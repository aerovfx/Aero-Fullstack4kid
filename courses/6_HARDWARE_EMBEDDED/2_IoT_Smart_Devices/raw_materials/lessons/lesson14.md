# Bài 14: Cảm biến từ - Báo mở cửa
# *Lesson 14: Magnetic Sensor – Door Alert*

> **Cấp độ / Level:** Trung cấp *(Intermediate)*
> **Thời lượng / Duration:** 90 phút *(90 minutes)*
> **Bộ kit / Kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit

---

## 1. Mục tiêu học tập / *Learning Objectives*

Sau bài học này, học sinh có thể:
*After this lesson, students will be able to:*

| # | Mục tiêu *(Objective)* | Kỹ năng *(Skill)* |
|---|------------------------|-------------------|
| 1 | Giải thích khái niệm từ trường và đơn vị đo | *Explain the concept of magnetic fields and their units* | Kiến thức *(Knowledge)* |
| 2 | Mô tả nguyên lý hiệu ứng Hall và cách cảm biến từ hoạt động | *Describe the Hall effect principle and how magnetic sensors work* | Hiểu biết *(Comprehension)* |
| 3 | Phân biệt cảm biến Hall effect với công tắc lưỡi gà (Reed switch) | *Distinguish between Hall effect sensors and reed switches* | Phân tích *(Analysis)* |
| 4 | Kết nối và lập trình cảm biến từ Crowtail với micro:bit | *Connect and program the Crowtail magnetic sensor with micro:bit* | Ứng dụng *(Application)* |
| 5 | Xây dựng hệ thống cảnh báo mở cửa bằng còi và đèn LED | *Build a door-open alert system using buzzer and LED* | Tổng hợp *(Synthesis)* |
| 6 | Đọc và hiển thị cường độ từ trường bằng la bàn tích hợp micro:bit | *Read and display magnetic field strength using the micro:bit built-in compass* | Sáng tạo *(Creation)* |

---

## 2. Lý thuyết / *Theory*

### 2.1 Từ trường là gì? / *What is a Magnetic Field?*

**Từ trường** là một vùng không gian xung quanh nam châm (hoặc dây dẫn mang điện) mà trong đó các vật có tính từ bị tác động bởi lực từ.
*A **magnetic field** is a region of space around a magnet (or current-carrying conductor) in which magnetic materials experience a force.*

**Đặc điểm của từ trường / *Properties of Magnetic Fields:***
- Từ trường có **hướng**: đi từ cực Bắc (N) sang cực Nam (S) bên ngoài nam châm.
  *Magnetic fields have **direction**: they travel from the North (N) to the South (S) pole outside the magnet.*
- Từ trường **yếu dần** theo khoảng cách (tỷ lệ nghịch với bình phương khoảng cách).
  *Magnetic fields **weaken** with distance (inversely proportional to the square of distance).*
- Từ trường **xuyên qua** nhiều vật liệu (gỗ, nhựa, giấy) nhưng bị chặn bởi vật liệu sắt từ.
  *Magnetic fields **pass through** many materials (wood, plastic, paper) but are blocked by ferromagnetic materials.*

**Đơn vị đo từ trường / *Units of Magnetic Field Measurement:***

| Đơn vị *(Unit)* | Ký hiệu *(Symbol)* | Mô tả *(Description)* | Ví dụ *(Example)* |
|---|---|---|---|
| Tesla | T | Đơn vị SI chính thức *(Official SI unit)* | MRI y tế ≈ 1.5–3 T |
| Gauss | G | 1 T = 10,000 G *(1 T = 10,000 G)* | Từ trường Trái Đất ≈ 0.5 G |
| Microtesla | µT | 1 T = 1,000,000 µT | Từ trường Trái Đất ≈ 50 µT |
| Millitesla | mT | 1 T = 1,000 mT | Nam châm vĩnh cửu nhỏ ≈ 100 mT |

**Ví dụ so sánh cường độ từ trường / *Magnetic Field Strength Comparison:***

```
Cường độ (Tesla) / Strength (Tesla):

10 T  ─── Máy gia tốc hạt / Particle accelerator
 3 T  ─── Máy MRI bệnh viện / Hospital MRI machine
 1 T  ─── Nam châm nghiên cứu / Research magnet
0.1 T ─── Nam châm neodymium mạnh / Strong neodymium magnet
0.01T ─── Nam châm tủ lạnh / Refrigerator magnet
0.001T─── Từ trường Trái Đất / Earth's magnetic field (50µT)
```

---

### 2.2 Hiệu ứng Hall / *The Hall Effect*

**Hiệu ứng Hall** được khám phá bởi nhà vật lý Edwin Hall năm 1879. Đây là hiện tượng xuất hiện **điện áp ngang (Hall voltage)** khi dòng điện chạy qua một vật dẫn đặt trong từ trường vuông góc.
*The **Hall Effect** was discovered by physicist Edwin Hall in 1879. It is the phenomenon where a **transverse voltage (Hall voltage)** appears when current flows through a conductor placed in a perpendicular magnetic field.*

**Mô tả nguyên lý / *Principle Description:***

```
          Từ trường B / Magnetic field B
                ↓ ↓ ↓ ↓ ↓
    ┌───────────────────────────┐
    │   ●→  ●→  ●→  ●→  ●→    │
    │ dòng điện I / current I  │
    │   ●→  ●→  ●→  ●→  ●→    │
    └───────────────────────────┘
         ↑                   ↑
    (-) cực / pole      (+) cực / pole
    
    Lực Lorentz đẩy electron sang một bên
    Lorentz force pushes electrons to one side
    → Tạo ra điện áp Hall / Creates Hall voltage
    → Điện áp ∝ Cường độ từ trường B
      Voltage ∝ Magnetic field strength B
```

**Cảm biến Hall Effect (SS49E) trong Crowtail / *Hall Effect Sensor (SS49E) in Crowtail:***
- Đo từ trường và xuất tín hiệu điện áp tỷ lệ với cường độ từ trường.
  *Measures the magnetic field and outputs a voltage proportional to field strength.*
- Phát hiện cả hai cực của nam châm (N và S).
  *Detects both poles of a magnet (N and S).*
- Đầu ra: tín hiệu **digital** (HIGH/LOW khi từ trường vượt ngưỡng).
  *Output: **digital** signal (HIGH/LOW when field exceeds threshold).*
- Điện áp hoạt động: 3.3V – 5V, tương thích với micro:bit.
  *Operating voltage: 3.3V – 5V, compatible with micro:bit.*

---

### 2.3 So sánh cảm biến Hall Effect và công tắc lưỡi gà / *Hall Effect Sensor vs. Reed Switch*

| Đặc điểm *(Feature)* | Cảm biến Hall Effect | Công tắc lưỡi gà *(Reed Switch)* |
|---|---|---|
| **Nguyên lý** *(Principle)* | Hiệu ứng điện tử *(Electronic effect)* | Tiếp xúc cơ học *(Mechanical contact)* |
| **Độ bền** *(Durability)* | Rất cao, không bộ phận chuyển động *(Very high, no moving parts)* | Trung bình, lò xo có thể mỏi *(Medium, spring may fatigue)* |
| **Tốc độ phản hồi** *(Response speed)* | Rất nhanh (nano-giây) *(Very fast – nanoseconds)* | Chậm hơn (milli-giây) *(Slower – milliseconds)* |
| **Kích thước** *(Size)* | Rất nhỏ (chip IC) *(Very small – IC chip)* | Nhỏ nhưng lớn hơn *(Small but larger)* |
| **Độ nhạy** *(Sensitivity)* | Điều chỉnh được *(Adjustable)* | Cố định *(Fixed)* |
| **Phát hiện cực từ** *(Pole detection)* | Có thể phân biệt N và S *(Can distinguish N and S)* | Không phân biệt được *(Cannot distinguish)* |
| **Giá thành** *(Cost)* | Rẻ hơn ở quy mô lớn *(Cheaper at scale)* | Rẻ hơn cho số lượng nhỏ *(Cheaper for small qty)* |
| **Ứng dụng điển hình** *(Typical use)* | Cảm biến tốc độ xe, hệ thống bảo mật *(Vehicle speed, security)* | Hệ thống cửa đơn giản, bàn phím cũ *(Simple door systems, old keyboards)* |

---

### 2.4 La bàn tích hợp micro:bit / *micro:bit Built-in Compass/Magnetometer*

BBC micro:bit (v1 và v2) được trang bị **cảm biến từ trường tích hợp (magnetometer)** là chip **LSM303AGR** (v1) hoặc **LSM303AGR** (v2).
*BBC micro:bit (v1 and v2) features a **built-in magnetometer** chip, the **LSM303AGR** (v1) or **LSM303AGR** (v2).*

**Thông số kỹ thuật / *Technical Specifications:***

| Thông số *(Parameter)* | Giá trị *(Value)* |
|---|---|
| Trục đo *(Measurement axes)* | 3 trục: X, Y, Z *(3-axis: X, Y, Z)* |
| Dải đo *(Range)* | ±400 µT (±4 Gauss) |
| Độ phân giải *(Resolution)* | 0.1 µT |
| Tần số lấy mẫu *(Sample rate)* | 10–100 Hz |
| Giao tiếp *(Interface)* | I2C |

**Đọc dữ liệu la bàn trong MicroPython / *Reading Compass in MicroPython:***
```python
compass.calibrate()          # Hiệu chỉnh la bàn / Calibrate compass
compass.heading()            # Đọc hướng 0°–360° / Read heading 0°–360°
compass.get_x()              # Cường độ trục X (µT) / X-axis strength (µT)
compass.get_y()              # Cường độ trục Y (µT) / Y-axis strength (µT)
compass.get_z()              # Cường độ trục Z (µT) / Z-axis strength (µT)
compass.get_field_strength() # Tổng cường độ từ trường / Total field strength
```

**Lưu ý:** Trước khi sử dụng la bàn, cần **hiệu chỉnh (calibrate)** bằng cách xoay micro:bit theo hướng dẫn trên màn hình.
*Note: Before using the compass, you must **calibrate** it by rotating the micro:bit as instructed on screen.*

---

### 2.5 Cường độ từ trường giảm theo khoảng cách / *How Field Strength Varies with Distance*

Cường độ từ trường của nam châm tỷ lệ nghịch với **lập phương** của khoảng cách:
*Magnetic field strength of a magnet is inversely proportional to the **cube** of distance:*

$$B \propto \frac{1}{r^3}$$

**Bảng tham khảo (nam châm neodymium 10mm) / *Reference Table (10mm neodymium magnet):***

| Khoảng cách r *(Distance)* | Cường độ tương đối *(Relative Strength)* | Cảm biến phát hiện? *(Detected?)* |
|---|---|---|
| 0 mm (chạm / touching) | 100% | ✅ Chắc chắn *(Definitely)* |
| 5 mm | 30% | ✅ Có *(Yes)* |
| 10 mm | 12% | ✅ Có *(Yes)* |
| 20 mm | 2% | ⚠️ Tùy cảm biến *(Depends on sensor)* |
| 50 mm | 0.08% | ❌ Không *(No)* |

---

### 2.6 Ứng dụng thực tế / *Real-World Applications*

| Lĩnh vực *(Field)* | Ứng dụng *(Application)* | Nguyên lý *(Principle)* |
|---|---|---|
| 🏠 Nhà ở *(Home)* | Cảm biến cửa mở/đóng *(Door open/close sensor)* | Nam châm trên cửa, cảm biến trên khung |
| 💻 Máy tính xách tay *(Laptop)* | Phát hiện đóng nắp máy *(Lid-close detection)* | Hall sensor ở cạnh màn hình |
| 📱 Điện thoại *(Phone)* | Bao da thông minh tắt màn hình *(Smart cover screen-off)* | Hall sensor ở mặt điện thoại |
| 🚗 Ô tô *(Car)* | Cảm biến tốc độ bánh xe *(Wheel speed sensor)* | Đếm vòng quay qua nam châm |
| 🏭 Công nghiệp *(Industry)* | Mã hóa vị trí trục quay *(Rotary encoder)* | Phát hiện răng từ |
| 🔒 Bảo mật *(Security)* | Hệ thống báo động cửa *(Door alarm system)* | Báo động khi cửa mở |
| 🏥 Y tế *(Medical)* | Máy MRI *(MRI machines)* | Từ trường mạnh để chụp ảnh |
| 🧭 Hàng hải *(Navigation)* | La bàn điện tử *(Electronic compass)* | Từ trường Trái Đất |

---

## 3. Dụng cụ cần thiết / *Components Needed*

| STT | Tên dụng cụ *(Component Name)* | Số lượng *(Qty)* | Ghi chú *(Notes)* |
|-----|-------------------------------|-----------------|-------------------|
| 1 | BBC micro:bit (v1 hoặc v2) | 1 | Bo mạch chính với la bàn tích hợp *(Main board with built-in compass)* |
| 2 | Cảm biến từ Crowtail *(Crowtail Magnetic Sensor)* | 1 | Module Hall effect, đầu ra digital |
| 3 | Module còi Crowtail *(Crowtail Buzzer Module)* | 1 | Còi áp điện, không cần điện trở ngoài |
| 4 | LED đơn Crowtail *(Crowtail LED Module)* | 1 | Hoặc LED strip tùy có sẵn |
| 5 | Dây cáp Crowtail 4 chân *(Crowtail 4-pin Cable)* | 3 | Một dây cho mỗi module |
| 6 | Crowtail Base Shield cho micro:bit | 1 | Bảng mở rộng chân cắm |
| 7 | Nam châm vĩnh cửu nhỏ *(Small permanent magnet)* | 1–2 | Nam châm neodymium hoặc ferrite |
| 8 | Cáp USB Micro *(Micro USB Cable)* | 1 | Nạp chương trình và cấp nguồn |
| 9 | Máy tính / Laptop *(Computer)* | 1 | MakeCode hoặc Mu Editor |
| 10 | Băng keo hai mặt *(Double-sided tape)* | Ít | Gắn nam châm vào cửa *(Attach magnet to door)* |
| 11 | Hộp carton nhỏ *(Small cardboard box)* | 1 | Mô phỏng cửa *(Simulate a door)* |

---

## 4. Sơ đồ kết nối / *Wiring & Connection*

### 4.1 Sơ đồ tổng quan / *Overview Diagram*

```
┌────────────────────────────────────────────────────────────┐
│           BBC micro:bit + Crowtail Base Shield              │
│                                                            │
│  CẢM BIẾN TỪ           CÒI               LED              │
│  (Magnetic Sensor)     (Buzzer)          (LED)             │
│  ┌──────────┐          ┌──────────┐      ┌──────────┐      │
│  │ S  G  V  │          │ S  G  V  │      │ S  G  V  │      │
│  └──┬──┬──┬─┘          └──┬──┬──┬─┘      └──┬──┬──┬─┘     │
│     │  │  │               │  │  │            │  │  │       │
│    P1  │ 3.3V            P0  │ 3.3V         P2  │ 3.3V    │
│        GND                   GND                GND        │
│                                                            │
│  [La bàn tích hợp / Built-in Compass → Không cần dây]     │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

### 4.2 Bảng kết nối chi tiết / *Detailed Connection Table*

| Module | Chân Module *(Pin)* | Chân micro:bit *(micro:bit Pin)* | Màu dây *(Cable Color)* | Chức năng *(Function)* |
|--------|---------------------|----------------------------------|-------------------------|------------------------|
| Cảm biến từ *(Magnetic Sensor)* | S (Signal) | **P1** | Vàng *(Yellow)* | Đọc tín hiệu digital *(Read digital signal)* |
| Cảm biến từ *(Magnetic Sensor)* | V (VCC) | 3.3V | Đỏ *(Red)* | Cấp nguồn *(Power supply)* |
| Cảm biến từ *(Magnetic Sensor)* | G (GND) | GND | Đen *(Black)* | Nối đất *(Ground)* |
| Còi *(Buzzer)* | S (Signal) | **P0** | Vàng *(Yellow)* | Điều khiển còi *(Buzzer control)* |
| Còi *(Buzzer)* | V (VCC) | 3.3V | Đỏ *(Red)* | Cấp nguồn *(Power supply)* |
| Còi *(Buzzer)* | G (GND) | GND | Đen *(Black)* | Nối đất *(Ground)* |
| LED Module | S (Signal) | **P2** | Vàng *(Yellow)* | Điều khiển bật/tắt *(On/Off control)* |
| LED Module | V (VCC) | 3.3V | Đỏ *(Red)* | Cấp nguồn *(Power supply)* |
| LED Module | G (GND) | GND | Đen *(Black)* | Nối đất *(Ground)* |
| La bàn tích hợp *(Built-in compass)* | — | I2C (tích hợp) | — | Không cần kết nối thêm *(No extra connection needed)* |

> ⚠️ **Lưu ý quan trọng / Important Note:**
> Cảm biến từ Crowtail xuất tín hiệu **DIGITAL**: LOW (0) khi phát hiện từ trường, HIGH (1) khi không có từ trường (logic đảo - inverted logic).
> *The Crowtail magnetic sensor outputs a **DIGITAL** signal: LOW (0) when a magnetic field is detected, HIGH (1) when no field present (inverted logic).*

### 4.3 Hướng dẫn lắp cảm biến lên cửa / *Mounting Guide for Door Setup*

```
   CỬA (DOOR)                    KHUNG CỬA (DOOR FRAME)
   ┌─────────────────┐            ┌──────────────────────┐
   │                 │            │                      │
   │  🧲 Nam châm   │←───5mm────→│  📡 Cảm biến từ      │
   │  (Magnet)       │   khoảng   │  (Magnetic Sensor)   │
   │  [Dán bằng      │   cách     │  [Gắn cố định vào    │
   │  băng 2 mặt]    │   gap      │   khung cửa]         │
   │                 │            │                      │
   └─────────────────┘            └──────────────────────┘
   
   Cửa Đóng / Door CLOSED: Nam châm gần cảm biến → LOW → Bình thường
   Cửa Mở  / Door OPEN:    Nam châm xa cảm biến  → HIGH → Báo động!
```

---

## 5. Mô tả khối lệnh MakeCode / *MakeCode Block Description*

### 5.1 Hoạt động 1: Báo mở cửa / *Activity 1: Door Alert*

```
[Pseudocode – Mô tả các khối MakeCode]

KHI KHỞI ĐỘNG (on start):
  - Hiển thị chữ "READY" trên LED matrix
  - Chờ 2 giây
  - Xóa màn hình

LẶP VÔ HẠN (forever loop):
  BƯỚC 1: Đọc giá trị digital từ chân P1 (cảm biến từ)
          → Lưu vào biến "trang_thai_cua" (door_state)

  BƯỚC 2: NẾU trang_thai_cua = 1 (HIGH = không có từ trường = cửa mở):
    - Ghi digital HIGH ra chân P0 (bật còi)
    - Ghi digital HIGH ra chân P2 (bật đèn LED)
    - Hiển thị icon CẢNH BÁO (!) trên LED matrix
    - Chờ 500ms
    - Ghi digital LOW ra chân P0 (tắt còi)
    - Chờ 500ms
    → LẶP LẠI tiếng còi khi cửa còn mở

  BƯỚC 3: KHÔNG THÌ (LOW = có từ trường = cửa đóng):
    - Ghi digital LOW ra chân P0 (tắt còi)
    - Ghi digital LOW ra chân P2 (tắt đèn LED)
    - Hiển thị icon CHECK (✓) trên LED matrix
    - Chờ 200ms

KẾT THÚC VÒNG LẶP
```

### 5.2 Hoạt động 2: Hiển thị cường độ từ trường / *Activity 2: Magnetic Field Strength Display*

```
[Pseudocode – Mô tả các khối MakeCode]

KHI KHỞI ĐỘNG (on start):
  - Gọi lệnh "hiệu chỉnh la bàn" (compass.calibrate)
  - Đợi quá trình hiệu chỉnh hoàn tất
  - Hiển thị icon NAM CHÂM trên LED matrix

LẶP VÔ HẠN (forever loop):
  BƯỚC 1: Đọc tổng cường độ từ trường
          tu_truong = căn bậc hai(X² + Y² + Z²)
          [Trong MakeCode: dùng khối "magnetic force" với trục "absolute"]

  BƯỚC 2: Hiển thị số tu_truong trên màn hình LED

  BƯỚC 3: NẾU tu_truong > 100 (µT, có nam châm gần):
    - Phát âm thanh cảnh báo
    - Bật LED cảnh báo (P2)
  KHÔNG THÌ:
    - Tắt LED (P2)

  BƯỚC 4: Chờ 500ms

KẾT THÚC VÒNG LẶP
```

---

## 6. Code MicroPython / *MicroPython Code*

### 6.1 Hoạt động 1: Báo mở cửa bằng còi và đèn LED / *Activity 1: Door Open Alert with Buzzer + LED*

```python
# ============================================================
# Bài 14 - Hoạt động 1: Cảm biến từ – Báo mở cửa
# Lesson 14 - Activity 1: Magnetic Sensor – Door Open Alert
#
# Phần cứng / Hardware:
#   - Cảm biến từ Crowtail: P1 (đầu ra DIGITAL, LOW = phát hiện từ trường)
#     Crowtail Magnetic Sensor: P1 (DIGITAL output, LOW = field detected)
#   - Còi Crowtail: P0
#     Crowtail Buzzer: P0
#   - LED Crowtail: P2
#     Crowtail LED: P2
#
# Logic đảo / Inverted Logic:
#   P1 = 0 (LOW)  → Có từ trường → CỬA ĐÓNG / Door CLOSED
#   P1 = 1 (HIGH) → Không từ trường → CỬA MỞ / Door OPEN
# ============================================================

from microbit import *
import utime
import music

# --- Hằng số / Constants ---
CHAN_CAM_BIEN = pin1   # Chân cảm biến từ / Magnetic sensor pin
CHAN_COI = pin0        # Chân còi / Buzzer pin
CHAN_LED = pin2        # Chân đèn LED / LED pin

# Biểu tượng tùy chỉnh / Custom icons
ICON_CUA_DONG = Image(
    "09090:"
    "09090:"
    "09090:"
    "09090:"
    "09090"
)

ICON_CANH_BAO = Image(
    "00900:"
    "09990:"
    "09090:"
    "09990:"
    "00000"
)

def bat_canh_bao():
    """
    Kích hoạt hệ thống cảnh báo: còi + đèn + hiển thị.
    Activate alert system: buzzer + LED + display.
    """
    # Bật đèn LED cảnh báo / Turn on warning LED
    CHAN_LED.write_digital(1)
    
    # Phát âm thanh còi ngắn / Sound short buzzer beep
    CHAN_COI.write_digital(1)
    utime.sleep_ms(200)
    CHAN_COI.write_digital(0)
    utime.sleep_ms(100)
    CHAN_COI.write_digital(1)
    utime.sleep_ms(200)
    CHAN_COI.write_digital(0)
    
    # Hiển thị cảnh báo trên LED matrix / Show warning on LED matrix
    display.show(ICON_CANH_BAO)

def tat_canh_bao():
    """
    Tắt hệ thống cảnh báo.
    Deactivate alert system.
    """
    # Tắt còi và đèn / Turn off buzzer and LED
    CHAN_COI.write_digital(0)
    CHAN_LED.write_digital(0)
    
    # Hiển thị trạng thái đóng / Show closed status
    display.show(ICON_CUA_DONG)

# --- Khởi động / Startup ---
display.scroll("READY", delay=80)
utime.sleep(0.5)
display.show(ICON_CUA_DONG)

print("He thong bao dong cua bat dau / Door alarm system started")

# --- Biến trạng thái / State variable ---
cua_da_mo = False    # Theo dõi trạng thái cửa / Track door state

# --- Vòng lặp chính / Main Loop ---
while True:
    # Bước 1: Đọc trạng thái cảm biến từ (P1)
    # Step 1: Read magnetic sensor state (P1)
    # LOW (0) = Từ trường phát hiện = CỬA ĐÓNG
    # HIGH (1) = Không có từ trường = CỬA MỞ
    trang_thai = CHAN_CAM_BIEN.read_digital()
    
    # Bước 2: Phân tích trạng thái
    # Step 2: Analyze state
    if trang_thai == 1:
        # Tín hiệu HIGH → Không có từ trường → CỬA MỞ!
        # HIGH signal → No magnetic field → DOOR IS OPEN!
        
        if not cua_da_mo:
            # Lần đầu phát hiện cửa mở / First detection of door opening
            print("!!! CUA MO / DOOR OPEN !!!")
            cua_da_mo = True
        
        # Kích hoạt cảnh báo liên tục khi cửa còn mở
        # Keep triggering alert while door remains open
        bat_canh_bao()
        utime.sleep_ms(800)   # Chờ trước khi kêu lại / Wait before beeping again
        
    else:
        # Tín hiệu LOW → Có từ trường → CỬA ĐÓNG
        # LOW signal → Magnetic field present → DOOR IS CLOSED
        
        if cua_da_mo:
            # Cửa vừa được đóng lại / Door was just closed
            print("Cua da dong / Door closed")
            cua_da_mo = False
        
        tat_canh_bao()
        utime.sleep_ms(200)   # Kiểm tra thường xuyên / Check frequently
```

### 6.2 Hoạt động 2: Hiển thị cường độ từ trường bằng la bàn tích hợp / *Activity 2: Magnetic Field Strength Display Using Built-in Magnetometer*

```python
# ============================================================
# Bài 14 - Hoạt động 2: Đo cường độ từ trường
# Lesson 14 - Activity 2: Magnetic Field Strength Measurement
#
# Sử dụng la bàn (magnetometer) tích hợp trong micro:bit
# Uses the built-in compass (magnetometer) in micro:bit
# Chip: LSM303AGR – 3-axis magnetometer
#
# Đơn vị đo / Unit: µT (microtesla) - thực ra MicroPython
# trả về milligauss (mG), 1 µT = 10 mG
# ============================================================

from microbit import *
import utime
import math

# --- Hằng số / Constants ---
NGUONG_NAM_CHAM = 200    # Ngưỡng cảnh báo có nam châm (đơn vị tùy chip)
                          # Threshold for magnet presence (unit depends on chip)
CHAN_COI = pin0           # Còi / Buzzer
CHAN_LED = pin2           # Đèn LED / LED

def tinh_cuong_do_tu_truong():
    """
    Tính tổng cường độ từ trường từ 3 trục X, Y, Z.
    Calculate total magnetic field strength from 3 axes X, Y, Z.
    
    Công thức / Formula:
        B = √(X² + Y² + Z²)
    
    Giá trị trả về là đơn vị tương đối của chip LSM303AGR.
    Returned value is in chip LSM303AGR relative units.
    """
    x = compass.get_x()    # Thành phần trục X / X-axis component
    y = compass.get_y()    # Thành phần trục Y / Y-axis component
    z = compass.get_z()    # Thành phần trục Z / Z-axis component
    
    # Tính độ lớn vector từ trường / Calculate magnetic vector magnitude
    cuong_do = math.sqrt(x*x + y*y + z*z)
    return int(cuong_do)

def hien_thi_thanh_muc(cuong_do, nguong=500):
    """
    Hiển thị thanh mức từ trường trên LED matrix 5×5.
    Display magnetic field level bar on 5×5 LED matrix.
    
    Tham số / Parameters:
        cuong_do: Cường độ từ trường / Magnetic field strength
        nguong: Giá trị tối đa để ánh xạ sang 25 pixel / Max value for 25 pixels
    """
    # Giới hạn tối đa / Cap at maximum
    if cuong_do > nguong:
        cuong_do = nguong
    
    # Tính số pixel sáng / Calculate lit pixels
    so_pixel = int(cuong_do * 25 / nguong)
    
    # Tạo ảnh thanh mức / Create level bar image
    anh = Image(5, 5)
    for i in range(so_pixel):
        hang = i // 5
        cot = i % 5
        anh.set_pixel(cot, hang, 9)
    
    display.show(anh)

# --- Hiệu chỉnh la bàn / Compass Calibration ---
# QUAN TRỌNG: Bước này bắt buộc trước khi dùng la bàn!
# IMPORTANT: This step is mandatory before using the compass!
display.scroll("CAL", delay=80)    # Hiển thị thông báo / Show message

# Bắt đầu hiệu chỉnh: nghiêng micro:bit theo vòng tròn
# Start calibration: tilt micro:bit in a circle
compass.calibrate()

# Sau khi hiệu chỉnh xong / After calibration complete
display.show(Image.YES)
utime.sleep(1)

print("La ban da hieu chinh / Compass calibrated")
print("Dua nam cham lai gan de do / Bring magnet close to measure")

# --- Vòng lặp chính / Main Loop ---
while True:
    # Bước 1: Tính cường độ từ trường tổng / Calculate total field strength
    cuong_do = tinh_cuong_do_tu_truong()
    
    # Bước 2: Đọc hướng la bàn / Read compass heading
    huong = compass.heading()
    
    # Bước 3: Hiển thị thanh mức / Display level bar
    hien_thi_thanh_muc(cuong_do)
    
    # Bước 4: Cảnh báo nếu phát hiện nam châm mạnh
    # Step 4: Alert if strong magnet detected
    if cuong_do > NGUONG_NAM_CHAM:
        CHAN_COI.write_digital(1)     # Bật còi / Buzzer on
        CHAN_LED.write_digital(1)     # Bật đèn / LED on
    else:
        CHAN_COI.write_digital(0)     # Tắt còi / Buzzer off
        CHAN_LED.write_digital(0)     # Tắt đèn / LED off
    
    # Bước 5: In dữ liệu ra Serial Monitor
    # Step 5: Print data to Serial Monitor
    print("Cuong do / Strength:", cuong_do,
          "| Huong / Heading:", huong, "°",
          "| X:", compass.get_x(),
          "Y:", compass.get_y(),
          "Z:", compass.get_z())
    
    # Chờ trước khi đọc lại / Wait before next reading
    utime.sleep_ms(500)
```

---

## 7. Công thức & Tính toán / *Formulas & Calculations*

### 7.1 Tính tổng cường độ từ trường / *Total Magnetic Field Strength*

$$B_{total} = \sqrt{B_x^2 + B_y^2 + B_z^2}$$

*Trong đó Bₓ, Bᵧ, B_z là thành phần từ trường theo ba trục.*
*Where Bₓ, Bᵧ, B_z are the magnetic field components along three axes.*

### 7.2 Logic phát hiện ngưỡng / *Threshold Detection Logic*

$$\text{Cảnh báo} = \begin{cases} \text{BẬT (ON)} & \text{nếu } B_{total} > \text{Ngưỡng (Threshold)} \\ \text{TẮT (OFF)} & \text{nếu } B_{total} \leq \text{Ngưỡng (Threshold)} \end{cases}$$

### 7.3 Nghịch đảo khoảng cách / *Distance Inverse Law*

$$B(r) = B_0 \times \left(\frac{r_0}{r}\right)^3$$

*Trong đó B₀ là cường độ tại r₀ (khoảng cách tham chiếu).*
*Where B₀ is the strength at r₀ (reference distance).*

### 7.4 Chuyển đổi đơn vị / *Unit Conversion*

$$1 \text{ Tesla (T)} = 10{,}000 \text{ Gauss (G)} = 1{,}000{,}000 \text{ microtesla (µT)}$$

$$1 \text{ Gauss (G)} = 100 \text{ microtesla (µT)}$$

**Ví dụ tính / *Calculation Example:***

Nếu la bàn micro:bit đọc: X = 100, Y = 150, Z = 200 (đơn vị chip)
*If micro:bit compass reads: X = 100, Y = 150, Z = 200 (chip units)*

$$B_{total} = \sqrt{100^2 + 150^2 + 200^2} = \sqrt{10000 + 22500 + 40000} = \sqrt{72500} \approx 269 \text{ (đơn vị chip)}$$

---

## 8. Hoạt động 1: Báo mở cửa với còi và LED / *Activity 1: Door Open Alert with Buzzer and LED*

### Hướng dẫn thực hiện / *Step-by-Step Instructions*

**Phần A: Chuẩn bị phần cứng / *Part A: Hardware Setup* (10 phút / 10 minutes)**

1. Lắp **cảm biến từ** vào cổng **P1** trên Crowtail Shield.
   *Connect the **magnetic sensor** to the **P1** port on the Crowtail Shield.*

2. Lắp **module còi** vào cổng **P0** trên Crowtail Shield.
   *Connect the **buzzer module** to the **P0** port on the Crowtail Shield.*

3. Lắp **module LED** vào cổng **P2** trên Crowtail Shield.
   *Connect the **LED module** to the **P2** port on the Crowtail Shield.*

4. **Mô phỏng cửa**: Lấy hộp carton, dán **nam châm** ở cạnh nắp hộp, gắn **cảm biến** lên thân hộp sao cho khi đóng nắp thì khoảng cách cảm biến-nam châm < 10mm.
   *Simulate a door: Take a cardboard box, stick the **magnet** on the lid edge, attach the **sensor** to the box body so that when closed, the sensor-magnet distance is < 10mm.*

**Phần B: Lập trình / *Part B: Programming* (15 phút / 15 minutes)**

5. Nhập code MicroPython từ Mục 6.1 vào Mu Editor.
   *Enter the MicroPython code from Section 6.1 into Mu Editor.*

6. Nạp code vào micro:bit.
   *Flash the code to the micro:bit.*

**Phần C: Thử nghiệm / *Part C: Testing* (10 phút / 10 minutes)**

7. **Đóng nắp hộp** (cửa đóng): Kiểm tra LED matrix hiển thị biểu tượng cửa, còi tắt, đèn tắt.
   *Close the box lid (door closed): Check that the LED matrix shows the door icon, buzzer is off, LED is off.*

8. **Mở nắp hộp** (cửa mở): Kiểm tra còi kêu và đèn LED sáng.
   *Open the box lid (door open): Check that the buzzer sounds and LED lights up.*

9. Ghi lại kết quả quan sát:
   *Record your observations:*

| Trạng thái *(State)* | Cảm biến đọc *(Sensor Read)* | Còi *(Buzzer)* | LED | Màn hình *(Display)* |
|---|---|---|---|---|
| Cửa đóng *(Door closed)* | _____ | _____ | _____ | _____ |
| Cửa mở *(Door open)* | _____ | _____ | _____ | _____ |
| Nam châm bị lấy ra *(Magnet removed)* | _____ | _____ | _____ | _____ |

**Câu hỏi thực nghiệm / *Experiment Questions:***
- Khoảng cách tối đa để cảm biến vẫn phát hiện là bao nhiêu? *(What is the maximum distance the sensor still detects?)*
- Điều gì xảy ra nếu bạn xoay nam châm? *(What happens if you rotate the magnet?)*

---

## 9. Hoạt động 2: Hiển thị cường độ từ trường / *Activity 2: Magnetic Field Strength Display Using Built-in Compass*

### Hướng dẫn thực hiện / *Step-by-Step Instructions*

**Mục tiêu / *Goal:*** Biến micro:bit thành một **máy đo từ trường di động** sử dụng la bàn tích hợp.
*Transform the micro:bit into a **portable magnetic field meter** using the built-in compass.*

**Các bước thực hiện / *Steps:***

1. **Giữ nguyên kết nối** từ Hoạt động 1, thay thế code bằng code Mục 6.2.
   *Keep connections from Activity 1, replace code with Section 6.2 code.*

2. **Hiệu chỉnh la bàn (BẮTBUỘC)**: Khi micro:bit khởi động, màn hình sẽ hiển thị hướng dẫn nghiêng thiết bị. Nghiêng micro:bit theo vòng tròn cho đến khi tất cả các đèn sáng lên.
   *Calibrate compass (MANDATORY): When micro:bit starts, the screen will show instructions to tilt the device. Tilt the micro:bit in a circular motion until all lights are lit.*

3. **Khám phá từ trường xung quanh**: Mang micro:bit lại gần các vật sau và ghi lại giá trị:
   *Explore surrounding magnetic fields: Bring the micro:bit close to the following items and record values:*

| Vật thể *(Object)* | Giá trị đo *(Measured Value)* | Quan sát *(Observation)* |
|---|---|---|
| Không có gì *(Nothing/air)* | _____ | _____ |
| Nam châm nhỏ *(Small magnet)* | _____ | _____ |
| Cạnh laptop *(Laptop edge)* | _____ | _____ |
| Cạnh điện thoại *(Phone edge)* | _____ | _____ |
| Loa bluetooth *(Bluetooth speaker)* | _____ | _____ |
| Dây cáp có điện *(Powered cable)* | _____ | _____ |

4. **Vẽ biểu đồ** cường độ từ trường theo khoảng cách từ nam châm:
   *Draw a graph of field strength vs. distance from a magnet:*

   Đặt nam châm cố định, dịch chuyển micro:bit từ 0mm → 50mm và ghi lại giá trị mỗi 5mm.
   *Fix the magnet, move the micro:bit from 0mm → 50mm, recording values every 5mm.*

5. Sử dụng Serial Monitor để xuất dữ liệu ra máy tính và vẽ đồ thị.
   *Use the Serial Monitor to export data to your computer and plot a graph.*

---

## 10. Lưu ý an toàn / *Safety Notes*

> ⚠️ **An toàn với nam châm và thiết bị điện tử / Safety with Magnets and Electronics**

1. 🧲 **Không đặt nam châm mạnh (neodymium) lại gần thẻ ngân hàng, thẻ từ, hay ổ cứng HDD** — từ trường có thể xóa dữ liệu.
   *Never place strong magnets (neodymium) near bank cards, magnetic cards, or HDD hard drives — magnetic fields can erase data.*

2. 👁️ Nam châm nhỏ rất nguy hiểm nếu nuốt phải. **Không để trẻ nhỏ chơi với nam châm** không có giám sát.
   *Small magnets are very dangerous if swallowed. Never let young children play with magnets unsupervised.*

3. 🔌 Ngắt điện trước khi thay đổi kết nối phần cứng.
   *Disconnect power before changing hardware connections.*

4. 📡 La bàn micro:bit dễ bị **nhiễu bởi các thiết bị điện tử gần đó** (máy tính, điện thoại, loa). Khi đo, hãy đứng xa các thiết bị này.
   *The micro:bit compass is easily **interfered with by nearby electronics** (computers, phones, speakers). When measuring, stand away from these devices.*

5. ⚡ Không kết nối trực tiếp nguồn điện ngoài (> 3.3V) vào chân tín hiệu của micro:bit.
   *Do not connect external power (> 3.3V) directly to the micro:bit signal pins.*

6. 🔊 Còi Crowtail có thể phát ra âm thanh đủ lớn — tránh để gần tai khi thử nghiệm lần đầu.
   *The Crowtail buzzer can produce a loud sound — keep it away from your ears when testing for the first time.*

7. 🏃 Khi di chuyển micro:bit để hiệu chỉnh la bàn, đảm bảo không làm tuột dây kết nối.
   *When moving the micro:bit to calibrate the compass, ensure you don't dislodge any cables.*

---

## 11. Câu hỏi thảo luận / *Discussion Questions*

1. **[Hiểu biết]** Tại sao cảm biến từ Crowtail xuất tín hiệu LOW khi phát hiện từ trường thay vì HIGH? Điều này gọi là gì trong kỹ thuật điện tử?
   *[Comprehension] Why does the Crowtail magnetic sensor output LOW when a magnetic field is detected instead of HIGH? What is this called in electronics?*

2. **[Ứng dụng]** Laptop của bạn tự tắt màn hình khi đóng nắp. Giải thích cơ chế này sử dụng kiến thức về cảm biến từ.
   *[Application] Your laptop automatically turns off its screen when you close the lid. Explain this mechanism using your knowledge of magnetic sensors.*

3. **[Phân tích]** So sánh hệ thống báo động cửa dùng cảm biến từ với hệ thống dùng nút bấm thông thường. Hệ thống nào đáng tin cậy hơn và tại sao?
   *[Analysis] Compare a door alarm using a magnetic sensor vs. one using a regular pushbutton. Which is more reliable and why?*

4. **[Đánh giá]** La bàn micro:bit báo hướng không chính xác khi đặt gần máy tính. Tại sao điều này xảy ra và bạn sẽ khắc phục thế nào?
   *[Evaluation] The micro:bit compass shows incorrect headings when placed near a computer. Why does this happen and how would you fix it?*

5. **[Sáng tạo]** Thiết kế một hệ thống bảo vệ học sinh không để quên tủ đồ mà không khoá. Hệ thống sẽ hoạt động như thế nào? Cần những gì?
   *[Creation] Design a system to prevent students from leaving their locker unlocked. How would the system work? What components would you need?*

---

## 12. Bảng đánh giá / *Assessment Rubric*

| Tiêu chí *(Criterion)* | Xuất sắc 4⭐ *(Excellent)* | Tốt 3⭐ *(Good)* | Đạt 2⭐ *(Satisfactory)* | Cần cải thiện 1⭐ *(Needs Improvement)* |
|---|---|---|---|---|
| **Hiểu lý thuyết** *(Theory Understanding)* | Giải thích chính xác và đầy đủ hiệu ứng Hall, Reed switch, và từ trường; so sánh được hai loại cảm biến *(Accurately explains Hall effect, Reed switch, and magnetic fields; can compare both sensor types)* | Giải thích đúng hai trong ba khái niệm chính *(Correctly explains 2 of 3 main concepts)* | Giải thích được khái niệm cơ bản nhưng còn nhầm lẫn chi tiết *(Explains basic concepts but has some detail errors)* | Nhầm lẫn hoặc không giải thích được các khái niệm *(Confuses or cannot explain concepts)* |
| **Kết nối phần cứng** *(Hardware Connection)* | Kết nối đúng tất cả 3 module (cảm biến, còi, LED), lắp nam châm mô phỏng cửa thành thục *(Correctly connects all 3 modules, mounts door-simulation magnet proficiently)* | Kết nối đúng, cần nhắc nhở về nam châm mô phỏng *(Correct connection, minor reminder needed for magnet)* | Kết nối đúng sau khi được hướng dẫn trực tiếp *(Correct after direct guidance)* | Kết nối sai hoặc không hoàn thành được *(Incorrect or unable to complete)* |
| **Lập trình** *(Programming)* | Code chạy đúng hoàn toàn, xử lý logic đảo (inverted logic) chính xác, có comment rõ ràng, thử thách thêm tính năng *(Code runs correctly, handles inverted logic accurately, with clear comments, attempts extra features)* | Code chạy đúng, xử lý được logic đảo *(Code runs, correctly handles inverted logic)* | Code chạy nhưng cần sửa nhỏ về logic đảo *(Code runs but needs minor logic fix)* | Code không chạy hoặc logic đảo sai hoàn toàn *(Code doesn't run or inverted logic completely wrong)* |
| **Thực nghiệm & Phân tích** *(Experiment & Analysis)* | Ghi đầy đủ dữ liệu, vẽ biểu đồ khoảng cách vs. cường độ, phân tích được quy luật nghịch đảo, có nhận xét sâu *(Complete data, distance-strength graph, analyzes inverse law, deep analysis)* | Ghi đủ dữ liệu, vẽ biểu đồ, phân tích cơ bản *(Complete data, graph, basic analysis)* | Ghi thiếu một phần dữ liệu, phân tích sơ lược *(Partial data, brief analysis)* | Không ghi dữ liệu hoặc phân tích không liên quan *(No data or irrelevant analysis)* |

---

## 13. Khám phá thêm / *Further Exploration & Challenges*

### Thử thách 1: Hệ thống bảo vệ nhiều cửa / *Challenge 1: Multi-Door Security System*
Mở rộng hệ thống để giám sát **3 cửa** đồng thời sử dụng P0, P1, P2 cho 3 cảm biến từ khác nhau. Khi bất kỳ cửa nào mở, còi sẽ báo và LED matrix hiển thị số cửa bị mở.
*Expand the system to monitor **3 doors** simultaneously using P0, P1, P2 for 3 different magnetic sensors. When any door opens, the buzzer sounds and the LED matrix shows which door is open.*

### Thử thách 2: Ghi lại thời gian cửa mở / *Challenge 2: Door Open Duration Logger*
Thêm chức năng ghi lại tổng thời gian cửa mở trong một phiên hoạt động. Hiển thị thời gian (tính bằng giây) khi nhấn nút A.
*Add functionality to record the total time a door is open during a session. Display the time (in seconds) when button A is pressed.*

### Thử thách 3: La bàn đơn giản / *Challenge 3: Simple Compass*
Sử dụng la bàn tích hợp để tạo **la bàn điện tử**: hiển thị mũi tên trỏ về hướng Bắc trên màn hình LED 5×5 khi xoay micro:bit.
*Use the built-in compass to create an **electronic compass**: display an arrow pointing North on the 5×5 LED screen as you rotate the micro:bit.*

### Thử thách 4 (Nâng cao): Phát hiện xe đi qua / *Challenge 4 (Advanced): Vehicle Detection*
Xe ô tô chứa nhiều kim loại ảnh hưởng đến từ trường Trái Đất. Đặt micro:bit trên mặt đất và thử phát hiện khi có xe đi qua gần đó bằng cách đọc sự thay đổi cường độ từ trường.
*A car contains a lot of metal that affects Earth's magnetic field. Place the micro:bit on the ground and try to detect when a vehicle passes nearby by reading changes in field strength.*

### Thử thách 5: Kết hợp với bài 13 / *Challenge 5: Combine with Lesson 13*
Tạo hệ thống **bảo mật thông minh**: cửa mở → báo động, tiếng vỗ tay → tắt báo động (nhập mật mã bằng tiếng vỗ).
*Create a **smart security system**: door opens → alarm, clap → deactivate alarm (clap-code entry).*

---

## 14. Bảng từ vựng / *Vocabulary List*

| STT | Thuật ngữ *(Term)* | Định nghĩa Tiếng Việt | *English Definition* |
|-----|-------------------|----------------------|----------------------|
| 1 | **Từ trường (Magnetic Field)** | Vùng không gian xung quanh nam châm có thể tác dụng lực lên vật từ tính | *Region of space around a magnet that can exert force on magnetic materials* |
| 2 | **Tesla (T)** | Đơn vị đo cường độ từ trường trong hệ SI | *SI unit of magnetic field strength* |
| 3 | **Gauss (G)** | Đơn vị đo từ trường cũ: 1 T = 10,000 G | *Old unit of magnetic field: 1 T = 10,000 G* |
| 4 | **Hiệu ứng Hall (Hall Effect)** | Hiện tượng điện áp ngang xuất hiện khi dòng điện đi qua vật dẫn trong từ trường | *Phenomenon where a transverse voltage appears when current flows through a conductor in a magnetic field* |
| 5 | **Cảm biến Hall (Hall Sensor)** | Thiết bị bán dẫn phát hiện từ trường dựa trên hiệu ứng Hall | *Semiconductor device that detects magnetic fields based on the Hall effect* |
| 6 | **Công tắc lưỡi gà (Reed Switch)** | Công tắc điện cơ học đóng/mở tiếp điểm khi có từ trường | *Electromechanical switch that closes/opens contacts when a magnetic field is present* |
| 7 | **Từ kế (Magnetometer)** | Cảm biến đo cường độ và hướng của từ trường | *Sensor that measures the strength and direction of magnetic fields* |
| 8 | **Logic đảo (Inverted Logic)** | Trạng thái tín hiệu ngược với kỳ vọng: LOW = hoạt động, HIGH = không hoạt động | *Signal state opposite to expectation: LOW = active, HIGH = inactive* |
| 9 | **Hiệu chỉnh (Calibration)** | Quá trình chuẩn hóa cảm biến để cho kết quả chính xác | *Process of standardizing a sensor to produce accurate results* |
| 10 | **Cực Bắc/Nam (North/South Pole)** | Hai cực của nam châm: cực Bắc (N) hút cực Nam (S) | *Two poles of a magnet: North pole (N) attracts South pole (S)* |
| 11 | **Từ trường Trái Đất (Earth's Magnetic Field)** | Từ trường tự nhiên của Trái Đất, khoảng 25–65 µT tùy vị trí | *Earth's natural magnetic field, approximately 25–65 µT depending on location* |
| 12 | **Neodymium (NdFeB)** | Loại nam châm vĩnh cửu mạnh nhất hiện nay, dùng trong loa và ổ cứng | *The strongest type of permanent magnet, used in speakers and hard drives* |
| 13 | **Còi áp điện (Piezo Buzzer)** | Thiết bị phát âm thanh bằng dao động của tinh thể piezo khi có điện áp | *Sound-producing device using vibration of a piezo crystal when voltage is applied* |
| 14 | **Vector từ trường (Magnetic Vector)** | Đại lượng có cả độ lớn và hướng, biểu diễn từ trường trong không gian 3D | *A quantity with both magnitude and direction, representing the magnetic field in 3D space* |
| 15 | **Nhiễu từ (Magnetic Interference)** | Sự sai lệch đo lường do từ trường bên ngoài không mong muốn | *Measurement deviation caused by unwanted external magnetic fields* |

---

*Bài học trước / Previous Lesson: **Bài 13 – Cảm biến âm thanh** / Lesson 13 – Sound Sensor*
*Bài học tiếp theo / Next Lesson: **Bài 15 – Cảm biến khí / Gas Sensor***

---
*Phiên bản / Version: 1.0 | Ngày tạo / Created: 2026 | Elecrow Crowtail STEAM Edu Kit*
