# Tuần 2: Unreal Project, Enhanced Input và Camera / Week 2: Unreal Project, Enhanced Input & Camera

## Mục Tiêu / Objectives

Đưa kiến thức C++ vào Unreal Engine 5 và tạo nhân vật Greystone điều khiển được trong arena thử nghiệm. / Apply C++ inside Unreal Engine 5 and build a controllable Greystone character.

**Mục tiêu cụ thể:**
1. Khởi tạo Third Person C++ project và Git repository sạch.
2. Hiểu `UCLASS`, `UPROPERTY`, `UFUNCTION` và reflection.
3. Cấu hình Enhanced Input cho Move và Look.
4. Thiết lập Spring Arm và Follow Camera.
5. Tạo map kiểm thử chuyển động.

---

## Lý Thuyết / Theory

### 1. Unreal C++ Class

- `UCLASS()` đưa class vào reflection system.
- `GENERATED_BODY()` sinh mã kết nối Unreal.
- `UPROPERTY()` giúp Editor, serialization và Garbage Collection nhận biết dữ liệu.
- Constructor tạo component mặc định; `BeginPlay()` chạy khi gameplay bắt đầu.

### 2. Enhanced Input

```text
Input Action → Input Mapping Context → Enhanced Input Component → C++ Handler
```

`IA_Move` trả về Vector2D; `IA_Look` trả về delta chuột/gamepad.

### 3. Camera góc nhìn thứ ba

Spring Arm giữ khoảng cách, xử lý va chạm; Follow Camera gắn vào cuối arm. Controller rotation và character rotation phải được cấu hình nhất quán.

---

## Cảnh Báo Kỹ Thuật / Technical Warnings

> [!WARNING]
> Đóng Editor trước khi đổi tên module/class lớn. Không commit `Binaries/`, `DerivedDataCache/`, `Intermediate/` hoặc `Saved/`. Dùng source control trước khi import asset dung lượng lớn.

---

## Thực Hành / Hands-On

**Môi trường:** Unreal Engine 5.3+, module `EchoesOfTerra`, plugin Enhanced Input bật; thêm `"EnhancedInput"` vào `EchoesOfTerra.Build.cs`.

#### Code khái niệm nhỏ — component tree

**Files:** `Source/EchoesOfTerra/Characters/BaseCharacter.h/.cpp`

```cpp
// BaseCharacter.h
UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category="Camera")
TObjectPtr<USpringArmComponent> CameraBoom;
UPROPERTY(VisibleAnywhere, BlueprintReadOnly, Category="Camera")
TObjectPtr<UCameraComponent> FollowCamera;

// BaseCharacter.cpp, trong constructor
CameraBoom = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraBoom"));
CameraBoom->SetupAttachment(GetRootComponent());
CameraBoom->TargetArmLength = 350.0f;
CameraBoom->bUsePawnControlRotation = true;
FollowCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("FollowCamera"));
FollowCamera->SetupAttachment(CameraBoom, USpringArmComponent::SocketName);
```

Compile và mở Blueprint con; Components panel phải hiện `CameraBoom → FollowCamera`. Default subobject chỉ được tạo trong constructor; `UPROPERTY`/`TObjectPtr` giữ reference hợp lệ cho reflection.

### Cấp độ 1: Project và Character

Tạo project `EchoesOfTerra`, import Greystone, tạo `ABaseCharacter` và `APlayerCharacter`.

### Cấp độ 2: Input

```cpp
void APlayerCharacter::Move(const FInputActionValue& Value)
{
    const FVector2D Axis = Value.Get<FVector2D>();
    const FRotator Rotation(0.0f, GetControlRotation().Yaw, 0.0f);
    AddMovementInput(FRotationMatrix(Rotation).GetUnitAxis(EAxis::X), Axis.Y);
    AddMovementInput(FRotationMatrix(Rotation).GetUnitAxis(EAxis::Y), Axis.X);
}

void APlayerCharacter::Look(const FInputActionValue& Value)
{
    const FVector2D Axis = Value.Get<FVector2D>();
    AddControllerYawInput(Axis.X);
    AddControllerPitchInput(Axis.Y);
}

void APlayerCharacter::SetupPlayerInputComponent(UInputComponent* Input)
{
    Super::SetupPlayerInputComponent(Input);
    UEnhancedInputComponent* Enhanced = Cast<UEnhancedInputComponent>(Input);
    if (!ensureMsgf(Enhanced, TEXT("Enhanced Input is required"))) return;
    if (MoveAction) Enhanced->BindAction(MoveAction, ETriggerEvent::Triggered, this, &ThisClass::Move);
    if (LookAction) Enhanced->BindAction(LookAction, ETriggerEvent::Triggered, this, &ThisClass::Look);
}
```

**Ví dụ trung gian:** khai báo `MoveAction`, `LookAction`, `DefaultMappingContext` bằng `UPROPERTY(EditDefaultsOnly)` trong `PlayerCharacter.h`; gán asset trong Blueprint. Trong `BeginPlay()`, chỉ thêm mapping context sau khi kiểm tra `Controller`, `ULocalPlayer` và subsystem khác null—AI/dedicated server có thể không có local player.

### Cấp độ 3: Camera và test map

Tạo Spring Arm, Follow Camera, platform dốc, hành lang hẹp và vật cản. Kiểm tra camera collision và tốc độ xoay.

**Lab tích hợp:** tạo `Content/EchoesOfTerra/Maps/L_ControllerGym`, `Blueprints/Characters/BP_PlayerCharacter` và `Input/{IA_Move,IA_Look,IMC_Player}`. Đặt `bOrientRotationToMovement=true`, `bUseControllerRotationYaw=false`, bật Spring Arm collision rồi test keyboard/gamepad.

**Expected/verification:** đi tám hướng không nhanh hơn đi thẳng; camera thu arm khi gặp tường; asset input null không crash. Nếu không di chuyển, kiểm tra GameMode/Pawn, mapping context và module dependency; nếu mesh quay theo camera, kiểm tra hai cờ rotation. Lưu kết quả tại `evidence/week02-controller.md`.

---

## Bài Tập / Exercises

### 🟢 Phần A

- WASD di chuyển theo hướng camera.
- Mouse/gamepad điều khiển camera.
- Tốc độ chỉnh được trong Editor.

### 🟡 Phần B

- Thêm `IA_Sprint` và thay đổi tốc độ khi giữ phím.
- Giới hạn pitch camera để tránh lật ngược.

### 🔴 Phần C: Character Controller Milestone

Quay video 30–60 giây chứng minh di chuyển trên dốc, va chạm camera và sprint hoạt động.

---

## Kiểm Thử / Testing

| Ca kiểm thử | Kết quả mong đợi |
|---|---|
| Đi chéo W+D | Tốc độ không lớn hơn đi thẳng |
| Camera chạm tường | Spring Arm thu ngắn, không xuyên tường |
| Thả Sprint | Trở lại tốc độ mặc định |
| Mở lại project | Compile và input vẫn hoạt động |

## Câu Hỏi Thảo Luận / Discussion Questions

1. Reflection bổ sung gì ngoài C++ chuẩn?
2. Vì sao Mapping Context nên tách khỏi Character?
3. Controller rotation khác actor rotation thế nào?
4. Vì sao diagonal input cần chuẩn hóa?
5. Logic nào nên ở C++ và logic nào phù hợp Blueprint?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Live Coding không thay thế clean build sau thay đổi reflection lớn.
- Spring Arm không phải camera; nó là cơ chế giữ và va chạm khoảng cách.
- Bind input thành công không bảo đảm Mapping Context đã được thêm.

## Đánh Giá / Assessment Rubric

| Tiêu chí | 9–10 | 7–8 | 5–6 | <5 |
|---|---|---|---|---|
| Character/Input | Mượt, chuẩn hóa diagonal | Hoạt động ổn định | Có Move/Look cơ bản | Input lỗi |
| Camera | Va chạm và góc nhìn tốt | Hoạt động, lỗi nhỏ | Camera cơ bản | Rung/xuyên nghiêm trọng |
| Project hygiene | `.gitignore`, cấu trúc sạch | Thiếu ít tài liệu | Compile được | Project không mở được |
| Kiểm thử | Đủ bảng và video | Thiếu một ca | Kiểm thử sơ sài | Không kiểm thử |

## Checklist

- [ ] Greystone dùng `APlayerCharacter`.
- [ ] Enhanced Input cấu hình đúng.
- [ ] Camera collision hoạt động.
- [ ] Test map và video milestone hoàn thành.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
