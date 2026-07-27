# Tuần 3: Giao Thức I2C, Màn Hình OLED SSD1306 & MPU6050 (I2C Bus, OLED & MPU6050)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nguyên lý giao tiếp bus **I2C (`machine.I2C`)** trên Pico RP2040 (2 bộ I2C phần cứng: `I2C0` và `I2C1`).
- Lập trình quét địa chỉ I2C (I2C Scanner) và hiển thị đồ họa/văn bản trên màn hình **OLED SSD1306 (128x64 pixels)** bằng thư viện `ssd1306.py`.
- Đọc gia tốc 3 trục ($a_x, a_y, a_z$) và con quay hồi chuyển từ cảm biến **MPU6050**.
- Thực hành tính toán góc nghiêng Roll/Pitch và trực quan hóa lên màn hình OLED.

### English
- Master the **I2C bus protocol (`machine.I2C`)** on Pico RP2040 (`I2C0` and `I2C1`).
- Program I2C address scanners and render text/graphics on **OLED SSD1306 displays** via `ssd1306.py`.
- Read 3-axis acceleration ($a_x, a_y, a_z$) and gyroscope data from the **MPU6050**.
- Practice calculating Roll/Pitch tilt angles and visualize telemetry on OLED displays.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - MPU6050 & OLED SSD1306 Visualizer
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 3: MPU6050 IMU Visualizer on OLED Display via I2C

from machine import Pin, I2C
import ssd1306
import math
import time

# Initialize I2C0 (SDA=GPIO0, SCL=GPIO1)
i2c = I2C(0, sda=Pin(0), scl=Pin(1), freq=400000)

# Initialize OLED (128x64, address 0x3C)
oled = ssd1306.SSD1306_I2C(128, 64, i2c, addr=0x3C)

# Simple MPU6050 Reader
MPU_ADDR = 0x68
i2c.writeto_mem(MPU_ADDR, 0x6B, b'\x00') # Wake up MPU6050

def read_mpu_accel():
    data = i2c.readfrom_mem(MPU_ADDR, 0x3B, 6)
    ax = (int.from_bytes(data[0:2], 'big', True)) / 16384.0
    ay = (int.from_bytes(data[2:4], 'big', True)) / 16384.0
    az = (int.from_bytes(data[4:6], 'big', True)) / 16384.0
    return ax, ay, az

while True:
    ax, ay, az = read_mpu_accel()
    roll = math.atan2(ay, az) * (180.0 / math.pi)

    oled.fill(0)
    oled.text("PICO IMU MONITOR", 0, 0)
    oled.text(f"Roll: {roll:.1f} deg", 0, 20)
    oled.text(f"Ax: {ax:.2f}g", 0, 35)

    # Draw level bar
    bar_x = int(64 + (roll / 90.0) * 60)
    bar_x = max(0, min(124, bar_x))
    oled.fill_rect(bar_x, 52, 8, 8, 1)

    oled.show()
    time.sleep(0.1)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 3.1: Bộ Quét Địa Chỉ I2C Scanner
Viết script MicroPython quét toàn bộ bus I2C và in ra danh sách các địa chỉ thiết bị tìm thấy (Hex format: `0x3C`, `0x68`).

#### Bài 3.2: Đồng Hồ Đồng Hoạt Họa Trên OLED
Lập trình màn hình OLED hiển thị đồng hồ đếm thời gian dạng `MM:SS` và vẽ thanh tiến trình Progress Bar.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 3.3: Thước Livo Thủy Ngân Điện Tử 2 Trục
Viết script hiển thị một hình tròn nhỏ di chuyển trên màn hình OLED theo góc nghiêng Pitch/Roll từ cảm biến MPU6050.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 3.4: Giả Lập Mạch OLED SSD1306 Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico + OLED SSD1306. Viết script MicroPython hiển thị biểu tượng hình ảnh và văn bản.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi OLED Reference Solution
from machine import Pin, I2C
import ssd1306

i2c = I2C(0, sda=Pin(0), scl=Pin(1))
oled = ssd1306.SSD1306_I2C(128, 64, i2c)
oled.text("Hello Wokwi!", 10, 25)
oled.show()
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Giao Thức I2C** | Giải thích sâu sắc bus I2C master-slave, địa chỉ I2C, màn hình OLED SSD1306 và công thức đọc gia tốc MPU6050. | Hiểu cách sử dụng thư viện `ssd1306.py` và đọc MPU6050. | Nắm được định nghĩa I2C nhưng chưa hiển thị được OLED. | Sai địa chỉ I2C. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (I2C Scanner, OLED Stopwatch, Bubble Level & Wokwi Lab). | Hoàn thành Bài 3.1 và Bài 3.2 đúng yêu cầu. | Code có lỗi đơ bus I2C hoặc vẽ hình tròn ra ngoài màn hình. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
