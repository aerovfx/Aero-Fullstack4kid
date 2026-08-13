# Tuần 7: Health, Stamina và HUD / Week 7: Health, Stamina & HUD

## Mục Tiêu / Objectives

Hoàn thiện tài nguyên chiến đấu và giao diện phản hồi theo event. / Complete combat resources and event-driven UI.

**Mục tiêu cụ thể:**
1. Tạo Health/Stamina Component tái sử dụng.
2. Dùng multicast delegate để cập nhật UI.
3. Tạo Player HUD và world-space Enemy Health Bar.
4. Áp dụng stamina cost cho attack.
5. Xử lý regeneration, death và edge cases.

---

## Lý Thuyết / Theory

### 1. Component ownership

Health Component sở hữu HP và death event; Stamina Component sở hữu chi phí, delay và regeneration; UI chỉ quan sát dữ liệu.

### 2. Event-driven UI

```text
Gameplay changes value → Component broadcasts delegate → Widget updates
```

Cách này tránh binding hoặc polling nặng mỗi frame.

### 3. Stamina loop

Spend → Delay → Regenerate → Clamp. Attack Component phải hỏi Stamina Component trước khi bắt đầu montage.

---

## Cảnh Báo / Warnings

> [!WARNING]
> Delegate binding phải được gỡ hoặc dùng weak UObject semantics đúng cách. Không broadcast death nhiều lần. Không để timer regeneration tiếp tục sau khi owner bị destroy.

---

## Thực Hành / Hands-On

### Cấp độ 1: Health Component

Tạo `OnHealthChanged`, `OnDeath`, `ApplyDamage()` và `GetHealthPercent()`.

### Cấp độ 2: Stamina Component

```cpp
bool UStaminaComponent::TrySpend(float Cost)
{
    if (Cost < 0.0f || CurrentStamina < Cost) return false;
    CurrentStamina -= Cost;
    OnStaminaChanged.Broadcast(GetPercent());
    RestartRegenerationDelay();
    return true;
}
```

### Cấp độ 3: Widgets

Tạo Player HUD, Enemy Health Bar và cập nhật Progress Bar từ delegate.

### Code 1 — Khái niệm nhỏ: HP được clamp và death idempotent

**File:** `Source/EchoesOfTerra/Components/HealthComponent.cpp`

```cpp
float UHealthComponent::ApplyDamage(float Damage)
{
    if (bIsDead || Damage <= 0.0f) return 0.0f;

    const float OldHealth = CurrentHealth;
    CurrentHealth = FMath::Clamp(CurrentHealth - Damage, 0.0f, MaxHealth);
    const float Applied = OldHealth - CurrentHealth;
    OnHealthChanged.Broadcast(CurrentHealth, MaxHealth);

    if (CurrentHealth <= 0.0f && !bIsDead)
    {
        bIsDead = true;
        OnDeath.Broadcast(GetOwner());
    }
    return Applied;
}
```

`bIsDead` bảo đảm death chỉ phát một lần; giá trị âm không vô tình trở thành heal. Healing nên có API riêng.

**Xác minh:** gọi lần lượt damage `25`, `500`, `10`; HP là `75`, rồi `0`, và `OnDeath` chỉ phát một lần.

### Code 2 — Ví dụ trung gian: stamina regen bằng timer

**Files:** `Source/EchoesOfTerra/Components/StaminaComponent.h/.cpp`

```cpp
void UStaminaComponent::RestartRegenerationDelay()
{
    GetWorld()->GetTimerManager().ClearTimer(RegenTickHandle);
    GetWorld()->GetTimerManager().SetTimer(
        RegenDelayHandle, this, &ThisClass::BeginRegeneration,
        RegenDelaySeconds, false);
}

void UStaminaComponent::BeginRegeneration()
{
    GetWorld()->GetTimerManager().SetTimer(
        RegenTickHandle, this, &ThisClass::RegenerateStep, 0.05f, true);
}

void UStaminaComponent::RegenerateStep()
{
    CurrentStamina = FMath::Min(
        MaxStamina, CurrentStamina + RegenPerSecond * 0.05f);
    OnStaminaChanged.Broadcast(CurrentStamina, MaxStamina);
    if (FMath::IsNearlyEqual(CurrentStamina, MaxStamina))
        GetWorld()->GetTimerManager().ClearTimer(RegenTickHandle);
}

void UStaminaComponent::EndPlay(const EEndPlayReason::Type Reason)
{
    GetWorld()->GetTimerManager().ClearAllTimersForObject(this);
    Super::EndPlay(Reason);
}
```

**Xác minh:** tiêu 30 stamina, không hồi trong delay, sau đó tăng đều và dừng chính xác tại max. Kiểm tra destroy enemy không còn callback/warning.

### Code 3 — Lab tích hợp: HUD event-driven

**Files:** `Source/EchoesOfTerra/UI/PlayerHUDWidget.h/.cpp`; UMG module phải có trong `EchoesOfTerra.Build.cs`.

```cpp
void UPlayerHUDWidget::InitializeFromCharacter(ABaseCharacter* Character)
{
    if (!IsValid(Character)) return;
    Health = Character->FindComponentByClass<UHealthComponent>();
    Stamina = Character->FindComponentByClass<UStaminaComponent>();
    if (!Health || !Stamina) return;

    Health->OnHealthChanged.AddUniqueDynamic(this, &ThisClass::HandleHealthChanged);
    Stamina->OnStaminaChanged.AddUniqueDynamic(this, &ThisClass::HandleStaminaChanged);
    HandleHealthChanged(Health->GetCurrentHealth(), Health->GetMaxHealth());
    HandleStaminaChanged(Stamina->GetCurrentStamina(), Stamina->GetMaxStamina());
}

void UPlayerHUDWidget::HandleHealthChanged(float Current, float Maximum)
{
    HealthBar->SetPercent(Maximum > 0.0f ? Current / Maximum : 0.0f);
}
```

Tạo widget một lần trong `APlayerCharacter::BeginPlay`, gọi `InitializeFromCharacter(this)`. Không dùng UMG property binding chạy mỗi frame.

**Expected result:** damage và stamina cost cập nhật bar ngay; restart không tạo widget/delegate trùng. Test `MaxHealth == 0`, component thiếu và pawn respawn; code phải không crash.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Damage cập nhật HP bar.
- Normal/Strong Attack trừ stamina khác nhau.

### 🟡 Phần B

- Stamina hồi sau delay, dừng ở max.
- Enemy Health Bar chỉ hiện khi cần.

### 🔴 Phần C: Combat Resource System

Tạo debug scenario liên tục attack, nhận damage, chết và restart để phát hiện timer/delegate lỗi.

---

## Kiểm Thử / Testing

1. Damage âm không hồi máu ngoài ý muốn.
2. Death event chỉ phát một lần.
3. Không attack khi stamina thiếu.
4. UI đúng sau restart level.
5. Destroy enemy không để timer/delegate warning.

## Câu Hỏi Thảo Luận / Discussion Questions

1. Vì sao UI nên phản ứng qua delegate?
2. Death event cần idempotent vì sao?
3. Stamina delay tạo quyết định chiến thuật gì?
4. Component nên clamp dữ liệu ở đầu vào hay đầu ra?
5. World-space health bar nên ẩn/hiện theo điều kiện nào?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Progress Bar binding mỗi frame không phải cách duy nhất cập nhật UI.
- Timer không tự an toàn khi owner bị destroy.
- Trừ stamina sau khi montage phát có thể tạo attack miễn phí khi race condition xảy ra.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Components | Tái sử dụng, API rõ | Hoạt động tốt | Logic lẫn Character | Hard-code |
| UI | Event-driven, đúng mọi state | Lỗi nhỏ | Binding cơ bản | Không cập nhật |
| Stamina | Cost/delay/regen chuẩn | Thiếu edge case | Có cost/regen | Logic sai |
| Safety | Timer/delegate sạch | Warning nhỏ | Chạy được | Crash/leak state |

## Checklist

- [ ] Health/Stamina Component dùng cho Player và Enemy.
- [ ] UI không poll nặng mỗi frame.
- [ ] Death event idempotent.
- [ ] Test restart thành công.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.
