# Tuần 6: Combo, Âm thanh và Hiệu ứng / Week 6: Combos, Audio & VFX

## Mục Tiêu / Objectives

Tạo combat feedback rõ ràng và chuỗi combo có timing. / Create readable combat feedback and timing-based combos.

**Mục tiêu cụ thể:**
1. Xây combo ba đòn và strong attack.
2. Thiết kế input buffer/combo window.
3. Dùng Niagara cho impact và weapon trail.
4. Đồng bộ sound bằng Anim Notify.
5. Dùng camera shake vừa đủ, không gây khó chịu.

---

## Lý Thuyết / Theory

### 1. Combo state

```text
Attack 1 --valid input--> Attack 2 --valid input--> Attack 3
     \--timeout/interrupted-----------------------> Reset
```

### 2. Data-driven attack

```cpp
USTRUCT(BlueprintType)
struct FAttackData
{
    GENERATED_BODY()
    UPROPERTY(EditDefaultsOnly) TObjectPtr<UAnimMontage> Montage;
    UPROPERTY(EditDefaultsOnly) float Damage = 20.0f;
    UPROPERTY(EditDefaultsOnly) float StaminaCost = 15.0f;
    UPROPERTY(EditDefaultsOnly) TObjectPtr<UNiagaraSystem> ImpactEffect;
    UPROPERTY(EditDefaultsOnly) TObjectPtr<USoundBase> ImpactSound;
};
```

### 3. Feedback layers

Animation diễn tả hành động; trail diễn tả quỹ đạo; impact effect/sound xác nhận va chạm; camera shake nhấn mạnh lực.

---

## Cảnh Báo Trải Nghiệm / UX Warnings

> [!WARNING]
> Tránh flash, shake hoặc âm lượng quá mạnh. Cung cấp tùy chọn giảm camera shake. Không dùng asset âm thanh/VFX ngoài phạm vi giấy phép.

---

## Thực Hành / Hands-On

### Cấp độ 1: Combo

Tạo `ComboIndex`, `bCanQueueNextAttack`, timer reset và notify mở combo window.

### Cấp độ 2: VFX/SFX

Spawn effect tại `ImpactPoint`, xoay theo `ImpactNormal`; bật trail ở đầu active window và tắt khi kết thúc.

### Cấp độ 3: Terra integration

Thiết lập Attack Montage, Hit React, Physics Asset, impact và footstep cho Terra qua dữ liệu riêng.

### Code 1 — Khái niệm nhỏ: combo window

**File:** `Source/EchoesOfTerra/Components/AttackComponent.h` (UE 5.x, trong `UAttackComponent` từ tuần 5).

```cpp
UPROPERTY(VisibleInstanceOnly, Category="Combat|Combo")
int32 ComboIndex = 0;

UPROPERTY(VisibleInstanceOnly, Category="Combat|Combo")
bool bCanQueueNextAttack = false;

UPROPERTY(VisibleInstanceOnly, Category="Combat|Combo")
bool bAttackQueued = false;

UPROPERTY(EditDefaultsOnly, Category="Combat|Combo")
TArray<FAttackData> ComboAttacks;

void OpenComboWindow() { bCanQueueNextAttack = true; }
void CloseComboWindow() { bCanQueueNextAttack = false; }

void QueueNextAttack()
{
    if (bIsAttacking && bCanQueueNextAttack)
    {
        bAttackQueued = true;
    }
}
```

Ba biến tách rõ trạng thái đang đánh, thời điểm được nối đòn và input đã được buffer. Notify không tự chọn montage; nó chỉ mở/đóng cửa sổ quyết định.

**Xác minh:** bật `ShowDebug Animation`, nhấn ngoài cửa sổ không nối đòn; nhấn một lần trong cửa sổ chỉ queue một đòn.

### Code 2 — Ví dụ trung gian: kết thúc đòn và chuyển combo

**File:** `Source/EchoesOfTerra/Components/AttackComponent.cpp`

```cpp
void UAttackComponent::HandleAttackMontageEnded(UAnimMontage* Montage, bool bInterrupted)
{
    bIsAttacking = false;
    bCanQueueNextAttack = false;

    if (bInterrupted || !bAttackQueued || ComboAttacks.IsEmpty())
    {
        ComboIndex = 0;
        bAttackQueued = false;
        return;
    }

    bAttackQueued = false;
    ComboIndex = (ComboIndex + 1) % ComboAttacks.Num();
    CurrentMontage = ComboAttacks[ComboIndex].Montage;
    TryAttack(); // Dùng lại API không tham số đã xây ở tuần 4.
}
```

Bind hàm này vào `UAnimInstance::Montage_SetEndDelegate` ngay sau khi montage phát thành công. Dùng callback thật thay vì timer đoán thời lượng, nên animation bị interrupt sẽ reset an toàn.

**Edge cases:** mảng rỗng; montage không phát; owner bị stun/death; spam input. `TryAttack` phải hoàn lại state nếu `Montage_Play` trả `0.0f`.

### Code 3 — Lab tích hợp: impact VFX/SFX của EchoesOfTerra

**Files:** `Source/EchoesOfTerra/Components/AttackComponent.cpp`; thêm module `Niagara` trong `EchoesOfTerra.Build.cs`.

```cpp
#include "NiagaraFunctionLibrary.h"
#include "Kismet/GameplayStatics.h"

void UAttackComponent::SpawnImpactFeedback(const FHitResult& Hit,
                                           const FAttackData& Attack) const
{
    if (!GetWorld() || !Hit.bBlockingHit) return;

    const FRotator Rotation = Hit.ImpactNormal.Rotation();
    if (Attack.ImpactEffect)
    {
        UNiagaraFunctionLibrary::SpawnSystemAtLocation(
            GetWorld(), Attack.ImpactEffect, Hit.ImpactPoint, Rotation);
    }
    if (Attack.ImpactSound)
    {
        UGameplayStatics::PlaySoundAtLocation(
            this, Attack.ImpactSound, Hit.ImpactPoint);
    }
}
```

Gọi đúng một lần sau khi `HitActors.Add(HitActor)` thành công trong weapon trace tuần 5. Tạo `DA_Attack_Greystone_Light01..03` và `DA_Attack_Greystone_Strong`, rồi gán montage, damage, stamina cost, Niagara và sound.

**Expected result:** combo 1→2→3 dùng ba bộ dữ liệu; miss không tạo impact; mỗi actor chỉ phát một impact trong một attack window. Test ở 30/60/120 FPS để bảo đảm notify/trace không phụ thuộc frame rate.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Combo ba đòn reset đúng.
- Normal và Strong Attack dùng dữ liệu khác nhau.

### 🟡 Phần B

- Footstep sound theo loại surface.
- Camera shake chỉ chạy gần impact.

### 🔴 Phần C: Combat Vertical Slice v2

Quay video 60–90 giây thể hiện combo, strong attack, hit reaction, trail, impact, sound và camera feedback.

---

## Kiểm Thử / Testing

| Tình huống | Kết quả |
|---|---|
| Input ngoài combo window | Không nối sai đòn |
| Attack bị hit interrupt | Combo reset |
| Miss target | Không phát impact effect |
| Giảm camera shake | Cường độ giảm theo setting |

## Câu Hỏi Thảo Luận / Discussion Questions

1. Combo window ảnh hưởng cảm giác điều khiển thế nào?
2. Input buffer khác spam input ở điểm nào?
3. Vì sao impact effect phải dựa trên `ImpactNormal`?
4. Feedback nào xác nhận hit mạnh nhất đối với người chơi?
5. Data-driven attack giúp balance như thế nào?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Combo không nên chỉ tăng index sau một timer cố định.
- Niagara/Sound không được spawn khi attack miss.
- Camera shake mạnh hơn không đồng nghĩa combat tốt hơn.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Combo | Timing rõ, reset an toàn | Combo ổn định | Chuỗi cố định | Lỗi state |
| VFX/SFX | Đồng bộ và tiết chế | Có feedback tốt | Có nhưng lệch | Thiếu |
| Data-driven | Attack cấu hình bằng data | Phần lớn data | Hard-code đáng kể | Copy logic |
| Polish | Cảm giác nhất quán | Lỗi nhỏ | Demo cơ bản | Khó chơi |

## Checklist

- [ ] Combo/Strong Attack hoàn thành.
- [ ] VFX/SFX đúng timing.
- [ ] Terra dùng dữ liệu riêng.
- [ ] Tag Git `combat-vertical-slice-v2`.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.
