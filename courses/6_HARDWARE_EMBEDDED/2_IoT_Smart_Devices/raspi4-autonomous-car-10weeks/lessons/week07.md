# Tuần 7: Điều Hướng Xe Robot Tự Hành & Hệ Thống Phanh Khẩn Cấp (Obstacle Avoidance & Emergency Braking)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc tích hợp đa cảm biến (**Multi-Sensor Fusion**): Kết hợp dữ liệu đường đi từ Camera CSI với mảng cảm biến siêu âm HC-SR04.
- Hiểu nguyên lý và thuật toán **Tự động điều chỉnh tốc độ (Dynamic Speed Regulation)** khi vào khúc ngoặt gấp.
- Triển khai **Hệ thống Phanh Khẩn Cấp (Emergency Braking System - EBS)** tự động dừng xe tức thời khi phát hiện vật cản bất ngờ trong hành trình.
- Thực hành thuật toán chuyển làn né vật cản (Lane Change Obstacle Bypass Algorithm).

### English
- Master **Multi-Sensor Fusion** architectures combining CSI camera vision pipelines with HC-SR04 ultrasonic array telemetry.
- Implement **Dynamic Speed Regulation** algorithms slowing down on sharp curves.
- Build an **Emergency Braking System (EBS)** halting vehicle movement instantly upon sudden obstacle encounters.
- Practice Lane Change Obstacle Bypass algorithms.

---

## Lý Thuyết / Theory

### 1. Thuật Toán Phanh Khẩn Cấp EBS & Điều Chỉnh Tốc Độ Động

#### Tiếng Việt
Tốc độ xe $V_{\text{target}}$ được điều chỉnh linh hoạt theo độ cong làn đường và khoảng cách vật cản phía trước $D_{\text{front}}$:

$$V_{\text{target}} = \begin{cases} 
0, & \text{nếu } D_{\text{front}} < 20\,\text{cm} \quad (\text{EBS Emergency Brake}) \\
V_{\text{base}} \times \left(1 - \frac{|\theta_{\text{steer}} - 90|}{90}\right), & \text{nếu } D_{\text{front}} \ge 20\,\text{cm} \quad (\text{Curve Slowdown})
\end{cases}$$

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - Integrated Emergency Braking & Dynamic Speed Control Engine
```python
"""
Lesson 7: Emergency Braking System & Dynamic Speed Controller
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import time
import RPi.GPIO as GPIO

# GPIO Pins for Ultrasonic Array (Front & Side)
TRIG_FRONT = 23
ECHO_FRONT = 24

BASE_SPEED = 60 # Base speed percentage (0-100%)
MIN_BRAKE_DIST_CM = 20.0

def setup_sensors():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(TRIG_FRONT, GPIO.OUT, initial=GPIO.LOW)
    GPIO.setup(ECHO_FRONT, GPIO.IN)

def get_front_distance():
    GPIO.output(TRIG_FRONT, GPIO.HIGH)
    time.sleep(0.00001)
    GPIO.output(TRIG_FRONT, GPIO.LOW)

    start = time.time()
    end = time.time()
    timeout = time.time()

    while GPIO.input(ECHO_FRONT) == 0:
        start = time.time()
        if start - timeout > 0.03: return 400.0

    while GPIO.input(ECHO_FRONT) == 1:
        end = time.time()
        if end - start > 0.03: return 400.0

    return round(((end - start) * 34300) / 2.0, 1)

def compute_dynamic_speed(front_dist_cm, steering_angle_deg):
    """Calculates safe driving speed based on distance and curve sharpness"""
    if front_dist_cm < MIN_BRAKE_DIST_CM:
        print("ALERT: EMERGENCY BRAKE ACTIVATED!")
        return 0 # Stop completely

    # Reduce speed when making sharp turns (steering_angle far from 90)
    turn_factor = 1.0 - (abs(steering_angle_deg - 90) / 90.0)
    speed = int(BASE_SPEED * turn_factor)
    return max(20, speed) # Minimum crawl speed 20%

def main():
    setup_sensors()
    print("[+] Autonomous Navigation & EBS Engine Ready!")

    try:
        while True:
            dist = get_front_distance()
            simulated_steer_angle = 120 # Simulating sharp right turn

            speed = compute_dynamic_speed(dist, simulated_steer_angle)
            print(f"[NAV] Dist: {dist} cm | Steer: {simulated_steer_angle} deg | Target Speed: {speed}%")

            time.sleep(0.1)

    except KeyboardInterrupt:
        print("\n[-] Exiting EBS Navigation Engine...")
    finally:
        GPIO.cleanup()

if __name__ == "__main__":
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 7.1: Thước Đo Cảnh Báo Khoảng Cách Đa Cấp (Multi-Stage Proximity Warning)
Lập trình hiển thị cảnh báo: Khoảng cách $> 50\,\text{cm}$ (An toàn - Xanh), $20-50\,\text{cm}$ (Giảm tốc - Vàng), $< 20\,\text{cm}$ (Phanh gấp - Đỏ).

#### Bài 7.2: Thử Nghiệm Phanh Gấp Khởi Động Lại Tự Động
Viết script khi phát hiện vật cản $< 20\,\text{cm}$, phanh xe dừng lại. Khi vật cản di chuyển đi xa ($> 30\,\text{cm}$), xe tự động nhả phanh và tiếp tục hành trình.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 7.3: Thuật Toán Chuyển Làn Né Vật Cản (Lane Change Bypass Algorithm)
Viết thuật toán khi phát hiện vật cản cố định trên làn đường: Xe tự động bẻ lái sang làn đối diện, đi qua vật cản $50\,\text{cm}$, sau đó bẻ lái quay lại làn đường cũ.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Python (Hands-on Colab Lab)

#### Bài 7.4: Mô Phỏng Hệ Thống EBS Trên Google Colab
Mở Google Colab, viết script mô phỏng biểu đồ vận tốc xe theo thời gian khi gặp chướng ngại vật bất ngờ xuất hiện.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# EBS Simulation Reference Solution on Colab
import matplotlib.pyplot as plt

distances = [100, 80, 60, 45, 25, 15, 10, 35, 60] # Simulating distance sensor readings
speeds = []

for d in distances:
    if d < 20: speeds.append(0) # Emergency Brake
    else: speeds.append(min(60, d))

plt.figure(figsize=(8, 4))
plt.plot(distances, label='Distance (cm)', color='blue', marker='o')
plt.plot(speeds, label='Speed (%)', color='red', marker='s')
plt.title("Emergency Braking System (EBS) Response")
plt.xlabel("Time Step"); plt.ylabel("Value"); plt.legend(); plt.grid(True); plt.show()
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Điều Hướng & EBS** | Giải thích sâu sắc hợp nhất đa cảm biến, công thức điều tốc động, khoảng cách an toàn phanh gấp và thuật toán chuyển làn. | Hiểu cách sử dụng cảm biến siêu âm kết hợp điều chỉnh tốc độ xe. | Nắm được định nghĩa EBS nhưng chưa tự nhả phanh được. | Xe bị va chạm với vật cản. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Proximity Warning, Auto Re-start, Lane Bypass & Colab EBS Simulation Lab). | Hoàn thành Bài 7.1 và Bài 7.2 đúng yêu cầu. | Code có lỗi phanh xe bị giật hoặc sai khoảng cách. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
