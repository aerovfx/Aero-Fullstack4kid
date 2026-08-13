# Tuần 1: Nền tảng C++ và kiến trúc Soulslike / Week 1: C++ Foundations & Soulslike Architecture

## Mục Tiêu / Objectives

Tuần đầu xây nền C/C++ cần thiết cho Unreal và mô hình hóa dữ liệu chiến đấu của **Echoes of Terra**. Mọi bài tập đều chuẩn bị trực tiếp cho các class sẽ dùng trong project. / This week establishes the C/C++ foundation required by Unreal and models the combat data used throughout the project.

**Mục tiêu cụ thể / Specific Objectives:**
1. Sử dụng đúng biến, điều kiện, vòng lặp, mảng, hàm và `const`.
2. Phân biệt value, pointer, reference, stack và heap.
3. Áp dụng class, constructor, encapsulation, inheritance và override.
4. Thiết kế `CharacterStats`, `Character`, `Player` và `Enemy`.
5. Quản lý source bằng Git ngay từ milestone đầu tiên.

---

## Lý Thuyết / Theory

### 1. Dữ liệu chiến đấu

- **Health:** tài nguyên quyết định nhân vật còn sống.
- **Stamina:** tài nguyên giới hạn hành động mạnh.
- **Damage:** lượng HP bị trừ trước/sau khi áp dụng giáp.
- **Invariant:** điều kiện luôn đúng, ví dụ `0 <= Health <= MaxHealth`.

### 2. Value, Pointer và Reference

- Value tạo bản sao; thay đổi bản sao không đổi dữ liệu gốc.
- Pointer lưu địa chỉ và có thể là `nullptr`.
- Reference là bí danh của một đối tượng hợp lệ.
- Trong Unreal, pointer tới `UObject` phải được theo dõi đúng cách bằng `UPROPERTY` khi trở thành dữ liệu thành viên.

### 3. Hướng đối tượng

```text
Character
├── Player
└── Enemy
```

- **Encapsulation:** HP chỉ thay đổi qua `ApplyDamage()` hoặc `Heal()`.
- **Inheritance:** Player và Enemy tái sử dụng hành vi Character.
- **Polymorphism:** mỗi loại nhân vật có thể override cách chọn attack.
- **Single Responsibility:** class chỉ nên có một lý do chính để thay đổi.

---

## Cảnh Báo Kỹ Thuật / Technical Warnings

> [!WARNING]
> Không xóa thủ công các thư mục source/config khi Unreal Editor đang mở. Commit trước mỗi thay đổi kiến trúc lớn. Không lưu pointer tới object Unreal mà không hiểu vòng đời và Garbage Collection.

---

## Thực Hành Code / Hands-On

**Ngữ cảnh chạy:** dùng C++17 thuần để kiểm chứng luật combat trước khi chuyển sang Unreal. Biên dịch: `clang++ -std=c++17 src/main.cpp -o combat_sim`.

### Cấp độ 1: Khái niệm nhỏ — invariant tài nguyên

**File:** `Week01/src/main.cpp`

```cpp
struct CharacterStats
{
    float MaxHealth = 100.0f;
    float Health = 100.0f;
    float MaxStamina = 100.0f;
    float Stamina = 100.0f;
    float AttackDamage = 20.0f;
};

float ClampResource(float Value, float Maximum)
{
    return std::clamp(Value, 0.0f, std::max(0.0f, Maximum));
}
```

Thêm `#include <algorithm>`. Xác minh `ClampResource(-5, 100)==0` và `ClampResource(125, 100)==100`; maximum âm cũng trả 0.

### Cấp độ 2: Ví dụ trung gian — class đóng gói tài nguyên

**File:** `Week01/src/main.cpp` (mở rộng ví dụ trên)

```cpp
class Character
{
public:
    explicit Character(const CharacterStats& InStats) : Stats(InStats) {}

    bool SpendStamina(float Cost)
    {
        if (Cost < 0.0f || Stats.Stamina < Cost) return false;
        Stats.Stamina -= Cost;
        return true;
    }

    void RestoreStamina(float Amount)
    {
        if (Amount > 0.0f)
            Stats.Stamina = ClampResource(Stats.Stamina + Amount, Stats.MaxStamina);
    }

    void ApplyDamage(float Amount)
    {
        if (Amount <= 0.0f) return;
        Stats.Health = std::max(0.0f, Stats.Health - Amount);
    }

    bool IsDead() const { return Stats.Health <= 0.0f; }
    float GetHealth() const { return Stats.Health; }

private:
    CharacterStats Stats;
};
```

`SpendStamina()` trả `bool` để caller biết action có hợp lệ mà không sửa trực tiếp state. Test cost âm, cost đúng bằng stamina, hồi vượt max, damage âm và damage sau khi chết.

### Cấp độ 3: Lab tích hợp — Combat Simulator của Echoes of Terra

**File:** `Week01/src/main.cpp`

```cpp
int main()
{
    CharacterStats HeroStats;
    HeroStats.MaxHealth = HeroStats.Health = 120.0f;
    Character Greystone(HeroStats);

    CharacterStats EnemyStats;
    EnemyStats.MaxHealth = EnemyStats.Health = 50.0f;
    std::vector<Character> Enemies(3, Character(EnemyStats));

    for (Character& Enemy : Enemies)
    {
        while (!Greystone.IsDead() && !Enemy.IsDead())
        {
            const bool bStrong = Greystone.SpendStamina(30.0f);
            Enemy.ApplyDamage(bStrong ? 35.0f : HeroStats.AttackDamage);
            if (!Enemy.IsDead()) Greystone.ApplyDamage(8.0f);
            Greystone.RestoreStamina(10.0f);
        }
    }
    std::cout << (Greystone.IsDead() ? "Defeat" : "Victory")
              << ", HP=" << Greystone.GetHealth() << '\n';
    return Greystone.IsDead() ? 1 : 0;
}
```

Thêm `#include <iostream>` và `<vector>`. Chạy `./combat_sim`: chương trình phải dừng, in `Victory`/`Defeat`, và không có HP/stamina âm. Các identifiers `CharacterStats`, Greystone, damage và stamina tiếp tục được dùng trong Unreal ở tuần sau.

Tạo vòng lặp cho Player đấu ba Enemy. Mỗi lượt cho phép Normal Attack, Strong Attack hoặc Rest. Strong Attack chỉ chạy nếu đủ stamina.

**Kết quả mong đợi / Expected Result:** chương trình kết thúc đúng khi Player chết hoặc toàn bộ Enemy bị hạ; HP và stamina không âm.

---

## Bài Tập & Bài Về Nhà / Exercises & Homework

### 🟢 Phần A: Cơ bản

1. Viết `Heal()`, `SpendStamina()` và `RestoreStamina()`.
2. Thêm giáp và công thức `FinalDamage = max(1, Damage - Armor)`.

### 🟡 Phần B: Nâng cao

1. Tạo `Player : public Character` và `Enemy : public Character`.
2. Override hàm chọn attack.
3. Tách declaration/implementation thành `.h` và `.cpp`.

### 🔴 Phần C: Mini Project

Tạo `CombatSimulatorCPP` có menu, ba loại Enemy, battle log và tối thiểu năm test case thủ công.

---

## Hồ Sơ Nộp Bài / Deliverables

```text
Week01/
├── src/
├── tests/test-cases.md
├── architecture.md
└── README.md
```

## Câu Hỏi Thảo Luận / Discussion Questions

1. Vì sao HP nên được bảo vệ thay vì để `public`?
2. Khi nào reference phù hợp hơn pointer?
3. Invariant giúp ngăn loại bug combat nào?
4. Kế thừa có thể gây coupling ra sao?
5. Phần nào của simulator nên trở thành Unreal Component?

## Hiểu Lầm Thường Gặp / Common Misconceptions

- Pointer không tự động có nghĩa là cấp phát heap.
- `const` không làm mọi object liên quan trở thành bất biến.
- Kế thừa không phải lựa chọn mặc định; composition thường phù hợp cho khả năng gameplay.

## Đánh Giá / Assessment Rubric

| Tiêu chí | Xuất sắc (9–10) | Tốt (7–8) | Đạt (5–6) | Cần cải thiện (<5) |
|---|---|---|---|---|
| C++ cơ bản | Logic đúng, có kiểm tra biên | Logic chính xác, thiếu ít kiểm tra | Chạy được ca cơ bản | Lỗi compile/runtime |
| OOP | Encapsulation và kế thừa hợp lý | Class rõ nhưng còn phụ thuộc | Có class nhưng trách nhiệm lẫn lộn | Toàn bộ logic trong `main` |
| Kiểm thử | Có ≥5 ca và battle log | Có 3–4 ca | Có 1–2 ca | Không kiểm thử |
| Git/tài liệu | Commit rõ, README đầy đủ | Có Git và hướng dẫn | Commit ít | Không có lịch sử |

## Checklist Hoàn Thành

- [ ] Combat simulator compile và chạy.
- [ ] HP/stamina luôn hợp lệ.
- [ ] Có sơ đồ class.
- [ ] Có README và test cases.
- [ ] Tối thiểu ba commit có ý nghĩa.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.
