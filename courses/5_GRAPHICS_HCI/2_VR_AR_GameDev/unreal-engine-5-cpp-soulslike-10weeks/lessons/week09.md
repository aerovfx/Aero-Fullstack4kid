# Tuần 9: Enemy AI chiến đấu / Week 9: Enemy Combat AI

## Mục Tiêu / Objectives

Mở rộng Behavior Tree để Enemy tự quyết định tiếp cận, strafe, attack, phản ứng và chết. / Extend the Behavior Tree so enemies can approach, strafe, attack, react, and die autonomously.

**Mục tiêu cụ thể:**
1. Tạo Combat State và Fight Selector.
2. Viết Service cập nhật khoảng cách.
3. Viết Attack Task dùng chung Attack Component.
4. Chọn Normal/Strong Attack theo context.
5. Xử lý Hit React, Exit Combat và Death.

---

## Lý Thuyết / Theory

### 1. State và quyết định

```cpp
UENUM(BlueprintType)
enum class ECombatState : uint8
{
    Patrol, Chase, Strafe, Attack, HitReact, Dead
};
```

Behavior Tree quyết định **làm gì**; Attack Component quyết định **thực hiện attack như thế nào**.

### 2. Fight tree

```text
Selector
├── Dead
├── Hit React
├── Fight
│   ├── Attack
│   ├── Strafe
│   └── Move Into Range
├── Chase
└── Patrol
```

### 3. AI stamina

AI không nên attack khi thiếu stamina. Nó có thể strafe, giữ khoảng cách hoặc chờ hồi, tạo nhịp chiến đấu dễ đọc.

---

## Cảnh Báo Thiết Kế / Design Warnings

> [!WARNING]
> Tránh AI đọc input Player hoặc gọi trực tiếp method riêng của Player. Task phải hoàn tất khi montage kết thúc/interrupted. Death phải có priority cao nhất và dừng mọi task đang chạy.

---

## Thực Hành / Hands-On

### Cấp độ 1: Distance Service

Cập nhật `DistanceToTarget` ở tần suất hợp lý và đặt decorator cho Attack/Chase.

### Cấp độ 2: Attack Task

Task gọi `TryAttack()` trên Attack Component; hoàn thành qua delegate khi attack kết thúc, không dùng fixed delay đoán thời lượng montage.

### Cấp độ 3: Tactical movement

Thêm strafe point, quay mặt về target, chọn attack type dựa trên range/stamina và thoát combat khi mất target.

### Code 1 — Khái niệm nhỏ: service đo khoảng cách

**File:** `Source/EchoesOfTerra/AI/Services/BTService_UpdateCombatContext.cpp`

```cpp
void UBTService_UpdateCombatContext::TickNode(
    UBehaviorTreeComponent& OwnerComp, uint8* NodeMemory, float DeltaSeconds)
{
    Super::TickNode(OwnerComp, NodeMemory, DeltaSeconds);
    APawn* Pawn = OwnerComp.GetAIOwner() ? OwnerComp.GetAIOwner()->GetPawn() : nullptr;
    AActor* Target = Cast<AActor>(OwnerComp.GetBlackboardComponent()
        ->GetValueAsObject(TargetKey.SelectedKeyName));
    const float Distance = Pawn && IsValid(Target)
        ? FVector::Dist(Pawn->GetActorLocation(), Target->GetActorLocation())
        : TNumericLimits<float>::Max();
    OwnerComp.GetBlackboardComponent()->SetValueAsFloat(
        DistanceKey.SelectedKeyName, Distance);
}
```

Đặt interval khoảng `0.15–0.25s`; combat không cần đo mỗi frame. Decorator Attack kiểm tra `DistanceToTarget <= AttackRange`.

### Code 2 — Ví dụ trung gian: chọn attack theo context

**File:** `Source/EchoesOfTerra/AI/EnemyCombatDecision.cpp`

```cpp
const FAttackData* UEnemyCombatDecision::ChooseAttack(
    float Distance, const UStaminaComponent& Stamina) const
{
    if (Distance <= StrongAttack.MaxRange &&
        Stamina.CanSpend(StrongAttack.StaminaCost))
        return &StrongAttack;

    if (Distance <= NormalAttack.MaxRange &&
        Stamina.CanSpend(NormalAttack.StaminaCost))
        return &NormalAttack;

    return nullptr;
}
```

Đây là policy thuần, dễ kiểm thử; `AttackComponent` vẫn chịu trách nhiệm thực thi và trừ stamina. `nullptr` nghĩa là chuyển sang strafe/recover, không cố phát montage.

**Xác minh:** lập bảng test distance/stamina tại biên `MaxRange`, thiếu đúng `0.01` stamina và cả hai attack không hợp lệ.

### Code 3 — Lab tích hợp: Behavior Tree Attack Task bất đồng bộ

**Files:** `Source/EchoesOfTerra/AI/Tasks/BTTask_PerformAttack.h/.cpp`. Đặt `bCreateNodeInstance = true` trong constructor để task giữ binding riêng cho từng AI.

```cpp
EBTNodeResult::Type UBTTask_PerformAttack::ExecuteTask(
    UBehaviorTreeComponent& OwnerComp, uint8* NodeMemory)
{
    CachedOwnerComp = &OwnerComp;
    AEnemyCharacter* Enemy = Cast<AEnemyCharacter>(OwnerComp.GetAIOwner()->GetPawn());
    if (!Enemy || !Enemy->GetAttackComponent()) return EBTNodeResult::Failed;

    AttackComponent = Enemy->GetAttackComponent();
    AttackComponent->OnAttackFinished.AddUniqueDynamic(
        this, &ThisClass::HandleAttackFinished);
    if (!AttackComponent->TryAIAttack())
    {
        AttackComponent->OnAttackFinished.RemoveDynamic(
            this, &ThisClass::HandleAttackFinished);
        return EBTNodeResult::Failed;
    }
    return EBTNodeResult::InProgress;
}

void UBTTask_PerformAttack::HandleAttackFinished(bool bInterrupted)
{
    if (AttackComponent)
        AttackComponent->OnAttackFinished.RemoveDynamic(this, &ThisClass::HandleAttackFinished);
    if (CachedOwnerComp)
        FinishLatentTask(*CachedOwnerComp,
            bInterrupted ? EBTNodeResult::Failed : EBTNodeResult::Succeeded);
}
```

Override `AbortTask` để unbind delegate, interrupt montage và trả `Aborted`. Khi `OnDeath` phát, controller gọi `BrainComponent->StopLogic`, Attack Component phải broadcast kết thúc/cleanup đúng một lần.

**Expected result:** Terra đi vào range, chọn attack hợp lệ, task kết thúc đúng theo montage; hit react/death giữa attack không để task `InProgress`. Kiểm tra đồng thời hai enemy để phát hiện state dùng chung sai.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Enemy vào attack range và thực hiện một attack.
- Enemy không attack khi thiếu stamina.

### 🟡 Phần B

- Chọn Normal/Strong Attack theo khoảng cách.
- Strafe khi đang recovery hoặc hồi stamina.

### 🔴 Phần C: AI Combat Demo

Tổ chức trận Greystone–Terra hoàn chỉnh từ patrol → perception → chase → fight → death. Thu video và Behavioral Log.

---

## Kiểm Thử / Testing

1. Target chết trong lúc Enemy đang attack.
2. Enemy bị hit react trong lúc montage chạy.
3. Enemy hết stamina.
4. Player chạy khỏi leash radius.
5. Enemy chết khi Task đang active.
6. Hai enemy cùng nhắm Player không chồng vị trí quá mức.

## Câu Hỏi Thảo Luận / Discussion Questions

1. Vì sao Behavior Tree không nên chứa implementation combat chi tiết?
2. Async Task phải báo hoàn tất ở những đường nào?
3. Distance và stamina nên ảnh hưởng attack selection ra sao?
4. Strafe tạo fairness cho người chơi như thế nào?
5. Death branch cần priority cao nhất vì sao?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Task trả `Succeeded` ngay sau `TryAttack()` không có nghĩa attack đã hoàn tất.
- Fixed delay không đáng tin bằng montage/delegate callback.
- AI khó hơn không đồng nghĩa AI phản ứng tức thời hoặc luôn biết vị trí Player.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Quyết định AI | Có context và nhịp rõ | Hoạt động tốt | Attack/chase cơ bản | Hành vi lỗi |
| Task lifecycle | Delegate, abort/death an toàn | Thiếu edge case nhỏ | Fixed delay nhưng chạy | Task treo |
| Tái sử dụng | Dùng chung combat modules | Ít duplicate | Có duplicate | AI logic riêng hoàn toàn |
| Test | Đủ sáu ca | 4–5 ca | 2–3 ca | Không test |

## Checklist

- [ ] Fight Selector hoàn chỉnh.
- [ ] Attack Task không dùng delay đoán mò.
- [ ] Death dừng Behavior Tree.
- [ ] AI Combat Demo được tag Git.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.
