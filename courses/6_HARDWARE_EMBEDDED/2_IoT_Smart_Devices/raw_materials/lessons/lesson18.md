# Bài 18: Gia tốc kế — Xúc xắc Điện tử
# Lesson 18: Accelerometer — Electronic Dice

**Bộ kit:** Elecrow Crowtail STEAM Edu Kit | **Kit:** Elecrow Crowtail STEAM Edu Kit  
**Lớp:** 6–12 | **Grade:** 6–12  
**Thời lượng:** 90 phút | **Duration:** 90 minutes  
**Ngày:** __________ | **Date:** __________

---

## 🎯 Mục tiêu Học tập / Learning Objectives

Sau bài học này, học sinh sẽ có thể:  
*After this lesson, students will be able to:*

1. **Giải thích** khái niệm gia tốc và liên hệ với Định luật II Newton.  
   *Explain the concept of acceleration and its connection to Newton's Second Law.*

2. **Mô tả** ba trục X, Y, Z của gia tốc kế và ý nghĩa vật lý của từng trục.  
   *Describe the three axes X, Y, Z of the accelerometer and the physical meaning of each axis.*

3. **Hiểu** công nghệ MEMS và cách micro:bit đo gia tốc.  
   *Understand MEMS technology and how the micro:bit measures acceleration.*

4. **Nhận dạng** các cử chỉ: lắc, nghiêng, úp mặt, ngửa mặt, rơi tự do.  
   *Recognize gestures: shake, tilt, face up, face down, free fall.*

5. **Lập trình** xúc xắc điện tử, bộ phát hiện nghiêng, và bộ đếm bước chân.  
   *Program an electronic dice, tilt detector, and step counter.*

6. **Áp dụng** kiến thức gia tốc kế vào các ứng dụng thực tế.  
   *Apply accelerometer knowledge to real-world applications.*

---

## 📚 Lý thuyết / Theory

### 1. Gia tốc là gì? / What is Acceleration?

**Tiếng Việt:**  
Gia tốc là tốc độ thay đổi vận tốc theo thời gian. Theo **Định luật II Newton**: F = m × a, trong đó:
- **F** = Lực tác dụng (N — Newton)
- **m** = Khối lượng của vật (kg)
- **a** = Gia tốc của vật (m/s²)

Khi bạn lắc micro:bit, bạn tác dụng lực lên nó. Lực này gây ra gia tốc. Gia tốc kế đo gia tốc đó và chuyển đổi thành tín hiệu số.

Ví dụ trong cuộc sống: Khi ô tô tăng tốc, hành khách bị đẩy về phía sau — đó là gia tốc dương. Khi phanh, hành khách bị đẩy về phía trước — đó là gia tốc âm (hay gia tốc âm = độ giảm tốc).

*Acceleration is the rate of change of velocity over time. According to **Newton's Second Law**: F = m × a, where:*
- ***F** = Applied Force (N — Newtons)*
- ***m** = Mass of the object (kg)*
- ***a** = Acceleration of the object (m/s²)*

*When you shake the micro:bit, you apply a force to it. This force causes acceleration. The accelerometer measures that acceleration and converts it to a digital signal.*

*Real-life examples: When a car speeds up, passengers are pushed backward — that's positive acceleration. When braking, passengers are pushed forward — that's negative acceleration (deceleration).*

### 2. Ba Trục Đo / Three Measurement Axes

**Tiếng Việt:**  
Gia tốc kế trong micro:bit đo gia tốc trên **ba trục vuông góc nhau**:

```
           ↑ Z (lên/xuống)
           |
           |
           +----------→ X (trái/phải)
          /
         /
        ↙ Y (trước/sau)

Nhìn từ phía trước micro:bit / Viewed from the front of the micro:bit:

      [micro:bit — mặt trước với LED]
      ┌─────────────────────────┐
      │  • • • • •              │
      │  • • • • •   ← Y trước │
      │  • • • • •   → Y sau   │
      │  • • • • •              │
      │  • • • • •              │
      └─────────────────────────┘
       ↑ X phải   ↓ X trái
       ↑ Z lên    ↓ Z xuống (qua mặt phẳng bảng)
```

- **Trục X:** Đo nghiêng trái/phải. Giá trị dương = nghiêng sang phải, âm = nghiêng sang trái.  
  *X-axis: Measures left/right tilt. Positive = tilt right, negative = tilt left.*

- **Trục Y:** Đo nghiêng trước/sau. Giá trị dương = nghiêng về phía trước, âm = về phía sau.  
  *Y-axis: Measures forward/backward tilt. Positive = tilt forward, negative = tilt backward.*

- **Trục Z:** Đo gia tốc lên/xuống. Khi nằm bằng phẳng, Z ≈ −1024 mg (do trọng lực trái đất).  
  *Z-axis: Measures up/down acceleration. When lying flat, Z ≈ −1024 mg (due to Earth's gravity).*

### 3. g-force và milli-g / g-force and milli-g

**Tiếng Việt:**  
Gia tốc thường được đo bằng **g** (g-force), với 1g = 9.8 m/s² (gia tốc trọng trường của Trái Đất).  
micro:bit đo gia tốc bằng đơn vị **milli-g (mg)**: 1000 mg = 1g = 9.8 m/s².

Khi micro:bit nằm yên phẳng trên bàn:
- X ≈ 0 mg (không nghiêng ngang)
- Y ≈ 0 mg (không nghiêng dọc)
- Z ≈ −1024 mg (trọng lực hướng xuống)

Khi lắc mạnh: các giá trị X, Y, Z thay đổi đột ngột và lớn, có thể lên đến ±2000 mg.

*Acceleration is commonly measured in **g** (g-force), where 1g = 9.8 m/s² (Earth's gravitational acceleration). The micro:bit measures acceleration in **milli-g (mg)**: 1000 mg = 1g = 9.8 m/s².*

*When the micro:bit lies flat on a table: X ≈ 0 mg, Y ≈ 0 mg, Z ≈ −1024 mg (gravity pointing down). When shaken hard: X, Y, Z values change suddenly and greatly, up to ±2000 mg.*

### 4. Công nghệ MEMS / MEMS Technology

**Tiếng Việt:**  
Gia tốc kế trong micro:bit sử dụng công nghệ **MEMS (Micro-Electro-Mechanical Systems — Hệ thống Vi Cơ Điện Tử)**. Đây là công nghệ kết hợp các cấu trúc cơ học cực nhỏ (micro) với mạch điện tử trên cùng một chip silicon.

Nguyên lý MEMS accelerometer:
1. Bên trong chip có một **khối lượng bằng chứng (proof mass)** cực nhỏ được treo bởi các lò xo silicon nhỏ.
2. Khi chip gia tốc, khối lượng bằng chứng bị dịch chuyển tương đối so với vỏ chip.
3. Sự dịch chuyển này thay đổi điện dung của các tụ điện bên trong.
4. Mạch đọc điện tử chuyển đổi thay đổi điện dung thành giá trị gia tốc số.

Ưu điểm MEMS: Cực nhỏ, nhẹ, tiêu thụ điện thấp, giá rẻ. Đây là lý do gia tốc kế xuất hiện trong mọi điện thoại thông minh.

*The accelerometer in the micro:bit uses **MEMS (Micro-Electro-Mechanical Systems)** technology. This technology combines extremely small mechanical structures with electronic circuits on the same silicon chip.*

*MEMS accelerometer principle:*
1. *Inside the chip is a tiny **proof mass** suspended by small silicon springs.*
2. *When the chip accelerates, the proof mass is displaced relative to the chip housing.*
3. *This displacement changes the capacitance of internal capacitors.*
4. *Electronic readout circuits convert capacitance changes to digital acceleration values.*

*MEMS advantages: Extremely small, lightweight, low power consumption, low cost. This is why accelerometers appear in every smartphone.*

### 5. Phát hiện Cử chỉ / Gesture Detection

**Tiếng Việt:**  
micro:bit có thể tự động phát hiện nhiều loại cử chỉ dựa trên ngưỡng ngưỡng gia tốc:

| Cử chỉ / Gesture | Điều kiện phát hiện / Detection Condition |
|---|---|
| `shake` (lắc) | Tổng biên độ gia tốc vượt ngưỡng lắc (≈ 1500 mg) |
| `tilt left` (nghiêng trái) | X < −300 mg, Y và Z gần 0 |
| `tilt right` (nghiêng phải) | X > +300 mg, Y và Z gần 0 |
| `tilt forward` (nghiêng tới) | Y > +300 mg |
| `tilt backward` (nghiêng lui) | Y < −300 mg |
| `face up` (ngửa mặt) | Z ≈ −1024 mg (mặt LED hướng lên) |
| `face down` (úp mặt) | Z ≈ +1024 mg (mặt LED hướng xuống) |
| `free fall` (rơi tự do) | Cả X, Y, Z ≈ 0 mg (không còn trọng lực biểu kiến) |

Phát hiện dựa trên ngưỡng (threshold-based): firmware của micro:bit liên tục kiểm tra các giá trị X, Y, Z và so sánh với các ngưỡng đặt sẵn để xác định cử chỉ.

*The micro:bit can automatically detect many gesture types based on acceleration thresholds:*

*Threshold-based detection: the micro:bit firmware continuously checks X, Y, Z values and compares them to preset thresholds to determine gestures.*

### 6. Ứng dụng Thực tế / Real-World Applications

| Thiết bị / Device | Ứng dụng gia tốc kế / Accelerometer Application |
|---|---|
| 📱 Điện thoại thông minh / Smartphone | Xoay màn hình, đếm bước chân, chơi game nghiêng / Screen rotation, step counting, tilt gaming |
| ⌚ Đồng hồ thông minh / Smartwatch | Theo dõi hoạt động, phát hiện ngã / Activity tracking, fall detection |
| 🚗 Túi khí ô tô / Car airbag | Phát hiện va chạm đột ngột → bơm túi khí / Detect sudden collision → inflate airbag |
| ✈️ Máy bay / Aircraft | Hệ thống định hướng quán tính / Inertial navigation system |
| 🕹️ Game controller | Điều khiển bằng chuyển động (Nintendo Switch) / Motion control (Nintendo Switch) |
| 🏃 Thiết bị thể thao / Sports devices | Phân tích chuyển động vận động viên / Athlete motion analysis |
| 💻 Ổ cứng laptop | Bảo vệ khi phát hiện laptop đang rơi / Protection when detecting laptop falling |

---

## 📐 Công thức Góc Nghiêng / Tilt Angle Formula

```
Góc nghiêng (trục X so với mặt phẳng ngang):
Tilt angle (X-axis relative to horizontal plane):

    angle_x = arctan(x_reading / z_reading) × (180 / π)

Trong đó / Where:
    x_reading = giá trị gia tốc trục X (mg) / X-axis acceleration (mg)
    z_reading = giá trị gia tốc trục Z (mg) / Z-axis acceleration (mg)
    arctan = hàm arc-tangent / arc-tangent function
    × (180/π) = chuyển từ radian sang độ / converts radians to degrees

Ví dụ / Example:
    x_reading = 500 mg, z_reading = 866 mg
    angle_x = arctan(500 / 866) × (180/π)
    angle_x = arctan(0.577) × 57.3
    angle_x ≈ 30° (nghiêng 30° sang phải / tilted 30° to the right)
```

> **Lưu ý / Note:** Trong MicroPython, sử dụng `math.atan2()` thay vì `math.atan()` để xử lý tất cả các góc phần tư đúng cách. / *In MicroPython, use `math.atan2()` instead of `math.atan()` to handle all quadrants correctly.*

---

## 🧰 Linh kiện Cần thiết / Components Needed

| # | Linh kiện (Tiếng Việt) | Component (English) | Số lượng / Qty |
|---|---|---|---|
| 1 | Bo mạch micro:bit (V1 hoặc V2) | micro:bit board (V1 or V2) | 1 |
| 2 | Dây cáp micro USB | micro USB cable | 1 |
| 3 | Máy tính / Tablet | Computer / Tablet | 1 |
| 4 | Nguồn pin AA (3V) — để thao tác tự do | AA battery pack (3V) — for free movement | 1 |
| 5 | Bảng mở rộng Crowtail (tùy chọn) | Crowtail breakout board (optional) | 1 |

> **Lưu ý:** Gia tốc kế đã tích hợp sẵn trong micro:bit — không cần mua thêm module. Ma trận LED 5×5 cũng đã tích hợp sẵn để hiển thị kết quả.  
> *Note: The accelerometer is already built into the micro:bit — no additional module needed. The 5×5 LED matrix is also built-in for displaying results.*

---

## 🔌 Kết nối Mạch / Wiring & Connections

### Gia tốc kế và Màn hình LED / Accelerometer and LED Matrix

Cả gia tốc kế và ma trận LED 5×5 đều là **tích hợp sẵn** trong micro:bit — **không cần kết nối thêm bất kỳ dây nào**.  
*Both the accelerometer and 5×5 LED matrix are **built-in** to the micro:bit — **no additional wiring is required**.*

```
micro:bit (Nhìn từ phía trước / Front view):
┌───────────────────────────────────┐
│  [•][•][•][•][•]    Ma trận LED  │
│  [•][•][•][•][•]    LED Matrix   │
│  [•][•][•][•][•]    (tích hợp/   │
│  [•][•][•][•][•]     built-in)   │
│  [•][•][•][•][•]                  │
│                                   │
│  [A]           [B]  ← Nút bấm    │
│         USB                       │
└──┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬─┬──┘
   Cạnh kết nối (Edge Connector)
   P0 P1 P2 3V GND ...

Gia tốc kế bên trong chip (không thấy từ ngoài):
Accelerometer inside chip (not visible externally):
   Chip LSM303AGR (V2) hoặc MMA8652FC (V1)
   → Kết nối I2C nội bộ với bộ xử lý chính
   → Internal I2C connection to main processor
```

### Sử dụng Pin / Using Battery Pack

Để thao tác tự do (lắc, nghiêng), hãy dùng nguồn pin 3V thay vì cáp USB:  
*For free movement (shaking, tilting), use a 3V battery pack instead of USB cable:*

```
Pin AA (3V)   →   Cổng pin micro:bit (JST 2-pin)
Battery pack  →   micro:bit battery port (JST 2-pin)
```

---

## 🧩 Mô tả Khối MakeCode / MakeCode Block Description

### Hoạt động 1: Xúc Xắc Điện tử / Activity 1: Electronic Dice

**Khối "on shake" (Khi lắc):**
- Tạo biến `dice_value`.
- Gán `dice_value` = số ngẫu nhiên từ 1 đến 6 (khối `pick random 1 to 6`).
- Xóa màn hình LED (`clear screen`).
- Sử dụng cấu trúc điều kiện (`if-else if`) để hiển thị hình ảnh tương ứng:
  - Nếu `dice_value` = 1 → hiển thị hình `DICE1` (1 chấm giữa).
  - Nếu `dice_value` = 2 → hiển thị hình `DICE2` (2 chấm chéo góc).
  - Nếu `dice_value` = 3 → hiển thị hình `DICE3` (3 chấm đường chéo).
  - Nếu `dice_value` = 4 → hiển thị hình `DICE4` (4 chấm 4 góc).
  - Nếu `dice_value` = 5 → hiển thị hình `DICE5` (4 góc + 1 giữa).
  - Nếu `dice_value` = 6 → hiển thị hình `DICE6` (6 chấm 2 cột).
- Tạm dừng 3000ms trước khi cho phép lắc tiếp.

*"on shake" block: Create `dice_value` variable. Set `dice_value` = random number 1–6. Clear screen. Use if-else chain to show corresponding dice image. Pause 3000ms.*

**Khối "on start" (Khi bắt đầu):**
- Hiển thị "DICE" lướt qua màn hình.
- Hiển thị biểu tượng xúc xắc 6 mặt để báo hiệu sẵn sàng.

*"on start" block: Scroll "DICE" across screen. Show a dice icon to signal ready.*

**Khối "forever" (Mãi mãi):**
- Hiển thị biểu tượng trái tim nhấp nháy để cho biết chương trình đang chạy.
- Tạm dừng 1000ms.
- Xóa màn hình 200ms.

*"forever" block: Show blinking heart to indicate program is running. Pause 1000ms. Clear 200ms.*

### Hoạt động 2: Bộ Phát hiện Nghiêng / Activity 2: Tilt Detector

**Khối "forever" (Mãi mãi):**
- Đọc `accelerometer x` → lưu vào `x_val`.
- Đọc `accelerometer y` → lưu vào `y_val`.
- Dùng cấu trúc điều kiện:
  - Nếu `x_val` > 500 → hiển thị mũi tên sang phải (`ARROW_E`).
  - Nếu không, nếu `x_val` < -500 → hiển thị mũi tên sang trái (`ARROW_W`).
  - Nếu không, nếu `y_val` > 500 → hiển thị mũi tên xuống (`ARROW_S`).
  - Nếu không, nếu `y_val` < -500 → hiển thị mũi tên lên (`ARROW_N`).
  - Nếu không → hiển thị hình vuông (bằng phẳng).

*"forever" block: Read x and y accelerometer values. Use if-else chain to show directional arrows based on tilt.*

---

## 💻 MicroPython Code

### Chương trình Đầy đủ / Full Program

```python
# ============================================================
# Bài 18: Xúc Xắc Điện tử và Gia tốc kế micro:bit
# Lesson 18: Electronic Dice and micro:bit Accelerometer
#
# Tác giả / Author: STEM Elecrow Crowtail Curriculum
# Phiên bản / Version: 1.0
# ============================================================

from microbit import *
import random
import math

# ──────────────────────────────────────────────────────────
# PHẦN 1: ĐỊNH NGHĨA HÌNH XÚC XẮC / DICE FACE DEFINITIONS
# Mỗi mặt xúc xắc được định nghĩa là một đối tượng Image
# Each dice face defined as an Image object (5×5 LED matrix)
# Cú pháp: '0' = LED tắt, '9' = LED sáng nhất
# Syntax: '0' = LED off, '9' = LED brightest
# ──────────────────────────────────────────────────────────

DICE_1 = Image(
    "00000:"   # hàng 1 / row 1
    "00000:"   # hàng 2 / row 2
    "00900:"   # hàng 3 — chấm giữa / row 3 — center dot
    "00000:"   # hàng 4 / row 4
    "00000"    # hàng 5 / row 5
)

DICE_2 = Image(
    "00009:"   # chấm trên phải / top-right dot
    "00000:"
    "00000:"
    "00000:"
    "90000"    # chấm dưới trái / bottom-left dot
)

DICE_3 = Image(
    "00009:"   # chấm trên phải / top-right dot
    "00000:"
    "00900:"   # chấm giữa / center dot
    "00000:"
    "90000"    # chấm dưới trái / bottom-left dot
)

DICE_4 = Image(
    "90009:"   # 2 chấm trên / 2 top dots
    "00000:"
    "00000:"
    "00000:"
    "90009"    # 2 chấm dưới / 2 bottom dots
)

DICE_5 = Image(
    "90009:"   # 2 chấm trên / 2 top dots
    "00000:"
    "00900:"   # chấm giữa / center dot
    "00000:"
    "90009"    # 2 chấm dưới / 2 bottom dots
)

DICE_6 = Image(
    "90009:"   # 2 chấm trên / 2 top dots
    "00000:"
    "90009:"   # 2 chấm giữa / 2 middle dots
    "00000:"
    "90009"    # 2 chấm dưới / 2 bottom dots
)

# Danh sách tất cả các mặt xúc xắc (chỉ số 0-5 tương ứng 1-6)
# List of all dice faces (index 0-5 corresponds to values 1-6)
DICE_FACES = [DICE_1, DICE_2, DICE_3, DICE_4, DICE_5, DICE_6]

# ──────────────────────────────────────────────────────────
# PHẦN 2: HÀM XÚC XẮC / DICE FUNCTIONS
# ──────────────────────────────────────────────────────────

def roll_dice():
    """
    Gieo xúc xắc điện tử: tạo số ngẫu nhiên 1-6 và hiển thị.
    Roll the electronic dice: generate random 1-6 and display.
    """
    # Hiệu ứng lắc / Shake animation
    for _ in range(3):
        display.show(Image.DIAMOND)
        sleep(100)
        display.show(Image.DIAMOND_SMALL)
        sleep(100)

    # Tạo số ngẫu nhiên từ 1-6 / Generate random number 1-6
    value = random.randint(1, 6)

    # Hiển thị mặt xúc xắc tương ứng / Display corresponding dice face
    # Trừ 1 vì chỉ số danh sách bắt đầu từ 0 / Subtract 1 since list index starts at 0
    display.show(DICE_FACES[value - 1])

    # Hiển thị số bằng chữ / Also scroll the number
    sleep(1500)
    display.scroll(str(value), delay=80)

    return value

# ──────────────────────────────────────────────────────────
# PHẦN 3: HÀM PHÁT HIỆN NGHIÊNG / TILT DETECTION FUNCTIONS
# ──────────────────────────────────────────────────────────

def get_tilt_direction():
    """
    Đọc gia tốc và xác định hướng nghiêng.
    Read acceleration and determine tilt direction.
    Trả về chuỗi mô tả hướng / Returns string describing direction.
    """
    x = accelerometer.get_x()  # Đọc trục X (trái/phải) / Read X-axis (left/right)
    y = accelerometer.get_y()  # Đọc trục Y (trước/sau) / Read Y-axis (forward/back)
    z = accelerometer.get_z()  # Đọc trục Z (lên/xuống) / Read Z-axis (up/down)

    # Ngưỡng phân biệt nghiêng đáng kể / Threshold for significant tilt
    THRESHOLD = 500  # milli-g

    if x > THRESHOLD:
        return "RIGHT"
    elif x < -THRESHOLD:
        return "LEFT"
    elif y > THRESHOLD:
        return "DOWN"
    elif y < -THRESHOLD:
        return "UP"
    else:
        return "FLAT"

def show_tilt_arrow(direction):
    """
    Hiển thị mũi tên tương ứng hướng nghiêng.
    Display arrow corresponding to tilt direction.
    """
    if direction == "RIGHT":
        display.show(Image.ARROW_E)
    elif direction == "LEFT":
        display.show(Image.ARROW_W)
    elif direction == "UP":
        display.show(Image.ARROW_N)
    elif direction == "DOWN":
        display.show(Image.ARROW_S)
    else:
        # Nằm phẳng → hiển thị hình vuông / Flat → show square
        display.show(Image(
            "99999:"
            "90009:"
            "90009:"
            "90009:"
            "99999"
        ))

# ──────────────────────────────────────────────────────────
# PHẦN 4: HÀM ĐẾM BƯỚC CHÂN / STEP COUNTER FUNCTION
# ──────────────────────────────────────────────────────────

# Biến đếm bước / Step counter variables
step_count = 0
last_shake_strength = 0
STEP_THRESHOLD = 800   # Ngưỡng phát hiện "bước" / Step detection threshold
STEP_COOLDOWN = 300    # Thời gian chờ giữa 2 bước (ms) / Cooldown between steps (ms)
last_step_time = 0

def check_step():
    """
    Phát hiện một bước đi dựa trên gia tốc.
    Detect a step based on acceleration.
    Thuật toán: Kiểm tra tổng độ lớn gia tốc vượt ngưỡng.
    Algorithm: Check if total acceleration magnitude exceeds threshold.
    """
    global step_count, last_step_time

    x = accelerometer.get_x()
    y = accelerometer.get_y()
    z = accelerometer.get_z()

    # Tính tổng độ lớn gia tốc (bỏ qua phần trọng lực)
    # Calculate total acceleration magnitude (excluding gravity component)
    # Dùng giá trị tuyệt đối / Use absolute values
    magnitude = abs(x) + abs(y) + abs(z + 1024)  # z+1024 để loại trừ trọng lực

    current_time = running_time()  # Thời gian hiện tại (ms) / Current time (ms)

    # Phát hiện bước: độ lớn vượt ngưỡng VÀ đã qua thời gian cooldown
    # Detect step: magnitude exceeds threshold AND cooldown time has passed
    if magnitude > STEP_THRESHOLD and (current_time - last_step_time) > STEP_COOLDOWN:
        step_count += 1
        last_step_time = current_time
        return True

    return False

# ──────────────────────────────────────────────────────────
# PHẦN 5: CHƯƠNG TRÌNH CHÍNH / MAIN PROGRAM
# Sử dụng nút để chuyển đổi giữa các chế độ
# Use buttons to switch between modes
# ──────────────────────────────────────────────────────────

# Chế độ: 0 = Xúc xắc, 1 = Phát hiện nghiêng, 2 = Đếm bước
# Mode: 0 = Dice, 1 = Tilt detector, 2 = Step counter
mode = 0
MODE_NAMES = ["DICE", "TILT", "STEP"]

# Thông báo khởi động / Startup announcement
display.scroll("ACCEL LAB", delay=80)
sleep(500)

while True:

    # ── Chuyển chế độ bằng nút A / Switch mode with Button A ──
    if button_a.was_pressed():
        mode = (mode + 1) % 3  # Xoay vòng 0→1→2→0 / Cycle 0→1→2→0
        display.scroll(MODE_NAMES[mode], delay=80)
        step_count = 0  # Reset bộ đếm khi đổi chế độ / Reset counter on mode change

    # ══════════════════════════════════════════════════════
    # CHẾ ĐỘ 0: XÚC XẮC ĐIỆN TỬ / MODE 0: ELECTRONIC DICE
    # ══════════════════════════════════════════════════════
    if mode == 0:
        if accelerometer.was_gesture("shake"):
            roll_dice()
            sleep(2000)  # Không lắc liên tục / Prevent continuous rolling

        else:
            # Hiển thị hình dấu hỏi chờ lắc / Show question mark while waiting to shake
            display.show(Image(
                "09990:"
                "00090:"
                "00900:"
                "00000:"
                "00900"
            ))
            sleep(100)

    # ══════════════════════════════════════════════════════════
    # CHẾ ĐỘ 1: PHÁT HIỆN NGHIÊNG / MODE 1: TILT DETECTOR
    # ══════════════════════════════════════════════════════════
    elif mode == 1:
        direction = get_tilt_direction()
        show_tilt_arrow(direction)
        sleep(150)  # Cập nhật nhanh để phản hồi mượt / Update fast for smooth response

    # ══════════════════════════════════════════════════════════
    # CHẾ ĐỘ 2: ĐẾM BƯỚC CHÂN / MODE 2: STEP COUNTER
    # ══════════════════════════════════════════════════════════
    elif mode == 2:
        step_detected = check_step()

        if step_detected:
            # Hiển thị số bước / Show step count
            display.show(str(step_count % 10))  # Chỉ hiển thị chữ số cuối / Last digit
            sleep(50)

        # Nút B: Hiển thị tổng số bước / Button B: Show total steps
        if button_b.was_pressed():
            display.scroll("STEPS:" + str(step_count), delay=80)

    sleep(50)  # Vòng lặp chính 50ms / Main loop 50ms
```

---

## 🎲 Hình Ảnh Mặt Xúc Xắc / Dice Face Pixel Art

Mỗi mặt xúc xắc được hiển thị trên ma trận LED 5×5 như sau  
*(• = LED sáng, · = LED tắt):*  
*Each dice face displayed on the 5×5 LED matrix as follows (• = LED on, · = LED off):*

```
MẶT 1 / FACE 1          MẶT 2 / FACE 2          MẶT 3 / FACE 3
· · · · ·               · · · · •               · · · · •
· · · · ·               · · · · ·               · · · · ·
· · • · ·               · · · · ·               · · • · ·
· · · · ·               · · · · ·               · · · · ·
· · · · ·               • · · · ·               • · · · ·

MẶT 4 / FACE 4          MẶT 5 / FACE 5          MẶT 6 / FACE 6
• · · · •               • · · · •               • · · · •
· · · · ·               · · · · ·               · · · · ·
· · · · ·               · · • · ·               • · · · •
· · · · ·               · · · · ·               · · · · ·
• · · · •               • · · · •               • · · · •
```

**Giải thích bố cục / Layout explanation:**

| Mặt / Face | Số chấm / Dots | Vị trí / Position |
|---|---|---|
| 1 | 1 | Chính giữa / Dead center |
| 2 | 2 | Góc trên phải + Góc dưới trái / Top-right + Bottom-left |
| 3 | 3 | Góc trên phải + Giữa + Góc dưới trái / Top-right + Center + Bottom-left |
| 4 | 4 | 4 góc / All 4 corners |
| 5 | 5 | 4 góc + Giữa / 4 corners + Center |
| 6 | 6 | 3 cột 2 chấm / 3 rows of 2 (left and right columns) |

---

## 🔬 Hoạt động 1: Xúc Xắc Điện tử
## Activity 1: Electronic Dice

**Mục tiêu / Objective:**  
Tạo một xúc xắc điện tử: khi lắc micro:bit, hiển thị ngẫu nhiên một mặt xúc xắc từ 1 đến 6 với hình ảnh chấm chân thực trên ma trận LED.  
*Create an electronic dice: when the micro:bit is shaken, display a random dice face from 1 to 6 with authentic dot patterns on the LED matrix.*

**Thời gian / Duration:** 25 phút / 25 minutes

**Lý thuyết ngắn / Quick Theory:**  
Xúc xắc điện tử kết hợp hai yếu tố: phát hiện cử chỉ (lắc) và số ngẫu nhiên. Số ngẫu nhiên thực chất là số **giả ngẫu nhiên** — máy tính dùng thuật toán phức tạp tạo ra dãy số có vẻ ngẫu nhiên.  
*The electronic dice combines two elements: gesture detection (shake) and random numbers. Random numbers are actually **pseudo-random** — computers use complex algorithms to generate sequences that appear random.*

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Tạo 6 hình ảnh mặt xúc xắc bằng cú pháp `Image(...)` hoặc dùng hình ảnh `DICE1`–`DICE6` có sẵn trong thư viện MakeCode.  
*Create 6 dice face images using `Image(...)` syntax or use the built-in `DICE1`–`DICE6` images in MakeCode.*

**Bước 2 / Step 2:** Trong khối "on shake":  
*In the "on shake" block:*
- Tạo biến `roll` = `pick random 1 to 6`.  
  *Create variable `roll` = `pick random 1 to 6`.*
- Dùng chuỗi if-else để hiển thị hình tương ứng.  
  *Use an if-else chain to display the corresponding image.*

**Bước 3 / Step 3:** Nạp chương trình, dùng nguồn pin và thử lắc.  
*Flash the program, use battery power, and try shaking.*

**Bước 4 / Step 4:** Thống kê kết quả:  
*Record results statistics:*

| Số mặt / Face | Lần xuất hiện / Times appeared |
|---|---|
| 1 | |
| 2 | |
| 3 | |
| 4 | |
| 5 | |
| 6 | |

Sau 30 lần lắc, phân bố có đều không? / After 30 shakes, is the distribution even?

**Câu hỏi / Questions:**
1. Xúc xắc điện tử có công bằng như xúc xắc thật không? / Is the electronic dice as fair as a real dice?
2. Làm thế nào để làm cho xúc xắc "gian lận" (luôn ra mặt 6)? / How would you make the dice "cheat" (always land on 6)?

---

## 🔬 Hoạt động 2: Bộ Phát hiện Hướng Nghiêng với Mũi Tên
## Activity 2: Tilt Direction Detector with Arrow Display

**Mục tiêu / Objective:**  
Lập trình micro:bit đọc giá trị gia tốc kế và hiển thị mũi tên hướng theo chiều nghiêng của thiết bị theo thời gian thực.  
*Program the micro:bit to read accelerometer values and display directional arrows according to the device's tilt direction in real time.*

**Thời gian / Duration:** 25 phút / 25 minutes

**Ứng dụng thực tế / Real Application:**  
Nguyên lý này giống như cảm biến nghiêng trong xe tự hành và drone — chúng đọc gia tốc kế/con quay hồi chuyển để biết mình đang nghiêng bao nhiêu độ và điều chỉnh để giữ thăng bằng.  
*This principle is similar to tilt sensors in self-driving cars and drones — they read accelerometer/gyroscope data to know how much they're tilting and adjust to maintain balance.*

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Trong vòng lặp "forever", đọc `accelerometer x` và `accelerometer y`.  
*In the "forever" loop, read `accelerometer x` and `accelerometer y`.*

**Bước 2 / Step 2:** Thiết lập ngưỡng THRESHOLD = 500 mg.  
*Set threshold THRESHOLD = 500 mg.*

**Bước 3 / Step 3:** Điều kiện hiển thị:  
*Display conditions:*

```
Nếu X > 500   → Mũi tên PHẢI  (ARROW_E)   → micro:bit nghiêng sang phải
If X > 500    → RIGHT arrow   (ARROW_E)   → micro:bit tilted right

Nếu X < -500  → Mũi tên TRÁI  (ARROW_W)   → micro:bit nghiêng sang trái
If X < -500   → LEFT arrow    (ARROW_W)   → micro:bit tilted left

Nếu Y > 500   → Mũi tên XUỐNG (ARROW_S)   → micro:bit nghiêng xuống
If Y > 500    → DOWN arrow    (ARROW_S)   → micro:bit tilted down

Nếu Y < -500  → Mũi tên LÊN  (ARROW_N)   → micro:bit nghiêng lên
If Y < -500   → UP arrow      (ARROW_N)   → micro:bit tilted up

Còn lại       → Hình VUÔNG    (nằm phẳng)
Otherwise     → SQUARE image  (lying flat)
```

**Bước 4 / Step 4:** Thử nghiệm với các góc nghiêng khác nhau. Ghi lại giá trị X, Y khi nghiêng 45°.  
*Test with different tilt angles. Record X, Y values when tilted 45°.*

**Bảng Thực nghiệm / Experiment Table:**

| Tư thế / Position | X (mg) | Y (mg) | Z (mg) | Mũi tên / Arrow |
|---|---|---|---|---|
| Nằm phẳng / Flat | | | | — |
| Nghiêng phải 45° / Tilt right 45° | | | | → |
| Nghiêng trái 45° / Tilt left 45° | | | | ← |
| Nghiêng lên 45° / Tilt up 45° | | | | ↑ |
| Đứng thẳng / Vertical | | | | ↑ |

---

## 🔬 Hoạt động 3: Bộ Đếm Bước Chân Đơn giản
## Activity 3: Simple Step Counter

**Mục tiêu / Objective:**  
Xây dựng một bộ đếm bước chân đơn giản bằng cách phát hiện chuyển động lắc định kỳ tương tự bước đi.  
*Build a simple step counter by detecting periodic shake motions similar to walking steps.*

**Thời gian / Duration:** 20 phút / 20 minutes

**Lý thuyết ngắn / Quick Theory:**  
Vòng đeo tay thể thao (Fitbit, Apple Watch) đếm bước chân bằng gia tốc kế. Mỗi bước đi tạo ra một dao động gia tốc đặc trưng. Phần mềm phát hiện các đỉnh dao động này và đếm chúng. Thuật toán thực tế phức tạp hơn nhiều — chúng lọc nhiễu, phân biệt đi bộ với chạy, và tránh đếm nhầm khi ngồi xe.  
*Sports wristbands (Fitbit, Apple Watch) count steps using an accelerometer. Each step creates a characteristic acceleration oscillation. Software detects these oscillation peaks and counts them. Real algorithms are much more complex — they filter noise, distinguish walking from running, and avoid miscounting while in a vehicle.*

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Tạo biến `steps` = 0.  
*Create variable `steps` = 0.*

**Bước 2 / Step 2:** Tạo biến `last_strength` để lưu độ lớn gia tốc vòng trước.  
*Create variable `last_strength` to store previous acceleration magnitude.*

**Bước 3 / Step 3:** Trong vòng lặp: tính `strength` = |X| + |Y| + |Z − (−1024)|.  
*In the loop: calculate `strength` = |X| + |Y| + |Z − (−1024)|.*

**Bước 4 / Step 4:** Nếu `strength` > 800 VÀ `last_strength` <= 800 (phát hiện sườn lên / detect rising edge) → `steps` += 1.  
*If `strength` > 800 AND `last_strength` <= 800 (detect rising edge) → `steps` += 1.*

**Bước 5 / Step 5:** Hiển thị `steps` liên tục. Nút B → hiển thị và reset bộ đếm.  
*Continuously display `steps`. Button B → display and reset counter.*

**Bước 6 / Step 6:** Đặt micro:bit vào túi và đi 20 bước. So sánh kết quả.  
*Put the micro:bit in your pocket and walk 20 steps. Compare results.*

**Câu hỏi phân tích / Analysis Questions:**
1. Bộ đếm có chính xác không? Sai số bao nhiêu bước trên 20 bước? / Is the counter accurate? What is the error over 20 steps?
2. Tại sao cần thời gian cooldown giữa các bước? / Why do we need a cooldown time between steps?
3. Làm sao để cải thiện độ chính xác? / How can we improve accuracy?

---

## ⚠️ Lưu ý An toàn / Safety Notes

> **🇻🇳 Tiếng Việt:**
> 1. **Không lắc quá mạnh** — có thể làm micro:bit bay ra khỏi tay và hư hỏng.
> 2. **Sử dụng dây đeo hoặc hộp bảo vệ** khi dùng micro:bit với nguồn pin di động.
> 3. **Không ném micro:bit** để thử nghiệm rơi tự do — sẽ gây hư hỏng thiết bị.
> 4. **Cẩn thận không vấp ngã** khi vừa đi vừa nhìn màn hình micro:bit để đếm bước.
> 5. **Tắt nguồn** khi không sử dụng để tiết kiệm pin.
> 6. **Không để micro:bit rơi xuống** — chip MEMS bên trong có thể bị hư do va chạm mạnh.

> **🇬🇧 English:**
> 1. **Do not shake too violently** — the micro:bit may fly out of your hand and get damaged.
> 2. **Use a lanyard or protective case** when using the micro:bit with a portable battery pack.
> 3. **Do not throw the micro:bit** to test free fall — this will cause device damage.
> 4. **Be careful not to trip** while walking and watching the micro:bit display to count steps.
> 5. **Turn off power** when not in use to save battery.
> 6. **Do not drop the micro:bit** — the MEMS chip inside can be damaged by strong impact.

---

## 💬 Câu hỏi Thảo luận / Discussion Questions

1. **Gia tốc kế trong điện thoại thông minh** hoạt động như thế nào khi bạn xoay điện thoại để màn hình cũng xoay? Hãy giải thích từng bước xử lý tín hiệu.  
   *How does the accelerometer in a smartphone work when you rotate the phone and the screen also rotates? Explain each step of signal processing.*

2. **Tại sao xúc xắc điện tử** cần dùng số giả ngẫu nhiên? Tại sao máy tính không thể tạo ra số ngẫu nhiên thực sự? Điều đó có ảnh hưởng gì đến trò chơi?  
   *Why does the electronic dice use pseudo-random numbers? Why can't a computer generate truly random numbers? How does this affect games?*

3. **Túi khí ô tô** sử dụng gia tốc kế để phát hiện va chạm. Nếu ngưỡng phát hiện quá thấp sẽ có vấn đề gì? Nếu quá cao sẽ có vấn đề gì? Làm thế nào các kỹ sư cân bằng hai rủi ro này?  
   *Car airbags use accelerometers to detect collisions. What problems occur if the detection threshold is too low? Too high? How do engineers balance these two risks?*

4. **Bộ đếm bước chân** của em có chính xác không? Hãy so sánh với bộ đếm bước trên điện thoại hoặc đồng hồ thông minh. Tại sao chúng lại chính xác hơn?  
   *Is your step counter accurate? Compare it to the step counter on a phone or smartwatch. Why are they more accurate?*

5. **Định luật II Newton: F = m × a.** Nếu hai micro:bit có cùng khối lượng nhưng một chiếc bị lắc với lực gấp đôi chiếc kia, gia tốc đọc được sẽ khác nhau thế nào? Tính toán cụ thể.  
   *Newton's Second Law: F = m × a. If two micro:bits have the same mass but one is shaken with twice the force of the other, how will the acceleration readings differ? Calculate specifically.*

---

## 📊 Bảng Đánh giá / Assessment Rubric

| Tiêu chí / Criteria | Xuất sắc (4) / Excellent | Giỏi (3) / Good | Đạt (2) / Satisfactory | Cần cải thiện (1) / Needs Work |
|---|---|---|---|---|
| **Kiến thức Gia tốc kế** / Accelerometer Knowledge | Giải thích đầy đủ: 3 trục, milli-g, MEMS, phát hiện cử chỉ có ngưỡng. / Fully explains: 3 axes, milli-g, MEMS, threshold-based gesture detection. | Giải thích đúng hầu hết, có thể mắc 1-2 lỗi nhỏ về đơn vị. / Mostly correct, may have 1-2 minor errors in units. | Giải thích được 3 trục và ý nghĩa cơ bản. / Can explain 3 axes and basic meaning. | Không giải thích được các trục hoặc khái niệm cơ bản. / Cannot explain axes or basic concepts. |
| **Lập trình Xúc Xắc** / Dice Programming | Xúc xắc hoạt động hoàn hảo với 6 hình ảnh pixel art chính xác, hiệu ứng lắc mượt mà. / Dice works perfectly with 6 accurate pixel art images and smooth shake effect. | Xúc xắc hoạt động với hình ảnh hợp lệ nhưng hiệu ứng chưa hoàn hảo. / Dice works with valid images but effects not perfect. | Xúc xắc hiển thị số nhưng không có hình ảnh pixel art. / Dice shows numbers but no pixel art images. | Chương trình xúc xắc không chạy hoặc không phát hiện lắc. / Dice program doesn't run or doesn't detect shake. |
| **Phát hiện Nghiêng** / Tilt Detection | Phát hiện chính xác 4+ hướng với mũi tên hiển thị mượt mà, có chế độ "phẳng". / Accurately detects 4+ directions with smooth arrow display and "flat" mode. | Phát hiện được 4 hướng chính nhưng đôi khi bị nhiễu. / Detects 4 main directions but occasionally noisy. | Phát hiện được 2 hướng (trái/phải). / Detects 2 directions (left/right). | Không phát hiện được hướng nghiêng chính xác. / Cannot accurately detect tilt direction. |
| **Sáng tạo & Mở rộng** / Creativity & Extension | Thêm ít nhất 2 tính năng mới ngoài yêu cầu với giải thích rõ ràng. / Added at least 2 new features beyond requirements with clear explanation. | Thêm 1 tính năng mới hoặc cải thiện đáng kể tính năng có sẵn. / Added 1 new feature or significantly improved existing ones. | Hoàn thành đúng yêu cầu không có thêm gì. / Completed requirements exactly with nothing extra. | Không hoàn thành đủ yêu cầu. / Did not complete all requirements. |

---

## 🚀 Khám phá Thêm / Further Exploration & Challenges

### Thử thách Cơ bản / Basic Challenges
1. **Xúc xắc đặc biệt:** Tạo xúc xắc 8 mặt hoặc 12 mặt (phù hợp cho trò chơi nhập vai). Gợi ý: dùng `random.randint(1, 8)` và hiển thị số thay vì chấm.  
   *Special dice: Create an 8-sided or 12-sided dice (suitable for role-playing games). Hint: use `random.randint(1, 8)` and display numbers instead of dots.*

2. **Màn hình gia tốc thực:** Hiển thị giá trị X, Y, Z thực tế lên màn hình khi nhấn nút, giúp học sinh "thấy" gia tốc.  
   *Live accelerometer display: Show actual X, Y, Z values on screen when button pressed, helping students "see" acceleration.*

### Thử thách Nâng cao / Advanced Challenges
3. **Trò chơi Mê cung:** Dùng nghiêng để điều hướng một chấm sáng qua mê cung trên màn hình LED 5×5.  
   *Maze game: Use tilt to navigate a bright dot through a maze on the 5×5 LED screen.*

4. **Thước đo góc (Inclinometer):** Dùng công thức `arctan(x/z)` để tính và hiển thị góc nghiêng thực tế bằng độ.  
   *Inclinometer: Use the formula `arctan(x/z)` to calculate and display the actual tilt angle in degrees.*

5. **Xúc xắc đôi qua Radio:** Kết nối 2 micro:bit qua radio. Lắc một chiếc sẽ đồng thời "gieo" cả hai xúc xắc. Tổng điểm được cộng lại và gửi đến màn hình thứ ba.  
   *Dual dice via Radio: Connect 2 micro:bits via radio. Shaking one simultaneously "rolls" both dice. Total scores are added and sent to a third display.*

6. **Phát hiện rơi tự do:** Lập trình phát hiện khi micro:bit đang trong trạng thái rơi tự do (tất cả gia tốc ≈ 0) và phát cảnh báo âm thanh.  
   *Free fall detection: Program to detect when the micro:bit is in free fall (all acceleration ≈ 0) and sound an alert.*

---

## 📖 Từ vựng / Vocabulary List

| # | Thuật ngữ (Tiếng Việt) | Term (English) | Định nghĩa song ngữ / Bilingual Definition |
|---|---|---|---|
| 1 | Gia tốc | Acceleration | Tốc độ thay đổi vận tốc theo thời gian (m/s²). / Rate of change of velocity over time (m/s²). |
| 2 | Gia tốc kế | Accelerometer | Thiết bị đo gia tốc trên các trục không gian. / A device that measures acceleration along spatial axes. |
| 3 | Trục tọa độ | Coordinate Axis | Đường thẳng xác định hướng đo trong không gian (X, Y, Z). / A line defining a measurement direction in space (X, Y, Z). |
| 4 | g-force | g-force | Đơn vị gia tốc bằng gia tốc trọng trường Trái Đất (9.8 m/s²). / Unit of acceleration equal to Earth's gravitational acceleration (9.8 m/s²). |
| 5 | Milli-g (mg) | Milli-g (mg) | 1/1000 của 1g, đơn vị micro:bit dùng để đo gia tốc. / 1/1000 of 1g, the unit micro:bit uses to measure acceleration. |
| 6 | MEMS | MEMS (Micro-Electro-Mechanical Systems) | Công nghệ kết hợp vi cơ học và điện tử trên chip silicon. / Technology combining micro-mechanics and electronics on a silicon chip. |
| 7 | Cử chỉ | Gesture | Chuyển động có chủ đích được phần mềm nhận dạng (lắc, nghiêng...). / An intentional movement recognized by software (shake, tilt...). |
| 8 | Ngưỡng | Threshold | Giá trị giới hạn: vượt qua sẽ kích hoạt hành động. / Limit value: exceeding it triggers an action. |
| 9 | Số giả ngẫu nhiên | Pseudo-random Number | Số do thuật toán tạo ra có vẻ ngẫu nhiên nhưng có thể dự đoán nếu biết hạt giống. / Number generated by an algorithm that appears random but is predictable if the seed is known. |
| 10 | Rơi tự do | Free Fall | Chuyển động chỉ dưới tác dụng của trọng lực, không có lực nào khác. / Motion under gravity alone, with no other forces acting. |
| 11 | Định luật II Newton | Newton's Second Law | F = ma: Lực bằng khối lượng nhân gia tốc. / F = ma: Force equals mass times acceleration. |
| 12 | Khối lượng bằng chứng | Proof Mass | Khối lượng nhỏ bên trong gia tốc kế MEMS bị dịch chuyển khi có gia tốc. / Small mass inside MEMS accelerometer that is displaced by acceleration. |
| 13 | Bộ đếm bước | Step Counter / Pedometer | Thiết bị hoặc phần mềm đếm số bước đi dựa trên gia tốc. / Device or software counting steps based on acceleration. |
| 14 | Ma trận LED | LED Matrix | Lưới LED có thể lập trình để hiển thị hình ảnh và văn bản. / A programmable grid of LEDs for displaying images and text. |

---

*Bài 18 hoàn thành — Xuất sắc! / Lesson 18 Complete — Excellent!*  
*Tiếp theo: Bài 19 — La bàn Điện tử / Next: Lesson 19 — Electronic Compass* 🎉

---

**Tài liệu tham khảo / References:**
- [micro:bit MicroPython Accelerometer](https://microbit-micropython.readthedocs.io/en/v2-docs/accelerometer.html)
- [BBC micro:bit Hardware Specification](https://tech.microbit.org/hardware/)
- [Elecrow Crowtail STEAM Edu Kit Documentation](https://www.elecrow.com)
