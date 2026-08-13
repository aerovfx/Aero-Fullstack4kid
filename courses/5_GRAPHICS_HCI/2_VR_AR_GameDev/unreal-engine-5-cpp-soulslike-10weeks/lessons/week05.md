# Tuần 5: Weapon Trace, Damage và Hit Reaction / Week 5: Weapon Traces, Damage & Hit Reactions

## Mục Tiêu / Objectives

Biến animation thành đòn đánh có hit detection chính xác, damage chuẩn và phản ứng theo hướng. / Turn attack animation into accurate hit detection, damage, and directional reactions.

**Mục tiêu cụ thể:**
1. Phân biệt Line Trace, Sphere Trace và overlap.
2. Trace theo socket của vũ khí trong active frames.
3. Áp dụng Unreal Damage System.
4. Chặn multi-hit ngoài ý muốn.
5. Tính hướng va chạm và phát Hit React Montage.

---

## Lý Thuyết / Theory

### 1. Sweep theo vũ khí

Chỉ trace tại vị trí hiện tại dễ bỏ sót mục tiêu khi kiếm di chuyển nhanh. Sweep từ socket frame trước đến frame hiện tại giúp phủ đường đi.

### 2. Hit window

Anim Notify State mở/đóng khoảng thời gian vũ khí có sát thương. `TSet<AActor*> HitActors` bảo đảm một attack không đánh cùng Actor nhiều lần.

### 3. Directional reaction

Tính vector từ victim đến impact; dot product với forward/right vector để phân loại Front/Back/Left/Right.

---

## Cảnh Báo / Warnings

> [!WARNING]
> Debug Draw chỉ dùng trong development. Phải bỏ qua owner, weapon và actor đã trúng. Không dùng Tick toàn thời gian nếu trace chỉ cần trong attack window.

---

## Thực Hành / Hands-On

#### Code khái niệm nhỏ — hướng hit bằng dot product

**File:** `Source/EchoesOfTerra/Combat/HitDirection.h`

```cpp
UENUM(BlueprintType)
enum class EHitDirection : uint8 { Front, Back, Left, Right };

inline EHitDirection ClassifyHitDirection(const AActor& Victim, const FVector& Point)
{
    const FVector V = (Point - Victim.GetActorLocation()).GetSafeNormal2D();
    if (V.IsNearlyZero()) return EHitDirection::Front;
    const float F = FVector::DotProduct(Victim.GetActorForwardVector(), V);
    const float R = FVector::DotProduct(Victim.GetActorRightVector(), V);
    if (FMath::Abs(F) >= FMath::Abs(R)) return F >= 0 ? EHitDirection::Front : EHitDirection::Back;
    return R >= 0 ? EHitDirection::Right : EHitDirection::Left;
}
```

Test với `±Forward*100`, `±Right*100`; impact trùng tâm dùng fallback Front.

### Cấp độ 1: Trace cơ bản

Tạo socket `WeaponBase`, `WeaponTip`; dùng Sphere Trace giữa hai frame và hiển thị debug color.

**Ví dụ trung gian — files sửa:** `Source/EchoesOfTerra/Components/AttackComponent.h/.cpp`

```cpp
void UAttackComponent::BeginHitWindow()
{
    HitActors.Reset();
    PreviousTip = WeaponMesh->GetSocketLocation(TEXT("WeaponTip"));
    bHitWindowOpen = true;
}

void UAttackComponent::TraceWeapon()
{
    if (!bHitWindowOpen || !WeaponMesh) return;
    const FVector Tip = WeaponMesh->GetSocketLocation(TEXT("WeaponTip"));
    FCollisionQueryParams Params(SCENE_QUERY_STAT(WeaponTrace), false, GetOwner());
    TArray<FHitResult> Hits;
    GetWorld()->SweepMultiByChannel(Hits, PreviousTip, Tip, FQuat::Identity,
        ECC_GameTraceChannel1, FCollisionShape::MakeSphere(8.0f), Params);
    for (const FHitResult& Hit : Hits)
    {
        AActor* Target = Hit.GetActor();
        if (!IsValid(Target) || HitActors.Contains(Target)) continue;
        HitActors.Add(Target);
        ApplyHit(Hit);
    }
    PreviousTip = Tip;
}
```

`HitActors.Reset()` chỉ ở đầu attack, không mỗi frame. Production nên sweep thêm base/nhiều sample trên blade. Trace được gọi từ Anim Notify State trong active frames, không từ Tick toàn trận.

### Cấp độ 2: Damage

```cpp
UGameplayStatics::ApplyPointDamage(
    HitActor, Damage, TraceDirection,
    HitResult, InstigatorController,
    GetOwner(), DamageTypeClass);
```

Đặt lời gọi trong `ApplyHit(const FHitResult&)`, dùng owner làm damage causer và `Owner->GetInstigatorController()`; kiểm tra owner/target/null và target khác owner trước khi gọi.

### Cấp độ 3: Hit reaction

Nhận `OnTakePointDamage`, cập nhật Health Component và chọn montage phản ứng theo hướng.

**Lab tích hợp:** thêm `Source/EchoesOfTerra/Components/HealthComponent.h/.cpp`, bind `OnTakePointDamage` trong `BeginPlay`, clamp health `[0, MaxHealth]`, bỏ damage `<=0`, broadcast thay đổi. Tạo `ANS_WeaponTrace`, sockets `WeaponBase/WeaponTip`, channel `Weapon`, bốn montage reaction; đặt Greystone và hai Terra trong `L_CombatGym`.

**Expected/verification:** mỗi target mất damage đúng một lần/attack; một cung có thể trúng hai target; reaction đúng bốn hướng; health không âm. FPS thấp bị miss thì tăng radius/sample path; damage lặp thì kiểm tra vòng đời `HitActors`; socket thiếu phải abort và log warning, không trace từ world origin. Ghi attacker/victim/damage/bone/direction vào `evidence/week05-vertical-slice.md`.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Trace trúng collision channel của Character.
- Damage dummy enemy đúng giá trị.

### 🟡 Phần B

- Mỗi target chỉ nhận một hit/attack.
- Chọn bốn montage phản ứng.

### 🔴 Phần C: Combat Vertical Slice v1

Greystone đánh Terra trong test arena; hiển thị debug damage log gồm attacker, victim, damage, impact bone và direction.

---

## Kiểm Thử / Testing

1. Kiếm đi nhanh vẫn không xuyên qua mục tiêu.
2. Một sweep qua nhiều frame chỉ gây một damage.
3. Đánh hai enemy trong một cung kiếm gây damage cho cả hai.
4. Đánh từ bốn hướng phát đúng montage.

## Câu Hỏi Thảo Luận / Discussion Questions

1. Vì sao sweep đáng tin cậy hơn trace tại một điểm?
2. Hit window nên do animation hay Character kiểm soát?
3. `TSet` phù hợp với multi-hit prevention vì sao?
4. Impact direction khác attack direction thế nào?
5. Collision channel riêng cải thiện hệ thống ra sao?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Trace dài hơn không nhất thiết chính xác hơn.
- Nhiều hit result qua nhiều frame không nên luôn chuyển thành nhiều damage.
- Debug draw không phải bằng chứng collision configuration đã tối ưu.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Trace | Sweep chính xác, không miss | Hoạt động, ít sai | Trace cơ bản | Không ổn định |
| Damage | Tách hệ thống, đúng instigator | Damage đúng | Trừ HP trực tiếp | Multi-hit/lỗi |
| Reaction | Đủ bốn hướng | Hai–ba hướng | Một montage | Không có |
| Performance | Chỉ trace khi active | Còn debug nhỏ | Tick dư thừa | Trace liên tục |

## Checklist

- [ ] Socket và collision channel đúng.
- [ ] `HitActors` reset mỗi attack.
- [ ] Point Damage đi qua Health Component.
- [ ] Vertical Slice v1 được quay video.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
