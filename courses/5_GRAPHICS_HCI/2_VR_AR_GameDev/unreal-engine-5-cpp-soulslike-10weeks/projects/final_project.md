# Đồ án cuối khóa — Echoes of Terra

## Mục tiêu

Hoàn thành một combat arena Soulslike bằng Unreal Engine 5 và C++, thể hiện kiến trúc mở rộng được thay vì tập hợp Blueprint rời rạc.

## Yêu cầu bắt buộc

- Player C++ với Enhanced Input và camera góc nhìn thứ ba.
- Locomotion và Animation Blueprint.
- Normal Attack, Strong Attack và combo ít nhất ba đòn.
- Weapon trace và directional hit reaction.
- Health, stamina, damage và death.
- Niagara impact, weapon trail, âm thanh và camera shake.
- Player HUD và enemy health bar.
- Enemy AI có patrol, chase, strafe, attack, hit react và death.
- Behavior Tree, Blackboard, Tasks và Services.
- Enemy Spawner, tối thiểu hai wave và một boss.
- Win/Lose Widget và Restart.
- Cấu hình nhân vật/attack bằng Data Asset.
- Project được quản lý bằng Git và đóng gói thành build chạy được.

## Rubric

| Hạng mục | Điểm |
|---|---:|
| C++ và kiến trúc component/interface | 20 |
| Combat và hit detection | 20 |
| Animation, âm thanh và VFX | 15 |
| AI và Behavior Tree | 25 |
| UI, health và stamina | 10 |
| Clean Code, Git và độ ổn định | 10 |

## Hồ sơ bàn giao

```text
EchoesOfTerra/
├── Source/
├── Content/
├── Config/
├── README.md
├── DESIGN.md
├── TESTING.md
└── Build/
```

`README.md` phải hướng dẫn mở project, điều khiển và đóng gói. `DESIGN.md` mô tả kiến trúc. `TESTING.md` ghi các ca kiểm thử và lỗi còn biết.

## Các module code phải thể hiện

- `Characters`: không chứa toàn bộ combat logic; chỉ điều phối component.
- `Components`: Attack, Health và Stamina dùng lại cho nhiều loại Character.
- `Interfaces`: Player và AI giao tiếp qua hợp đồng chung thay vì cast cứng.
- `Data`: thông số nhân vật và attack cấu hình bằng Data Asset.
- `AI`: Task/Service có lifecycle rõ ràng và không tìm Player mỗi Tick.
- `Game`: Spawner/GameMode quản lý wave, win, lose và restart.

Mã nguồn phải compile từ clean checkout. Những đoạn chỉ chạy nhờ trạng thái tạm trong Editor không được xem là hoàn thành.

## Definition of Done

1. Clean build thành công.
2. Chơi hết arena không gặp lỗi chặn tiến trình.
3. Restart hoạt động sau cả Win và Lose.
4. Không có hard reference không cần thiết giữa Player và Enemy.
5. Thêm enemy hoặc attack mới chủ yếu qua Data Asset.
6. Có video demo 2–4 phút và executable build.
