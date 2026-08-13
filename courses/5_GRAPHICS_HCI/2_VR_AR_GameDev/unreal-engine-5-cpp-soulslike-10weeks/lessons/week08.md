# Tuần 8: Enemy AI — Patrol và Chase / Week 8: Enemy AI — Patrol & Chase

## Mục Tiêu / Objectives

Xây enemy có khả năng tuần tra, phát hiện và truy đuổi Player bằng Unreal AI. / Build an enemy that patrols, perceives, and chases the Player using Unreal AI.

**Mục tiêu cụ thể:**
1. Cấu hình NavMesh và AI Controller.
2. Hiểu Blackboard, Behavior Tree, Selector và Sequence.
3. Viết Task chọn patrol location.
4. Dùng AI Perception sight sense.
5. Quản lý target và mất dấu ổn định.

---

## Lý Thuyết / Theory

### 1. Kiến trúc Unreal AI

```text
Enemy Character ←possessed by— AI Controller
       ↑                           ↓
  Animation                  Behavior Tree
                                  ↓
                              Blackboard
```

### 2. Behavior Tree nodes

- **Selector:** chọn nhánh đầu tiên có thể thành công.
- **Sequence:** chạy các node con theo thứ tự, dừng khi một node thất bại.
- **Task:** thực hiện hành động hữu hạn.
- **Service:** cập nhật thông tin định kỳ cho một nhánh.

### 3. Perception

Sight có bán kính nhìn, bán kính mất dấu và góc nhìn. Perception event cập nhật `TargetActor`; không nên tìm Player bằng `GetAllActorsOfClass()` mỗi Tick.

---

## Cảnh Báo / Warnings

> [!WARNING]
> NavMesh phải phủ vùng đi lại. Task phải trả `Succeeded`/`Failed` đúng lúc; task treo sẽ khóa Behavior Tree. Không giữ raw pointer target sau khi Actor đã bị destroy.

---

## Thực Hành / Hands-On

### Cấp độ 1: Patrol

Tạo Blackboard keys:

```text
TargetActor (Object)
PatrolLocation (Vector)
DistanceToTarget (Float)
CombatState (Enum)
IsDead (Bool)
```

Tạo Task lấy random reachable point và `Move To PatrolLocation`.

### Cấp độ 2: Perception

Cấu hình `UAIPerceptionComponent`, `UAISenseConfig_Sight`; cập nhật Target Actor khi stimulus thay đổi.

### Cấp độ 3: Chase

```text
Selector
├── Sequence: Chase
│   ├── TargetActor Is Set
│   └── Move To TargetActor
└── Sequence: Patrol
    ├── Find Patrol Location
    └── Move To PatrolLocation
```

### Code 1 — Khái niệm nhỏ: chọn điểm patrol reachable

**File:** `Source/EchoesOfTerra/AI/Tasks/BTTask_FindPatrolLocation.cpp`; module cần có: `AIModule`, `NavigationSystem`.

```cpp
EBTNodeResult::Type UBTTask_FindPatrolLocation::ExecuteTask(
    UBehaviorTreeComponent& OwnerComp, uint8* NodeMemory)
{
    APawn* Pawn = OwnerComp.GetAIOwner()
        ? OwnerComp.GetAIOwner()->GetPawn() : nullptr;
    UNavigationSystemV1* Nav = FNavigationSystem::GetCurrent<UNavigationSystemV1>(Pawn);
    if (!Pawn || !Nav) return EBTNodeResult::Failed;

    FNavLocation Point;
    if (!Nav->GetRandomReachablePointInRadius(Pawn->GetActorLocation(), Radius, Point))
        return EBTNodeResult::Failed;

    OwnerComp.GetBlackboardComponent()->SetValueAsVector(
        PatrolLocationKey.SelectedKeyName, Point.Location);
    return EBTNodeResult::Succeeded;
}
```

`GetRandomReachablePointInRadius` tránh chọn điểm hình học nằm ngoài NavMesh. Expose `Radius` và Blackboard selector bằng `UPROPERTY(EditAnywhere)`.

**Xác minh:** dùng `P` hiển thị NavMesh; 20 lần chạy đều trả điểm xanh trong vùng reachable.

### Code 2 — Ví dụ trung gian: perception cập nhật target an toàn

**File:** `Source/EchoesOfTerra/AI/EnemyAIController.cpp`

```cpp
void AEnemyAIController::HandleTargetPerceptionUpdated(
    AActor* Actor, FAIStimulus Stimulus)
{
    if (!Blackboard || !IsValid(Actor)) return;

    const bool bPlayerTarget = Actor->ActorHasTag(TEXT("Player"));
    if (!bPlayerTarget) return;

    if (Stimulus.WasSuccessfullySensed())
    {
        Blackboard->SetValueAsObject(TargetActorKey, Actor);
    }
    else if (Blackboard->GetValueAsObject(TargetActorKey) == Actor)
    {
        Blackboard->ClearValue(TargetActorKey);
    }
}
```

Bind bằng `OnTargetPerceptionUpdated.AddDynamic`. Với nhiều target, không clear target hiện tại khi stimulus thất bại thuộc actor khác.

**Edge cases:** actor bị destroy, nhiều player, friendly actor, target tạm khuất. Với memory delay, cấu hình `MaxAge` hoặc dùng timer có weak pointer thay vì clear ngay.

### Code 3 — Lab tích hợp: controller chạy Behavior Tree

**File:** `Source/EchoesOfTerra/AI/EnemyAIController.cpp`

```cpp
void AEnemyAIController::OnPossess(APawn* InPawn)
{
    Super::OnPossess(InPawn);
    const AEnemyCharacter* Enemy = Cast<AEnemyCharacter>(InPawn);
    if (!Enemy || !Enemy->GetBehaviorTree()) return;

    UBlackboardComponent* BlackboardOut = nullptr;
    if (!UseBlackboard(Enemy->GetBehaviorTree()->BlackboardAsset, BlackboardOut)) return;
    Blackboard = BlackboardOut;
    RunBehaviorTree(Enemy->GetBehaviorTree());
}

void AEnemyAIController::OnUnPossess()
{
    if (BrainComponent) BrainComponent->StopLogic(TEXT("Pawn unpossessed"));
    Super::OnUnPossess();
}
```

Tạo `BB_Enemy` với đúng keys đã liệt kê và `BT_Enemy` gồm Chase/Patrol. Đặt `NavMeshBoundsVolume`, gán AI Controller Class và `Auto Possess AI = Placed in World or Spawned`.

**Expected result:** Terra patrol, thấy Greystone thì chase, mất target thì quay lại patrol; đường bị chặn làm Move To fail/retry chứ không treo tree. Dùng Behavior Tree debugger để chụp bằng chứng cả hai nhánh.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Enemy patrol trong bán kính giới hạn.
- Enemy đuổi Player khi nhìn thấy.

### 🟡 Phần B

- Thêm thời gian ghi nhớ target trước khi quay lại patrol.
- Dùng Draw Debug Cone để kiểm tra tầm nhìn trong development.

### 🔴 Phần C: AI Navigation Lab

Tạo arena có cột che khuất, nhiều cao độ và hai enemy. Ghi lại hành vi phát hiện, mất dấu, tìm đường và quay lại patrol.

---

## Kiểm Thử / Testing

| Ca | Kết quả mong đợi |
|---|---|
| Player ngoài sight | Enemy patrol |
| Player đi vào sight | Enemy chase |
| Player khuất sau cột | Mất dấu theo cấu hình |
| Target bị destroy | Blackboard được clear |
| Đường đi bị chặn | Task fail/retry, không treo |

## Câu Hỏi Thảo Luận / Discussion Questions

1. Blackboard là state store hay business logic?
2. Selector và Sequence khác nhau khi child thất bại thế nào?
3. Vì sao Perception event tốt hơn tìm Player mỗi Tick?
4. Patrol Task cần fail trong trường hợp nào?
5. Lose-sight memory ảnh hưởng độ khó ra sao?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- NavMesh màu xanh không bảo đảm mọi target đều reachable.
- Service không nên thực hiện hành động kéo dài thay cho Task.
- Clear Target Actor không tự động reset mọi combat state liên quan.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Behavior Tree | Rõ, không treo task | Hoạt động ổn định | Patrol/chase cơ bản | Không chạy |
| Perception | Event-driven, clear target đúng | Lỗi nhỏ | Phát hiện cơ bản | Tick search |
| Navigation | Xử lý vật cản/mất đường | Lỗi hiếm | Map đơn giản | Kẹt thường xuyên |
| Debug/Test | Đủ năm ca và video | Thiếu một ca | Kiểm thử ít | Không test |

## Checklist

- [ ] NavMesh và AI Controller đúng.
- [ ] Patrol/Chase chuyển nhánh ổn định.
- [ ] Target được clear an toàn.
- [ ] Không tìm Player mỗi Tick.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.
