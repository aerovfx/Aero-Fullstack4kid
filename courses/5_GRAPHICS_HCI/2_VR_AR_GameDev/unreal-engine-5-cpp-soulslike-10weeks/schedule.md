# Lộ trình 10 tuần — Echoes of Terra

| Tuần | Chủ đề | Phạm vi Udemy | Milestone |
|---|---|---|---|
| 1 | C/C++, OOP và kiến trúc | Section 1–3 | Bộ class và dữ liệu nhân vật |
| 2 | Unreal setup, input, camera | Bài 48–60 | Greystone điều khiển được |
| 3 | Di chuyển, Data Asset, animation | Bài 61–64 | Locomotion tái sử dụng được |
| 4 | Attack Component và Interface | Bài 65–73 | Đòn đánh đầu tiên |
| 5 | Trace, damage, hit reaction | Bài 74–87 | Combat Vertical Slice v1 |
| 6 | Combo, audio và VFX | Bài 88–106 | Combat có cảm giác Soulslike |
| 7 | Widget, health và stamina | Bài 107–110, 137–143 | HUD và tài nguyên chiến đấu |
| 8 | AI cơ bản | Bài 111–126 | Enemy patrol/chase |
| 9 | AI chiến đấu | Bài 127–136, 144–151 | Enemy tự chiến đấu |
| 10 | Spawner và game loop | Bài 152–161 | Arena hoàn chỉnh |

## Lịch 20 buổi học

| Tuần | Buổi | Nội dung | Code artifact | Kết quả |
|---|---:|---|---|---|
| 1 | 1 | Kiểu dữ liệu, hàm, pointer/reference | `CharacterStats.h` | Dữ liệu combat hợp lệ |
| 1 | 2 | Class, kế thừa, combat simulator | `Character.cpp`, `CombatSimulator.cpp` | Mô phỏng trận đấu chạy được |
| 2 | 3 | Unreal reflection và Character | `BaseCharacter.h/.cpp` | Character spawn đúng |
| 2 | 4 | Enhanced Input và camera | `PlayerCharacter.h/.cpp` | Move/Look/Sprint hoạt động |
| 3 | 5 | Data-driven character | `CharacterDataAsset.h` | Greystone/Terra có data riêng |
| 3 | 6 | Anim Instance và locomotion | `CombatAnimInstance.h/.cpp` | Idle/Walk/Run/Jump mượt |
| 4 | 7 | Interface và component | `CombatInterface.h`, `AttackComponent.h` | API attack dùng chung |
| 4 | 8 | Montage lifecycle | `AttackComponent.cpp` | Attack/interrupt reset an toàn |
| 5 | 9 | Weapon sockets và sweep trace | `ANS_AttackTrace.h/.cpp` | Trace theo lưỡi kiếm |
| 5 | 10 | Point Damage và hit reaction | `HealthComponent.cpp`, reaction helper | Damage và bốn hướng phản ứng |
| 6 | 11 | Attack Data và combo | `AttackData.h`, combo state | Combo ba đòn |
| 6 | 12 | Niagara, audio, trail, shake | Combat feedback integration | Vertical Slice v2 |
| 7 | 13 | Health/Stamina components | `StaminaComponent.h/.cpp` | Cost/delay/regen đúng |
| 7 | 14 | Event-driven widgets | `PlayerHUD`, `EnemyHealthBar` | UI cập nhật qua delegate |
| 8 | 15 | AI Controller, Blackboard, patrol | `EnemyAIController`, `BTTask_FindPatrolLocation` | Enemy tuần tra |
| 8 | 16 | AI Perception và chase | Perception handlers | Enemy phát hiện/mất dấu |
| 9 | 17 | Service và Attack Task | `BTService_UpdateDistance`, `BTTask_Attack` | Enemy chọn thời điểm đánh |
| 9 | 18 | Strafe, stamina, death | Combat-state integration | AI combat hoàn chỉnh |
| 10 | 19 | Spawner, wave, affiliation | `EnemySpawner.h/.cpp` | Ba wave hoạt động |
| 10 | 20 | Win/Lose, restart, packaging | `SoulslikeGameMode`, End Widget | Final build chạy độc lập |

## Quy tắc code mỗi buổi

1. Compile sau mỗi thay đổi nhỏ.
2. Chạy ít nhất một happy-path và một edge-case test.
3. Không chuyển đoạn code mẫu sang tuần sau nếu chưa giải thích dependency và kết quả.
4. Dùng cùng namespace/module/class names xuyên suốt khóa học.
5. Kết thúc buổi bằng một commit cục bộ có ý nghĩa do học viên tự thực hiện.

## Nhịp học mỗi tuần

- 2–3 giờ: xem bài và ghi chú.
- 3–4 giờ: triển khai theo bài vào project.
- 1–2 giờ: thử thách độc lập.
- 30 phút: refactor, kiểm thử và Git commit.

## Các mốc đánh giá

- Cuối tuần 3: Character Prototype.
- Cuối tuần 6: Combat Vertical Slice.
- Cuối tuần 9: AI Combat Demo.
- Cuối tuần 10: Final Playable Build.
