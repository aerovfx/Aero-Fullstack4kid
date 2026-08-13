# Tuần 4: Kiến trúc hệ thống tấn công / Week 4: Attack System Architecture

## Mục Tiêu / Objectives

Xây hệ thống attack component-based, dùng chung cho Player và Enemy. / Build a component-based attack system shared by Player and Enemy.

**Mục tiêu cụ thể:**
1. Phân tách input, gameplay logic và animation.
2. Tạo `UAttackComponent` và Unreal Interface.
3. Phát Attack Montage từ dữ liệu.
4. Dùng Anim Notify để điều khiển trạng thái.
5. Ngăn spam và xử lý kết thúc montage an toàn.

---

## Lý Thuyết / Theory

### 1. Component và Interface

- Component đóng gói một khả năng có thể gắn vào Actor.
- Interface định nghĩa hợp đồng mà không phụ thuộc class cụ thể.

```text
Input/AI → AttackComponent → Combat Interface → Animation Montage
```

### 2. Attack state

Một đòn đánh thường đi qua `Idle → Windup → Active → Recovery → Idle`. Không nên mở trace trong toàn bộ montage.

### 3. SOLID áp dụng

- Character nhận input và sở hữu component.
- Attack Component quản lý attack state.
- Animation asset quyết định timing qua Notify.
- Data Asset giữ montage và thông số.

---

## Cảnh Báo / Warnings

> [!WARNING]
> Không gọi montage trên AnimInstance null. Mọi đường thoát (montage blend out, interrupted, death) phải reset attack state; nếu không nhân vật có thể bị khóa vĩnh viễn.

---

## Thực Hành / Hands-On

#### Code khái niệm nhỏ — Combat Interface

**File:** `Source/EchoesOfTerra/Interfaces/CombatInterface.h`

```cpp
UINTERFACE(BlueprintType)
class UCombatInterface : public UInterface { GENERATED_BODY() };

class ECHOESOFTERRA_API ICombatInterface
{
    GENERATED_BODY()
public:
    UFUNCTION(BlueprintNativeEvent, BlueprintCallable, Category="Combat")
    bool CanAttack() const;
    UFUNCTION(BlueprintNativeEvent, BlueprintCallable, Category="Combat")
    UAttackComponent* GetAttackComponent() const;
};
```

Implementation C++ dùng `_Implementation`; caller dùng `ICombatInterface::Execute_CanAttack(Actor)`. Không cast sang Player vì Terra cũng dùng hợp đồng này.

### Cấp độ 1: Interface

Tạo `UCombatInterface` với `CanAttack()`, `GetAttackComponent()` và `HandleAttackFinished()`.

### Cấp độ 2: Component

```cpp
bool UAttackComponent::TryAttack()
{
    ACharacter* Character = Cast<ACharacter>(GetOwner());
    if (bIsAttacking || !CurrentMontage || !Character || !Character->GetMesh()) return false;
    UAnimInstance* Anim = Character->GetMesh()->GetAnimInstance();
    if (!Anim) return false;
    bIsAttacking = true;
    if (Anim->Montage_Play(CurrentMontage) <= 0.0f)
    {
        bIsAttacking = false;
        return false;
    }
    FOnMontageEnded Delegate;
    Delegate.BindUObject(this, &ThisClass::OnMontageEnded);
    Anim->Montage_SetEndDelegate(Delegate, CurrentMontage);
    return true;
}

void UAttackComponent::OnMontageEnded(UAnimMontage* Montage, bool bInterrupted)
{
    if (Montage == CurrentMontage) FinishAttack();
}

void UAttackComponent::FinishAttack() { bIsAttacking = false; }
```

**Ví dụ trung gian:** đặt code trong `Source/EchoesOfTerra/Components/AttackComponent.h/.cpp`; `bIsAttacking` là `UPROPERTY(Transient)`, montage là `TObjectPtr<UAnimMontage>`. Delegate bao phủ complete/interrupt; `FinishAttack()` phải idempotent khi cả Notify lẫn delegate gọi. Montage null, AnimInstance null và skeleton/slot sai phải trả `false`, không khóa state.

### Cấp độ 3: Montage lifecycle

Dùng Notify hoặc montage delegate để kết thúc attack, đồng thời xử lý interrupted path.

**Lab tích hợp:** tạo `IA_Attack`, `AM_Greystone_Normal`, montage Terra; thêm một `UAttackComponent` vào `ABaseCharacter`. Player handler và AI dummy đều chỉ gọi `TryAttack()`. Test spam, `Montage_Stop`, death và asset montage null trong `L_CombatGym`.

**Expected/verification:** một lần chỉ có một montage; Player/Terra dùng chung API; mọi interrupt reset state. Montage chạy nhưng không thấy pose thì kiểm tra Slot node; state khóa thì breakpoint `OnMontageEnded`. Lưu log/video tại `evidence/week04-attack.md`.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Bind `IA_Attack` và phát một montage.
- Ngăn gọi đòn mới khi `bIsAttacking`.

### 🟡 Phần B

- Chuyển montage sang Data Asset.
- Gắn Attack Component lên Terra.

### 🔴 Phần C: Reusable Attack Module

Viết test map trong đó Player và AI dummy gọi cùng API `TryAttack()` từ hai nguồn điều khiển khác nhau.

---

## Kiểm Thử / Testing

| Ca | Kết quả mong đợi |
|---|---|
| Nhấn attack liên tục | Chỉ một montage hợp lệ |
| Montage bị interrupt | State trở về Idle |
| Character không có montage | Không crash, trả `false` |
| Player/Enemy cùng component | Cùng hành vi nền tảng |

## Câu Hỏi Thảo Luận / Discussion Questions

1. Interface giải quyết coupling nào trong combat?
2. Vì sao input không nên trực tiếp phát montage?
3. Attack state nào cần tồn tại ngoài animation?
4. Component nên biết gì về Player và Enemy?
5. Callback montage tốt hơn fixed timer ở điểm nào?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Interface không tự cung cấp implementation hoặc state.
- Montage kết thúc bình thường và bị interrupt là hai đường xử lý khác nhau.
- Component tái sử dụng được không có nghĩa nó phải chứa mọi logic combat.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Kiến trúc | Phân lớp rõ, tái sử dụng tốt | Ít phụ thuộc | Hoạt động nhưng dính Character | Logic tập trung trong input |
| State safety | Xử lý mọi exit path | Thiếu một edge case | Reset cơ bản | Dễ bị khóa |
| Data-driven | Montage từ asset | Một phần từ asset | Hard-code ít | Hard-code toàn bộ |
| Test | Đủ bốn ca | Ba ca | Một–hai ca | Không test |

## Checklist

- [ ] Player và Enemy dùng chung Attack Component.
- [ ] Spam không phá state.
- [ ] Interrupted montage được xử lý.
- [ ] Commit `week04-attack-architecture`.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
