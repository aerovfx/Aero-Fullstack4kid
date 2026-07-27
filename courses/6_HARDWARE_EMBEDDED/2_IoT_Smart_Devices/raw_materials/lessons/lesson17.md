# Bài 17: Nhiệt độ micro:bit — Nhiệt kế Điện tử
# Lesson 17: micro:bit Temperature Sensor — Digital Thermometer

**Bộ kit:** Elecrow Crowtail STEAM Edu Kit | **Kit:** Elecrow Crowtail STEAM Edu Kit  
**Lớp:** 6–12 | **Grade:** 6–12  
**Thời lượng:** 90 phút | **Duration:** 90 minutes  
**Ngày:** __________ | **Date:** __________

---

## 🎯 Mục tiêu Học tập / Learning Objectives

Sau bài học này, học sinh sẽ có thể:  
*After this lesson, students will be able to:*

1. **Giải thích** khái niệm nhiệt độ và ba thang đo: Celsius, Fahrenheit, Kelvin.  
   *Explain the concept of temperature and three measurement scales: Celsius, Fahrenheit, Kelvin.*

2. **Áp dụng** công thức chuyển đổi giữa các thang đo nhiệt độ.  
   *Apply conversion formulas between temperature scales.*

3. **Mô tả** cách cảm biến nhiệt độ tích hợp trong micro:bit hoạt động.  
   *Describe how the micro:bit built-in temperature sensor works.*

4. **Lập trình** micro:bit để hiển thị nhiệt độ bằng MakeCode và MicroPython.  
   *Program the micro:bit to display temperature using MakeCode and MicroPython.*

5. **Xây dựng** một nhiệt kế điện tử có cảnh báo âm thanh khi nhiệt độ vượt ngưỡng.  
   *Build a digital thermometer with a sound alert when temperature exceeds a threshold.*

6. **Hiệu chỉnh** cảm biến để đo nhiệt độ môi trường chính xác hơn.  
   *Calibrate the sensor to measure ambient temperature more accurately.*

---

## 📚 Lý thuyết / Theory

### 1. Nhiệt độ là gì? / What is Temperature?

**Tiếng Việt:**  
Nhiệt độ là đại lượng vật lý đo mức độ nóng hay lạnh của một vật. Về mặt vi mô, nhiệt độ liên quan trực tiếp đến **động năng trung bình** của các phân tử cấu tạo nên vật đó. Khi nhiệt độ tăng, các phân tử dao động và chuyển động nhanh hơn — chúng va chạm nhiều hơn và mạnh hơn. Khi nhiệt độ giảm, chuyển động phân tử chậm lại. Ở nhiệt độ tuyệt đối không (0 K = −273,15 °C), lý thuyết cho rằng mọi chuyển động phân tử dừng lại hoàn toàn.

*Temperature is a physical quantity that measures how hot or cold an object is. At the microscopic level, temperature is directly related to the **average kinetic energy** of the molecules making up that object. When temperature rises, molecules vibrate and move faster — they collide more frequently and with greater force. When temperature drops, molecular motion slows. At absolute zero (0 K = −273.15 °C), all molecular motion theoretically ceases.*

### 2. Các Thang Đo Nhiệt Độ / Temperature Scales

| Thang đo / Scale | Ký hiệu / Symbol | Điểm đóng băng nước / Water Freezing | Điểm sôi nước / Water Boiling | Ghi chú / Note |
|---|---|---|---|---|
| Celsius | °C | 0 °C | 100 °C | Dùng phổ biến toàn cầu / Used worldwide |
| Fahrenheit | °F | 32 °F | 212 °F | Dùng chủ yếu tại Mỹ / Used mainly in the USA |
| Kelvin | K | 273.15 K | 373.15 K | Thang đo khoa học / Scientific scale |

**Thang Celsius (°C):**  
Được đề xuất bởi Anders Celsius năm 1742. Chia khoảng giữa điểm đóng băng và sôi của nước thành 100 bậc bằng nhau. Được sử dụng rộng rãi nhất trên thế giới trong đời sống hàng ngày và khoa học.  
*Proposed by Anders Celsius in 1742. Divides the range between the freezing and boiling points of water into 100 equal steps. The most widely used scale in everyday life and science worldwide.*

**Thang Fahrenheit (°F):**  
Được đề xuất bởi Daniel Gabriel Fahrenheit năm 1724. Chủ yếu sử dụng ở Hoa Kỳ và một số ít quốc gia. Nhiệt độ cơ thể người bình thường là 98.6 °F (37 °C).  
*Proposed by Daniel Gabriel Fahrenheit in 1724. Mainly used in the United States and a few other countries. Normal human body temperature is 98.6 °F (37 °C).*

**Thang Kelvin (K):**  
Thang đo nhiệt động lực học tuyệt đối, không có nhiệt độ âm. Được sử dụng trong vật lý, hóa học và thiên văn học. 0 K là điểm không tuyệt đối — nhiệt độ thấp nhất có thể tồn tại trong vũ trụ.  
*The absolute thermodynamic temperature scale, with no negative temperatures. Used in physics, chemistry, and astronomy. 0 K is absolute zero — the lowest temperature possible in the universe.*

### 3. Công thức Chuyển đổi / Conversion Formulas

```
Celsius → Fahrenheit:   F = (C × 9/5) + 32
Fahrenheit → Celsius:   C = (F − 32) × 5/9
Celsius → Kelvin:       K = C + 273.15
Kelvin → Celsius:       C = K − 273.15
```

**Ví dụ / Example:**  
- 0 °C = (0 × 9/5) + 32 = **32 °F** = 0 + 273.15 = **273.15 K**  
- 100 °C = (100 × 9/5) + 32 = **212 °F** = 100 + 273.15 = **373.15 K**  
- 37 °C (nhiệt độ cơ thể / body temp) = (37 × 9/5) + 32 = 66.6 + 32 = **98.6 °F** = **310.15 K**

### 4. Cảm biến Nhiệt độ Tích hợp trong micro:bit / micro:bit Built-in Temperature Sensor

**Tiếng Việt:**  
micro:bit **không có** cảm biến nhiệt độ riêng biệt dành cho môi trường xung quanh. Thay vào đó, nó đo nhiệt độ của **chip vi xử lý Nordic nRF51822** (phiên bản V1) hoặc **Nordic nRF52833** (phiên bản V2) bằng cảm biến nhiệt độ tích hợp bên trong chip đó. Cảm biến này đo nhiệt độ của bản thân chip, không phải nhiệt độ không khí xung quanh.

**Hệ quả thực tế:** Vì chip tỏa nhiệt khi hoạt động, nhiệt độ đọc từ micro:bit thường **cao hơn nhiệt độ môi trường khoảng 3–8 °C**. Để có số đọc gần đúng với nhiệt độ phòng, người dùng cần **hiệu chỉnh (calibrate)** bằng cách trừ đi một giá trị bù (offset).

*The micro:bit does **not** have a dedicated ambient temperature sensor. Instead, it measures the temperature of the **Nordic nRF51822 processor chip** (V1) or **Nordic nRF52833** (V2) using the built-in temperature sensor inside that chip. This sensor measures the chip's own temperature, not the surrounding air.*

*Practical consequence: Since the chip generates heat during operation, the temperature read from the micro:bit is typically **3–8 °C higher than the ambient temperature**. To get a reading closer to room temperature, users need to **calibrate** by subtracting an offset value.*

### 5. Thermistor là gì? / What is a Thermistor?

**Tiếng Việt:**  
Thermistor (Thermal Resistor — Điện trở Nhiệt) là một loại điện trở có giá trị thay đổi theo nhiệt độ. Có hai loại chính:

- **NTC (Negative Temperature Coefficient — Hệ số Nhiệt độ Âm):** Khi nhiệt độ **tăng**, điện trở **giảm**. Đây là loại phổ biến nhất, dùng trong nhiệt kế số, máy điều hòa, tủ lạnh.
- **PTC (Positive Temperature Coefficient — Hệ số Nhiệt độ Dương):** Khi nhiệt độ **tăng**, điện trở **tăng**. Dùng trong các mạch bảo vệ quá nhiệt.

*A thermistor (Thermal Resistor) is a type of resistor whose value changes with temperature. There are two main types:*

*- **NTC (Negative Temperature Coefficient):** As temperature **increases**, resistance **decreases**. Most common type, used in digital thermometers, air conditioners, refrigerators.*
*- **PTC (Positive Temperature Coefficient):** As temperature **increases**, resistance **increases**. Used in over-temperature protection circuits.*

### 6. Hiệu chỉnh Cảm biến / Sensor Calibration

**Tiếng Việt:**  
Để hiệu chỉnh cảm biến nhiệt độ micro:bit:

1. Đặt một nhiệt kế thủy ngân hoặc nhiệt kế kỹ thuật số đã được kiểm định cạnh micro:bit.
2. Chờ 5–10 phút để nhiệt độ ổn định.
3. Ghi lại nhiệt độ thực tế (T_thực) và nhiệt độ đọc từ micro:bit (T_đọc).
4. Tính offset = T_đọc − T_thực.
5. Trong chương trình: nhiệt độ hiệu chỉnh = T_đọc − offset.

*To calibrate the micro:bit temperature sensor:*
1. *Place a calibrated mercury or digital thermometer next to the micro:bit.*
2. *Wait 5–10 minutes for temperature to stabilize.*
3. *Record the actual temperature (T_actual) and micro:bit reading (T_read).*
4. *Calculate offset = T_read − T_actual.*
5. *In the program: calibrated temperature = T_read − offset.*

### 7. Ứng dụng Thực tế / Real-World Applications

| Lĩnh vực / Field | Ứng dụng / Application |
|---|---|
| 🌤️ Khí tượng / Meteorology | Trạm thời tiết, dự báo nhiệt độ / Weather stations, temperature forecasting |
| 🏠 HVAC | Điều hòa không khí, lò sưởi tự động / Smart air conditioning, automatic heating |
| 🏥 Y tế / Medical | Nhiệt kế hồng ngoại, theo dõi bệnh nhân / Infrared thermometers, patient monitoring |
| 🏭 Công nghiệp / Industry | Kiểm soát lò nung, bảo vệ động cơ / Furnace control, motor protection |
| 🌿 Nông nghiệp / Agriculture | Nhà kính thông minh, bảo quản thực phẩm / Smart greenhouses, food storage |
| 🚗 Ô tô / Automotive | Cảm biến nhiệt độ động cơ, điều hòa tự động / Engine temp sensor, auto A/C |

---

## 📐 Công thức Quan trọng / Key Formulas

```
┌─────────────────────────────────────────────────────────┐
│  CÔNG THỨC NHIỆT ĐỘ / TEMPERATURE FORMULAS             │
├─────────────────────────────────────────────────────────┤
│  Celsius → Fahrenheit:  F = (C × 9/5) + 32             │
│  Celsius → Kelvin:      K = C + 273.15                  │
│  Fahrenheit → Celsius:  C = (F − 32) × 5/9             │
│  Kelvin → Celsius:      C = K − 273.15                  │
│  Hiệu chỉnh / Calibrated: T_cal = T_raw − offset       │
└─────────────────────────────────────────────────────────┘
```

**Ví dụ minh họa / Worked Example:**
- Nhiệt độ micro:bit đọc: 32 °C / micro:bit reads: 32 °C
- Nhiệt kế thực: 27 °C / Actual thermometer: 27 °C
- Offset = 32 − 27 = **5 °C**
- Nhiệt độ hiệu chỉnh = 32 − 5 = **27 °C** ✓

---

## 🧰 Linh kiện Cần thiết / Components Needed

| # | Linh kiện (Tiếng Việt) | Component (English) | Số lượng / Qty |
|---|---|---|---|
| 1 | Bo mạch micro:bit (V1 hoặc V2) | micro:bit board (V1 or V2) | 1 |
| 2 | Dây cáp micro USB | micro USB cable | 1 |
| 3 | Còi điện (Buzzer) Crowtail — cổng P0 | Crowtail Buzzer — port P0 | 1 |
| 4 | Dây kết nối Crowtail (4 chân) | Crowtail connector cable (4-pin) | 1 |
| 5 | Nguồn pin AA (3V) hoặc cáp USB | AA battery pack (3V) or USB | 1 |
| 6 | Máy tính / Tablet | Computer / Tablet | 1 |
| 7 | Nhiệt kế thực để hiệu chỉnh (tùy chọn) | Reference thermometer for calibration (optional) | 1 |

> **Lưu ý:** Cảm biến nhiệt độ đã tích hợp sẵn trong micro:bit — không cần mua thêm module cảm biến nhiệt độ.  
> *Note: The temperature sensor is already built into the micro:bit — no additional temperature sensor module is needed.*

---

## 🔌 Kết nối Mạch / Wiring & Connections

### Cảm biến Nhiệt độ Tích hợp / Built-in Temperature Sensor

Cảm biến nhiệt độ trong micro:bit là tích hợp sẵn trong chip — **không cần kết nối thêm**.  
*The temperature sensor in the micro:bit is integrated into the chip — **no additional wiring is needed**.*

### Còi Buzzer (Cảnh báo Nhiệt độ) / Buzzer (Temperature Alert)

```
micro:bit Edge Connector   →   Crowtail Buzzer
──────────────────────────────────────────────
       GND (0V)            →   GND  (dây đen / black wire)
       3.3V                →   VCC  (dây đỏ / red wire)
        P0                 →   SIG  (dây vàng / yellow wire)
       P14                 →   NC   (không dùng / not used)
```

**Cách kết nối / Connection Steps:**
1. Cắm đầu cắm Crowtail vào cổng **P0** trên bo mạch mở rộng Crowtail.  
   *Plug the Crowtail connector into the **P0** port on the Crowtail breakout board.*
2. Cắm đầu còn lại vào module Còi Buzzer Crowtail.  
   *Plug the other end into the Crowtail Buzzer module.*
3. Kết nối micro:bit với máy tính qua cáp USB.  
   *Connect the micro:bit to the computer via USB cable.*

---

## 🧩 Mô tả Khối MakeCode / MakeCode Block Description

### Hoạt động 1: Nhiệt kế Cơ bản / Activity 1: Basic Thermometer

**Bước 1 — Khối "on start" (Khi bắt đầu):**
- Hiển thị biểu tượng trái tim để báo hiệu chương trình bắt đầu.  
  *Show a heart icon to signal the program has started.*
- Đặt biến `offset` = 5 (giá trị hiệu chỉnh mặc định).  
  *Set variable `offset` = 5 (default calibration value).*

**Bước 2 — Khối "forever" (Mãi mãi):**
- Đọc giá trị từ khối `temperature (°C)` → lưu vào biến `temp_c`.  
  *Read value from `temperature (°C)` block → store in variable `temp_c`.*
- Tính `temp_c` = `temp_c` − `offset` (hiệu chỉnh).  
  *Calculate `temp_c` = `temp_c` − `offset` (calibration).*
- Hiển thị chuỗi "C:" + `temp_c` lên màn hình LED.  
  *Show string "C:" + `temp_c` on LED display.*
- Tạm dừng 2000ms.  
  *Pause 2000ms.*
- Tính `temp_f` = (`temp_c` × 9 / 5) + 32.  
  *Calculate `temp_f` = (`temp_c` × 9 / 5) + 32.*
- Hiển thị chuỗi "F:" + `temp_f`.  
  *Show string "F:" + `temp_f`.*
- Tạm dừng 2000ms.  
  *Pause 2000ms.*

**Bước 3 — Nút A (Button A pressed):**
- Hiển thị nhiệt độ Kelvin: K = `temp_c` + 273  
  *Display Kelvin temperature: K = `temp_c` + 273*

**Bước 4 — Nút B (Button B pressed):**
- Tăng `offset` thêm 1 để tăng giá trị hiệu chỉnh.  
  *Increase `offset` by 1 to adjust calibration.*

---

## 💻 MicroPython Code

### Chương trình Đầy đủ / Full Program

```python
# ============================================================
# Bài 17: Nhiệt kế Điện tử với micro:bit
# Lesson 17: Digital Thermometer with micro:bit
# 
# Tác giả / Author: STEM Elecrow Crowtail Curriculum
# Phiên bản / Version: 1.0
# ============================================================

from microbit import *
import music

# ──────────────────────────────────────────────────────────
# PHẦN 1: CÀI ĐẶT / SETUP
# ──────────────────────────────────────────────────────────

# Giá trị hiệu chỉnh: micro:bit thường đọc cao hơn ~5°C so với
# nhiệt độ thực tế vì chip tỏa nhiệt khi hoạt động.
# Calibration offset: micro:bit typically reads ~5°C higher than
# actual temperature because the chip generates heat.
CALIBRATION_OFFSET = 5  # Điều chỉnh giá trị này / Adjust this value

# Ngưỡng cảnh báo nhiệt độ / Temperature alert threshold
HEAT_ALERT_THRESHOLD = 35  # °C

# Biến theo dõi min/max / Variables to track min/max
temp_min = 100   # Khởi tạo giá trị rất cao / Initialize very high
temp_max = -100  # Khởi tạo giá trị rất thấp / Initialize very low

# Chế độ hiển thị: 0 = Celsius, 1 = Fahrenheit, 2 = Kelvin
# Display mode: 0 = Celsius, 1 = Fahrenheit, 2 = Kelvin
display_mode = 0

# ──────────────────────────────────────────────────────────
# PHẦN 2: HÀM CHUYỂN ĐỔI / CONVERSION FUNCTIONS
# ──────────────────────────────────────────────────────────

def celsius_to_fahrenheit(c):
    """
    Chuyển đổi Celsius sang Fahrenheit.
    Convert Celsius to Fahrenheit.
    Công thức / Formula: F = (C × 9/5) + 32
    """
    return (c * 9 / 5) + 32

def celsius_to_kelvin(c):
    """
    Chuyển đổi Celsius sang Kelvin.
    Convert Celsius to Kelvin.
    Công thức / Formula: K = C + 273
    """
    return c + 273

def get_calibrated_temp():
    """
    Đọc và hiệu chỉnh nhiệt độ từ cảm biến micro:bit.
    Read and calibrate temperature from the micro:bit sensor.
    Trả về / Returns: nhiệt độ Celsius đã hiệu chỉnh / calibrated Celsius
    """
    raw = temperature()          # Đọc nhiệt độ chip / Read chip temperature
    return raw - CALIBRATION_OFFSET  # Trừ offset để hiệu chỉnh / Subtract offset

# ──────────────────────────────────────────────────────────
# PHẦN 3: HÀM CẢNH BÁO / ALERT FUNCTION
# ──────────────────────────────────────────────────────────

def heat_alert():
    """
    Phát cảnh báo âm thanh khi nhiệt độ quá cao.
    Sound a heat alert when temperature is too high.
    Còi kết nối tại P0 / Buzzer connected at P0.
    """
    pin0.write_digital(1)    # Bật còi / Turn on buzzer
    sleep(500)               # Giữ 500ms / Hold 500ms
    pin0.write_digital(0)    # Tắt còi / Turn off buzzer
    sleep(200)               # Nghỉ ngắn / Short pause
    pin0.write_digital(1)    # Bật lần 2 / Second beep
    sleep(500)
    pin0.write_digital(0)    # Tắt còi / Turn off buzzer

def show_heat_warning():
    """
    Hiển thị biểu tượng cảnh báo nóng.
    Display a heat warning icon.
    """
    display.show(Image.ARROW_N)  # Mũi tên lên = nóng / Up arrow = hot
    sleep(300)
    display.show(Image.NO)       # Dấu X = cảnh báo / X mark = warning
    sleep(300)

# ──────────────────────────────────────────────────────────
# PHẦN 4: CHƯƠNG TRÌNH CHÍNH / MAIN PROGRAM
# ──────────────────────────────────────────────────────────

# Thông báo khởi động / Startup message
display.scroll("TEMP", delay=100)
display.show(Image.HEART)
sleep(1000)

while True:
    # ── Đọc nhiệt độ / Read temperature ──────────────────
    temp_c = get_calibrated_temp()
    temp_f = celsius_to_fahrenheit(temp_c)
    temp_k = celsius_to_kelvin(temp_c)

    # ── Cập nhật min/max / Update min/max ────────────────
    if temp_c < temp_min:
        temp_min = temp_c
    if temp_c > temp_max:
        temp_max = temp_c

    # ── Kiểm tra nút bấm / Check buttons ─────────────────
    if button_a.was_pressed():
        # Nút A: Chuyển chế độ hiển thị / Button A: Cycle display mode
        display_mode = (display_mode + 1) % 3  # Xoay vòng 0→1→2→0 / Cycle 0→1→2→0

    if button_b.was_pressed():
        # Nút B: Hiển thị min/max / Button B: Show min/max
        display.scroll("MIN:" + str(temp_min) + " MAX:" + str(temp_max), delay=80)
        continue  # Bỏ qua phần còn lại / Skip rest of loop

    # ── Hiển thị nhiệt độ / Display temperature ──────────
    if display_mode == 0:
        # Chế độ Celsius / Celsius mode
        display.scroll("C:" + str(temp_c), delay=80)

    elif display_mode == 1:
        # Chế độ Fahrenheit / Fahrenheit mode
        temp_f_rounded = round(temp_f, 1)
        display.scroll("F:" + str(temp_f_rounded), delay=80)

    elif display_mode == 2:
        # Chế độ Kelvin / Kelvin mode
        display.scroll("K:" + str(temp_k), delay=80)

    # ── Kiểm tra cảnh báo nóng / Check heat alert ────────
    if temp_c > HEAT_ALERT_THRESHOLD:
        show_heat_warning()
        heat_alert()

    # ── Nghỉ trước vòng lặp tiếp / Rest before next loop ─
    sleep(1000)
```

---

## 🔬 Hoạt động 1: Nhiệt kế Hiển thị C và F
## Activity 1: Digital Thermometer Displaying Celsius and Fahrenheit

**Mục tiêu / Objective:**  
Lập trình micro:bit hiển thị nhiệt độ luân phiên bằng °C và °F, đồng thời có chức năng hiệu chỉnh đơn giản.  
*Program the micro:bit to alternately display temperature in °C and °F with a simple calibration feature.*

**Thời gian / Duration:** 20 phút / 20 minutes

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Kết nối micro:bit với máy tính và mở MakeCode.  
*Connect the micro:bit to the computer and open MakeCode.*

**Bước 2 / Step 2:** Tạo biến `offset` = 5 trong khối "on start".  
*Create variable `offset` = 5 in the "on start" block.*

**Bước 3 / Step 3:** Trong vòng lặp "forever":
- Đọc `temperature (°C)` → lưu vào biến `raw_temp`.  
- Tính `temp_c` = `raw_temp` − `offset`.  
- Hiển thị "C:" + `temp_c`.  
- Đợi 2 giây.  
- Tính `temp_f` = (`temp_c` × 9 / 5) + 32.  
- Hiển thị "F:" + `temp_f`.  
- Đợi 2 giây.  

*In the "forever" loop:*
- *Read `temperature (°C)` → store in variable `raw_temp`.*
- *Calculate `temp_c` = `raw_temp` − `offset`.*
- *Show "C:" + `temp_c`.*
- *Wait 2 seconds.*
- *Calculate `temp_f` = (`temp_c` × 9 / 5) + 32.*
- *Show "F:" + `temp_f`.*
- *Wait 2 seconds.*

**Bước 4 / Step 4:** Nạp chương trình và quan sát màn hình LED.  
*Flash the program and observe the LED display.*

**Câu hỏi quan sát / Observation Questions:**
- Nhiệt độ hiển thị là bao nhiêu? / What temperature is displayed?
- So sánh với nhiệt kế thực tế. / Compare with a real thermometer.
- Thử cầm micro:bit chặt trong lòng bàn tay — nhiệt độ thay đổi thế nào? / Hold the micro:bit tightly in your palm — how does the temperature change?

---

## 🔬 Hoạt động 2: Bộ Ghi Nhiệt độ Min/Max
## Activity 2: Temperature Logger Tracking Min/Max

**Mục tiêu / Objective:**  
Sử dụng biến để theo dõi và hiển thị nhiệt độ tối thiểu và tối đa trong suốt phiên làm việc.  
*Use variables to track and display the minimum and maximum temperature throughout a session.*

**Thời gian / Duration:** 25 phút / 25 minutes

**Lý thuyết ngắn / Quick Theory:**  
Bộ ghi dữ liệu (data logger) là thiết bị tự động thu thập và lưu trữ dữ liệu theo thời gian. Trạm thời tiết, thiết bị y tế đều dùng bộ ghi dữ liệu.  
*A data logger is a device that automatically collects and stores data over time. Weather stations and medical devices all use data loggers.*

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Trong "on start", tạo:  
- `temp_min` = 100 (khởi tạo rất cao để giá trị đầu tiên luôn nhỏ hơn).  
- `temp_max` = -100 (khởi tạo rất thấp để giá trị đầu tiên luôn lớn hơn).  
*In "on start", create: `temp_min` = 100, `temp_max` = -100.*

**Bước 2 / Step 2:** Trong "forever":
- Đọc và hiệu chỉnh nhiệt độ → `temp_c`.
- Nếu `temp_c` < `temp_min` → gán `temp_min` = `temp_c`.
- Nếu `temp_c` > `temp_max` → gán `temp_max` = `temp_c`.
- Hiển thị `temp_c`.

*In "forever": Read and calibrate temperature → `temp_c`. If `temp_c` < `temp_min` → set `temp_min` = `temp_c`. If `temp_c` > `temp_max` → set `temp_max` = `temp_c`. Show `temp_c`.*

**Bước 3 / Step 3:** Khi nhấn Nút A → hiển thị "MIN:" + `temp_min`.  
*On Button A press → show "MIN:" + `temp_min`.*

**Bước 4 / Step 4:** Khi nhấn Nút B → hiển thị "MAX:" + `temp_max`.  
*On Button B press → show "MAX:" + `temp_max`.*

**Thử thách / Challenge:** Thử chạy chương trình cả buổi sáng và ghi lại nhiệt độ min/max của phòng học.  
*Try running the program all morning and record the min/max temperature of the classroom.*

---

## 🔬 Hoạt động 3: Hệ thống Cảnh báo Nhiệt / Heat Alert System

**Mục tiêu / Objective:**  
Kết hợp cảm biến nhiệt độ với còi buzzer để tạo hệ thống cảnh báo tự động khi nhiệt độ vượt 35 °C.  
*Combine the temperature sensor with a buzzer to create an automatic alert system when temperature exceeds 35 °C.*

**Thời gian / Duration:** 25 phút / 25 minutes

**Kịch bản thực tế / Real-world Scenario:**  
Hệ thống này mô phỏng cảm biến nhiệt độ trong máy chủ (server room), kho lạnh, hoặc nhà kính — nơi cần cảnh báo kịp thời khi nhiệt độ bất thường.  
*This system simulates temperature sensors in server rooms, cold storage, or greenhouses — places needing timely alerts when temperature is abnormal.*

**Các bước thực hiện / Steps:**

**Bước 1 / Step 1:** Kết nối còi Buzzer Crowtail vào cổng P0.  
*Connect the Crowtail Buzzer to port P0.*

**Bước 2 / Step 2:** Đặt ngưỡng cảnh báo `threshold` = 35.  
*Set alert threshold `threshold` = 35.*

**Bước 3 / Step 3:** Trong vòng lặp chính:
- Đọc nhiệt độ `temp_c`.
- Hiển thị `temp_c`.
- **Nếu** `temp_c` > `threshold`:
  - Hiển thị biểu tượng cảnh báo (dấu X hoặc mũi tên lên).
  - Phát tiếng còi: bật P0 → đợi 500ms → tắt P0 → đợi 200ms → lặp lại 3 lần.
- **Ngược lại**: Hiển thị biểu tượng trái tim (bình thường).

*In the main loop: Read `temp_c`. Show `temp_c`. **If** `temp_c` > `threshold`: show warning icon, sound buzzer pattern. **Else**: show heart icon (normal).*

**Bước 4 / Step 4:** Kiểm tra bằng cách cầm vi xử lý trong lòng bàn tay để nâng nhiệt độ.  
*Test by cupping the processor in your palm to raise the temperature.*

**Mở rộng / Extension:** Thêm chức năng ghi lại số lần cảnh báo.  
*Add a function to log the number of alert events.*

---

## 📝 Ví dụ Minh họa / Worked Example

### Chuyển đổi 37 °C sang Fahrenheit và Kelvin
### Converting 37 °C to Fahrenheit and Kelvin

**Bài toán / Problem:** Nhiệt độ cơ thể người bình thường là 37 °C. Hãy chuyển sang °F và K.  
*Normal human body temperature is 37 °C. Convert to °F and K.*

**Giải / Solution:**

```
Bước 1 / Step 1: Celsius → Fahrenheit
   F = (C × 9/5) + 32
   F = (37 × 9/5) + 32
   F = (333/5) + 32
   F = 66.6 + 32
   F = 98.6 °F  ✓

Bước 2 / Step 2: Celsius → Kelvin
   K = C + 273.15
   K = 37 + 273.15
   K = 310.15 K  ✓

Kết quả / Result:
   37 °C  =  98.6 °F  =  310.15 K
```

**Kiểm tra / Verification:** Nhiệt độ cơ thể người 98.6 °F là con số quen thuộc ở Mỹ — điều này xác nhận công thức đúng.  
*The 98.6 °F human body temperature is a familiar figure in the US — this confirms the formula is correct.*

---

## ⚠️ Lưu ý An toàn / Safety Notes

> **🇻🇳 Tiếng Việt:**
> 1. **Không để micro:bit tiếp xúc với chất lỏng** — bo mạch không chống nước và có thể bị hư hỏng vĩnh viễn.
> 2. **Không đặt micro:bit gần nguồn nhiệt quá cao** (>60 °C) như bếp lửa, đèn sưởi — chip có thể bị hỏng.
> 3. **Không chạm vào bộ phận điện tử bằng tay ướt** — nguy cơ điện giật và hư mạch.
> 4. **Cẩn thận với còi buzzer** — âm thanh to có thể ảnh hưởng đến thính giác nếu giữ gần tai.
> 5. **Tắt nguồn** trước khi cắm hoặc tháo dây kết nối.

> **🇬🇧 English:**
> 1. **Do not expose the micro:bit to liquids** — the board is not waterproof and can be permanently damaged.
> 2. **Do not place the micro:bit near excessive heat** (>60 °C) such as stoves or heaters — the chip may be damaged.
> 3. **Do not touch electronic components with wet hands** — risk of electric shock and circuit damage.
> 4. **Be careful with the buzzer** — loud sounds can affect hearing if held close to the ear.
> 5. **Turn off power** before plugging or unplugging connector cables.

---

## 💬 Câu hỏi Thảo luận / Discussion Questions

1. **Tại sao micro:bit đọc nhiệt độ cao hơn nhiệt độ thực tế?** Hãy giải thích dựa trên nguyên lý hoạt động của chip vi xử lý.  
   *Why does the micro:bit read a higher temperature than the actual ambient temperature? Explain based on the operating principles of the processor chip.*

2. **So sánh ưu và nhược điểm** của thang đo Celsius và Fahrenheit. Tại sao hầu hết thế giới dùng Celsius nhưng Mỹ vẫn dùng Fahrenheit?  
   *Compare the advantages and disadvantages of Celsius and Fahrenheit scales. Why does most of the world use Celsius but the US still uses Fahrenheit?*

3. **Thermistor NTC** được sử dụng trong điều hòa không khí. Hãy mô tả nguyên lý hoạt động: khi phòng nóng lên, điện trở thay đổi thế nào và điều hòa phản ứng ra sao?  
   *An NTC thermistor is used in air conditioning. Describe the operating principle: when the room heats up, how does the resistance change and how does the A/C respond?*

4. **Thiết kế một ứng dụng thực tế** sử dụng cảm biến nhiệt độ micro:bit cho trường học của em. Hệ thống đó sẽ đo gì, cảnh báo gì, và dữ liệu sẽ được lưu ở đâu?  
   *Design a real-world application using the micro:bit temperature sensor for your school. What would the system measure, what alerts would it give, and where would data be stored?*

5. **Nhiệt độ tuyệt đối không (0 K)** là gì? Tại sao không thể đạt được nhiệt độ âm trên thang Kelvin? Điều gì xảy ra với các phân tử ở 0 K?  
   *What is absolute zero (0 K)? Why can there be no negative temperatures on the Kelvin scale? What happens to molecules at 0 K?*

---

## 📊 Bảng Đánh giá / Assessment Rubric

| Tiêu chí / Criteria | Xuất sắc (4) / Excellent | Giỏi (3) / Good | Đạt (2) / Satisfactory | Cần cải thiện (1) / Needs Work |
|---|---|---|---|---|
| **Kiến thức lý thuyết** / Theoretical Knowledge | Giải thích đầy đủ và chính xác tất cả các khái niệm: nhiệt độ, 3 thang đo, thermistor, hiệu chỉnh. / Fully and accurately explains all concepts: temperature, 3 scales, thermistor, calibration. | Giải thích đúng hầu hết các khái niệm với một vài lỗi nhỏ. / Correctly explains most concepts with minor errors. | Giải thích được 2–3 khái niệm cơ bản. / Can explain 2–3 basic concepts. | Hiểu rất ít hoặc không hiểu các khái niệm. / Understands very few or no concepts. |
| **Kỹ năng lập trình** / Programming Skills | Chương trình hoạt động hoàn hảo, mã sạch, có chú thích đầy đủ. / Program works perfectly, clean code, fully commented. | Chương trình hoạt động với một vài lỗi nhỏ không ảnh hưởng kết quả. / Program works with minor bugs that don't affect results. | Chương trình chạy được nhưng thiếu một số tính năng. / Program runs but is missing some features. | Chương trình không chạy hoặc có nhiều lỗi. / Program doesn't run or has many errors. |
| **Hiệu chỉnh Cảm biến** / Sensor Calibration | Hiệu chỉnh chính xác, giải thích rõ tại sao cần hiệu chỉnh và cách tính offset. / Accurate calibration with clear explanation of why calibration is needed and how to calculate offset. | Thực hiện hiệu chỉnh đúng nhưng giải thích chưa đầy đủ. / Correctly calibrated but explanation is incomplete. | Hiểu khái niệm hiệu chỉnh nhưng không áp dụng được trong code. / Understands calibration concept but couldn't apply it in code. | Không hiệu chỉnh và không hiểu tại sao cần. / No calibration and doesn't understand why it's needed. |
| **Báo cáo & Trình bày** / Report & Presentation | Báo cáo chi tiết, số liệu rõ ràng, trình bày lưu loát và tự tin. / Detailed report, clear data, fluent and confident presentation. | Báo cáo đầy đủ các phần chính, trình bày tương đối tốt. / Report covers main sections, fairly good presentation. | Báo cáo thiếu một số phần, trình bày còn ngập ngừng. / Report missing some sections, hesitant presentation. | Báo cáo sơ sài, không trình bày được. / Superficial report, unable to present. |

---

## 🚀 Khám phá Thêm / Further Exploration & Challenges

### Thử thách Cơ bản / Basic Challenges
1. **Nhiệt kế 3 chế độ:** Thêm chế độ Kelvin, dùng nút A để chuyển đổi giữa C, F, K.  
   *3-mode thermometer: Add Kelvin mode, use Button A to switch between C, F, K.*

2. **Biểu đồ nhiệt độ đơn giản:** Sử dụng ma trận LED 5×5 để hiển thị mức nhiệt độ dạng thanh (bar graph).  
   *Simple temperature chart: Use the 5×5 LED matrix to display temperature level as a bar graph.*

### Thử thách Nâng cao / Advanced Challenges
3. **Trạm thời tiết liên kết:** Kết nối 2 micro:bit qua radio, micro:bit A đo nhiệt độ và gửi dữ liệu, micro:bit B nhận và hiển thị.  
   *Linked weather station: Connect 2 micro:bits via radio, micro:bit A measures and sends temperature data, micro:bit B receives and displays.*

4. **Bộ ghi dữ liệu nâng cao:** Ghi nhiệt độ mỗi phút, tính nhiệt độ trung bình, hiển thị xu hướng (tăng/giảm/ổn định).  
   *Advanced data logger: Record temperature every minute, calculate average, display trend (rising/falling/stable).*

5. **Điều khiển quạt tự động:** Kết nối thêm module relay, khi nhiệt độ > 30 °C thì bật quạt, khi < 25 °C thì tắt quạt.  
   *Automatic fan control: Add a relay module, turn on a fan when temperature > 30 °C, turn off when < 25 °C.*

---

## 📖 Từ vựng / Vocabulary List

| # | Thuật ngữ (Tiếng Việt) | Term (English) | Định nghĩa song ngữ / Bilingual Definition |
|---|---|---|---|
| 1 | Nhiệt độ | Temperature | Đại lượng đo mức độ nóng/lạnh của vật. / A measure of how hot or cold an object is. |
| 2 | Động năng | Kinetic Energy | Năng lượng do chuyển động của phân tử. / Energy due to molecular motion. |
| 3 | Thang Celsius | Celsius Scale | Thang đo chia 0–100 °C giữa điểm đóng băng và sôi của nước. / Scale dividing 0–100 °C between water's freezing and boiling points. |
| 4 | Thang Fahrenheit | Fahrenheit Scale | Thang đo dùng chủ yếu tại Mỹ (32–212 °F). / Scale mainly used in the USA (32–212 °F). |
| 5 | Thang Kelvin | Kelvin Scale | Thang đo tuyệt đối, bắt đầu từ 0 K (không tuyệt đối). / Absolute scale starting from 0 K (absolute zero). |
| 6 | Không tuyệt đối | Absolute Zero | Nhiệt độ thấp nhất có thể (0 K = −273.15 °C). / The lowest possible temperature (0 K = −273.15 °C). |
| 7 | Cảm biến nhiệt độ | Temperature Sensor | Thiết bị đo và chuyển đổi nhiệt độ thành tín hiệu điện. / A device that measures and converts temperature to an electrical signal. |
| 8 | Thermistor | Thermistor | Điện trở có giá trị thay đổi theo nhiệt độ. / A resistor whose value changes with temperature. |
| 9 | NTC | NTC (Negative Temperature Coefficient) | Thermistor có điện trở giảm khi nhiệt độ tăng. / Thermistor whose resistance decreases as temperature increases. |
| 10 | PTC | PTC (Positive Temperature Coefficient) | Thermistor có điện trở tăng khi nhiệt độ tăng. / Thermistor whose resistance increases as temperature increases. |
| 11 | Hiệu chỉnh | Calibration | Quá trình điều chỉnh thiết bị đo để cho kết quả chính xác hơn. / The process of adjusting a measurement device for more accurate results. |
| 12 | Bù trừ / Offset | Offset | Giá trị cộng thêm hoặc trừ bớt để hiệu chỉnh số đọc. / A value added or subtracted to correct a reading. |
| 13 | Ngưỡng cảnh báo | Alert Threshold | Giá trị giới hạn khi vượt qua sẽ kích hoạt cảnh báo. / A limit value that triggers an alert when exceeded. |
| 14 | Bộ ghi dữ liệu | Data Logger | Thiết bị tự động thu thập và lưu dữ liệu theo thời gian. / A device that automatically collects and stores data over time. |

---

*Bài 17 hoàn thành — Chúc mừng! / Lesson 17 Complete — Congratulations!*  
*Tiếp theo: Bài 18 — Gia tốc kế / Next: Lesson 18 — Accelerometer* 🎉
