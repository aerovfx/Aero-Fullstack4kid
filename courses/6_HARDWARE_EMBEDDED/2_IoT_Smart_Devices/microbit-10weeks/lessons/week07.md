# Tuần 7: Nông Nghiệp Thông Minh & Hệ Thống Nhà Thông Minh (Smart Agriculture & Smart Home)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Ứng dụng tích hợp vi điều khiển BBC micro:bit v2 với các cảm biến và thiết bị chấp hành để giải quyết bài toán thực tế: **Nông nghiệp thông minh (Smart Agriculture)** và **Nhà thông minh (Smart Home)**.
- Thiết kế hệ thống **Tự động tưới cây (Automated Irrigation System)**: Đọc cảm biến độ ẩm đất Crowtail, tự động kích hoạt Rơ-le (Relay) / Động cơ bơm nước 5V mini khi đất khô.
- Xây dựng **Hệ thống Cảnh báo Đột nhập (Smart Intruder Alarm)**: Kết hợp cảm biến siêu âm HC-SR04, còi báo động Buzzer, dải LED RGB Neopixel và gửi tin nhắn cảnh báo không dây qua sóng Radio.
- Thực hành thiết kế sơ đồ khối nguyên lý (Flowchart System Design) và chế tạo mô hình STEM hoàn chỉnh.

### English
- Apply BBC micro:bit v2, sensors, and actuators to build integrated real-world STEM projects: **Smart Agriculture** and **Smart Home Security**.
- Design an **Automated Plant Irrigation System**: Read Crowtail soil moisture levels, automatically triggers 5V mini water pumps via relays when soil dries out.
- Build a **Smart Intruder Alarm**: Integrate HC-SR04 ultrasonic rangefinding, audio buzzers, RGB Neopixel light bars, and wireless Radio emergency alerts.
- Practice flowchart system engineering and complete physical STEM model prototyping.

---

## Lý Thuyết / Theory

### 1. Sơ Đồ Khối Điều Khiển Vòng Kín Hệ Thống Tưới Cây Tự Động

```text
 [ Cảm Biến Độ Ẩm Đất ] ─── ( Tín hiệu Analog Pin 0 ) ───► [ micro:bit Control Core ]
                                                                   │
                                                                   ▼ (Nếu Moisture < 30%)
 [ Động Cơ Bơm Nước 5V ] ◄─── ( Kích Hoạt Relay Pin 1 ) ───────────┴─── ( Bật Còi Buzzer Pin 2 )
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: MicroPython - Automated Smart Plant Watering Engine
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 7: Automated Smart Irrigation & Water Pump Controller

from microbit import *
import music

# Calibration parameters for Crowtail Soil Moisture Sensor
DRY_THRESHOLD_PCT = 30 # Trigger pump if moisture < 30%

def read_moisture_percent():
    raw = pin0.read_analog()
    # Linear interpolation mapping (850 = Dry 0%, 350 = Wet 100%)
    pct = int((850 - raw) * 100 / (850 - 350))
    return max(0, min(100, pct))

# Set Pin 1 as Output to control 5V Relay / Water Pump
pin1.write_digital(0) # Pump OFF by default

while True:
    moisture = read_moisture_percent()
    display.scroll(str(moisture) + "%")

    if moisture < DRY_THRESHOLD_PCT:
        # Soil is dry: Turn ON Water Pump for 3 seconds
        display.show(Image.SAD)
        music.pitch(523, 200) # C5 Warning Beep
        
        pin1.write_digital(1) # Turn Pump ON
        sleep(3000)           # Pump water for 3 seconds
        pin1.write_digital(0) # Turn Pump OFF
        
        # Pause to let water soak into soil
        sleep(5000)
    else:
        display.show(Image.HAPPY)
        pin1.write_digital(0)
        
    sleep(1000)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 7.1: Mái Che Nắng Tự Động Bằng Servo SG90
Lập trình đọc cảm biến ánh sáng ma trận LED. Khi trời quá nắng ($> 180$), Servo SG90 (chân `P2`) tự động quay $90^\circ$ để kéo mái che. Khi trời râm mát ($< 80$), Servo quay $0^\circ$ thu mái che lại.

#### Bài 7.2: Hệ Thống Đèn Đường Thông Minh Tiết Kiệm Điện
Lập trình cảm biến siêu âm HC-SR04 kết hợp cảm biến ánh sáng: Đèn đường LED chỉ sáng $100\%$ khi vừa có trời tối VÀ có người/xe đi ngang qua (khoảng cách $< 20\,\text{cm}$).

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 7.3: Hệ Thống An Ninh Chống Trộm Đa Lớp Vô Tuyến (Multi-layer Radio Security System)
Lập trình 2 bo mạch micro:bit:
- **Trạm Bảo Vệ (Node A):** Đặt ở cửa nhà, đọc cảm biến siêu âm. Nếu phát hiện chuyển động bất thường trong bán kính $30\,\text{cm}$, bật còi hú, nhấp nháy Neopixel đỏ và gửi mã cảnh báo `"ALARM_TRIGGERED"` qua sóng Radio.
- **Trạm Chủ Nhà (Node B):** Đặt trong phòng ngủ, khi nhận tín hiệu Radio `"ALARM_TRIGGERED"`, bật còi báo động riêng và hiển thị mã vùng bị xâm nhập.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 7.4: Giả Lập Mô Hình Nông Nghiệp Thông Minh Trên MakeCode
Mở MakeCode Simulator, lắp mạch micro:bit + Moisture Sensor + Relay + Servo. Lập trình luồng tưới cây và mở mái che tự động, xuất log kiểm thử.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Smart Agriculture
def on_forever():
    soil = pins.analog_read_pin(AnalogPin.P0)
    if soil < 400:
        pins.digital_write_pin(DigitalPin.P1, 1) # Pump ON
        basic.show_icon(IconNames.SAD)
        basic.pause(3000)
        pins.digital_write_pin(DigitalPin.P1, 0) # Pump OFF
    else:
        basic.show_icon(IconNames.HAPPY)
    basic.pause(2000)

basic.forever(on_forever)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Tích Hợp Hệ Thống** | Giải thích sâu sắc sơ đồ khối hệ thống vòng kín, mạch đệm Relay, điều khiển động cơ bơm và cảnh báo vô tuyến Radio. | Hiểu quy trình tưới cây tự động và cảnh báo an ninh. | Nắm được định nghĩa Relay nhưng chưa kết nối được bơm nước. | Làm chập nguồn điện khi bật rơ-le. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Smart Awning, Smart Streetlight, Radio Security & MakeCode Irrigation Lab). | Hoàn thành Bài 7.1 và Bài 7.2 đúng yêu cầu. | Code có lỗi rơ-le đóng cắt liên tục không ngắt. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
