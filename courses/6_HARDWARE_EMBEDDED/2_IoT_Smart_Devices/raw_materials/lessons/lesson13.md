# Bài 13: Cảm biến âm thanh - Vỗ tay bật đèn
# *Lesson 13: Sound Sensor – Clap to Light*

> **Cấp độ / Level:** Trung cấp *(Intermediate)*
> **Thời lượng / Duration:** 90 phút *(90 minutes)*
> **Bộ kit / Kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit

---

## 1. Mục tiêu học tập / *Learning Objectives*

Sau bài học này, học sinh có thể:
*After this lesson, students will be able to:*

| # | Mục tiêu *(Objective)* | Kỹ năng *(Skill)* |
|---|------------------------|-------------------|
| 1 | Giải thích nguyên lý hoạt động của cảm biến âm thanh | *Explain how a sound sensor works* | Kiến thức *(Knowledge)* |
| 2 | Phân biệt tín hiệu tương tự (analog) và tín hiệu số (digital) | *Distinguish between analog and digital signals* | Hiểu biết *(Comprehension)* |
| 3 | Đọc giá trị analog từ cảm biến âm thanh bằng micro:bit | *Read analog values from a sound sensor using micro:bit* | Ứng dụng *(Application)* |
| 4 | Lập trình điều khiển đèn LED bằng tiếng vỗ tay | *Program LED control triggered by clapping* | Tổng hợp *(Synthesis)* |
| 5 | Hiển thị mức âm thanh trên ma trận LED 5×5 | *Display sound level on the 5×5 LED matrix* | Sáng tạo *(Creation)* |

---

## 2. Lý thuyết / *Theory*

### 2.1 Tín hiệu Analog là gì? / *What is an Analog Signal?*

**Tín hiệu tương tự (analog)** là loại tín hiệu có giá trị **thay đổi liên tục** theo thời gian, không bị gián đoạn. Không giống như tín hiệu số (digital) chỉ có hai trạng thái 0 và 1, tín hiệu analog có thể nhận bất kỳ giá trị nào trong một khoảng xác định.

*An **analog signal** is a type of signal whose value **changes continuously** over time without interruption. Unlike digital signals that only have two states (0 and 1), analog signals can take any value within a defined range.*

**Dải đo của micro:bit / *micro:bit Analog Range:***

Khi đọc tín hiệu analog bằng micro:bit, giá trị trả về nằm trong khoảng **0 đến 1023**:
- **0** → Điện áp thấp nhất: 0V *(Minimum voltage: 0V)*
- **1023** → Điện áp cao nhất: 3.3V *(Maximum voltage: 3.3V)*
- **Công thức chuyển đổi / *Conversion formula:*** `Điện áp (V) = Giá trị đọc × 3.3 / 1023`

Khoảng 0–1023 tương ứng với độ phân giải **10-bit** (2¹⁰ = 1024 giá trị).
*The range 0–1023 corresponds to **10-bit resolution** (2¹⁰ = 1024 distinct values).*

---

### 2.2 Nguyên lý hoạt động của cảm biến âm thanh / *Sound Sensor Working Principle*

Cảm biến âm thanh Crowtail bao gồm các bộ phận chính sau:
*The Crowtail sound sensor consists of the following main components:*

```
    Âm thanh (Sound)
         │
         ▼
   ┌─────────────┐
   │  Micro điện │  ← Thu âm thanh thành tín hiệu điện
   │  (Microphone)│    Convert sound to electrical signal
   └──────┬──────┘
          │
          ▼
   ┌─────────────┐
   │  Op-Amp     │  ← Khuếch đại tín hiệu yếu
   │  (Amplifier)│    Amplifies weak signals
   └──────┬──────┘
          │
          ▼
   ┌─────────────┐
   │ Chân Analog │  ← Đưa ra tín hiệu 0–1023
   │  Output Pin │    Outputs value 0–1023
   └─────────────┘
```

**Quá trình hoạt động / *Operating Process:***
1. **Thu âm** *(Sound capture):* Màng loa trong microphone rung động khi có âm thanh / *The microphone diaphragm vibrates when sound waves arrive*
2. **Chuyển đổi** *(Conversion):* Rung động cơ học → tín hiệu điện biến thiên / *Mechanical vibration → varying electrical signal*
3. **Khuếch đại** *(Amplification):* Op-amp tăng cường tín hiệu yếu lên mức đủ để ADC đọc / *Op-amp boosts the weak signal to a level readable by ADC*
4. **Số hóa** *(Digitization):* ADC (Bộ chuyển đổi Analog-to-Digital) trong micro:bit chuyển tín hiệu analog thành số nguyên 0–1023 / *The micro:bit's ADC converts the analog signal to an integer 0–1023*

---

### 2.3 Khái niệm ngưỡng phát hiện / *Threshold Detection Concept*

**Ngưỡng (Threshold)** là một giá trị được đặt trước. Nếu tín hiệu đo được **vượt quá** ngưỡng này, hệ thống sẽ thực hiện một hành động cụ thể.
*A **threshold** is a pre-set value. If the measured signal **exceeds** this threshold, the system performs a specific action.*

```
Giá trị / Value
1023 ─────────────────────────────────
      │
 800 ─╔══════════════════════╗──────── ← Vỗ tay / Clap
      ║                      ║
 NGƯỠNG / THRESHOLD ─────────────────── (ví dụ: 600)
      │                      │
 300 ─╚══════════════════════╝
      │
   0 ─────────────────────────────────
      └──────────────────────────────► Thời gian / Time
```

Khi âm thanh vỗ tay làm giá trị vượt ngưỡng → Bật/Tắt đèn.
*When a clap pushes the value above the threshold → Toggle LED.*

---

### 2.4 So sánh Analog và Digital / *Analog vs. Digital Comparison*

| Đặc điểm *(Feature)* | Analog (Tương tự) | Digital (Số) |
|---|---|---|
| Giá trị *(Values)* | Liên tục, vô hạn *(Continuous, infinite)* | Rời rạc: 0 hoặc 1 *(Discrete: 0 or 1)* |
| Dạng sóng *(Waveform)* | Sóng liên tục *(Smooth wave)* | Sóng vuông *(Square wave)* |
| Ví dụ *(Example)* | Nhiệt độ, âm thanh, ánh sáng | Bật/tắt công tắc *(Switch on/off)* |
| Độ chính xác *(Precision)* | Rất cao *(Very high)* | Thấp (chỉ 2 mức) *(Low – only 2 levels)* |
| Dễ xử lý *(Ease of processing)* | Phức tạp hơn *(More complex)* | Đơn giản *(Simple)* |
| Nhiễu *(Noise susceptibility)* | Dễ bị nhiễu *(Susceptible to noise)* | Kháng nhiễu tốt *(Noise-resistant)* |
| Trong micro:bit | `pins.analogRead(pin)` → 0–1023 | `pins.digitalRead(pin)` → 0 hoặc 1 |

---

### 2.5 Ứng dụng thực tế của cảm biến âm thanh / *Real-World Applications*

Cảm biến âm thanh được sử dụng rộng rãi trong cuộc sống:
*Sound sensors are widely used in everyday life:*

- 🏠 **Nhà thông minh** *(Smart Home):* Đèn vỗ tay bật/tắt, báo động tiếng ồn
- 🎤 **Âm nhạc** *(Music):* Máy lọc âm thanh, micro thu âm
- 🚗 **Ô tô** *(Automotive):* Phát hiện tiếng gõ động cơ bất thường
- 🏭 **Công nghiệp** *(Industry):* Giám sát tiếng ồn máy móc, phát hiện sự cố
- 📱 **Điện thoại** *(Mobile):* Nhận lệnh giọng nói, trợ lý ảo Siri/Google Assistant
- 🔒 **Bảo mật** *(Security):* Phát hiện tiếng động trong phòng khi có trộm
- 🎮 **Trò chơi** *(Gaming):* Điều khiển bằng giọng nói, nhạc cụ điện tử

---

## 3. Dụng cụ cần thiết / *Components Needed*

| STT | Tên dụng cụ *(Component Name)* | Số lượng *(Qty)* | Ghi chú *(Notes)* |
|-----|-------------------------------|-----------------|-------------------|
| 1 | BBC micro:bit (v1 hoặc v2) | 1 | Bo mạch lập trình chính *(Main microcontroller board)* |
| 2 | Cảm biến âm thanh Crowtail *(Crowtail Sound Sensor)* | 1 | Module microphone analog |
| 3 | LED đơn Crowtail *(Crowtail LED Module)* | 1 | LED 5mm, điện trở tích hợp sẵn |
| 4 | Dây cáp Crowtail 4 chân *(Crowtail 4-pin Cable)* | 2 | Kết nối module với shield |
| 5 | Crowtail Base Shield cho micro:bit | 1 | Bảng mở rộng chân cắm |
| 6 | Cáp USB Micro *(Micro USB Cable)* | 1 | Nạp chương trình và cấp nguồn |
| 7 | Máy tính / Laptop *(Computer)* | 1 | Cài đặt MakeCode hoặc Mu Editor |
| 8 | Nguồn pin AAA (tùy chọn) *(AAA Battery Pack, optional)* | 1 | Dùng khi không có USB *(For portable use)* |

---

## 4. Sơ đồ kết nối / *Wiring & Connection*

### Mô tả kết nối chi tiết / *Detailed Pin Mapping*

```
┌─────────────────────────────────────────────────────────┐
│              BBC micro:bit + Crowtail Shield             │
│                                                         │
│  Cảm biến Âm thanh         LED Module                   │
│  (Sound Sensor)             (LED)                       │
│  ┌──────────────┐          ┌──────────────┐             │
│  │  S  G  V  NC │          │  S  G  V  NC │             │
│  │  │  │  │     │          │  │  │  │     │             │
│  └──┼──┼──┼─────┘          └──┼──┼──┼─────┘             │
│     │  │  │                   │  │  │                   │
│     │  │  └─── 3.3V ──────────│──│──┘                   │
│     │  └─────── GND ──────────│──┘                      │
│     └───────── P0  ───────────┘ (Signal)                │
│                P1 ←────────────────── LED Signal        │
└─────────────────────────────────────────────────────────┘
```

### Bảng kết nối / *Connection Table*

| Module | Chân Module *(Pin)* | Chân micro:bit *(micro:bit Pin)* | Chức năng *(Function)* |
|--------|---------------------|----------------------------------|------------------------|
| Cảm biến âm thanh *(Sound Sensor)* | S (Signal) | **P0** | Đọc tín hiệu analog *(Read analog signal)* |
| Cảm biến âm thanh *(Sound Sensor)* | V (VCC) | 3.3V | Cấp nguồn *(Power supply)* |
| Cảm biến âm thanh *(Sound Sensor)* | G (GND) | GND | Nối đất *(Ground)* |
| LED Module | S (Signal) | **P1** | Điều khiển bật/tắt *(On/Off control)* |
| LED Module | V (VCC) | 3.3V | Cấp nguồn *(Power supply)* |
| LED Module | G (GND) | GND | Nối đất *(Ground)* |

> ⚠️ **Lưu ý / Note:** Dùng cáp Crowtail 4 chân màu (vàng-đen-đỏ-trắng) để kết nối đúng chiều. Không cắm ngược cáp!
> *Use the colored 4-pin Crowtail cable (yellow-black-red-white) to connect correctly. Do not reverse the cable!*

---

## 5. Mô tả khối lệnh MakeCode / *MakeCode Block Description*

### 5.1 Hoạt động 1: Vỗ tay bật/tắt đèn / *Activity 1: Clap to Toggle LED*

```
[Pseudocode – Mô tả các khối MakeCode]

KHI KHỞI ĐỘNG (on start):
  - Đặt biến "den_bat" (led_on) = false
  - Hiển thị icon trái tim nhỏ trên LED matrix

LẶP VÔ HẠN (forever loop):
  BƯỚC 1: Đọc giá trị analog từ chân P0
          → Lưu vào biến "am_luong" (sound_level)

  BƯỚC 2: NẾU am_luong > 600:
    BƯỚC 2a: NẾU den_bat = false:
               - Đặt den_bat = true
               - Ghi digital HIGH ra chân P1 (bật đèn)
               - Hiển thị icon bóng đèn sáng trên LED matrix
             KHÔNG THÌ:
               - Đặt den_bat = false
               - Ghi digital LOW ra chân P1 (tắt đèn)
               - Hiển thị icon bóng đèn tắt trên LED matrix

  BƯỚC 3: Chờ 300ms (để tránh đọc nhiều lần một tiếng vỗ)

KẾT THÚC VÒNG LẶP
```

### 5.2 Hoạt động 2: Hiển thị mức âm thanh / *Activity 2: Sound Level Bar Display*

```
[Pseudocode – Mô tả các khối MakeCode]

LẶP VÔ HẠN (forever loop):
  BƯỚC 1: Đọc giá trị analog từ chân P0 → "am_luong"

  BƯỚC 2: Chuyển đổi am_luong (0–1023) sang mức hiển thị (0–25):
          muc_hien_thi = am_luong × 25 / 1023

  BƯỚC 3: Xóa màn hình LED matrix

  BƯỚC 4: VỚI mỗi pixel từ 0 đến muc_hien_thi - 1:
            - Tính hàng = pixel / 5 (chia lấy phần nguyên)
            - Tính cột = pixel % 5 (lấy phần dư)
            - Bật pixel tại (cột, hàng) với độ sáng 255

  BƯỚC 5: Chờ 100ms

KẾT THÚC VÒNG LẶP
```

---

## 6. Code MicroPython / *MicroPython Code*

### 6.1 Hoạt động 1: Vỗ tay bật/tắt đèn / *Activity 1: Clap-to-Light Toggle*

```python
# ============================================================
# Bài 13 - Hoạt động 1: Vỗ tay bật/tắt đèn
# Lesson 13 - Activity 1: Clap-to-Light Toggle
# 
# Phần cứng / Hardware:
#   - Cảm biến âm thanh Crowtail kết nối chân P0
#     (Crowtail Sound Sensor connected to P0)
#   - LED Crowtail kết nối chân P1
#     (Crowtail LED connected to P1)
# ============================================================

from microbit import *
import utime

# --- Thiết lập ban đầu / Initial Setup ---
NGUONG_AM_THANH = 600   # Ngưỡng phát hiện tiếng vỗ (0-1023)
                         # Sound detection threshold (0-1023)
THOI_GIAN_CHO = 300     # Thời gian chờ sau mỗi vỗ tay (ms)
                         # Wait time after each clap (ms)

den_bat = False          # Trạng thái đèn: False = tắt, True = bật
                         # LED state: False = OFF, True = ON

# Hiển thị biểu tượng khởi động
# Show startup icon
display.show(Image.HEART_SMALL)
utime.sleep(1)
display.clear()

# --- Vòng lặp chính / Main Loop ---
while True:
    # Bước 1: Đọc giá trị tín hiệu âm thanh từ chân P0 (0–1023)
    # Step 1: Read sound signal from pin P0 (0–1023)
    am_luong = pin0.read_analog()
    
    # Bước 2: Kiểm tra xem có tiếng vỗ tay không
    # Step 2: Check if a clap was detected
    if am_luong > NGUONG_AM_THANH:
        
        # Bước 3: Đổi trạng thái đèn (toggle)
        # Step 3: Toggle LED state
        if den_bat == False:
            # Bật đèn / Turn LED ON
            den_bat = True
            pin1.write_digital(1)        # Ghi tín hiệu HIGH ra P1 / Write HIGH to P1
            display.show(Image.HAPPY)    # Hiển thị mặt cười / Show happy face
        else:
            # Tắt đèn / Turn LED OFF
            den_bat = False
            pin1.write_digital(0)        # Ghi tín hiệu LOW ra P1 / Write LOW to P1
            display.show(Image.SAD)      # Hiển thị mặt buồn / Show sad face
        
        # Bước 4: Chờ để tránh đọc nhiều lần từ một tiếng vỗ
        # Step 4: Wait to avoid multiple reads from a single clap
        utime.sleep_ms(THOI_GIAN_CHO)
```

### 6.2 Hoạt động 2: Hiển thị mức âm thanh trên LED matrix / *Activity 2: Sound Level Bar Graph on LED Matrix*

```python
# ============================================================
# Bài 13 - Hoạt động 2: Hiển thị thanh mức âm thanh
# Lesson 13 - Activity 2: Sound Level Bar Display on 5x5 LED Matrix
#
# Ma trận LED 5x5 hiển thị số pixel sáng tương ứng với
# cường độ âm thanh đọc được từ cảm biến.
# The 5x5 LED matrix displays lit pixels proportional to
# the sound intensity read from the sensor.
# ============================================================

from microbit import *
import utime

# --- Hằng số / Constants ---
NGUONG = 600        # Ngưỡng để kích hoạt LED / Threshold to activate LED
TONG_PIXEL = 25     # Tổng số pixel trên ma trận 5×5 / Total pixels on 5×5 matrix

def doc_am_thanh():
    """
    Đọc giá trị cảm biến âm thanh từ chân P0.
    Read sound sensor value from pin P0.
    Trả về: giá trị nguyên 0–1023 / Returns: integer 0–1023
    """
    return pin0.read_analog()

def chuyen_doi_muc(gia_tri_analog):
    """
    Chuyển đổi giá trị analog (0–1023) sang số pixel sáng (0–25).
    Convert analog value (0–1023) to number of lit pixels (0–25).
    
    Công thức / Formula:
        muc_pixel = gia_tri_analog * 25 / 1023
    """
    muc_pixel = int(gia_tri_analog * TONG_PIXEL / 1023)
    return muc_pixel

def ve_thanh_muc(so_pixel):
    """
    Vẽ thanh mức âm thanh trên ma trận LED 5×5.
    Draw sound level bar on the 5×5 LED matrix.
    
    Pixel được điền từ góc dưới-trái lên trên-phải.
    Pixels are filled from bottom-left to top-right.
    """
    # Tạo ảnh trống / Create blank image
    anh = Image(5, 5)
    
    for i in range(so_pixel):
        # Tính vị trí hàng và cột từ chỉ số pixel
        # Calculate row and column from pixel index
        hang = i // 5    # Hàng (0–4) / Row (0–4)
        cot = i % 5      # Cột (0–4) / Column (0–4)
        
        # Bật pixel với độ sáng tối đa (9)
        # Set pixel with maximum brightness (9)
        anh.set_pixel(cot, hang, 9)
    
    display.show(anh)

# --- Vòng lặp chính / Main Loop ---
print("Bat dau do am thanh... / Starting sound measurement...")

while True:
    # Đọc cảm biến / Read sensor
    gia_tri = doc_am_thanh()
    
    # Chuyển đổi sang số pixel / Convert to pixel count
    so_pixel_sang = chuyen_doi_muc(gia_tri)
    
    # Vẽ thanh mức lên LED matrix / Draw bar on LED matrix
    ve_thanh_muc(so_pixel_sang)
    
    # Bật LED rời nếu vượt ngưỡng / Turn on LED module if above threshold
    if gia_tri > NGUONG:
        pin1.write_digital(1)
    else:
        pin1.write_digital(0)
    
    # In ra màn hình serial để theo dõi / Print to serial monitor for debugging
    print("Am luong / Sound:", gia_tri, "| Pixel:", so_pixel_sang)
    
    # Chờ một chút trước khi đọc lại / Short delay before re-reading
    utime.sleep_ms(100)
```

---

## 7. Công thức & Tính toán / *Formulas & Calculations*

### 7.1 Chuyển đổi giá trị đọc sang phần trăm / *Convert Reading to Percentage*

$$\text{Phần trăm âm lượng} = \frac{\text{Giá trị đọc}}{1023} \times 100\%$$

$$\textit{Sound Level \%} = \frac{\textit{Read Value}}{1023} \times 100\%$$

**Ví dụ tính toán / *Calculation Examples:***

| Giá trị đọc *(Read Value)* | Phần trăm *(Percentage)* | Điện áp *(Voltage)* | Ý nghĩa *(Meaning)* |
|---|---|---|---|
| 0 | 0% | 0.00 V | Hoàn toàn yên tĩnh *(Complete silence)* |
| 100 | 9.8% | 0.32 V | Tiếng thì thầm *(Whisper)* |
| 512 | 50% | 1.65 V | Tiếng nói bình thường *(Normal speech)* |
| 700 | 68.4% | 2.26 V | Tiếng vỗ tay nhẹ *(Soft clap)* |
| 900 | 88% | 2.90 V | Tiếng vỗ tay mạnh *(Loud clap)* |
| 1023 | 100% | 3.30 V | Tiếng ồn rất lớn *(Very loud noise)* |

### 7.2 Công thức điện áp / *Voltage Formula*

$$V_{out} = \frac{\text{Giá trị ADC}}{1023} \times 3.3 \text{ V}$$

### 7.3 Công thức số pixel / *Pixel Count Formula*

$$\text{Số pixel sáng} = \left\lfloor \frac{\text{Giá trị analog} \times 25}{1023} \right\rfloor$$

*Dấu ⌊ ⌋ nghĩa là lấy phần nguyên (floor function).*
*The ⌊ ⌋ symbol means floor (integer part).*

---

## 8. Hoạt động 1: Vỗ tay bật/tắt đèn / *Activity 1: Clap to Toggle Light*

### Hướng dẫn thực hiện / *Step-by-Step Instructions*

**Chuẩn bị / Preparation (5 phút / 5 minutes):**
1. Lắp cảm biến âm thanh vào cổng **P0** trên Crowtail Shield bằng cáp 4 chân.
   *Connect the sound sensor to the **P0** port on the Crowtail Shield using a 4-pin cable.*
2. Lắp module LED vào cổng **P1** trên Crowtail Shield.
   *Connect the LED module to the **P1** port on the Crowtail Shield.*
3. Kết nối micro:bit với máy tính bằng cáp USB.
   *Connect the micro:bit to the computer via USB cable.*

**Lập trình / Programming (15 phút / 15 minutes):**
4. Mở trình soạn thảo Mu Editor hoặc MakeCode tại `makecode.microbit.org`.
   *Open Mu Editor or MakeCode at `makecode.microbit.org`.*
5. Nhập code MicroPython từ Mục 6.1 vào editor.
   *Type the MicroPython code from Section 6.1 into the editor.*
6. Nạp code vào micro:bit bằng nút **Flash**.
   *Flash the code to the micro:bit using the **Flash** button.*

**Thử nghiệm / Testing (10 phút / 10 minutes):**
7. Vỗ tay một lần gần cảm biến → Đèn LED bật.
   *Clap once near the sensor → LED turns ON.*
8. Vỗ tay thêm lần nữa → Đèn LED tắt.
   *Clap again → LED turns OFF.*
9. Nếu đèn không phản ứng: Thay đổi `NGUONG_AM_THANH` từ 600 lên 400 hoặc xuống 800 cho phù hợp với môi trường phòng học.
   *If the LED does not respond: Adjust `NGUONG_AM_THANH` from 600 to 400 (more sensitive) or 800 (less sensitive) to match your classroom environment.*

**Điều chỉnh ngưỡng / Tuning the Threshold:**

| Môi trường *(Environment)* | Ngưỡng đề xuất *(Suggested Threshold)* |
|---|---|
| Phòng yên tĩnh *(Quiet room)* | 400–500 |
| Lớp học bình thường *(Normal classroom)* | 550–650 |
| Môi trường ồn ào *(Noisy environment)* | 700–800 |

---

## 9. Hoạt động 2: Hiển thị mức âm thanh trên LED 5×5 / *Activity 2: Sound Level Bar on LED Matrix*

### Hướng dẫn thực hiện / *Step-by-Step Instructions*

**Mục tiêu của hoạt động / *Activity Goal:***
Biến micro:bit thành một **máy đo mức âm thanh trực quan** (VU Meter), giống như các thanh mức trên màn hình âm thanh.
*Transform the micro:bit into a **visual sound level meter** (VU Meter), similar to the level bars on audio equipment.*

**Các bước thực hiện / *Steps:***

1. **Giữ nguyên kết nối phần cứng** từ Hoạt động 1.
   *Keep the same hardware connections from Activity 1.*

2. **Thay thế code** bằng code Mục 6.2.
   *Replace the code with the code from Section 6.2.*

3. **Quan sát** màn hình LED khi:
   *Observe the LED screen when:*
   - Im lặng → 0 pixel sáng *(Silence → 0 pixels lit)*
   - Thì thầm → vài pixel *(Whisper → a few pixels)*
   - Vỗ tay → nhiều pixel *(Clap → many pixels)*
   - Hét to → gần 25 pixel *(Shout → close to 25 pixels)*

4. **Ghi chép kết quả** vào bảng sau:
   *Record results in the following table:*

| Nguồn âm thanh *(Sound Source)* | Giá trị đọc *(Read Value)* | Số pixel *(Pixels)* |
|---|---|---|
| Im lặng *(Silence)* | _____ | _____ |
| Thì thầm *(Whisper)* | _____ | _____ |
| Nói chuyện *(Normal speech)* | _____ | _____ |
| Vỗ tay *(Clap)* | _____ | _____ |
| Hét *(Shout)* | _____ | _____ |

5. **Mở Serial Monitor** trong Mu Editor để xem giá trị số thực tế.
   *Open the Serial Monitor in Mu Editor to see the actual numeric values.*

---

## 10. Lưu ý an toàn / *Safety Notes*

> ⚠️ **An toàn khi sử dụng thiết bị điện tử / Electronic Safety**

1. 🔌 **Ngắt nguồn** trước khi cắm hoặc tháo dây kết nối.
   *Always **disconnect power** before plugging or unplugging cables.*

2. 🔧 Cắm dây **đúng chiều** — dây Crowtail có màu để dễ nhận biết: đỏ = VCC, đen = GND, vàng = Signal.
   *Connect cables in the **correct orientation** — Crowtail cables are color-coded: red = VCC, black = GND, yellow = Signal.*

3. 💧 Tránh để nước hoặc chất lỏng tiếp xúc với mạch điện.
   *Keep water and liquids away from electronic circuits.*

4. 🌡️ Không để micro:bit ở nhiệt độ cao (trên 40°C) hoặc dưới ánh nắng mặt trời trực tiếp.
   *Do not expose the micro:bit to high temperatures (above 40°C) or direct sunlight.*

5. 📢 Không hét thẳng vào microphone của cảm biến âm thanh từ khoảng cách gần để tránh hỏng màng rung.
   *Do not shout directly into the sound sensor microphone at close range to avoid damaging the diaphragm.*

6. ⚡ Nguồn điện tối đa của micro:bit là **3.3V** — không kết nối nguồn 5V trực tiếp vào chân tín hiệu.
   *The micro:bit's maximum voltage is **3.3V** — do not connect 5V directly to signal pins.*

---

## 11. Câu hỏi thảo luận / *Discussion Questions*

1. **[Hiểu biết]** Tại sao cảm biến âm thanh trả về giá trị từ 0 đến 1023 thay vì chỉ 0 và 1?
   *[Comprehension] Why does the sound sensor return values from 0 to 1023 instead of just 0 and 1?*

2. **[Ứng dụng]** Nếu ngưỡng phát hiện quá thấp (ví dụ: 100), điều gì sẽ xảy ra với hệ thống bật/tắt đèn? Làm thế nào để khắc phục?
   *[Application] If the detection threshold is too low (e.g., 100), what will happen to the clap-toggle system? How can you fix it?*

3. **[Phân tích]** So sánh sự khác nhau giữa cảm biến âm thanh analog và nút bấm digital. Khi nào nên dùng mỗi loại?
   *[Analysis] Compare the difference between an analog sound sensor and a digital pushbutton. When should each be used?*

4. **[Đánh giá]** Tiếng vỗ tay và tiếng ồn nền (ô tô chạy ngoài đường, tiếng ghế kéo) đều có thể kích hoạt hệ thống. Làm thế nào để hệ thống chỉ phản ứng với tiếng vỗ tay?
   *[Evaluation] Both clapping and background noise (cars, chair scraping) can trigger the system. How can you make the system respond only to clapping?*

5. **[Sáng tạo]** Thiết kế một hệ thống báo động dựa trên âm thanh cho lớp học. Hệ thống sẽ hoạt động như thế nào? Cần thêm những thành phần gì?
   *[Creation] Design a sound-based alarm system for a classroom. How would it work? What additional components would you need?*

---

## 12. Bảng đánh giá / *Assessment Rubric*

| Tiêu chí *(Criterion)* | Xuất sắc 4⭐ *(Excellent)* | Tốt 3⭐ *(Good)* | Đạt 2⭐ *(Satisfactory)* | Cần cải thiện 1⭐ *(Needs Improvement)* |
|---|---|---|---|---|
| **Hiểu lý thuyết** *(Theory Understanding)* | Giải thích đầy đủ và chính xác tín hiệu analog, ngưỡng, và ADC *(Fully explains analog signals, threshold, and ADC accurately)* | Giải thích đúng phần lớn, còn vài điểm nhỏ chưa rõ *(Mostly correct, minor gaps)* | Hiểu cơ bản nhưng chưa giải thích được chi tiết *(Basic understanding, lacks detail)* | Nhầm lẫn khái niệm cơ bản *(Confuses basic concepts)* |
| **Kết nối phần cứng** *(Hardware Connection)* | Kết nối đúng và nhanh, không cần trợ giúp *(Connects correctly and quickly without help)* | Kết nối đúng sau 1–2 lần kiểm tra *(Correct after 1–2 checks)* | Kết nối đúng nhưng cần hướng dẫn nhiều *(Correct but needs much guidance)* | Kết nối sai hoặc không thể hoàn thành *(Incorrect or unable to complete)* |
| **Lập trình** *(Programming)* | Code chạy đúng hoàn toàn, có comment rõ ràng *(Code runs correctly, with clear comments)* | Code chạy đúng, ít comment *(Code runs correctly, few comments)* | Code chạy được sau khi sửa lỗi nhỏ *(Code runs after minor debugging)* | Code không chạy hoặc cần làm lại hoàn toàn *(Code doesn't run or needs full rewrite)* |
| **Thực nghiệm & Báo cáo** *(Experiment & Report)* | Ghi chép đầy đủ, phân tích số liệu sâu sắc, có nhận xét *(Complete records, deep data analysis, insightful comments)* | Ghi chép đủ, phân tích cơ bản *(Complete records, basic analysis)* | Ghi chép thiếu một phần, phân tích ít *(Partial records, minimal analysis)* | Không ghi chép hoặc báo cáo thiếu nhiều *(No records or very incomplete report)* |

---

## 13. Khám phá thêm / *Further Exploration & Challenges*

### Thử thách 1: Đèn giao thông âm thanh / *Challenge 1: Sound Traffic Light*
Sử dụng 3 LED (đỏ, vàng, xanh) để tạo đèn giao thông dựa trên mức âm thanh:
- Xanh (< 300): Yên tĩnh / *Green (< 300): Quiet*
- Vàng (300–600): Ồn vừa / *Yellow (300–600): Moderate*
- Đỏ (> 600): Quá ồn / *Red (> 600): Too loud*

### Thử thách 2: Nhạc cụ bằng tiếng vỗ / *Challenge 2: Clap Music Instrument*
Tạo nhạc cụ đơn giản: mỗi tiếng vỗ tay phát ra một nốt nhạc khác nhau bằng cách đếm số tiếng vỗ liên tiếp và phát âm thanh tương ứng qua loa.
*Create a simple instrument: each clap produces a different note by counting consecutive claps and playing the corresponding tone through the speaker.*

### Thử thách 3: Ghi nhận mức ồn theo thời gian / *Challenge 3: Noise Level Logger*
Ghi lại mức âm thanh mỗi 5 giây trong 1 phút và hiển thị giá trị trung bình, cao nhất, thấp nhất.
*Record sound levels every 5 seconds for 1 minute and display the average, maximum, and minimum values.*

### Thử thách 4 (Nâng cao): Phân tích tần số vỗ / *Challenge 4 (Advanced): Clap Pattern Recognition*
Nhận biết các mẫu vỗ tay khác nhau (vỗ 1 lần, 2 lần, 3 lần) và thực hiện các hành động khác nhau cho mỗi mẫu.
*Recognize different clap patterns (1 clap, 2 claps, 3 claps) and perform different actions for each pattern.*

---

## 14. Bảng từ vựng / *Vocabulary List*

| STT | Thuật ngữ *(Term)* | Định nghĩa Tiếng Việt | *English Definition* |
|-----|-------------------|----------------------|----------------------|
| 1 | **Analog (Tương tự)** | Tín hiệu có giá trị biến đổi liên tục, không gián đoạn | *A signal with continuously varying values without interruption* |
| 2 | **Digital (Số)** | Tín hiệu chỉ có hai trạng thái: 0 (thấp) hoặc 1 (cao) | *A signal with only two states: 0 (low) or 1 (high)* |
| 3 | **ADC** | Bộ chuyển đổi Analog-to-Digital: chuyển tín hiệu liên tục thành số nguyên | *Analog-to-Digital Converter: converts continuous signals to integers* |
| 4 | **Ngưỡng (Threshold)** | Giá trị ranh giới để hệ thống quyết định thực hiện hành động | *A boundary value that determines when the system takes action* |
| 5 | **Microphone** | Thiết bị chuyển âm thanh (rung động cơ học) thành tín hiệu điện | *Device that converts sound (mechanical vibration) to electrical signals* |
| 6 | **Khuếch đại (Amplify)** | Tăng cường biên độ của tín hiệu điện | *To increase the amplitude of an electrical signal* |
| 7 | **Toggle (Đổi trạng thái)** | Chuyển đổi qua lại giữa hai trạng thái: bật↔tắt | *Switching back and forth between two states: on↔off* |
| 8 | **Độ phân giải (Resolution)** | Số giá trị khác nhau mà ADC có thể phân biệt (10-bit = 1024 mức) | *Number of distinct values an ADC can distinguish (10-bit = 1024 levels)* |
| 9 | **Op-Amp** | Mạch khuếch đại hoạt động, dùng để tăng cường tín hiệu nhỏ | *Operational amplifier circuit, used to boost weak signals* |
| 10 | **Serial Monitor** | Cửa sổ hiển thị dữ liệu từ micro:bit qua cổng USB để gỡ lỗi | *Window that displays data from micro:bit via USB for debugging* |
| 11 | **Biên độ (Amplitude)** | Độ lớn của dao động tín hiệu, liên quan đến âm lượng | *The magnitude of signal oscillation, related to volume* |
| 12 | **Tần số (Frequency)** | Số lần dao động trong một giây, đơn vị Hertz (Hz) | *Number of oscillations per second, measured in Hertz (Hz)* |
| 13 | **Ma trận LED (LED Matrix)** | Lưới LED 5×5 trên micro:bit để hiển thị ký tự và hình ảnh | *5×5 grid of LEDs on micro:bit for displaying characters and images* |
| 14 | **VU Meter** | Đồng hồ đơn vị âm lượng, hiển thị mức âm thanh trực quan | *Volume Unit meter, visually displays sound levels* |

---

*Bài học tiếp theo / Next Lesson: **Bài 14 – Cảm biến từ: Báo mở cửa** / Lesson 14 – Magnetic Sensor: Door Alert*

---
*Phiên bản / Version: 1.0 | Ngày tạo / Created: 2026 | Elecrow Crowtail STEAM Edu Kit*
