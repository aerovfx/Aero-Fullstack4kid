# Bài 16: Độ Ẩm Đất – Chậu Cây Thông Minh
# *Lesson 16: Soil Moisture – Smart Plant Pot*

**Bộ kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit  
**Kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit

**Thời lượng:** 90 phút | **Duration:** 90 minutes  
**Cấp độ:** Trung cấp | **Level:** Intermediate  

---

## 1. Mục Tiêu Học Tập / Learning Objectives

### Sau bài học này, học sinh có thể: / *After this lesson, students will be able to:*

- **Giải thích** khái niệm độ ẩm đất và tại sao thực vật cần độ ẩm phù hợp.  
  *Explain the concept of soil moisture and why plants need the right moisture level.*

- **Mô tả** nguyên lý hoạt động của cảm biến đo độ ẩm đất theo phương pháp điện trở.  
  *Describe the operating principle of a resistive soil moisture sensor.*

- **Đọc và xử lý** giá trị analog (0–1023) từ cảm biến độ ẩm đất.  
  *Read and process analog values (0–1023) from the soil moisture sensor.*

- **Lập trình** micro:bit để hiển thị cảm xúc (mặt vui/buồn) dựa trên độ ẩm đất.  
  *Program the micro:bit to display emotions (happy/sad face) based on soil moisture.*

- **Xây dựng** hệ thống tưới cây tự động cảnh báo khi đất quá khô.  
  *Build an automatic watering alert system when soil is too dry.*

- **Thực hiện** quy trình hiệu chỉnh cảm biến cho các loại đất khác nhau.  
  *Perform sensor calibration for different soil types.*

- **Liên hệ** kỹ thuật này với nông nghiệp thông minh và hệ thống tưới tiêu tự động.  
  *Connect this technology to smart agriculture and automated irrigation systems.*

---

## 2. Lý Thuyết / Theory

### 2.1 Độ Ẩm Đất Là Gì? / *What Is Soil Moisture?*

**Độ ẩm đất** là lượng nước có trong đất, thường được biểu thị bằng phần trăm (%). Đây là một trong những yếu tố quan trọng nhất ảnh hưởng đến sự phát triển của cây trồng.  
*Soil moisture is the amount of water contained in the soil, usually expressed as a percentage (%). It is one of the most important factors affecting plant growth.*

```
Đất hoàn toàn khô / Completely dry soil:    ░░░░░░░░░░  0%
Đất hơi khô / Slightly dry soil:            ▓░░░░░░░░░  10-20%
Đất phù hợp cho cây / Ideal for plants:     ▓▓▓▓░░░░░░  30-60%
Đất ướt nhiều / Very wet soil:              ▓▓▓▓▓▓▓░░░  70-80%
Đất bão hòa nước / Saturated soil:          ▓▓▓▓▓▓▓▓▓▓  >90%
```

---

### 2.2 Nguyên Lý Cảm Biến Điện Trở / *Resistive Sensing Principle*

Cảm biến độ ẩm đất loại **điện trở (resistive)** hoạt động dựa trên một nguyên lý vật lý đơn giản:  
*The resistive soil moisture sensor operates based on a simple physical principle:*

> **Nước là chất dẫn điện!** Đất ướt có điện trở thấp → dòng điện chạy qua dễ dàng.  
> Đất khô có điện trở cao → dòng điện khó chạy qua.  
> *Water is an electrical conductor! Wet soil has low resistance → current flows easily.  
> Dry soil has high resistance → current flows with difficulty.*

#### Cơ chế hoạt động chi tiết / *Detailed mechanism:*

```
Cấu tạo cảm biến / Sensor structure:
┌─────────────────────────────────────────────────────┐
│  Probe A (+)     Probe B (-)                         │
│     │               │                                │
│     ▼               ▼                                │
│   ══╪═══════════════╪══  ← Kim loại tiếp xúc đất    │
│                          ← Metal probes in soil      │
└─────────────────────────────────────────────────────┘

Đất khô / Dry soil:
  A ──[đất khô/dry soil: R rất cao]──→ B
  Điện áp đầu ra cao / High output voltage → giá trị số cao / high digital value

Đất ướt / Wet soil:
  A ──[đất ướt/wet soil: R thấp]──→ B
  Điện áp đầu ra thấp / Low output voltage → giá trị số thấp / low digital value
```

> **Lưu ý thực tế / Practical note:** Cảm biến điện trở hoạt động tốt nhưng theo thời gian, điện phân (electrolysis) sẽ làm ăn mòn kim loại. Đây là lý do tại sao các cảm biến chuyên nghiệp thường dùng phương pháp **điện dung (capacitive)** thay thế.  
> *Resistive sensors work well but over time, electrolysis will corrode the metal. This is why professional sensors often use the capacitive method instead.*

---

### 2.3 Giá Trị Đọc Analog 0–1023 / *Analog Reading 0–1023*

Micro:bit đọc tín hiệu analog và chuyển đổi thành số nguyên từ **0 đến 1023** (độ phân giải 10-bit):  
*The micro:bit reads analog signals and converts them to integers from 0 to 1023 (10-bit resolution):*

```
Giá trị analog / Analog value:
0 ────────────────────────────────── 1023
│                                      │
Điện áp 0V                       Điện áp 3.3V
(0 Volts)                        (3.3 Volts)

Đối với cảm biến đất / For soil sensor:
0–300   = Đất KHÔ / DRY soil (điện trở cao / high resistance)
300–700 = Đất BÌNH THƯỜNG / NORMAL soil (độ ẩm tốt / good moisture)  
700–1023 = Đất ƯỚT / WET soil (điện trở thấp / low resistance)
```

> **Tại sao 10-bit?** 2^10 = 1024 bậc, nghĩa là cảm biến có thể phân biệt **1024 mức điện áp khác nhau** từ 0V đến 3.3V. Độ phân giải điện áp = 3.3V / 1023 ≈ 0.003V (3 mV) mỗi bậc.  
> *Why 10-bit? 2^10 = 1024 levels, meaning the sensor can distinguish 1,024 different voltage levels from 0V to 3.3V. Voltage resolution = 3.3V / 1023 ≈ 0.003V (3 mV) per step.*

---

### 2.4 Ngưỡng Khô và Ngưỡng Ướt / *Dry and Wet Thresholds*

Các ngưỡng (~300 và ~700) là giá trị **mặc định tham khảo**, nhưng chúng có thể thay đổi tùy theo:  
*The thresholds (~300 and ~700) are default reference values, but they can vary depending on:*

| Yếu tố / *Factor* | Ảnh hưởng / *Effect* |
|---|---|
| Loại đất / *Soil type* | Đất sét giữ nước tốt hơn đất cát / *Clay retains water better than sand* |
| Loại cây trồng / *Plant type* | Xương rồng cần đất khô hơn lan / *Cacti need drier soil than orchids* |
| Nhiệt độ / *Temperature* | Nhiệt độ cao → nước bay hơi nhanh hơn / *High temp → water evaporates faster* |
| Model cảm biến / *Sensor model* | Mỗi cảm biến có thể có giá trị hơi khác nhau / *Each sensor may have slightly different values* |

**→ Luôn hiệu chỉnh cảm biến với đất thực tế của bạn! (Xem Phần 10)**  
**→ Always calibrate the sensor with your actual soil! (See Section 10)**

---

### 2.5 Thực Vật Cần Bao Nhiêu Nước? / *How Much Water Do Plants Need?*

**Quá khô (Too dry):**  
- Cây bị héo, lá cong và vàng / *Plant wilts, leaves curl and yellow*
- Rễ không hấp thụ được dinh dưỡng / *Roots cannot absorb nutrients*
- Tế bào mất nước → cây chết / *Cells dehydrate → plant dies*

**Đủ ẩm (Adequate moisture):**  
- Cây quang hợp hiệu quả / *Plant photosynthesize efficiently*
- Vận chuyển dinh dưỡng tốt / *Good nutrient transport*
- Tăng trưởng khỏe mạnh / *Healthy growth*

**Quá ướt (Too wet):**  
- Rễ thiếu oxy → **thối rễ (root rot)** / *Roots lack oxygen → root rot*
- Vi khuẩn và nấm phát triển / *Bacteria and fungi thrive*
- Cây chết dù đất có nhiều nước / *Plant dies despite abundant water*

```
Mức độ nguy hiểm / Danger level:
      Thối rễ          Lý tưởng          Héo khô
      Root rot          Ideal             Wilting
         │               │                  │
    ─────┼───────────────┼──────────────────┼─────
    0   100   200   300   400   500   600   700   800   900   1000
         ↑                                   ↑
    Đất quá ướt                         Đất quá khô
    (Waterlogged)                        (Too dry)
```

---

### 2.6 Ứng Dụng Thực Tế / *Real-World Applications*

- 🌾 **Nông nghiệp thông minh** – hệ thống tưới tiêu tự động dựa trên độ ẩm đất / *Smart agriculture – automated irrigation based on soil moisture*
- 🏡 **Vườn nhà thông minh** – tưới cây tự động khi đất khô / *Smart home garden – auto-watering when soil is dry*
- 🌱 **Nhà kính (Greenhouse)** – kiểm soát môi trường trồng cây chính xác / *Greenhouse – precise growing environment control*
- 🌏 **Quan trắc môi trường** – theo dõi độ ẩm đất phục vụ nghiên cứu khí hậu / *Environmental monitoring – tracking soil moisture for climate research*
- 🚜 **Máy nông nghiệp** – máy tưới tự động điều chỉnh lượng nước theo nhu cầu thực tế / *Agricultural machinery – auto-irrigation adjusts water based on real needs*
- 📡 **IoT Agriculture** – các node cảm biến gửi dữ liệu lên cloud để quản lý đồng ruộng / *IoT Agriculture – sensor nodes send data to cloud for field management*

---

## 3. Công Thức / Formulas

### Chuyển đổi sang phần trăm độ ẩm / *Convert to Moisture Percentage:*

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   CÔNG THỨC / FORMULA:                                       ║
║                                                              ║
║   độ_ẩm (%) = (giá_trị_đọc / 1023) × 100                   ║
║   moisture (%) = (reading / 1023) × 100                      ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

**Ví dụ / Examples:**

| Giá trị đọc / *Reading* | Độ ẩm (%) / *Moisture (%)* | Trạng thái / *Status* |
|---|---|---|
| 0 | 0% | Đất hoàn toàn khô / *Completely dry* |
| 150 | 14.7% | Đất khô / *Dry soil* |
| 300 | 29.3% | Ngưỡng khô / *Dry threshold* |
| 512 | 50% | Độ ẩm trung bình / *Medium moisture* |
| 700 | 68.4% | Ngưỡng ướt / *Wet threshold* |
| 900 | 88% | Đất rất ướt / *Very wet* |
| 1023 | 100% | Đất bão hòa / *Saturated* |

### Công thức hiệu chỉnh nâng cao / *Advanced Calibration Formula:*

```
Sau khi đo giá trị khô và ướt thực tế:
After measuring actual dry and wet values:

dry_value  = giá trị khi đất hoàn toàn khô / value when soil is completely dry
wet_value  = giá trị khi đất bão hòa nước / value when soil is fully saturated

độ_ẩm_hiệu_chỉnh (%) = ((reading - dry_value) / (wet_value - dry_value)) × 100
calibrated_moisture (%) = ((reading - dry_value) / (wet_value - dry_value)) × 100
```

---

## 4. Thiết Bị Cần Chuẩn Bị / Components Needed

### Danh sách linh kiện / *Component List:*

| STT | Tên linh kiện / *Component* | Số lượng / *Quantity* | Ghi chú / *Notes* |
|---|---|---|---|
| 1 | BBC micro:bit v2 | 1 | Bo mạch chính / *Main board* |
| 2 | Cảm biến độ ẩm đất Crowtail / *Crowtail Soil Moisture Sensor* | 1 | Có 2 đầu dò bằng kim loại / *Has 2 metal probes* |
| 3 | Buzzer Crowtail / *Crowtail Buzzer* | 1 | Cảnh báo khi cần tưới / *Alert when watering needed* |
| 4 | Cáp Crowtail 4-chân / *Crowtail 4-pin cable* | 3 | Kết nối linh kiện / *Connect components* |
| 5 | Bo mạch mở rộng Crowtail / *Crowtail breakout board* | 1 | Kết nối micro:bit / *micro:bit interface* |
| 6 | Dây USB / *USB cable* | 1 | Lập trình / *Programming* |
| 7 | Chậu cây hoặc cốc / *Plant pot or cup* | 1 | Chứa đất thí nghiệm / *Hold test soil* |
| 8 | Đất trồng cây / *Potting soil* | Đủ dùng / *As needed* | Không dùng đất đá sỏi / *Not gravel or sand only* |
| 9 | Nước / *Water* | Đủ dùng / *As needed* | Để tưới đất thí nghiệm / *For watering test soil* |
| 10 | Máy tính / Laptop | 1 | Cài MakeCode / *Run MakeCode* |

---

## 5. Sơ Đồ Kết Nối / Wiring & Connection

### Mô tả kết nối / *Connection Description:*

```
[micro:bit] ←→ [Crowtail Breakout Board]
                        │
         ┌──────────────┼──────────────┐
         │              │              │
        [P0]           [P1]          [3V/GND]
  Cảm biến độ       Buzzer           Nguồn
  ẩm đất          (Buzzer)          (Power)
(Soil Moisture)
```

### Chi tiết từng kết nối / *Detailed connections:*

**Cảm biến độ ẩm đất Crowtail / *Crowtail Soil Moisture Sensor:***
- Cổng **P0** trên Crowtail Breakout Board (cổng Analog)  
  *(Port P0 on Crowtail Breakout Board – Analog port)*
- Dây **vàng/tín hiệu** → P0 (tín hiệu analog) / *Yellow/signal wire → P0 (analog signal)*
- Dây **đỏ** → 3.3V / *Red wire → 3.3V*
- Dây **đen** → GND / *Black wire → GND*

> **Lưu ý quan trọng / Important note:** Cảm biến độ ẩm đất cho tín hiệu **analog** (không phải digital). Phải sử dụng chân P0, P1, P2 trên micro:bit vì đây là các chân hỗ trợ đọc analog.  
> *The soil moisture sensor outputs an analog signal (not digital). Must use pins P0, P1, or P2 on micro:bit as these support analog reading.*

**Buzzer Crowtail / *Crowtail Buzzer:***
- Cổng **P1** trên Crowtail Breakout Board  
  *(Port P1 on Crowtail Breakout Board)*
- Tín hiệu điều khiển: Digital HIGH/LOW hoặc PWM từ micro:bit  
  *(Control signal: Digital HIGH/LOW or PWM from micro:bit)*

**Ma trận LED micro:bit / *micro:bit LED matrix:***
- Tích hợp sẵn trên bo mạch micro:bit (5×5 = 25 LED)  
  *(Built into the micro:bit board – 5×5 = 25 LEDs)*
- Hiển thị biểu tượng cảm xúc / *Displays emotion icons*

**Cảm biến cắm vào đất / *Insert sensor into soil:***
```
          Cắm thẳng đứng / Insert vertically
                    │
                    ▼
   ╔══════╗ ← Bảng mạch PCB / PCB board
   ║      ║
   ╠══════╣ ← Điểm nối dây / Cable connection point
   ║  ||  ║
   ║  ||  ║ ← Hai đầu dò / Two metal probes
   ║  ||  ║
   ╚══════╝
  [Đất ẩm / Moist soil]
```

---

## 6. Hướng Dẫn Lập Trình MakeCode / MakeCode Block Programming

### Mô tả khối lệnh – Hoạt động 1: Chậu cây thông minh / *Block Description – Activity 1: Smart Plant Pot*

```
╔══ KHI KHỞI ĐỘNG / ON START ═══════════════════════════════╗
║  Hiển thị chữ "PLANT" cuộn qua màn hình LED                ║
║  (Scroll "PLANT" text across LED screen)                    ║
║  Đợi 1 giây / Wait 1 second                                ║
╚════════════════════════════════════════════════════════════╝

╔══ LẶP MÃI / FOREVER ══════════════════════════════════════╗
║  [Bước 1 / Step 1] Đọc giá trị analog                     ║
║    - đọc_analog = đọc chân P0                              ║
║    (read_analog = read pin P0)                              ║
║                                                            ║
║  [Bước 2 / Step 2] Tính phần trăm độ ẩm                   ║
║    - do_am = (đọc_analog / 1023) × 100                     ║
║    (moisture = (read_analog / 1023) × 100)                  ║
║                                                            ║
║  [Bước 3 / Step 3] Kiểm tra và hiển thị                   ║
║                                                            ║
║  NẾU đọc_analog < 300 (ĐẤT KHÔ):                         ║
║    - Hiển thị mặt buồn / Show SAD face                    ║
║    - Cuộn chữ "DRY" / Scroll "DRY"                        ║
║    - Bật buzzer cảnh báo tưới / Activate watering alert   ║
║                                                            ║
║  NGƯỢC LẠI NẾU đọc_analog < 700 (ĐẤT TỐT):              ║
║    - Hiển thị mặt vui / Show HAPPY face                   ║
║    - Cuộn chữ "OK" / Scroll "OK"                          ║
║    - Tắt buzzer / Turn off buzzer                         ║
║                                                            ║
║  NGƯỢC LẠI (ĐẤT QUÁ ƯỚT):                               ║
║    - Hiển thị mặt bối rối / Show CONFUSED face            ║
║    - Cuộn chữ "WET" / Scroll "WET"                        ║
║    - Tắt buzzer / Turn off buzzer                         ║
║                                                            ║
║  [Bước 4 / Step 4] Đợi 1000ms rồi lặp lại               ║
║    (Wait 1000ms then repeat)                               ║
╚════════════════════════════════════════════════════════════╝
```

### Mô tả khối lệnh – Hoạt động 2: Hệ thống cảnh báo tưới / *Block Description – Activity 2: Watering Alert System*

```
╔══ LẶP MÃI / FOREVER ══════════════════════════════════════╗
║  [Đọc và tính như trên / Read and calculate as above]      ║
║                                                            ║
║  NẾU đọc_analog < 300 (ĐẤT KHÔ):                         ║
║    LẶP 3 LẦN / REPEAT 3 TIMES:                            ║
║      - Buzzer ON / 500ms                                   ║
║      - Buzzer OFF / 250ms                                  ║
║    Hiển thị hình giọt nước + chữ "WATER!"                 ║
║    (Show water drop icon + scroll "WATER!")                ║
║                                                            ║
║  NẾU đọc_analog > 700 (QUÁ ƯỚT):                         ║
║    - Buzzer ON / 200ms                                     ║
║    - Buzzer OFF / 200ms (1 lần / 1 time)                  ║
║    Hiển thị "STOP" / Show "STOP"                          ║
║                                                            ║
║  ĐỘ ẨM TỐT / GOOD MOISTURE: Im lặng                       ║
║    Hiển thị mặt vui / Show happy face                     ║
║    (All good - no buzzer)                                  ║
╚════════════════════════════════════════════════════════════╝
```

---

## 7. Mã MicroPython / MicroPython Code

```python
# ============================================================
# Bài 16: Cảm biến độ ẩm đất - Chậu cây thông minh
# Lesson 16: Soil Moisture Sensor - Smart Plant Pot
# ============================================================
# Board: BBC micro:bit v2
# Kit: Elecrow Crowtail STEAM Edu Kit
# Kết nối / Connections:
#   - Cảm biến độ ẩm đất / Soil Moisture: P0 (Analog)
#   - Buzzer: P1
#   - LED Matrix: Tích hợp / Built-in
# ============================================================

from microbit import *

# ============================================================
# CẤU HÌNH / CONFIGURATION
# ============================================================

# Chân kết nối / Pin assignments
SOIL_PIN = pin0   # Cảm biến đất (Analog) / Soil sensor (Analog)
BUZZ_PIN = pin1   # Buzzer / Buzzer

# Ngưỡng độ ẩm / Moisture thresholds (0–1023)
DRY_THRESHOLD = 300   # Dưới ngưỡng này = Đất KHÔ / Below this = DRY soil
WET_THRESHOLD = 700   # Trên ngưỡng này = Đất QUÁ ƯỚT / Above this = TOO WET

# ============================================================
# HÌNH ẢNH LED BIỂU CẢM / LED EXPRESSION IMAGES
# ============================================================

# Mặt buồn - Đất khô / Sad face - Dry soil
sad_face = Image(
    "09090:"
    "09090:"
    "00000:"
    "09990:"
    "90009"
)

# Mặt vui - Đất đủ ẩm / Happy face - Good moisture
happy_face = Image(
    "09090:"
    "09090:"
    "00000:"
    "90009:"
    "09990"
)

# Mặt bối rối/ướt - Đất quá ướt / Confused/wet face - Too wet
wet_face = Image(
    "09090:"
    "09090:"
    "00000:"
    "00900:"
    "09090"
)

# Hình giọt nước / Water drop icon
water_drop = Image(
    "00900:"
    "09990:"
    "99999:"
    "99999:"
    "09990"
)

# ============================================================
# HÀM ĐỌC CẢM BIẾN / SENSOR READING FUNCTION
# ============================================================

def read_soil_moisture():
    """
    Đọc giá trị analog từ cảm biến độ ẩm đất.
    Read analog value from soil moisture sensor.
    
    Trả về giá trị từ 0 (khô nhất) đến 1023 (ướt nhất).
    Returns value from 0 (driest) to 1023 (wettest).
    
    LƯU Ý QUAN TRỌNG / IMPORTANT NOTE:
    Tùy thuộc vào model cảm biến:
    - Một số model: 0 = ướt nhất, 1023 = khô nhất (đảo ngược)
    - Crowtail: thường 0 = khô nhất, 1023 = ướt nhất
    
    Depending on sensor model:
    - Some models: 0 = wettest, 1023 = driest (reversed)
    - Crowtail: usually 0 = driest, 1023 = wettest
    """
    # Đọc giá trị analog (0–1023) / Read analog value (0–1023)
    raw_value = SOIL_PIN.read_analog()
    return raw_value

def calculate_moisture_percent(raw_value):
    """
    Tính phần trăm độ ẩm từ giá trị analog thô.
    Calculate moisture percentage from raw analog value.
    
    raw_value: Giá trị thô 0–1023 / Raw value 0–1023
    Trả về / Returns: Phần trăm 0–100% / Percentage 0–100%
    """
    # Công thức / Formula: moisture% = (reading / 1023) × 100
    moisture_percent = (raw_value / 1023) * 100
    return int(moisture_percent)

# ============================================================
# HÀM BUZZER / BUZZER FUNCTIONS
# ============================================================

def buzz_once(duration_ms=500):
    """
    Kích hoạt buzzer một lần.
    Activate buzzer once.
    """
    BUZZ_PIN.write_digital(1)
    sleep(duration_ms)
    BUZZ_PIN.write_digital(0)

def watering_alert():
    """
    Chuỗi cảnh báo tưới nước: 3 tiếng beep ngắt quãng.
    Watering alert sequence: 3 interrupted beeps.
    """
    for i in range(3):
        BUZZ_PIN.write_digital(1)   # Bật buzzer / Turn on buzzer
        sleep(400)                   # Giữ 400ms / Hold 400ms
        BUZZ_PIN.write_digital(0)   # Tắt buzzer / Turn off buzzer
        sleep(200)                   # Nghỉ 200ms / Rest 200ms

def wet_warning():
    """
    Cảnh báo đất quá ướt: 1 tiếng beep ngắn.
    Too-wet warning: 1 short beep.
    """
    buzz_once(200)

def stop_buzzer():
    """
    Tắt buzzer.
    Turn off buzzer.
    """
    BUZZ_PIN.write_digital(0)

# ============================================================
# HOẠT ĐỘNG 1: CHẬU CÂY THÔNG MINH
# ACTIVITY 1: SMART PLANT POT
# ============================================================

def activity1_smart_plant_pot():
    """
    Hệ thống chậu cây thông minh:
    Smart plant pot system:
    
    - ĐẤT KHÔ (< 300): Mặt buồn + cảnh báo tưới
    - DRY SOIL (< 300): Sad face + watering alert
    
    - ĐẤT TỐT (300–700): Mặt vui + yên lặng
    - GOOD SOIL (300–700): Happy face + silent
    
    - ĐẤT ƯỚT (> 700): Mặt bối rối + cảnh báo nhẹ
    - WET SOIL (> 700): Confused face + light warning
    """
    
    # Hiển thị thông điệp chào / Show greeting message
    display.scroll("PLANT POT", delay=80)
    sleep(500)
    
    while True:
        # Đọc cảm biến / Read sensor
        soil_reading = read_soil_moisture()
        
        # Tính phần trăm / Calculate percentage
        moisture_pct = calculate_moisture_percent(soil_reading)
        
        # ═══ PHÂN LOẠI ĐỘ ẨM / CLASSIFY MOISTURE ═══
        
        if soil_reading < DRY_THRESHOLD:
            # ===== ĐẤT KHÔ / DRY SOIL =====
            # Hiển thị mặt buồn / Show sad face
            display.show(sad_face)
            sleep(1000)
            
            # Cuộn thông báo / Scroll message
            display.scroll("DRY! " + str(moisture_pct) + "%", delay=80)
            
            # Phát cảnh báo tưới / Trigger watering alert
            watering_alert()
            
        elif soil_reading <= WET_THRESHOLD:
            # ===== ĐẤT TỐT / GOOD SOIL =====
            # Hiển thị mặt vui / Show happy face
            display.show(happy_face)
            sleep(1500)
            
            # Cuộn phần trăm / Scroll percentage
            display.scroll("OK " + str(moisture_pct) + "%", delay=80)
            
            # Không buzzer / No buzzer
            stop_buzzer()
            
        else:
            # ===== ĐẤT QUÁ ƯỚT / TOO WET =====
            # Hiển thị mặt bối rối / Show confused face
            display.show(wet_face)
            sleep(1000)
            
            # Cuộn thông báo / Scroll message
            display.scroll("WET! " + str(moisture_pct) + "%", delay=80)
            
            # Cảnh báo nhẹ / Light warning
            wet_warning()
        
        # Nghỉ trước vòng lặp tiếp theo / Rest before next loop
        sleep(2000)

# ============================================================
# HOẠT ĐỘNG 2: HỆ THỐNG CẢNH BÁO TƯỚI NƯỚC
# ACTIVITY 2: WATERING ALERT SYSTEM
# ============================================================

def activity2_watering_alert_system():
    """
    Hệ thống cảnh báo tưới nước nâng cao.
    Advanced watering alert system.
    
    Tính năng bổ sung / Additional features:
    - Hiển thị biểu tượng giọt nước khi cần tưới
    - Show water drop icon when watering needed
    - Đếm số lần cảnh báo trong phiên làm việc
    - Count alerts in the session
    - Hiển thị xu hướng (tăng/giảm/ổn định)
    - Show trend (increasing/decreasing/stable)
    """
    
    display.scroll("WATERING SYS", delay=80)
    sleep(500)
    
    # Biến theo dõi / Tracking variables
    alert_count = 0       # Số lần cảnh báo / Alert count
    prev_reading = -1     # Giá trị lần trước / Previous reading
    
    while True:
        # Đọc cảm biến / Read sensor
        soil_reading = read_soil_moisture()
        moisture_pct = calculate_moisture_percent(soil_reading)
        
        # Tính xu hướng / Calculate trend
        if prev_reading != -1:
            trend = soil_reading - prev_reading
            if trend > 20:
                trend_symbol = "^"    # Tăng / Increasing (ẩm hơn / wetter)
            elif trend < -20:
                trend_symbol = "v"    # Giảm / Decreasing (khô hơn / drier)
            else:
                trend_symbol = "="    # Ổn định / Stable
        else:
            trend_symbol = "?"
        
        prev_reading = soil_reading
        
        # ═══ PHẢN HỒI THEO ĐỘ ẨM / RESPOND TO MOISTURE ═══
        
        if soil_reading < DRY_THRESHOLD:
            # ===== CẦN TƯỚI / NEEDS WATERING =====
            alert_count += 1
            
            # Hiển thị biểu tượng giọt nước khẩn cấp
            # Show urgent water drop icon
            for blink in range(3):
                display.show(water_drop)
                sleep(300)
                display.clear()
                sleep(200)
            
            # Phát cảnh báo tưới
            # Trigger watering alert
            watering_alert()
            
            # Cuộn thông báo chi tiết
            # Scroll detailed message
            display.scroll(
                "WATER! " + str(moisture_pct) + "% [" + trend_symbol + "]",
                delay=80
            )
            
        elif soil_reading > WET_THRESHOLD:
            # ===== QUÁ ƯỚT / TOO WET =====
            display.show(wet_face)
            wet_warning()
            sleep(500)
            display.scroll(
                "STOP! " + str(moisture_pct) + "% [" + trend_symbol + "]",
                delay=80
            )
            
        else:
            # ===== ĐỘ ẨM TỐT / GOOD MOISTURE =====
            display.show(happy_face)
            stop_buzzer()
            sleep(800)
            display.scroll(
                "OK " + str(moisture_pct) + "% [" + trend_symbol + "]",
                delay=80
            )
        
        sleep(3000)  # Đợi 3 giây trước khi đọc lại / Wait 3 seconds before re-reading

# ============================================================
# CHƯƠNG TRÌNH CHÍNH / MAIN PROGRAM
# ============================================================

# Chọn hoạt động / Choose activity:
# Bỏ chú thích dòng muốn chạy / Uncomment the line you want to run

# activity1_smart_plant_pot()       # Hoạt động 1 / Activity 1
activity2_watering_alert_system()   # Hoạt động 2 / Activity 2 (mặc định / default)
```

---

## 8. Hoạt Động 1: Chậu Cây Thông Minh / Activity 1: Smart Plant Pot

### Mục tiêu / *Objective:*
Xây dựng hệ thống theo dõi độ ẩm đất và hiển thị cảm xúc thông qua biểu tượng trên màn hình LED micro:bit.  
*Build a soil moisture monitoring system that displays emotions through icons on the micro:bit LED display.*

### Các bước thực hiện / *Steps:*

**Bước 1 – Chuẩn bị phần cứng / Step 1 – Hardware Preparation:**
- Gắn micro:bit vào bo mạch Crowtail / *Insert micro:bit into Crowtail breakout board*
- Cắm cảm biến độ ẩm đất vào cổng P0 / *Connect soil moisture sensor to P0 port*
- Cắm buzzer vào cổng P1 / *Connect buzzer to P1 port*
- Đổ đất vào chậu, cắm hai đầu dò cảm biến vào đất / *Fill pot with soil, insert sensor probes into soil*

**Bước 2 – Lập trình / Step 2 – Programming:**
- Mở MakeCode hoặc dùng MicroPython / *Open MakeCode or use MicroPython*
- Nhập code Hoạt động 1 / *Enter Activity 1 code*
- Nạp code vào micro:bit và khởi động / *Flash code to micro:bit and start*

**Bước 3 – Thử nghiệm / Step 3 – Testing:**
- Bắt đầu với đất khô → quan sát mặt buồn / *Start with dry soil → observe sad face*
- Từ từ tưới nước vào đất → quan sát sự thay đổi / *Slowly water the soil → observe changes*
- Tưới quá nhiều → quan sát mặt bối rối / *Overwater → observe confused face*

**Bảng ghi kết quả / Results Table:**

| Trạng thái đất / *Soil State* | Giá trị đọc / *Reading* | Độ ẩm (%) / *Moisture (%)* | Biểu tượng / *Icon* | Buzzer |
|---|---|---|---|---|
| Đất khô / Dry soil | ___ | ___% | 😢 | Có / Yes |
| Đất vừa phải / Medium | ___ | ___% | 😊 | Không / No |
| Đất ướt / Wet soil | ___ | ___% | 😕 | 1 beep |

**Câu hỏi quan sát / Observation questions:**
1. Giá trị đọc thay đổi ngay lập tức khi tưới nước không? / *Does the reading change immediately when you water?*
2. Sau khi tưới, bao lâu thì giá trị ổn định? / *After watering, how long until the value stabilizes?*
3. Nếu rút cảm biến ra khỏi đất, giá trị là bao nhiêu? / *If you remove the sensor from soil, what is the value?*

---

## 9. Hoạt Động 2: Hệ Thống Cảnh Báo Tưới Nước / Activity 2: Watering Alert System

### Mục tiêu / *Objective:*
Xây dựng hệ thống cảnh báo tự động với buzzer theo mẫu âm thanh khác nhau cho từng trạng thái.  
*Build an automatic alert system with buzzer using different sound patterns for each state.*

### Mẫu âm thanh buzzer / *Buzzer Sound Patterns:*

```
ĐẤT KHÔ / DRY SOIL (cần tưới / needs watering):
  ─────────┐       ┌────────┐       ┌────────┐
  BUZZ     │       │        │       │        │
  ─────────┘       └────────┘       └────────┘
  (400ms ON, 200ms OFF) × 3 lần / times

ĐẤT QUÁ ƯỚT / TOO WET (ngừng tưới / stop watering):
  ─────┐
  BUZZ │
  ─────┘
  (200ms ON) × 1 lần / time

ĐỘ ẨM TỐT / GOOD MOISTURE:
  (Im lặng / Silence)
```

### Thử nghiệm nâng cao / *Advanced Testing:*

**Thí nghiệm 1 / Experiment 1:** Đặt cảm biến trong không khí (không cắm vào đất). Giá trị là bao nhiêu?  
*Place the sensor in air (not in soil). What is the value?*

**Thí nghiệm 2 / Experiment 2:** Đặt cảm biến vào ly nước. Giá trị là bao nhiêu?  
*Place the sensor in a glass of water. What is the value?*

**Thí nghiệm 3 / Experiment 3:** So sánh các loại đất:  
*Compare different soil types:*

| Loại đất / *Soil Type* | Ẩm như nhau / *Same moisture* | Giá trị đọc / *Reading* |
|---|---|---|
| Đất trồng cây / *Potting soil* | 50% ướt / *50% wet* | ___ |
| Cát / *Sand* | 50% ướt / *50% wet* | ___ |
| Đất sét / *Clay* | 50% ướt / *50% wet* | ___ |

**Câu hỏi phân tích / Analysis questions:**
1. Tại sao các loại đất khác nhau cho giá trị đọc khác nhau dù cùng độ ẩm? / *Why do different soil types give different readings with the same moisture level?*
2. Loại đất nào cần điều chỉnh ngưỡng DRY_THRESHOLD cao hơn? Tại sao? / *Which soil type needs a higher DRY_THRESHOLD? Why?*

---

## 10. Quy Trình Hiệu Chỉnh Cảm Biến / Calibration Procedure

### Tại sao cần hiệu chỉnh? / *Why calibrate?*

Mỗi loại đất, mỗi cảm biến, và thậm chí mỗi điều kiện nhiệt độ có thể cho kết quả khác nhau. Hiệu chỉnh giúp cảm biến hoạt động chính xác với điều kiện thực tế của bạn.  
*Each soil type, sensor, and even temperature condition can give different results. Calibration makes the sensor work accurately for your specific conditions.*

### Các bước hiệu chỉnh / *Calibration Steps:*

**Bước 1 – Xác định giá trị KHÔ / Step 1 – Determine DRY value:**
```python
# Để cảm biến trong không khí (không cắm vào đất)
# Leave sensor in air (not in soil)
# Ghi lại giá trị đọc được
# Record the reading

dry_in_air = read_soil_moisture()
print("Giá trị không khí / Air value:", dry_in_air)
# Thường là / Usually: 850–1023
```

**Bước 2 – Xác định giá trị ƯỚT / Step 2 – Determine WET value:**
```python
# Ngâm đầu dò vào ly nước sạch
# Submerge probe tips in clean water
# Ghi lại giá trị đọc được
# Record the reading

wet_in_water = read_soil_moisture()
print("Giá trị trong nước / Water value:", wet_in_water)
# Thường là / Usually: 0–200
```

**Bước 3 – Tính ngưỡng thực tế / Step 3 – Calculate real thresholds:**
```python
# Ví dụ / Example:
# dry_in_air = 950
# wet_in_water = 100

# Tính khoảng giá trị / Calculate range
total_range = dry_in_air - wet_in_water  # 950 - 100 = 850

# Ngưỡng 30% (khô) / 30% threshold (dry)
calibrated_dry = wet_in_water + (total_range * 0.30)   # 100 + 255 = 355

# Ngưỡng 70% (ướt) / 70% threshold (wet)
calibrated_wet = wet_in_water + (total_range * 0.70)   # 100 + 595 = 695

print("Ngưỡng khô / Dry threshold:", int(calibrated_dry))
print("Ngưỡng ướt / Wet threshold:", int(calibrated_wet))
```

**Bước 4 – Cập nhật code / Step 4 – Update code:**
```python
# Thay thế các giá trị mặc định bằng giá trị đã hiệu chỉnh
# Replace default values with calibrated values
DRY_THRESHOLD = 355   # Giá trị từ bước 3 / Value from step 3
WET_THRESHOLD = 695   # Giá trị từ bước 3 / Value from step 3
```

**Bước 5 – Kiểm tra / Step 5 – Verify:**
- Cắm cảm biến vào đất khô → phải hiển thị mặt buồn / *Insert into dry soil → must show sad face*
- Tưới nước từ từ → quan sát chuyển trạng thái / *Water slowly → observe state transitions*
- Ngâm vào nước → phải hiển thị mặt bối rối / *Submerge in water → must show confused face*

### Bảng ghi kết quả hiệu chỉnh / *Calibration Record Table:*

| Thời điểm / *Time* | Giá trị không khí / *Air value* | Giá trị trong nước / *Water value* | Ngưỡng khô / *Dry threshold* | Ngưỡng ướt / *Wet threshold* |
|---|---|---|---|---|
| Ngày 1 / Day 1 | ___ | ___ | ___ | ___ |
| Ngày 7 / Day 7 | ___ | ___ | ___ | ___ |
| Ngày 30 / Day 30 | ___ | ___ | ___ | ___ |

> **Quan sát / Observe:** Theo thời gian, do điện phân (electrolysis), các đầu dò kim loại bị ăn mòn và giá trị có thể thay đổi. Đây là lý do nên hiệu chỉnh lại định kỳ!  
> *Over time, due to electrolysis, the metal probes corrode and values may shift. This is why periodic recalibration is important!*

---

## 11. Ghi Chú An Toàn / Safety Notes

> **⚠️ AN TOÀN KHI LÀM VIỆC VỚI ĐẤT VÀ NƯỚC / SAFETY WITH SOIL AND WATER**
>
> - Rửa tay sau khi tiếp xúc với đất / *Wash hands after handling soil*
> - Không để nước chảy lên bo mạch micro:bit hoặc dây điện / *Do not let water drip onto the micro:bit board or wires*
> - Chỉ nhúng phần đầu dò kim loại vào đất/nước – không nhúng phần bảng mạch PCB / *Only submerge the metal probe tips – not the PCB board*
> - Lau khô tay trước khi chạm vào bo mạch / *Dry hands before touching the circuit board*

> **⚠️ AN TOÀN ĐIỆN / ELECTRICAL SAFETY**
>
> - Tắt nguồn trước khi thay đổi kết nối dây / *Power off before changing wire connections*
> - Kiểm tra cực đúng của dây kết nối trước khi cấp điện / *Check wire polarity before powering on*
> - Không để cảm biến tiếp xúc trực tiếp với nguồn điện mạnh / *Do not expose the sensor to high voltage*
> - Không kết nối nhiều thiết bị tiêu thụ điện cao đồng thời / *Do not connect multiple high-power devices simultaneously*

> **⚠️ AN TOÀN CẢM BIẾN / SENSOR SAFETY**
>
> - Đầu dò kim loại sau khi dùng lâu sẽ bị oxy hóa – lau sạch sau mỗi buổi học / *Metal probes oxidize over time – wipe clean after each session*
> - Không cắm cảm biến vào đất có phân bón hoặc hóa chất mạnh / *Do not insert sensor into soil with strong fertilizers or chemicals*
> - Cảm biến điện trở không nên để cắm trong đất liên tục nhiều giờ (gây ăn mòn nhanh) / *Resistive sensors should not stay in soil for extended hours (causes faster corrosion)*

---

## 12. Câu Hỏi Thảo Luận / Discussion Questions

**Câu 1:** Tại sao nước lại dẫn điện? Vai trò của các ion khoáng trong đất là gì?  
*Question 1: Why does water conduct electricity? What is the role of mineral ions in soil?*

**Câu 2:** Cảm biến điện dung (capacitive sensor) khác gì với cảm biến điện trở (resistive sensor)? Cái nào tốt hơn và tại sao?  
*Question 2: How is a capacitive sensor different from a resistive sensor? Which is better and why?*

**Câu 3:** Nếu bạn muốn xây dựng hệ thống tưới tự động cho 10 chậu cây khác nhau, bạn cần bao nhiêu cảm biến và cần thêm những thiết bị gì?  
*Question 3: If you want to build an automated watering system for 10 different plant pots, how many sensors do you need and what additional devices are required?*

**Câu 4:** Vào mùa hè nắng nóng, đất khô nhanh hơn. Làm thế nào bạn có thể lập trình để hệ thống tự động điều chỉnh tần suất kiểm tra độ ẩm theo nhiệt độ?  
*Question 4: In hot summer, soil dries faster. How could you program the system to automatically adjust the moisture-checking frequency based on temperature?*

**Câu 5:** Hệ thống tưới thông minh trong nông nghiệp hiện đại sử dụng dữ liệu nào ngoài độ ẩm đất? Kể ít nhất 3 yếu tố và giải thích tầm quan trọng của chúng.  
*Question 5: Modern smart irrigation systems use what data besides soil moisture? Name at least 3 factors and explain their importance.*

---

## 13. Bảng Đánh Giá / Assessment Rubric

| Tiêu chí / *Criteria* | Xuất sắc (4) / *Excellent (4)* | Tốt (3) / *Good (3)* | Đạt (2) / *Satisfactory (2)* | Cần cải thiện (1) / *Needs Improvement (1)* |
|---|---|---|---|---|
| **Hiểu lý thuyết** / *Theory Understanding* | Giải thích được nguyên lý điện trở, tại sao nước dẫn điện, thang đo 0–1023, và ảnh hưởng của đất khô/ướt với cây / *Explains resistive principle, why water conducts, 0–1023 scale, and effects of dry/wet soil on plants* | Hiểu được hầu hết lý thuyết, còn thiếu 1–2 khái niệm / *Understands most theory, missing 1-2 concepts* | Hiểu cơ bản, cần gợi ý về nguyên lý điện trở / *Basic understanding, needs prompting about resistive principle* | Chưa hiểu cách cảm biến hoạt động / *Does not understand how the sensor works* |
| **Kỹ năng lập trình** / *Programming Skills* | Code chạy tốt cả 2 hoạt động, có xử lý ngoại lệ, mã chú thích đầy đủ / *Code runs well for both activities, handles exceptions, fully commented* | Code chạy tốt với lỗi nhỏ, có chú thích cơ bản / *Code runs well with minor errors, basic comments* | Code chạy được 1 hoạt động, thiếu xử lý lỗi / *Code runs 1 activity, lacks error handling* | Code không chạy được / *Code does not run* |
| **Thực hành hiệu chỉnh** / *Calibration Practice* | Thực hiện đầy đủ 5 bước hiệu chỉnh, ghi chép đầy đủ, kết quả chính xác / *Completes all 5 calibration steps, full documentation, accurate results* | Thực hiện 3–4 bước hiệu chỉnh, ghi chép chưa đầy đủ / *Completes 3-4 calibration steps, incomplete documentation* | Hiệu chỉnh được một phần, cần hỗ trợ / *Partial calibration, needs assistance* | Không thực hiện hiệu chỉnh / *Did not calibrate* |
| **Phân tích & Sáng tạo** / *Analysis & Creativity* | Trả lời tốt các câu hỏi thảo luận, đề xuất thêm ít nhất 1 tính năng sáng tạo / *Answers discussion questions well, proposes at least 1 creative feature* | Trả lời được 3–4 câu hỏi, không đề xuất thêm / *Answers 3-4 questions, no additional proposals* | Trả lời 1–2 câu hỏi với gợi ý của giáo viên / *Answers 1-2 questions with teacher prompting* | Không trả lời được câu hỏi nào / *Cannot answer any questions* |

**Thang điểm / *Scoring:*** 13–16: Xuất sắc / *Excellent* | 9–12: Tốt / *Good* | 5–8: Đạt / *Satisfactory* | 4: Cần cải thiện / *Needs Improvement*

---

## 14. Thám Hiểm Thêm / Further Exploration & Challenge

### Thử thách cơ bản / *Basic Challenge:*
Thêm chức năng hiển thị phần trăm độ ẩm (%) trên màn hình LED thay vì chỉ hiển thị mặt cảm xúc. Hướng dẫn: Cuộn chữ "45%" thay vì chỉ hiển thị icon.  
*Add a function to display the moisture percentage (%) on the LED screen instead of just showing an emotion face. Hint: Scroll "45%" instead of just showing an icon.*

### Thử thách trung cấp / *Intermediate Challenge:*
Kết hợp **cảm biến nhiệt độ tích hợp** của micro:bit với cảm biến độ ẩm đất để tạo "Chỉ số Comfort Cây Trồng":  
*Combine the micro:bit's built-in temperature sensor with the soil moisture sensor to create a "Plant Comfort Index":*

```python
# Gợi ý / Hint:
temperature = temperature()  # Đọc nhiệt độ / Read temperature
moisture = read_soil_moisture()
# Nếu nhiệt độ > 30°C VÀ độ ẩm < 300 → NGUY HIỂM ĐỎ
# If temperature > 30°C AND moisture < 300 → RED DANGER
# If temperature < 25°C AND moisture 300-700 → GREEN PERFECT
```

### Thử thách nâng cao / *Advanced Challenge:*
Xây dựng **hệ thống tưới tự động** thực sự bằng cách thêm một relay module hoặc transistor để điều khiển bơm nước mini. Khi đất quá khô, hệ thống tự động bật bơm trong 5 giây rồi tắt.  
*Build a real automatic watering system by adding a relay module or transistor to control a mini water pump. When soil is too dry, the system automatically turns on the pump for 5 seconds then turns it off.*

### Dự án mở rộng / *Extension Project:*
Nghiên cứu về **IoT Agriculture (Nông nghiệp kết nối Internet)**: Làm thế nào các nông trại hiện đại sử dụng mạng lưới hàng nghìn cảm biến để quản lý nước tưới? Tìm hiểu về hệ thống **Drip Irrigation (tưới nhỏ giọt)** và cách kết hợp với IoT.  
*Research IoT Agriculture: How do modern farms use networks of thousands of sensors to manage irrigation? Learn about Drip Irrigation systems and how they integrate with IoT.*

---

## 15. Từ Vựng / Vocabulary List

| Thuật ngữ / *Term* | Định nghĩa tiếng Việt | *English Definition* |
|---|---|---|
| **Độ ẩm đất** / *Soil moisture* | Lượng nước có trong đất, biểu thị bằng % | *Amount of water in soil, expressed as %* |
| **Cảm biến điện trở** / *Resistive sensor* | Cảm biến đo độ dẫn điện của đất qua điện trở | *Sensor measuring soil conductivity through resistance* |
| **Điện trở** / *Resistance* | Khả năng cản trở dòng điện của vật liệu, đơn vị Ohm (Ω) | *Material's opposition to current flow, unit: Ohm (Ω)* |
| **Tín hiệu analog** / *Analog signal* | Tín hiệu liên tục thay đổi mượt mà (khác với tín hiệu số 0/1) | *Continuously varying signal (unlike digital 0/1)* |
| **ADC (Analog-to-Digital Converter)** | Bộ chuyển đổi tín hiệu analog thành số nguyên 0–1023 | *Converts analog signal to integer value 0–1023* |
| **Thối rễ** / *Root rot* | Bệnh do đất quá ướt, rễ thiếu oxy và bị nấm tấn công | *Disease from oversaturated soil; roots lack oxygen and are attacked by fungi* |
| **Hiệu chỉnh (Calibration)** | Quy trình điều chỉnh thiết bị để đo chính xác với điều kiện thực tế | *Process of adjusting a device for accurate measurement in real conditions* |
| **Điện phân** / *Electrolysis* | Phản ứng hóa học do dòng điện, gây ăn mòn kim loại theo thời gian | *Chemical reaction caused by electric current, corroding metal over time* |
| **Cảm biến điện dung** / *Capacitive sensor* | Loại cảm biến đo độ ẩm đất qua sự thay đổi điện dung, không bị ăn mòn | *Soil moisture sensor using capacitance changes, not subject to corrosion* |
| **Ngưỡng (Threshold)** | Giá trị ranh giới để phân loại trạng thái (khô/ẩm/ướt) | *Boundary value for classifying states (dry/moist/wet)* |
| **IoT Agriculture** | Nông nghiệp ứng dụng Internet vạn vật, dùng cảm biến kết nối mạng | *Agriculture using Internet of Things – networked sensors for farming* |
| **Tưới nhỏ giọt** / *Drip irrigation* | Phương pháp tưới cây tiết kiệm nước, cấp nước trực tiếp vào rễ | *Water-saving irrigation method delivering water directly to roots* |

---

*© Elecrow Crowtail STEAM Edu Kit Curriculum – Bài 16 / Lesson 16*  
*Được thiết kế cho học sinh lớp 6–12 / Designed for students grades 6–12*
