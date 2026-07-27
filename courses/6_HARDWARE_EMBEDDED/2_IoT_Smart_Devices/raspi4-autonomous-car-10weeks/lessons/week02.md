# Tuần 2: Mạch Điều Khiển Động Cơ, Quản Lý Nguồn Điện & Mạch Lái PWM PCA9685 (Motor Drivers & Power Management)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc hệ thống cấp nguồn cách ly cho Xe Tự Hành: Bộ Pin Li-ion 18650 3S (11.1V), Mạch hạ áp **UBEC DC-DC 5V/3A** cấp nguồn sạch cho Pi 4 và nguồn riêng cho động cơ.
- Phân tích nguyên lý điều khiển động cơ DC qua **Mạch cầu H L298N / TB6612FNG** (PWM Speed & Direction Control).
- Sử dụng chip mở rộng **PCA9685 I2C 16-Channel PWM Driver** để điều khiển chính xác độ rộng xung cho Servo bẻ lái góc bánh trước ($0^\circ - 180^\circ$) và tốc độ 4 động cơ DC.
- Lập trình bộ thư viện Python điều khiển chuyển động khung xe tự hành 4 hướng (Tiến, Lùi, Rẽ Trái, Rẽ Phải, Dừng).

### English
- Master autonomous vehicle power distribution architectures: 18650 3S Li-ion battery packs (11.1V), **UBEC DC-DC 5V/3A buck converters** supplying isolated power for Pi 4, and direct motor rails.
- Analyze DC motor drive mechanisms via **L298N / TB6612FNG Dual H-Bridge Drivers** (PWM Speed & Direction).
- Utilize the **PCA9685 I2C 16-Channel 12-Bit PWM Driver** to precisely actuate steering Servos ($0^\circ - 180^\circ$) and motor speed channels.
- Build Python vehicle motion control libraries for 4-directional maneuvers (Forward, Reverse, Turn Left, Turn Right, Stop).

---

## Lý Thuyết / Theory

### 1. Sơ Đồ Cấp Nguồn Cách Ly Cho Xe Tự Hành Raspberry Pi 4

#### Tiếng Việt
Động cơ DC khi khởi động hoặc đổi chiều tạo ra dòng nhiễu ngược (Back EMF) và làm sụt điện áp nghiêm trọng. Nếu dùng chung nguồn không qua cách ly, Raspberry Pi 4 sẽ bị khởi động lại liên tục.

```text
       [ Battery Pack 11.1V Li-ion 3S ]
                      │
        ┌─────────────┴─────────────┐
        │                           │
        ▼                           ▼
[ UBEC 5V/3A Buck ]        [ L298N / TB6612 VMS Pin ]
        │                           │
        ▼ (Clean 5.0V)              ▼ (Raw 11.1V)
[ Raspberry Pi 4 ]         [ 4 DC Motors Drive ]
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - PCA9685 PWM Motor Driver & Steering Servo Controller
```python
"""
Lesson 2: PCA9685 I2C PWM Controller for Steering Servo & DC Motors
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import time
import board
import busio
from adafruit_pca9685 import PCA9685
from adafruit_motor import servo

# Initialize I2C Bus on Raspberry Pi 4 (SDA=GPIO2, SCL=GPIO3)
i2c = busio.I2C(board.SCL, board.SDA)

# Initialize PCA9685 at I2C address 0x40
pca = PCA9685(i2c)
pca.frequency = 50 # 50Hz frequency for RC Servos & Motor Drivers

# Channel 0: Steering Servo
steering_servo = servo.Servo(pca.channels[0], min_pulse=1000, max_pulse=2000)

# Channels 1 & 2: Motor A (Left) Speed PWM & Direction
# Channels 3 & 4: Motor B (Right) Speed PWM & Direction

def set_steering_angle(angle_deg):
    """Sets steering angle between 45 deg (Left) and 135 deg (Right), Center = 90 deg"""
    clamped_angle = max(45, min(135, angle_deg))
    steering_servo.angle = clamped_angle
    print(f"[STEERING] Servo Angle -> {clamped_angle} deg")

def drive_motors(left_speed_pct, right_speed_pct):
    """Sets motor speeds (-100% to +100%)"""
    # Map percentage to 16-bit PWM duty cycle (0 to 65535)
    duty_left = int((abs(left_speed_pct) / 100.0) * 65535)
    duty_right = int((abs(right_speed_pct) / 100.0) * 65535)

    # Set Left Motor Channel
    pca.channels[1].duty_cycle = duty_left
    # Set Right Motor Channel
    pca.channels[2].duty_cycle = duty_right

def main():
    print("[+] Initializing Autonomous Car Drive Engine...")
    set_steering_angle(90) # Straight ahead
    time.sleep(1)

    print("[+] Moving FORWARD (50% Speed)...")
    drive_motors(50, 50)
    time.sleep(2)

    print("[+] Steering LEFT...")
    set_steering_angle(60)
    time.sleep(1.5)

    print("[+] Steering RIGHT...")
    set_steering_angle(120)
    time.sleep(1.5)

    print("[+] Stopping Vehicle...")
    set_steering_angle(90)
    drive_motors(0, 0)
    pca.deinit()

if __name__ == "__main__":
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 2.1: Hiệu Chuẩn Góc Quay Servo Bẻ Lái (Steering Servo Calibration)
Viết script Python `calibrate_steering.py` cho phép nhập góc từ bàn phím ($45^\circ - 135^\circ$) để xác định chính xác vị trí bánh xe đứng thẳng ($90^\circ$).

#### Bài 2.2: Bộ Hàm Di Chuyển Khung Xe 4 Hướng
Viết lớp Python `VehicleController` đóng gói các phương thức `move_forward(speed)`, `move_backward(speed)`, `steer_left()`, `steer_right()`, `stop()`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 2.3: Thử Nghiệm Tăng Tốc Smooth Acceleration Controller
Viết hàm tăng/giảm tốc độ động cơ DC từ từ theo đường cong Smooth Ramp (tránh hiện tượng giật giật khung xe khi khởi động đột ngột).

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Python (Hands-on Colab Lab)

#### Bài 2.4: Mô Phỏng Động Học Xe Ackermann Trên Google Colab
Mở Google Colab, viết script Python mô phỏng quỹ đạo di chuyển của xe tự hành kiểu bẻ lái Ackermann Steering dựa trên góc Servo và tốc độ bánh xe.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# Python Reference Solution for Ackermann Kinematics Simulation
import math
import matplotlib.pyplot as plt

def simulate_ackermann(v, delta, L=0.2, dt=0.1, steps=50):
    x, y, theta = 0.0, 0.0, 0.0
    path_x, path_y = [x], [y]

    for _ in range(steps):
        x += v * math.cos(theta) * dt
        y += v * math.sin(theta) * dt
        theta += (v / L) * math.tan(math.radians(delta)) * dt
        path_x.append(x)
        path_y.append(y)

    plt.figure(figsize=(6, 6))
    plt.plot(path_x, path_y, marker='o', color='blue')
    plt.title(f"Ackermann Vehicle Trajectory (Steer = {delta}°)")
    plt.xlabel("X Position (m)"); plt.ylabel("Y Position (m)")
    plt.grid(True); plt.show()

simulate_ackermann(v=0.5, delta=15)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Động Cơ & PCA9685** | Giải thích sâu sắc nguyên lý nguồn điện cách ly UBEC 5V, Bus I2C PCA9685, độ phân giải PWM 12-bit và động học Ackermann. | Hiểu cách sử dụng mạch PCA9685 và điều khiển Servo bẻ lái. | Nắm được định nghĩa động cơ nhưng chưa bẻ được lái. | Làm sụt nguồn hỏng thẻ nhớ. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Steering Calibration, VehicleController Class, Smooth Ramp & Colab Kinematics Lab). | Hoàn thành Bài 2.1 và Bài 2.2 đúng yêu cầu. | Code có lỗi Servo bị quá giới hạn góc hoặc xe chạy giật. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
