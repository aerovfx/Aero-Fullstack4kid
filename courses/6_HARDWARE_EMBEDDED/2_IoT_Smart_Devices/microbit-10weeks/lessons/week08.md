# Tuần 8: Xe Robot micro:bit Tự Hành - Dò Đường Vạch Đen & Tránh Vật Cản (Microbit Robotics & Autonomous Rovers)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu kiến trúc mạch điều khiển động cơ dành riêng cho BBC micro:bit (**Microbit Motor Driver Shield**).
- Phân tích nguyên lý hoạt động của **Cảm biến hồng ngoại dò đường (IR Line Tracking Sensor)** phát hiện sự khác biệt giữa vạch đen và nền trắng.
- Lập trình xe Robot 2 bánh di chuyển 4 hướng (Tới, Lùi, Rẽ Trái, Rẽ Phải, Dừng) và điều chỉnh tốc độ bằng xung PWM.
- Triển khai thuật toán **Xe dò đường tự động (Line Follower)** và **Xe né vật cản siêu âm (Obstacle Avoidance Rover)**.

### English
- Master the **Microbit Motor Driver Shield** architecture powering dual DC motors.
- Analyze **Infrared (IR) Line Tracking Sensor** reflectometry principles distinguishing black lines from white surfaces.
- Program 4-directional motion control (Forward, Backward, Left, Right, Stop) with PWM speed regulation.
- Implement **Line Following** and **Ultrasonic Obstacle Avoidance** autonomous rover algorithms.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Cảm Biến Hồng Ngoại Dò Đường & Thuật Toán Bám Vạch

#### Tiếng Việt
Cảm biến dò đường gồm 2 mắt hồng ngoại (Mắt phát IR LED và Mắt thu Phototransistor):
- **Nền trắng:** Phản xạ tia hồng ngoại tốt $\implies$ Tín hiệu thu được `LOW` ($0$).
- **Vạch đen:** Hấp thụ tia hồng ngoại $\implies$ Tín hiệu thu được `HIGH` ($1$).
- **Bảng trạng thái thuật toán bám vạch 2 mắt (`Left_IR`, `Right_IR`):**
  - `(0, 0)`: Cả 2 mắt nằm trên nền trắng $\implies$ Xe đi Thẳng.
  - `(1, 0)`: Mắt Trái dính vạch đen $\implies$ Xe rẽ Trái.
  - `(0, 1)`: Mắt Phải dính vạch đen $\implies$ Xe rẽ Phải.
  - `(1, 1)`: Cả 2 mắt dính vạch đen $\implies$ Dừng xe hoặc ngã tư.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Autonomous Line Follower & Obstacle Avoidance Rover
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 8: Autonomous Line Follower & Obstacle Avoidance Engine

from microbit import *

# Motor Driver Pins (Motor A & Motor B)
# Assumes standard Microbit Motor Shield: P8, P12 for direction, P1, P2 for speed PWM

def set_motors(speed_L, speed_R):
    # Left Motor Speed & Direction
    if speed_L >= 0:
        pin8.write_digital(0)
        pin1.write_analog(int((speed_L / 100.0) * 1023))
    else:
        pin8.write_digital(1)
        pin1.write_analog(int((-speed_L / 100.0) * 1023))

    # Right Motor Speed & Direction
    if speed_R >= 0:
        pin12.write_digital(0)
        pin2.write_analog(int((speed_R / 100.0) * 1023))
    else:
        pin12.write_digital(1)
        pin2.write_analog(int((-speed_R / 100.0) * 1023))

def stop_motors():
    pin1.write_analog(0)
    pin2.write_analog(0)

# IR Line Sensor Pins
# Pin 13 = Left IR Sensor, Pin 14 = Right IR Sensor

while True:
    left_ir = pin13.read_digital()
    right_ir = pin14.read_digital()

    if left_ir == 0 and right_ir == 0:
        # Both white: Move FORWARD
        set_motors(60, 60)
    elif left_ir == 1 and right_ir == 0:
        # Left hit black line: Turn LEFT
        set_motors(10, 70)
    elif left_ir == 0 and right_ir == 1:
        # Right hit black line: Turn RIGHT
        set_motors(70, 10)
    else:
        # Both black: STOP
        stop_motors()
        
    sleep(20)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 8.1: Lập Trình Các Chuyển Động Khung Xe 2 Bánh
Viết các hàm C++ / MicroPython `forward(speed)`, `backward(speed)`, `turn_left()`, `turn_right()`, `stop()` điều khiển xe robot micro:bit.

#### Bài 8.2: Đọc Trạng Thái Cảm Biến Hồng Ngoại Dò Đường
Viết script đọc giá trị 2 mắt cảm biến hồng ngoại dò đường. Hiển thị mũi tên chỉ hướng rẽ tương ứng trên ma trận LED 5x5.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 8.3: Xe Robot Tay Cầm Điều Khiển Từ Xa Bằng Radio (Radio Remote Control Car)
Sử dụng 2 bo mạch micro:bit:
- **Bo mạch A (Tay cầm):** Đọc cảm biến gia tốc nghiêng (Nghiêng tới $\implies$ Tiến, nghiêng lùi $\implies$ Lùi, nghiêng trái $\implies$ Rẽ trái, nghiêng phải $\implies$ Rẽ phải). Gửi mã lệnh di chuyển qua sóng Radio.
- **Bo mạch B (Xe Robot):** Nhận lệnh Radio và lái 2 động cơ DC tương ứng.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 8.4: Giả Lập Thuật Toán Xe Né Vật Cản Trên MakeCode Simulator
Mở MakeCode Simulator, thêm extension `Cutebot` / `Maqueen`. Lập trình xe robot chạy tự do, khi cảm biến siêu âm phát hiện vật cản $< 15\,\text{cm}$, xe dừng lại, rẽ sang phải $90^\circ$ và tiếp tục hành trình.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Obstacle Avoidance Rover
def on_forever():
    dist = sonar.ping(DigitalPin.P1, DigitalPin.P2, PingUnit.CENTIMETERS)
    if dist > 0 and dist < 15:
        # Stop and Turn Right
        pins.digital_write_pin(DigitalPin.P8, 0)
        pins.analog_write_pin(AnalogPin.P1, 0)
        pins.analog_write_pin(AnalogPin.P2, 500)
        basic.pause(500)
    else:
        # Move Forward
        pins.analog_write_pin(AnalogPin.P1, 600)
        pins.analog_write_pin(AnalogPin.P2, 600)
    basic.pause(50)

basic.forever(on_forever)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Robotics micro:bit** | Giải thích sâu sắc nguyên lý mạch cầu H shield, mắt dò đường hồng ngoại, bảng trạng thái bám vạch và điều khiển bằng vô tuyến Radio. | Hiểu thuật toán xe dò đường vạch đen và né vật cản. | Nắm được định nghĩa xe robot nhưng chưa viết được hàm di chuyển. | Xe đâm vào tường không dừng. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Motion Functions, IR State Reader, Radio Remote Car & MakeCode Rover Lab). | Hoàn thành Bài 8.1 và Bài 8.2 đúng yêu cầu. | Code có lỗi rẽ ngược hướng hoặc trật khỏi vạch đen. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
