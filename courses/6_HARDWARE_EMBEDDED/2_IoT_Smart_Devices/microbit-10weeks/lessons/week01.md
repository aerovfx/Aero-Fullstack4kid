# Tuần 1: Kiến Trúc BBC micro:bit v2, Ma Trận LED 5x5 & Nút Nhấn / Week 1: BBC micro:bit v2, 5x5 LED Matrix & Buttons

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Khám phá kiến trúc phần cứng của bo mạch **BBC micro:bit v2** (Vi xử lý ARM Cortex-M4F, Ma trận 25 đèn LED Đỏ $5 \times 5$, Nút nhấn A/B, Nút cảm ứng Touch Logo, Loa và Micro tích hợp).
- Hiểu sơ đồ chân giao tiếp **Edge Connector** (các chân lớn `P0`, `P1`, `P2`, `3V`, `GND` và 19 chân tín hiệu nhỏ).
- Nắm vững môi trường lập trình khối kéo thả **Microsoft MakeCode** và ngôn ngữ **MicroPython**.
- Lập trình hiển thị hình ảnh biểu tượng (Icon), chữ cái chạy (Scrolling Text) và hiệu ứng hoạt họa (Animation) trên ma trận LED $5 \times 5$.
- Lập trình xử lý sự kiện bấm nút `Button A`, `Button B`, và `Touch Logo` phát âm thanh thanh điệu qua loa nhúng.

### English
- Explore the hardware architecture of the **BBC micro:bit v2** board (ARM Cortex-M4F CPU, $5 \times 5$ Red LED Matrix, Buttons A/B, Touch Logo, built-in Speaker, and Microphone).
- Understand the **Edge Connector** pinout (`P0`, `P1`, `P2`, `3V`, `GND`, and 19 small GPIO pins).
- Master block-based visual programming in **Microsoft MakeCode** and text-based **MicroPython**.
- Program custom LED matrix icons, scrolling strings, and frame-by-frame animations on the $5 \times 5$ LED display.
- Handle input events from `Button A`, `Button B`, and the capacitive `Touch Logo` with sound synthesizer effects.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- 1 x Bo mạch BBC micro:bit v2.
- 1 x Cáp Micro-USB truyền dữ liệu.
- 1 x Hộp Pin AAA ($2 \times 1.5\text{V}$) kèm giắc JST.
- Trình duyệt Web (Chrome/Edge) truy cập https://makecode.microbit.org/ hoặc phần mềm Mu Editor.

### English
- 1 x BBC micro:bit v2 Board.
- 1 x Micro-USB Data Cable.
- 1 x AAA Battery Holder ($2 \times 1.5\text{V}$) with JST connector.
- Web Browser accessing https://makecode.microbit.org/ or Mu Editor software.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Phần Cứng BBC micro:bit v2 / Hardware Architecture

#### Tiếng Việt
BBC micro:bit v2 là một máy tính bỏ túi nhỏ gọn được thiết kế riêng cho giáo dục STEM:
- **Vi xử lý:** Nordic nRF52833 (ARM Cortex-M4F 32-bit, xung nhịp 64 MHz, 512KB Flash, 128KB RAM).
- **Hiển thị:** Ma trận 25 đèn LED đỏ bố trí $5 \times 5$ (tọa độ $x \in [0, 4]$, $y \in [0, 4]$ với $x=0, y=0$ ở góc trên bên trái).
- **Đầu vào:** Nút bấm `Button A` (bên trái), `Button B` (bên phải), Nút cảm ứng điện dung `Touch Logo` (biểu tượng micro:bit kim loại ở mặt trước).
- **Âm thanh:** Loa Piezo tích hợp ở mặt sau + Micro MEMS thu âm thanh môi trường kèm đèn LED báo hiệu.
- **Cảm biến nhúng:** Gia tốc kế 3 trục (LSM303AGR), Cảm biến từ trường/La bàn, Cảm biến nhiệt độ chip CPU và Cảm biến mức độ ánh sáng ma trận LED.

```text
       (x=0, y=0) ┌───┬───┬───┬───┬───┐ (x=4, y=0)
                  │ O │ O │ O │ O │ O │
                  ├───┼───┼───┼───┼───┤
                  │ O │ O │ O │ O │ O │
                  ├───┼───┼───┼───┼───┤
                  │ O │ O │ O │ O │ O │
                  ├───┼───┼───┼───┼───┤
                  │ O │ O │ O │ O │ O │
                  ├───┼───┼───┼───┼───┤
       (x=0, y=4) └───┴───┴───┴───┴───┘ (x=4, y=4)
```

---

### 2. Tọa Độ Ma Trận LED $5 \times 5$ & Độ Sáng (Brightness)

#### Tiếng Việt
Mỗi điểm ảnh LED trên ma trận được xác định bởi cặp tọa độ $(x, y)$:
- Góc trên cùng bên trái: $(0, 0)$.
- Góc dưới cùng bên phải: $(4, 4)$.
- Độ sáng của từng điểm ảnh LED có thể điều chỉnh từ $0$ (Tắt hoàn toàn) đến $255$ (Sáng tối đa) trong MicroPython, hoặc $0 - 9$ trong MakeCode.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MakeCode Python / JavaScript - Interactive Emoji & Music Player
```python
# MakeCode Python Code for BBC micro:bit v2
# Lesson 1: Interactive Emoji & Music Synthesizer

def on_button_pressed_a():
    basic.clear_screen()
    basic.show_icon(IconNames.HAPPY)
    music.play_tone(262, music.beat(BeatFraction.WHOLE)) # C4 Tone

def on_button_pressed_b():
    basic.clear_screen()
    basic.show_icon(IconNames.SAD)
    music.play_tone(196, music.beat(BeatFraction.WHOLE)) # G3 Tone

def on_logo_event_touched():
    basic.clear_screen()
    basic.show_string("HELLO STEM!")
    music.start_melody(melody_key(Melodies.BA_DING), MelodyOptions.ONCE)

input.on_button_pressed(Button.A, on_button_pressed_a)
input.on_button_pressed(Button.B, on_button_pressed_b)
input.on_logo_event(TouchButtonEvent.TOUCHED, on_logo_event_touched)

# Default Start
basic.show_icon(IconNames.HEART)
```

---

### Code 2: Pure MicroPython (Mu Editor / MicroPython Web)
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 1: Custom Pixel Animation & Tone Generator

from microbit import *
import music

# Custom Heart Animation Frames
heart_small = Image("00000:"
                    "01010:"
                    "01110:"
                    "00100:"
                    "00000")

display.show(Image.HEART)
music.play(music.POWER_UP)

while True:
    if button_a.is_pressed() and button_b.is_pressed():
        display.show(Image.SURPRISED)
        music.pitch(880, 200) # A5 tone
        sleep(500)
    elif button_a.is_pressed():
        display.show(Image.HAPPY)
        music.pitch(440, 100) # A4 tone
        sleep(200)
    elif button_b.is_pressed():
        display.show(Image.SAD)
        music.pitch(330, 100) # E4 tone
        sleep(200)
    elif pin_logo.is_touched():
        # Heartbeat pulse animation
        display.show(Image.HEART)
        sleep(200)
        display.show(heart_small)
        sleep(200)
    else:
        display.show(Image.HEART)
        sleep(100)
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Ma trận LED $5 \times 5$ trên micro:bit v2 có tổng cộng bao nhiêu điểm ảnh (Pixels)? Tọa độ $(0, 0)$ nằm ở góc nào của bo mạch?
2. Sự khác biệt khi lập trình nút bấm `Button A` giữa phương thức Xử lý sự kiện (Event-driven) và Kiểm tra vòng lặp liên tục (Polling) là gì?
3. Tính năng Nút cảm ứng Touch Logo trên micro:bit v2 hoạt động dựa trên nguyên lý điện dung (Capacitive Sensing) như thế nào?
4. Tại sao bo mạch micro:bit v2 lại có thêm loa nhỏ ở mặt sau so với phiên bản micro:bit v1 cũ?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Trình Biểu Cảm Hoạt Họa (Animated Emoji)
Lập trình hiệu ứng hoạt hình đập cánh của con chim (Bird Animation) trên ma trận LED $5 \times 5$:
- Chuyển đổi qua lại giữa hình ảnh `Image.BIRD` và hình ảnh cánh hạ xuống sau mỗi $300\,\text{ms}$.
- Khi nhấn nút A, tốc độ đập cánh tăng gấp đôi. Khi nhấn nút B, tốc độ về bình thường.

#### Bài 1.2: Bộ Đếm Sản Phẩm Bằng Nút Nhấn (Digital Counter)
Viết chương trình đếm số lượng:
- Ban đầu hiển thị số $0$.
- Mỗi lần nhấn `Button A`, số tăng thêm $1$.
- Mỗi lần nhấn `Button B`, số giảm đi $1$.
- Nhấn đồng thời `Button A + B`, số reset về $0$.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Máy Chơi Nhạc Mini Piano 3 Phím (3-Key Mini Synthesizer)
Lập trình micro:bit v2 thành một cây đàn Piano mini:
- Nhấn `Button A`: Phát nốt **Đô (C4 - 262Hz)** và hiển thị chữ `"C"`.
- Nhấn `Button B`: Phát nốt **Rê (D4 - 294Hz)** và hiển thị chữ `"D"`.
- Chạm vào `Touch Logo`: Phát nốt **Mi (E4 - 330Hz)** và hiển thị chữ `"E"`.
- Phát nhạc mượt mà không làm đứng (block) màn hình hiển thị.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on Colab Lab)

#### Bài 1.4: Xúc Xắc Điện Tử Thông Minh (Smart Digital Dice Simulator)
Mở [MakeCode micro:bit Simulator](https://makecode.microbit.org/) và thực hiện:
1. Lập trình xúc xắc sinh số ngẫu nhiên từ $1$ đến $6$ khi người dùng lắc bo mạch (Event `on shake`).
2. Hiển thị số lượng chấm xúc xắc thực tế trên ma trận LED (ví dụ số 1 hiển thị 1 chấm ở giữa, số 6 hiển thị 6 chấm 2 cột).
3. Phát âm thanh hiệu ứng đổ xúc xắc ngẫu nhiên.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Dice Simulator
def on_gesture_shake():
    music.play_sound_effect(sound_expression.giggle, SoundExpressionExecution.IN_BACKGROUND)
    dice = randint(1, 6)
    basic.show_number(dice)
    basic.pause(1000)
    basic.clear_screen()

input.on_gesture(Gesture.SHAKE, on_gesture_shake)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Phần Cứng micro:bit** | Giải thích sâu sắc cấu trúc vi xử lý nRF52833, ma trận LED $5 \times 5$, Touch Logo và nguyên lý quét LED. | Hiểu tọa độ ma trận LED, nút nhấn A/B và cách phát âm thanh. | Nắm được định nghĩa micro:bit nhưng chưa hiểu hệ tọa độ $(x, y)$. | Không nạp được chương trình sang board. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Animated Emoji, Digital Counter, Mini Piano & Smart Dice Simulator). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi hiển thị số hoặc kẹt vòng lặp. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
