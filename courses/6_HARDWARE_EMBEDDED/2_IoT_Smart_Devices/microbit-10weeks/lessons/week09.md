# Tuần 9: MicroPython Nâng Cao, Thuật Toán Máy Trạng Thái & Game Retro (MicroPython, State Machines & Retro Games)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc phần mềm nâng cao với mô hình **Máy trạng thái hữu hạn (Finite State Machine - FSM)** trên MicroPython.
- Hiểu các cấu trúc dữ liệu nâng cao trong Python: Danh sách (`List`), Cặp dữ liệu (`Tuple`), Từ điển (`Dictionary`) và Hàm lập trình cấu trúc (`Functions`).
- Tối ưu hóa thuật toán gỡ lỗi (Debugging), quản lý bộ nhớ RAM và tốc độ thực thi chương trình.
- Thực hành lập trình game điện tử gia đình kinh điển: **Game Rắn Săn Mồi (Snake Game)** hoặc **Bắn Máy Bay (Space Invaders)** 100% bằng mã nguồn MicroPython trên ma trận LED $5 \times 5$.

### English
- Master advanced embedded software architectures with **Finite State Machines (FSM)** in MicroPython.
- Master Python data structures: `List`, `Tuple`, `Dictionary`, and functional decomposition.
- Optimize debugging routines, RAM memory footprints, and execution frame rates.
- Program classic retro arcade games: **Retro Snake** or **Space Invaders** using 100% text-based MicroPython code on the $5 \times 5$ LED Matrix.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Máy Trạng Thái Hữu Hạn (Finite State Machine - FSM)

#### Tiếng Việt
Máy trạng thái FSM chia ứng dụng thành các trạng thái (States) riêng biệt. Hệ thống chuyển đổi trạng thái khi có sự kiện (Events) xảy ra:

```text
 ┌───────────────┐        (Button A Press)       ┌───────────────┐
 │ STATE_MENU    │ ────────────────────────────► │ STATE_PLAYING │
 └───────────────┘                               └───────┬───────┘
         ▲                                               │ (Game Over)
         │               (Timeout 3s)                    ▼
         └────────────────────────────────────── ┌───────────────┐
                                                 │ STATE_GAMEOVER│
                                                 └───────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Retro Snake Game Engine on 5x5 LED Matrix
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 9: Retro Snake Game Engine on 5x5 LED Matrix

from microbit import *
import random

# Game States
STATE_MENU = 0
STATE_PLAYING = 1
STATE_GAMEOVER = 2

current_state = STATE_MENU

# Snake State Variables
snake = [(2, 2)]        # List of (x, y) tuples
direction = (0, -1)     # Moving UP by default
food = (0, 0)
score = 0

def spawn_food():
    global food
    while True:
        fx = random.randint(0, 4)
        fy = random.randint(0, 4)
        if (fx, fy) not in snake:
            food = (fx, fy)
            break

def reset_game():
    global snake, direction, score, current_state
    snake = [(2, 2)]
    direction = (0, -1)
    score = 0
    spawn_food()
    current_state = STATE_PLAYING

while True:
    if current_state == STATE_MENU:
        display.show(Image.PITCHFORK)
        if button_a.is_pressed() or button_b.is_pressed():
            reset_game()

    elif current_state == STATE_PLAYING:
        # Input Controls: Button A = Turn Left, Button B = Turn Right
        if button_a.was_pressed():
            direction = (-direction[1], direction[0]) # Rotate 90 deg Left
        elif button_b.was_pressed():
            direction = (direction[1], -direction[0])  # Rotate 90 deg Right

        # Calculate new head position
        head_x = (snake[0][0] + direction[0]) % 5
        head_y = (snake[0][1] + direction[1]) % 5
        new_head = (head_x, head_y)

        # Collision with self?
        if new_head in snake:
            current_state = STATE_GAMEOVER
            continue

        # Move Snake
        snake.insert(0, new_head)
        
        # Check Food Collision
        if new_head == food:
            score += 1
            spawn_food()
        else:
            snake.pop() # Remove tail

        # Render Game Field on 5x5 LED Matrix
        display.clear()
        # Draw Snake (Brightness = 9)
        for segment in snake:
            display.set_pixel(segment[0], segment[1], 9)
        # Draw Food (Blinking Brightness = 4)
        display.set_pixel(food[0], food[1], 4)

        sleep(400) # Game speed

    elif current_state == STATE_GAMEOVER:
        display.show(Image.SKULL)
        sleep(1000)
        display.scroll("Score: " + str(score))
        current_state = STATE_MENU
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 9.1: Trình Quản Lý Máy Trạng Thái FSM 3 Trạng Thái
Viết script MicroPython triển khai FSM với 3 trạng thái: `STATE_IDLE` (hiển thị mặt cười), `STATE_MEASURING` (đọc cảm biến nhiệt độ), và `STATE_ALERT` (phát còi hú). Chuyển đổi trạng thái qua lại bằng `Button A` và `Button B`.

#### Bài 9.2: Trò Chơi Nhanh Tay Nhanh Mắt (Reaction Time Game)
Lập trình game kiểm tra phản xạ: Chờ thời gian ngẫu nhiên $2 - 5$ giây, màn hình bất ngờ hiện một chấm sáng. Người chơi bấm nút A ngay lập tức. Tính thời gian phản ứng bằng millisecond.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 9.3: Game Bắn Máy Bay Retro Space Invaders
Viết game Space Invaders bằng MicroPython:
- Tàu vũ trụ của người chơi di chuyển ở hàng cuối ($y = 4$).
- Kẻ địch di chuyển từ trên xuống ($y = 0 \to 4$).
- Nhấn nút A/B di chuyển tàu trái/phải, nghiêng micro:bit để bắn đạn nổ tiêu diệt kẻ địch.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 9.4: Giả Lập Game Retro Snake Trên Trình Biên Dịch MicroPython Web
Mở trình duyệt truy cập https://python.microbit.org/, dán mã nguồn Game Rắn Săn Mồi và kiểm thử tốc độ phản hồi trên bàn phím giả lập.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MicroPython Reference Code for Reaction Time Game
from microbit import *
import random

display.clear()
sleep(random.randint(2000, 5000))

display.show(Image.HEART)
start_time = running_time()

while True:
    if button_a.is_pressed() or button_b.is_pressed():
        reaction = running_time() - start_time
        display.scroll(str(reaction) + "ms")
        break
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức MicroPython Nâng Cao** | Giải thích sâu sắc mô hình Máy trạng thái hữu hạn FSM, quản lý mảng List/Tuple, xử lý va chạm và vẽ ma trận LED. | Hiểu cấu trúc FSM và viết được game đơn giản. | Nắm được định nghĩa MicroPython nhưng chưa viết được FSM. | Code bị tràn bộ nhớ hoặc treo game. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (FSM 3-State Manager, Reaction Game, Space Invaders & Snake Game Engine). | Hoàn thành Bài 9.1 và Bài 9.2 đúng yêu cầu. | Code có lỗi xử lý va chạm hoặc di chuyển rắn sai. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.
