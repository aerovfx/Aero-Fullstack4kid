# Tuần 8: Xe Robot Pico Tự Hành 2 Bánh - Né Vật Cản & Dò Đường (Pico Autonomous AMR Robotics)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc mạch điều khiển 2 động cơ DC bằng **Mạch cầu H L298N** ghép nối vi điều khiển Raspberry Pi Pico RP2040.
- Lập trình bộ thư viện chuyển động 4 hướng (Tiến, Lùi, Rẽ Trái, Rẽ Phải, Dừng) và điều tốc bằng xung PWM.
- Sử dụng cảm biến **Hồng ngoại dò đường (IR Line Sensor)** triển khai thuật toán bám vạch đen (Line Follower).
- Sử dụng cảm biến **Siêu âm HC-SR04** triển khai thuật toán xe né vật cản tự động (Obstacle Avoidance Rover).

### English
- Master dual DC motor control architectures using **L298N H-Bridge Drivers** interfaced with Raspberry Pi Pico RP2040.
- Build 4-directional motion control libraries (Forward, Reverse, Left, Right, Stop) with PWM speed scaling.
- Utilize **Infrared Line Tracking Sensors** to execute black line following algorithms.
- Deploy **HC-SR04 Ultrasonic Sensors** powering autonomous obstacle avoidance rovers.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Autonomous Line Follower & Obstacle Avoidance Rover
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 8: Autonomous Line Follower & Obstacle Avoidance

from machine import Pin, PWM
import time

# Motor A (Left) & Motor B (Right) Pins
IN1 = Pin(10, Pin.OUT); IN2 = Pin(11, Pin.OUT); ENA = PWM(Pin(12)); ENA.freq(1000)
IN3 = Pin(13, Pin.OUT); IN4 = Pin(14, Pin.OUT); ENB = PWM(Pin(15)); ENB.freq(1000)

# IR Line Sensor Pins
IR_LEFT = Pin(16, Pin.IN)
IR_RIGHT = Pin(17, Pin.IN)

def drive_motors(speed_L, speed_R):
    # Left Motor
    IN1.value(1 if speed_L >= 0 else 0)
    IN2.value(0 if speed_L >= 0 else 1)
    ENA.duty_u16(int((abs(speed_L) / 100.0) * 65535))

    # Right Motor
    IN3.value(1 if speed_R >= 0 else 0)
    IN4.value(0 if speed_R >= 0 else 1)
    ENB.duty_u16(int((abs(speed_R) / 100.0) * 65535))

def stop_motors():
    ENA.duty_u16(0)
    ENB.duty_u16(0)

print("[+] Pico AMR Robotics Engine Active!")

while True:
    left_val = IR_LEFT.value()
    right_val = IR_RIGHT.value()

    if left_val == 0 and right_val == 0:
        drive_motors(60, 60) # Forward
    elif left_val == 1 and right_val == 0:
        drive_motors(20, 70) # Turn Left
    elif left_val == 0 and right_val == 1:
        drive_motors(70, 20) # Turn Right
    else:
        stop_motors()
        
    time.sleep(0.02)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 8.1: Lập Trình Các Chuyển Động Robot
Viết các hàm MicroPython `move_forward(speed)`, `move_backward(speed)`, `spin_left()`, `spin_right()`, `stop()`.

#### Bài 8.2: Đọc Cảm Biến Hồng Ngoại Dò Đường
Viết script đọc giá trị 2 mắt cảm biến hồng ngoại dò đường và hiển thị trạng thái lên Terminal.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 8.3: Xe Robot Điều Khiển Từ Xa Qua Web Server Wi-Fi (Pico W Web Car)
Lập trình Web Server nhúng trên Pico W cho phép lái xe 4 hướng mượt mà từ màn hình cảm ứng điện thoại.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 8.4: Giả Lập Thuật Toán Xe Né Vật Cản Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico + 2 Motor + HC-SR04. Lập trình xe dừng lại và rẽ phải khi khoảng cách $< 15\,\text{cm}$.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi Rover Simulation Reference Solution
from machine import Pin, PWM
import time

m1 = PWM(Pin(10)); m1.freq(1000)
m2 = PWM(Pin(11)); m2.freq(1000)

m1.duty_u16(32768); m2.duty_u16(32768)
time.sleep(2)
m1.duty_u16(0); m2.duty_u16(0)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Pico AMR Robotics** | Giải thích sâu sắc nguyên lý cầu H L298N, mắt dò đường hồng ngoại IR, bảng trạng thái bám vạch và điều khiển qua Web Wi-Fi. | Hiểu thuật toán xe bám vạch và né vật cản siêu âm. | Nắm được định nghĩa xe robot nhưng chưa bẻ lái được. | Xe đâm vào tường không dừng. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Movement Functions, IR Sensor Reader, Web Car & Wokwi Rover Lab). | Hoàn thành Bài 8.1 và Bài 8.2 đúng yêu cầu. | Code có lỗi rẽ ngược hướng hoặc trật vạch đen. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
