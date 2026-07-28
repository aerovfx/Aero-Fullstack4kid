# Unreal Engine 5 C++: Echoes of Terra

Khóa học project-based 10 tuần dựa trên **“Unreal Engine 5: Nhập Môn C++”** của Brandon Vox trên Udemy. Toàn bộ bài học cùng phát triển một game Soulslike duy nhất, từ nền tảng C++ đến combat, UI, stamina và Behavior Tree AI.

## Thông tin khóa học

- Thời lượng: 10 tuần, 7–9 giờ/tuần
- Nền tảng: Unreal Engine 5, C++, Blueprint, Git
- Đầu vào: biết thao tác Unreal Editor và Blueprint cơ bản
- Sản phẩm cuối: một combat arena Soulslike có thể đóng gói
- Project xuyên suốt: **Echoes of Terra**

## Cấu trúc

- [Lộ trình 10 tuần](schedule.md)
- [Tuần 1 — Nền tảng C++ và kiến trúc project](lessons/week01.md)
- [Tuần 2 — Character, input và camera](lessons/week02.md)
- [Tuần 3 — Data Asset và animation](lessons/week03.md)
- [Tuần 4 — Kiến trúc hệ thống tấn công](lessons/week04.md)
- [Tuần 5 — Trace, damage và hit reaction](lessons/week05.md)
- [Tuần 6 — Combo, âm thanh và hiệu ứng](lessons/week06.md)
- [Tuần 7 — Health, stamina và HUD](lessons/week07.md)
- [Tuần 8 — AI patrol và chase](lessons/week08.md)
- [Tuần 9 — AI chiến đấu](lessons/week09.md)
- [Tuần 10 — Arena, spawner và hoàn thiện game](lessons/week10.md)
- [Đồ án cuối khóa](projects/final_project.md)

## Cấu trúc source đề xuất

```text
Source/EchoesOfTerra/
├── Characters/
├── Components/
├── Interfaces/
├── Animation/
├── Data/
├── AI/Tasks/
├── AI/Services/
├── AI/Spawner/
├── UI/
└── Game/
```

## Lộ trình code xuyên suốt

Mỗi tuần bổ sung code vào cùng module `EchoesOfTerra`; các ví dụ không phải project rời rạc:

```text
Tuần 1   CharacterStats + CombatSimulator thuần C++
Tuần 2   BaseCharacter + PlayerCharacter + Enhanced Input
Tuần 3   CharacterDataAsset + CombatAnimInstance
Tuần 4   CombatInterface + AttackComponent
Tuần 5   AttackTrace Notify State + HealthComponent
Tuần 6   AttackData + Combo/VFX/SFX integration
Tuần 7   StaminaComponent + PlayerHUD + EnemyHealthBar
Tuần 8   EnemyAIController + Patrol Task + AI Perception
Tuần 9   Distance Service + Attack Task + Combat State
Tuần 10  EnemySpawner + SoulslikeGameMode + EndGameWidget
```

Mỗi bài học nêu rõ file cần tạo/sửa, code minh họa, cách tích hợp, kết quả mong đợi và các ca kiểm thử.

## Quy tắc học tập

1. Mỗi tuần làm việc trên cùng một repository.
2. Mỗi hệ thống phải có một milestone chạy được.
3. Không chỉ chép code từ video; phải hoàn thành thử thách cuối tuần không nhìn hướng dẫn.
4. Commit sau mỗi thay đổi có ý nghĩa.
5. Không chuyển tuần nếu project chưa compile và milestone chưa vượt qua checklist.
