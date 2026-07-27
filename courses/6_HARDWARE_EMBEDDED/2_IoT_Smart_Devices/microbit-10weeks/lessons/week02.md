# Tuần 2: Cảm Biến Gia Tốc, La Bàn Số & Thí Nghiệm Vật Lý (Accelerometer, Compass & Physics Labs)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu nguyên lý làm việc của **Cảm biến gia tốc 3 trục (3-Axis Accelerometer LSM303AGR)** đo lực gia tốc theo 3 trục $x, y, z$ ($1\text{g} \approx 9.81\,\text{m/s}^2$).
- Khám phá cảm biến **Từ trường / La bàn số (Magnetometer)** và kỹ thuật hiệu chuẩn la bàn (Compass Calibration).
- Lập trình nhận diện cử chỉ động chuyển động của micro:bit (Events: `on shake`, `screen up`, `screen down`, `free fall`, `3g`, `6g`, `8g`).
- Thực hành thí nghiệm Vật lý: Thước đo góc nghiêng (Clinometer), Đo độ xóc của chuyển động và Xúc xắc điện tử.

### English
- Master the **3-Axis Accelerometer (LSM303AGR)** measuring acceleration forces along $x, y, z$ axes ($1\text{g} \approx 9.81\,\text{m/s}^2$).
- Understand the **Magnetometer / Digital Compass** sensor and compass calibration routines.
- Program gesture recognition events (`on shake`, `screen up`, `screen down`, `free fall`, `3g`, `6g`).
- Conduct Physics labs: Electronic Clinometer (Tilt angle measurement), Motion Impact Logger, and Smart Digital Dice.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Gia Tốc Kế 3 Trục & Công Thức Góc Nghiêng (Tilt Angle)

#### Tiếng Việt
Gia tốc kế đo gia tốc trọng trường $\vec{g}$ tác dụng lên vi điều khiển:
- Khi nằm ngửa trên bàn: $a_x = 0$, $a_y = 0$, $a_z = +1024\,\text{mg} \approx +1\text{g}$.
- Tính tổng gia tốc tổng hợp (Strength Vector):
  $$a_{\text{total}} = \sqrt{a_x^2 + a_y^2 + a_z^2}$$
- Khi rơi tự do (Free Fall): $a_{\text{total}} \approx 0\,\text{g}$.
- Khi bị va đập mạnh (Impact / Shock): $a_{\text{total}} > 3\,\text{g}$.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Electronic Clinometer & Compass
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 2: Electronic Tilt Meter & Digital Compass

from microbit import *
import math

# Perform compass calibration on startup if needed
if not compass.is_calibrated():
    compass.calibrate()

while True:
    # Read Accelerometer 3-Axis Values (in mg)
    ax = accelerator.get_x()
    ay = accelerator.get_y()
    az = accelerator.get_z()

    # Calculate Roll Angle (in degrees)
    roll = math.atan2(ay, az) * (180.0 / math.pi)

    # Read Compass Heading (0 - 360 degrees)
    heading = compass.heading()

    if button_a.is_pressed():
        # Display Tilt Roll Angle
        display.scroll("Roll: " + str(int(roll)) + "deg")
    elif button_b.is_pressed():
        # Display Compass Direction (N, E, S, W)
        if heading < 45 or heading > 315:
            display.show("N")
        elif heading < 135:
            display.show("E")
        elif heading < 225:
            display.show("S")
        else:
            display.show("W")
    else:
        # Default: Level Indicator
        if abs(roll) < 5:
            display.show(Image.HAPPY)
        else:
            display.show(Image.NO)
            
    sleep(100)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 2.1: Thước Đo Độ Nghiêng Thủy Ngân Điện Tử (Digital Bubble Level)
Lập trình hiển thị một chấm sáng LED tại vị trí $(2, 2)$ trung tâm ma trận. Khi nghiêng micro:bit sang trái/phải hoặc lên/xuống, chấm sáng LED tự động di chuyển theo hướng nghiêng.

#### Bài 2.2: La Bàn Số Chỉ Hướng Bắc (Digital Compass)
Lập trình la bàn số: Luôn hiển thị mũi tên hướng về phương Bắc địa lý (North) bất kể micro:bit được xoay theo hướng nào trên mặt phẳng nằm ngang.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 2.3: Thiết Bị Cảnh Báo Té Ngã Cho Người Già (Smart Fall Detector)
Viết chương trình phát hiện ngã ngửa:
1. Phát hiện trạng thái rơi tự do (`Free Fall` $a_{\text{total}} < 0.2\text{g}$).
2. Tiếp sau đó là sự cố va đập mạnh (`Impact` $a_{\text{total}} > 3\text{g}$).
3. Lập tức phát còi báo động dồn dập, nhấp nháy ma trận LED chữ `"SOS"` và gửi thông báo.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 2.4: Giả Lập Thiết Bị Đếm Bước Chân (Pedometer Simulator)
Mở MakeCode Simulator, lập trình bộ đếm bước chân: Mỗi lần lắc micro:bit (Event `on shake`), số bước chân tăng 1 và tự động tính lượng Calo tiêu thụ ($1 \text{ bước} \approx 0.04 \text{ kcal}$).

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Pedometer
steps = 0

def on_gesture_shake():
    global steps
    steps += 1
    basic.show_number(steps)

input.on_gesture(Gesture.SHAKE, on_gesture_shake)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Cảm Biến Motion** | Giải thích sâu sắc nguyên lý gia tốc kế 3 trục, từ trường la bàn, công thức tính góc Roll/Pitch và điều kiện phát hiện va đập. | Hiểu cách sử dụng gia tốc kế và các sự kiện cử chỉ. | Nắm được định nghĩa cảm biến nhưng chưa tính được góc nghiêng. | Không đọc được gia tốc kế. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Digital Bubble Level, Compass Arrow, Fall Detector & Pedometer Lab). | Hoàn thành Bài 2.1 và Bài 2.2 đúng yêu cầu. | Code có lỗi di chuyển điểm LED không chính xác. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
