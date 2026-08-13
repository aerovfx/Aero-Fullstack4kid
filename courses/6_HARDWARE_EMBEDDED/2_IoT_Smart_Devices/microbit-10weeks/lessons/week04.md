# Tuần 4: Thiết Bị Chấp Hành, Đèn LED RGB Neopixel & Động Cơ Servo (Actuators, Neopixel & Servo Motors)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nguyên lý điều khiển các **Thiết bị chấp hành (Actuators)** nối với micro:bit: Đèn LED RGB WS2812B (Neopixel), Động cơ Servo SG90 và Loa phát nhạc Piezo Synthesizer.
- Hiểu kiến trúc truyền dữ liệu nối tiếp tốc độ cao $800\,\text{kHz}$ của dải đèn **Neopixel RGB** (điều khiển hàng trăm đèn LED chỉ bằng 1 chân GPIO).
- Sử dụng tín hiệu xung **PWM** để điều khiển vị trí góc quay chính xác của động cơ **Servo SG90 ($0^\circ - 180^\circ$)**.
- Thực hành lập trình hiệu ứng ánh sáng cầu vồng theo nhịp nhạc và kim đo đồng hồ Servo.

### English
- Master controlling embedded **Actuators**: WS2812B RGB Neopixel LEDs, SG90 Servo Motors, and Piezo Audio Synthesizers.
- Understand the $800\,\text{kHz}$ single-wire serial data protocol driving addressable **Neopixel RGB LEDs**.
- Generate **PWM** pulse trains to position **SG90 Servo Motors ($0^\circ - 180^\circ$)**.
- Practice rainbow music-reactive light shows and servo dial gauge indicators.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Dải Đèn LED RGB WS2812B (Neopixel) & Động Cơ Servo

#### Tiếng Việt
- **Neopixel WS2812B:** Mỗi đèn LED chứa chip IC tích hợp gồm 3 màu Đỏ (Red), Xanh lá (Green), Xanh dương (Blue). Mỗi màu có 256 mức độ sáng ($8$-bit), tạo ra tổng cộng $256 \times 256 \times 256 = 16.7$ triệu màu sắc.
- **Động cơ Servo SG90:** Điều khiển góc quay bằng độ rộng xung PWM tần số $50\,\text{Hz}$ (chu kỳ $20\,\text{ms}$):
  - Xung $1.0\,\text{ms} \implies$ Góc $0^\circ$.
  - Xung $1.5\,\text{ms} \implies$ Góc $90^\circ$ (Vị trí trung tâm).
  - Xung $2.0\,\text{ms} \implies$ Góc $180^\circ$.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Neopixel Rainbow & Servo Angle Controller
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 4: Neopixel RGB Rainbow & Servo Control

from microbit import *
import neopixel
import music

# Initialize Neopixel strip with 8 LEDs on Pin 1
np = neopixel.NeoPixel(pin1, 8)

def set_rainbow_color(shift):
    colors = [
        (255, 0, 0),   # Red
        (255, 127, 0), # Orange
        (255, 255, 0), # Yellow
        (0, 255, 0),   # Green
        (0, 0, 255),   # Blue
        (139, 0, 255)  # Purple
    ]
    for i in range(8):
        color_idx = (i + shift) % len(colors)
        np[i] = colors[color_idx]
    np.show()

def set_servo_angle(pin, angle):
    # Map angle (0 to 180) to pulse width for 50Hz PWM
    # 0 deg = duty ~ 26, 180 deg = duty ~ 128
    duty = int(26 + (angle / 180.0) * 102)
    pin.set_analog_period(20) # 20ms period (50Hz)
    pin.write_analog(duty)

current_angle = 90
shift_idx = 0

while True:
    if button_a.is_pressed():
        current_angle = max(0, current_angle - 15)
        set_servo_angle(pin2, current_angle)
        music.pitch(440, 50)
        sleep(100)
    elif button_b.is_pressed():
        current_angle = min(180, current_angle + 15)
        set_servo_angle(pin2, current_angle)
        music.pitch(880, 50)
        sleep(100)
        
    # Rotate Neopixel colors
    set_rainbow_color(shift_idx)
    shift_idx = (shift_idx + 1) % 6
    sleep(150)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 4.1: Đèn Báo Tín Hiệu Giao Thông RGB Neopixel
Lập trình dải đèn Neopixel 8 LED đóng vai trò cột đèn tín hiệu:
- 8 LED màu Đỏ sáng trong 4 giây.
- 8 LED màu Vàng sáng trong 2 giây.
- 8 LED màu Xanh lá sáng trong 4 giây.

#### Bài 4.2: Điều Khiển Góc Servo SG90 Bằng Nút Nhấn
Viết chương trình điều khiển Servo nối vào chân `P2`: Nhấn nút A góc quay giảm $15^\circ$, nhấn nút B góc quay tăng $15^\circ$, hiển thị góc hiện tại trên ma trận LED.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 4.3: Đồng Hồ Kim Đo Độ Âm Thanh Đồ Họa (Volume Meter & Servo Gauge)
Lập trình micro:bit v2 sử dụng Micro MEMS đo độ âm thanh môi trường:
- Hiển thị mức âm lượng bằng số lượng đèn Neopixel sáng tăng dần (VU Meter).
- Xoay kim động cơ Servo SG90 chỉ thị mức tiếng ồn từ $0^\circ$ (Yên tĩnh) đến $180^\circ$ (Quá ồn).

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 4.4: Giả Lập Mạch Cửa Tự Động Neopixel Trên MakeCode
Mở MakeCode Simulator, thêm extension `neopixel` và `servo`. Lập trình giả lập cửa tự động: Khi có người đến gần (Khoảng cách siêu âm $< 15\,\text{cm}$), Servo quay $90^\circ$ mở cửa và dải Neopixel sáng xanh; khi đi xa, cửa đóng và Neopixel chuyển đỏ.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Auto Door
strip = neopixel.create(DigitalPin.P1, 8, NeoPixelMode.RGB)
servo_angle = 0

def on_forever():
    global servo_angle
    # Simulated ultrasonic distance
    dist = 10 
    if dist < 15:
        pins.servo_write_pin(AnalogPin.P2, 90)
        strip.show_color(neopixel.colors(NeoPixelColors.GREEN))
    else:
        pins.servo_write_pin(AnalogPin.P2, 0)
        strip.show_color(neopixel.colors(NeoPixelColors.RED))
    basic.pause(500)

basic.forever(on_forever)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Thiết Bị Chấp Hành** | Giải thích sâu sắc nguyên lý giao tiếp Neopixel $800\,\text{kHz}$, độ rộng xung PWM Servo và tổng hợp âm thanh Piezo. | Hiểu cách sử dụng dải Neopixel RGB và động cơ Servo SG90. | Nắm được định nghĩa Neopixel nhưng chưa điều khiển được Servo. | Đấu sai dây làm cháy Servo. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Neopixel Traffic Light, Servo Angle Button, Volume Meter & Auto Door Lab). | Hoàn thành Bài 4.1 và Bài 4.2 đúng yêu cầu. | Code có lỗi Servo giật lag hoặc Neopixel không lên đúng màu. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
