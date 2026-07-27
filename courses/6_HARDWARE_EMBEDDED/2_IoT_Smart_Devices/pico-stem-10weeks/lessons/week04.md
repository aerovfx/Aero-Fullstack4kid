# Tuần 4: Điều Khiển Động Cơ DC, Mạch Cầu H L298N & Servo SG90 (Motors, Drivers & Servos)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Phân tích nguyên lý đảo chiều và điều tốc động cơ DC bằng **Mạch cầu H L298N**.
- Sử dụng tín hiệu xung PWM từ Pico RP2040 để điều khiển tốc độ góc động cơ DC ($0 - 100\%$) và góc vị trí của động cơ **Servo SG90 ($0^\circ - 180^\circ$)**.
- Phát nhạc giai điệu thông qua còi báo động **Piezo Buzzer** bằng xung PWM thay đổi tần số.
- Thực hành lắp mạch điều khiển động cơ DC và Servo bẻ lái góc.

### English
- Analyze DC motor directional control and speed regulation using **L298N H-Bridge Drivers**.
- Generate PWM signals from Pico RP2040 to manage DC motor speeds ($0 - 100\%$) and **SG90 Servo angles ($0^\circ - 180^\circ$)**.
- Synthesize musical melodies on a **Piezo Buzzer** using frequency-modulated PWM signals.
- Practice wiring dual DC motor drives and steering servos.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Dual DC Motor Drive & Servo Controller
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 4: L298N DC Motor Driver & Servo Controller

from machine import Pin, PWM
import time

# Motor A (Left) Pins
IN1 = Pin(10, Pin.OUT)
IN2 = Pin(11, Pin.OUT)
ENA = PWM(Pin(12))
ENA.freq(1000)

# Servo Pin (50Hz PWM)
servo_pwm = PWM(Pin(15))
servo_pwm.freq(50)

def set_servo_angle(angle_deg):
    # Map 0 - 180 deg to duty_u16 (approx 1638 to 8192)
    duty = int(1638 + (angle_deg / 180.0) * 6554)
    servo_pwm.duty_u16(duty)

def set_motor_speed(speed_pct):
    if speed_pct > 0:
        IN1.value(1); IN2.value(0)
    elif speed_pct < 0:
        IN1.value(0); IN2.value(1)
        speed_pct = -speed_pct
    else:
        IN1.value(0); IN2.value(0)

    duty = int((min(100, speed_pct) / 100.0) * 65535)
    ENA.duty_u16(duty)

print("[+] Motor & Servo Driver Active!")

set_servo_angle(90) # Center
set_motor_speed(60) # Forward 60%
time.sleep(2)

set_servo_angle(45) # Turn Left
time.sleep(1)

set_motor_speed(0) # Stop
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 4.1: Quét Tự Động Động Cơ Servo SG90
Viết script MicroPython cho Servo quét từ $0^\circ \to 180^\circ$ và $180^\circ \to 0^\circ$ liên tục.

#### Bài 4.2: Bộ Hàm Di Chuyển Khung Xe 2 Bánh
Viết các hàm `forward(speed)`, `backward(speed)`, `turn_left()`, `turn_right()`, `stop()` điều khiển xe robot 2 bánh.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 4.3: Nhạc Chuông Cảnh Báo Đa Âm (Polyphonic Alarm Synthesizer)
Viết script phát giai điệu nhạc Mario / Cảnh báo bằng cách thay đổi tần số PWM `pwm.freq(freq)` trên còi Buzzer.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 4.4: Giả Lập Mạch Servo SG90 Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico + Servo SG90 + Potentiometer. Viết script xoay Servo theo vị trí biến trở.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi Servo Reference Solution
from machine import Pin, ADC, PWM
import time

pot = ADC(26)
servo = PWM(Pin(15))
servo.freq(50)

while True:
    val = pot.read_u16()
    angle = (val / 65535.0) * 180.0
    duty = int(1638 + (angle / 180.0) * 6554)
    servo.duty_u16(duty)
    time.sleep(0.05)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Động Cơ & Cầu H** | Giải thích sâu sắc nguyên lý cầu H L298N, xung PWM điều tốc $1\text{kHz}$ và tần số Servo $50\text{Hz}$. | Hiểu cách sử dụng mạch L298N và Servo SG90. | Nắm được định nghĩa động cơ nhưng chưa đảo chiều được. | Đấu sai nguồn làm cháy Servo. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Servo Sweep, Movement Functions, Music Synthesizer & Wokwi Lab). | Hoàn thành Bài 4.1 và Bài 4.2 đúng yêu cầu. | Code có lỗi Servo bị giật hoặc động cơ không dừng. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
