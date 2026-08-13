# Tuần 10: Tích Hợp Hệ Thống micro:bit STEM & Bảo Vệ Dự Án Capstone (Capstone Project & Demo Day)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tóm tắt và kết nối toàn bộ 10 tuần kiến thức: Vi xử lý ARM, Cảm biến gia tốc/từ trường/môi trường, Thiết bị chấp hành Neopixel/Servo, Truyền thông không dây Radio P2P, Data Logging và MicroPython thành một **Hệ Thống STEM Thực Chiến Hoàn Chỉnh**.
- Thấu hiểu quy trình thiết kế kỹ thuật chuẩn **Engineering Design Process**: Xác định bài toán $\to$ Nghiên cứu giải pháp $\to$ Tạo mẫu thử nghiệm (Prototyping) $\to$ Kiểm thử & Cải tiến (Testing & Iteration).
- Đóng gói mã nguồn MakeCode / MicroPython đạt chuẩn, vẽ sơ đồ nguyên lý lắp mạch Crowtail và tải mã nguồn lên GitHub.
- Bảo vệ Dự án Tốt nghiệp Capstone (Demo Day) trước hội đồng đánh giá và trình diễn sản phẩm chạy thực tế.

### English
- Synthesize all 10-week embedded modules: ARM Core, Sensors, Neopixel/Servo Actuators, Wireless Radio P2P, Data Logging, and MicroPython into an **Integrated STEM System**.
- Master the **Engineering Design Process**: Problem Definition $\to$ Solution Research $\to$ Physical Prototyping $\to$ Testing & Iteration.
- Package production-grade MakeCode / MicroPython firmware, draw Crowtail schematic diagrams, and upload source code to GitHub.
- Present and defend the Final Capstone Project during Demo Day with live physical hardware demonstrations.

---

## Lý Thuyết / Theory

### 1. Quy Trình Thiết Kế Kỹ Thuật (Engineering Design Process)

```text
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │ 1. DEFINE      │ ───► │ 2. PROTOTYPE   │ ───► │ 3. TEST & LOG  │ ───► │ 4. PRESENT     │
 │ Problem & Specs│      │ Hardware/Code  │      │ Data & Fixes   │      │ Demo Day       │
 └────────────────┘      └────────────────┘      └────────────────┘      └────────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Complete MicroPython Capstone Baseline - Smart Agriculture & Wireless Node
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 10: Integrated Capstone Smart Greenhouse & Radio Telemetry System

from microbit import *
import radio

# Initialize Radio for Wireless Telemetry (Group 15)
radio.on()
radio.config(group=15, power=7)

DRY_THRESHOLD = 800

def read_sensors():
    temp_c = temperature()
    light_lvl = display.read_light_level()
    soil_raw = pin0.read_analog()
    return temp_c, light_lvl, soil_raw

# Relay Control Pin (Pump)
pin1.write_digital(0)

display.show(Image.HAPPY)

while True:
    temp, light, soil = read_sensors()

    # Automatic Irrigation Control Logic
    if soil > DRY_THRESHOLD:
        display.show(Image.SAD)
        pin1.write_digital(1) # Turn ON Pump
        sleep(2000)
        pin1.write_digital(0) # Turn OFF Pump
    else:
        display.show(Image.HAPPY)
        pin1.write_digital(0)

    # Broadcast Sensor Data via Radio P2P to Central Monitoring Station
    telemetry_pkt = "T:{},L:{},S:{}".format(temp, light, soil)
    radio.send(telemetry_pkt)

    sleep(2000)
```

---

## Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix

| Tuần | Chủ Đề Chính | Kỹ Thuật & Sản Phẩm Đạt Được |
| :--- | :--- | :--- |
| **Week 1** | BBC micro:bit v2 & Ma Trận LED | Kiến trúc v2, Ma trận LED 5x5, Touch Logo, Loa tích hợp, MakeCode & MicroPython. |
| **Week 2** | Gia Tốc Kế, La Bàn & Vật Lý | Cảm biến 3 trục LSM303AGR, La bàn số, Thước đo độ nghiêng & Cảnh báo té ngã. |
| **Week 3** | Cảm Biến Môi Trường & Siêu Âm | Nhiệt độ CPU, Mức ánh sáng LED, Cảm biến độ ẩm đất Crowtail & Siêu âm HC-SR04. |
| **Week 4** | Neopixel RGB & Động Cơ Servo | Dải LED Neopixel WS2812B $800\,\text{kHz}$, Động cơ Servo SG90 & VU Meter âm thanh. |
| **Week 5** | Truyền Thông Radio P2P & RSSI | Mạng vô tuyến Radio P2P, Radio Group, Đo khoảng cách RSSI & Walkie-Talkie. |
| **Week 6** | Data Logging & Serial Plotter | Ghi nhật ký tệp CSV trên bộ nhớ Flash v2, USB Serial UART & Phân tích Google Colab. |
| **Week 7** | Nông Nghiệp & Smart Home | Mô hình tưới cây tự động, Relay bơm nước 5V & Hệ thống an ninh báo động không dây. |
| **Week 8** | Xe Robot micro:bit Tự Hành | Microbit Motor Shield, Cảm biến dò đường vạch đen IR, Xe né vật cản & Điều khiển Radio. |
| **Week 9** | MicroPython Nâng Cao & FSM | Máy trạng thái hữu hạn FSM, Cấu trúc dữ liệu List/Tuple & Game Retro Snake 5x5. |
| **Week 10** | Tích Hợp Hệ Thống & Capstone | Tích hợp Hệ sinh thái micro:bit STEM, hoàn thiện Slide, Code GitHub & Demo Day. |

---

## Đánh Giá Capstone & Demo Day Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Mô Hình Phần Cứng (Hardware Model)** | Mô hình STEM đẹp mắt, kết nối Crowtail gọn gàng, cách ly nguồn an toàn, sáng tạo vượt trội. | Lắp mạch chạy đúng nhưng mô hình còn sơ sài. | Mạch chạy được nhưng thiếu gia cố phần cứng. | Mô hình bị hỏng không chạy được. |
| **Hoàn Thành Bài Tập & Capstone** | Hoàn thành xuất sắc cả 4 bài, sản phẩm Capstone chạy mượt mà, slide thuyết trình ấn tượng và bảo vệ thành công. | Hoàn thành Bài 10.1 và Bài 10.2 chạy đúng không lỗi. | Code có lỗi xử lý logic hoặc chưa nộp slide. | Không nộp dự án Capstone. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
