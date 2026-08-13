# Tuần 3: Data Asset và Animation / Week 3: Data Assets & Animation

## Mục Tiêu / Objectives

Xây locomotion tái sử dụng và tách cấu hình nhân vật khỏi code. / Build reusable locomotion and separate character configuration from code.

**Mục tiêu cụ thể:**
1. Hiểu Skeletal Mesh, Skeleton, Animation Sequence và Montage.
2. Xây Blend Space và Animation State Machine.
3. Cập nhật Animation Instance từ C++.
4. Tạo `UPrimaryDataAsset` cho Greystone và Terra.
5. Dùng Animation Blueprint Template để giảm trùng lặp.

---

## Lý Thuyết / Theory

### 1. Animation pipeline

```text
Character Movement → AnimInstance variables → State Machine → Final Pose
```

- **Speed:** độ lớn vận tốc ngang.
- **Direction:** góc chuyển động so với hướng nhân vật.
- **IsInAir:** trạng thái rời mặt đất.
- **State Machine:** điều khiển Idle/Walk/Run/Jump.

### 2. Data-driven design

Data Asset giữ thông số thay đổi theo nhân vật; C++ giữ quy tắc gameplay. Cách này cho phép tạo enemy mới mà không nhân bản class.

```cpp
UCLASS(BlueprintType)
class UCharacterDataAsset : public UPrimaryDataAsset
{
    GENERATED_BODY()
public:
    UPROPERTY(EditDefaultsOnly) float WalkSpeed = 400.0f;
    UPROPERTY(EditDefaultsOnly) float MaxHealth = 100.0f;
    UPROPERTY(EditDefaultsOnly) float MaxStamina = 100.0f;
    UPROPERTY(EditDefaultsOnly) TArray<TObjectPtr<UAnimMontage>> AttackMontages;
};
```

---

## Cảnh Báo Asset / Asset Warnings

> [!WARNING]
> Kiểm tra giấy phép asset trước khi phân phối build. Không đổi Skeleton/Retargeter hàng loạt khi chưa commit. Tránh hard reference không cần thiết vì sẽ làm tăng thời gian load và kích thước package.

---

## Thực Hành / Hands-On

#### Code khái niệm nhỏ — biến locomotion

**Files:** `Source/EchoesOfTerra/Animation/CombatAnimInstance.h/.cpp`

```cpp
void UCombatAnimInstance::NativeUpdateAnimation(float DeltaSeconds)
{
    Super::NativeUpdateAnimation(DeltaSeconds);
    const APawn* Pawn = TryGetPawnOwner();
    if (!Pawn) { Speed = 0.0f; bIsInAir = false; return; }
    const FVector Horizontal(Pawn->GetVelocity().X, Pawn->GetVelocity().Y, 0.0f);
    Speed = Horizontal.Size();
    Direction = CalculateDirection(Horizontal, Pawn->GetActorRotation());
    const ACharacter* Character = Cast<ACharacter>(Pawn);
    bIsInAir = Character && Character->GetCharacterMovement()->IsFalling();
}
```

Khai báo ba biến bằng `UPROPERTY(BlueprintReadOnly, Transient)`. Loại vận tốc Z để jump không bị hiểu là chạy; Anim Preview không có Pawn là edge case bình thường.

### Cấp độ 1: Locomotion

Tạo Blend Space Idle/Walk/Run và State Machine. Cập nhật `Speed`, `Direction`, `IsInAir` trong Anim Instance.

### Cấp độ 2: Data Asset

Tạo `DA_Greystone` và `DA_Terra`; áp dụng tốc độ và chỉ số khi `BeginPlay()`.

**Ví dụ trung gian — file `Source/EchoesOfTerra/Characters/BaseCharacter.cpp`:**

```cpp
void ABaseCharacter::ApplyCharacterData()
{
    if (!ensureMsgf(CharacterData, TEXT("CharacterData missing on %s"), *GetName())) return;
    GetCharacterMovement()->MaxWalkSpeed = FMath::Max(0.0f, CharacterData->WalkSpeed);
    UE_LOG(LogTemp, Log, TEXT("%s uses %s at speed %.0f"), *GetName(),
        *CharacterData->GetName(), GetCharacterMovement()->MaxWalkSpeed);
}
```

Gọi trong `BeginPlay()`. `meta=(ClampMin="0")` trên Data Asset hỗ trợ Editor, nhưng runtime vẫn clamp để chống asset cũ/dữ liệu sai.

### Cấp độ 3: Tái sử dụng

Tạo Animation Blueprint Template hoặc linked layer để Greystone/Terra dùng chung logic locomotion nhưng dùng animation asset riêng.

**Lab tích hợp:** tạo `DA_Greystone` (450 cm/s), `DA_Terra` (360 cm/s), hai Blend Space nhưng một state-machine template `Idle/Move ↔ InAir`. Đặt `BP_PlayerCharacter` và `BP_TerraDummy` trong `L_ControllerGym`, chạy `showdebug animation`.

**Expected/verification:** đổi Data Asset có hiệu lực không compile; Speed gần 0 ở idle và gần MaxWalkSpeed khi chạy; jump vào InAir. Nếu foot sliding, chỉnh sample theo tốc độ clip; T-pose thì kiểm tra skeleton/retarget/Anim Class; Data Asset null phải log warning, không crash. Lưu `evidence/week03-animation.md`.

---

## Bài Tập / Exercises

### 🟢 Phần A

- Idle ↔ Walk ↔ Run không giật.
- Jump/Fall/Land chuyển đúng điều kiện.

### 🟡 Phần B

- Tạo hai Data Asset có tốc độ và HP khác nhau.
- Hiển thị tên asset đang dùng trong debug log một lần khi bắt đầu.

### 🔴 Phần C: Character Prototype

Đặt Greystone và Terra trong cùng map; cả hai dùng chung animation architecture, không copy toàn bộ graph.

---

## Kiểm Thử / Testing

1. Đổi `WalkSpeed` trong Data Asset và xác nhận không cần sửa code.
2. Di chuyển tám hướng và kiểm tra foot sliding.
3. Jump khi đang chạy và khi đứng yên.
4. Đổi mesh/asset nhân vật và kiểm tra animation graph.

## Câu Hỏi Thảo Luận / Discussion Questions

1. Vì sao Data Asset tốt hơn hard-code cho nhiều Character?
2. Foot sliding xuất hiện do dữ liệu hay animation?
3. AnimInstance nên đọc hay sở hữu gameplay state?
4. Khi nào nên dùng Montage thay vì State Machine?
5. Animation Blueprint Template giảm loại chi phí bảo trì nào?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Data Asset không tự áp dụng dữ liệu; code vẫn phải đọc và validate.
- Animation Blueprint không nên là nguồn sự thật của HP hoặc attack state.
- Dùng chung Skeleton không đồng nghĩa mọi animation tự tương thích.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Locomotion | Mượt, đủ hướng/trạng thái | Hoạt động, lỗi nhỏ | Idle/Run cơ bản | State lỗi |
| Data Asset | Tách dữ liệu hoàn chỉnh | Tách phần lớn | Có asset nhưng còn hard-code | Không dùng |
| Tái sử dụng | Một architecture cho hai nhân vật | Trùng lặp ít | Copy graph đáng kể | Hai hệ độc lập |
| Kiểm thử | Đủ ca, có bằng chứng | Thiếu một ca | Kiểm thử sơ sài | Không kiểm thử |

## Checklist

- [ ] `DA_Greystone` và `DA_Terra` tồn tại.
- [ ] Locomotion chạy cho cả hai nhân vật.
- [ ] Không hard-code chỉ số chính.
- [ ] Character Prototype được tag trong Git.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 03](../code/week03/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 03](../code/week03/README.md), học lần lượt từ `01_...` đến `20_...`.
