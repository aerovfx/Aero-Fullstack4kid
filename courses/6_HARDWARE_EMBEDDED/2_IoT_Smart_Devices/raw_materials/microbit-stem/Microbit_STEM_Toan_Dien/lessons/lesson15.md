# Bài 15: Siêu Âm – Thước Đo Điện Tử
# *Lesson 15: Ultrasonic Sensor – Electronic Ruler*

**Bộ kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit  
**Kit:** Elecrow Crowtail STEAM Edu Kit + BBC micro:bit

**Thời lượng:** 90 phút | **Duration:** 90 minutes  
**Cấp độ:** Trung cấp | **Level:** Intermediate  

---

## 1. Mục Tiêu Học Tập / Learning Objectives

### Sau bài học này, học sinh có thể: / *After this lesson, students will be able to:*

- **Giải thích** nguyên lý hoạt động của sóng siêu âm và cảm biến HC-SR04.  
  *Explain the operating principle of ultrasonic waves and the HC-SR04 sensor.*

- **Tính toán** khoảng cách dựa trên thời gian phản hồi của sóng âm.  
  *Calculate distance based on the echo time of sound waves.*

- **Lập trình** micro:bit để đọc giá trị từ cảm biến siêu âm và hiển thị kết quả.  
  *Program the micro:bit to read values from the ultrasonic sensor and display results.*

- **Xây dựng** hệ thống cảnh báo đỗ xe với LED và loa buzzer theo các vùng khoảng cách.  
  *Build a parking warning system with LEDs and buzzer based on distance zones.*

- **Phân tích** ưu và nhược điểm của cảm biến siêu âm trong các ứng dụng thực tế.  
  *Analyze the advantages and limitations of ultrasonic sensors in real-world applications.*

- **Liên hệ** kỹ thuật đo khoảng cách này với các ứng dụng công nghệ hiện đại.  
  *Connect this distance-measurement technique to modern technology applications.*

---

## 2. Lý Thuyết / Theory

### 2.1 Sóng Siêu Âm Là Gì? / *What Are Ultrasonic Waves?*

**Âm thanh** là dao động cơ học lan truyền qua môi trường vật chất (không khí, nước, chất rắn). Con người có thể nghe được âm thanh có tần số từ **20 Hz đến 20.000 Hz**.  
*Sound is a mechanical vibration that propagates through a medium (air, water, solid). Humans can hear sounds with frequencies ranging from 20 Hz to 20,000 Hz.*

**Sóng siêu âm (Ultrasonic waves)** là sóng âm có tần số **lớn hơn 20.000 Hz (20 kHz)**. Vì tần số quá cao, tai người không thể cảm nhận được, nhưng các thiết bị điện tử có thể phát và thu nhận chúng rất chính xác.  
*Ultrasonic waves are sound waves with frequencies greater than 20,000 Hz (20 kHz). Because the frequency is too high, human ears cannot perceive them, but electronic devices can emit and receive them very accurately.*

#### Các loại sóng theo tần số / *Types of waves by frequency:*

| Loại sóng / *Wave Type* | Tần số / *Frequency* | Ví dụ / *Example* |
|---|---|---|
| Hạ âm / *Infrasound* | < 20 Hz | Địa chấn / *Earthquakes* |
| Âm thanh nghe được / *Audible sound* | 20 Hz – 20,000 Hz | Giọng nói, âm nhạc / *Voice, music* |
| Siêu âm / *Ultrasound* | > 20,000 Hz | Cảm biến, siêu âm y tế / *Sensors, medical ultrasound* |

> **Ví dụ thực tế / Real-world example:** Dơi sử dụng sóng siêu âm để định vị trong bóng tối. Cá heo giao tiếp bằng tần số siêu âm. Bác sĩ dùng siêu âm để chẩn đoán bệnh.  
> *Bats use ultrasonic waves to navigate in the dark. Dolphins communicate using ultrasonic frequencies. Doctors use ultrasound for medical diagnosis.*

---

### 2.2 Tốc Độ Âm Thanh / *Speed of Sound*

Âm thanh di chuyển với tốc độ khác nhau tùy theo môi trường và nhiệt độ:  
*Sound travels at different speeds depending on the medium and temperature:*

- **Trong không khí ở 20°C:** ~343 m/s (≈ 34.300 cm/s)  
  *In air at 20°C: ~343 m/s (≈ 34,300 cm/s)*

- **Trong nước:** ~1.500 m/s  
  *In water: ~1,500 m/s*

- **Trong thép:** ~5.100 m/s  
  *In steel: ~5,100 m/s*

#### Ảnh hưởng của nhiệt độ / *Effect of Temperature:*

Nhiệt độ càng cao, các phân tử không khí chuyển động càng nhanh → âm thanh truyền nhanh hơn.  
*The higher the temperature, the faster air molecules move → sound travels faster.*

```
Công thức chính xác / Accurate formula:
v = 331.3 + (0.606 × T) (m/s)

Trong đó T = nhiệt độ theo °C / where T = temperature in °C

Ví dụ / Example:
  Ở 0°C:   v = 331.3 m/s
  Ở 20°C:  v = 331.3 + (0.606 × 20) = 343.4 m/s
  Ở 35°C:  v = 331.3 + (0.606 × 35) = 352.5 m/s
```

> **Lưu ý giảng dạy / Teaching note:** Đây là lý do cảm biến siêu âm có thể bị sai lệch khi dùng ngoài trời vào mùa hè so với mùa đông!  
> *This is why ultrasonic sensors can be slightly inaccurate outdoors in summer vs. winter!*

---

### 2.3 Nguyên Lý Đo Thời Gian Bay / *Time-of-Flight Measurement Principle*

Cảm biến siêu âm hoạt động theo nguyên lý **Time-of-Flight (ToF)** – đo thời gian sóng âm đi từ nguồn phát đến vật thể và quay trở lại:  
*The ultrasonic sensor operates on the Time-of-Flight (ToF) principle – measuring the time it takes for a sound wave to travel from the emitter to an object and back:*

```
Bước 1 / Step 1: Phát xung siêu âm / Emit ultrasonic pulse
    micro:bit → TRIG pin (10 µs pulse HIGH)
    
Bước 2 / Step 2: Sóng âm đi đến vật thể / Sound wave travels to object
    ~~~))) ────────────────────> [ Vật thể / Object ]
    
Bước 3 / Step 3: Sóng âm phản xạ trở lại / Sound wave reflects back
    [ Vật thể / Object ] <────────────────── (((~~~
    
Bước 4 / Step 4: Thu nhận tín hiệu / Receive echo signal
    ECHO pin → micro:bit (đo thời gian HIGH / measures HIGH duration)
    
Bước 5 / Step 5: Tính khoảng cách / Calculate distance
    khoảng cách = (thời gian × tốc độ âm) / 2
```

**Tại sao chia 2?** Vì thời gian đo được là thời gian sóng âm đi **hai chiều** (đến và về), nên khoảng cách thực tế chỉ bằng một nửa.  
*Why divide by 2? Because the measured time is the time for the sound wave to travel **two ways** (there and back), so the actual distance is only half.*

---

### 2.4 Cảm Biến HC-SR04 / *HC-SR04 Sensor Operation*

Cảm biến siêu âm **HC-SR04** có 4 chân:  
*The HC-SR04 ultrasonic sensor has 4 pins:*

| Chân / *Pin* | Chức năng / *Function* | Điện áp / *Voltage* |
|---|---|---|
| VCC | Nguồn cấp / *Power supply* | 5V |
| GND | Đất / *Ground* | 0V |
| TRIG | Trigger – kích hoạt phát xung / *Trigger – activates pulse emission* | 3.3V–5V |
| ECHO | Echo – tín hiệu phản hồi / *Echo – receives reflected signal* | 5V (cần phân áp / *voltage divider needed*) |

#### Quy trình hoạt động chi tiết / *Detailed operation procedure:*

1. **TRIG LOW** (≥ 2 µs): Đảm bảo TRIG ở trạng thái thấp trước khi kích hoạt / *Ensure TRIG is LOW before triggering*
2. **TRIG HIGH** (10 µs): Gửi xung kích hoạt 10 micro giây / *Send 10 microsecond trigger pulse*
3. **TRIG LOW**: Kết thúc xung kích hoạt / *End trigger pulse*
4. Cảm biến tự động phát **8 xung siêu âm** ở tần số 40 kHz / *Sensor automatically emits 8 ultrasonic pulses at 40 kHz*
5. **ECHO HIGH**: Bắt đầu đếm thời gian / *Start timing*
6. Sóng âm phản xạ trở về / *Sound wave reflects back*
7. **ECHO LOW**: Kết thúc đếm thời gian → đây là thời gian bay / *End timing → this is the time of flight*

---

### 2.5 Giới Hạn Của Cảm Biến / *Sensor Limitations*

Không có cảm biến nào hoàn hảo. HC-SR04 có những giới hạn sau:  
*No sensor is perfect. The HC-SR04 has the following limitations:*

| Giới hạn / *Limitation* | Chi tiết / *Detail* |
|---|---|
| Khoảng cách tối thiểu / *Minimum distance* | ~2 cm (quá gần sẽ bị nhiễu / *too close causes interference*) |
| Khoảng cách tối đa / *Maximum distance* | ~400 cm (4 m) |
| Góc đo / *Measurement angle* | ±15° (vật ngoài góc này không phản xạ được / *objects outside this angle won't reflect*) |
| Bề mặt mềm / *Soft surfaces* | Vải, bông, xốp hấp thụ âm → kết quả không chính xác / *Fabric, foam absorbs sound → inaccurate results* |
| Bề mặt nghiêng / *Angled surfaces* | Góc nghiêng lớn → sóng phản xạ không trở về cảm biến / *Large angle → reflected wave doesn't return to sensor* |
| Nhiều cảm biến / *Multiple sensors* | Các cảm biến gần nhau có thể gây nhiễu lẫn nhau / *Nearby sensors can interfere with each other* |

---

### 2.6 Ứng Dụng Thực Tế / *Real-World Applications*

Cảm biến siêu âm được sử dụng rộng rãi trong:  
*Ultrasonic sensors are widely used in:*

- 🚗 **Cảm biến đỗ xe ô tô** – phát tiếng beep khi gần chướng ngại vật / *Car parking sensors – beeps when near obstacles*
- 🤖 **Robot tránh chướng ngại vật** – phát hiện và né tránh vật thể / *Obstacle-avoiding robots – detect and avoid objects*
- 🏭 **Đo mức chất lỏng trong bình** – đo mực nước, nhiên liệu / *Liquid level measurement in tanks – measures water, fuel levels*
- 🏥 **Siêu âm y tế** – hình ảnh bên trong cơ thể (tần số cao hơn, ~1-20 MHz) / *Medical ultrasound – imaging inside the body (higher frequency ~1-20 MHz)*
- 📦 **Băng chuyền tự động** – phát hiện vị trí hàng hóa / *Automated conveyor belts – detect product positions*
- 🚁 **Máy bay không người lái (drone)** – tránh va chạm, hạ cánh an toàn / *Drones – collision avoidance, safe landing*

---

## 3. Công Thức Chính / Key Formula

```
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   CÔNG THỨC TÍNH KHOẢNG CÁCH / DISTANCE FORMULA:           ║
║                                                              ║
║   khoảng cách (cm) = (thời_gian_echo (µs) × 0.034) / 2     ║
║   distance (cm)    = (echo_time_µs × 0.034) / 2            ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
```

### Giải thích từng con số / *Explanation of each number:*

**Con số 0.034 từ đâu?** / *Where does 0.034 come from?*

```
Tốc độ âm thanh = 343 m/s = 34.300 cm/s
Chuyển sang cm/µs: 34.300 cm/s ÷ 1.000.000 µs/s = 0.0343 cm/µs
Làm tròn: ≈ 0.034 cm/µs

Speed of sound = 343 m/s = 34,300 cm/s
Convert to cm/µs: 34,300 cm/s ÷ 1,000,000 µs/s = 0.0343 cm/µs
Rounded: ≈ 0.034 cm/µs
```

**Tại sao chia 2?** / *Why divide by 2?*

```
Sóng âm đi từ cảm biến → vật thể → cảm biến (hai chiều)
Nên thời gian đo = 2 × thời gian thực tế
→ Phải chia đôi để có khoảng cách một chiều

The sound wave travels: sensor → object → sensor (two-way)
So measured time = 2 × actual one-way time
→ Must divide by 2 to get one-way distance
```

---

## 4. Ví Dụ Tính Toán / Worked Example

### Bài toán: / *Problem:*

Thời gian ECHO = **1000 µs**. Tính khoảng cách.  
*Echo time = 1000 µs. Calculate the distance.*

### Giải / *Solution:*

```
Bước 1 / Step 1: Áp dụng công thức / Apply formula
  khoảng cách = (echo_time × 0.034) / 2
  distance     = (1000 × 0.034) / 2

Bước 2 / Step 2: Tính tử số / Calculate numerator
  1000 × 0.034 = 34 (cm)

Bước 3 / Step 3: Chia đôi / Divide by 2
  34 / 2 = 17 cm

Kết quả / Result: Khoảng cách = 17 cm / Distance = 17 cm
```

### Kiểm tra thêm / *More checks:*

| Thời gian ECHO / *Echo Time* | Khoảng cách / *Distance* |
|---|---|
| 116 µs | ~2 cm (khoảng cách tối thiểu / *minimum distance*) |
| 500 µs | ~8.5 cm |
| 1000 µs | ~17 cm |
| 2000 µs | ~34 cm |
| 5000 µs | ~85 cm |
| 23,529 µs | ~400 cm (khoảng cách tối đa / *maximum distance*) |

---

## 5. Thiết Bị Cần Chuẩn Bị / Components Needed

### Danh sách linh kiện / *Component List:*

| STT | Tên linh kiện / *Component* | Số lượng / *Quantity* | Ghi chú / *Notes* |
|---|---|---|---|
| 1 | BBC micro:bit v2 | 1 | Bo mạch chính / *Main board* |
| 2 | Cảm biến siêu âm Crowtail (HC-SR04) / *Crowtail Ultrasonic Sensor* | 1 | Đo khoảng cách / *Distance measurement* |
| 3 | Buzzer Crowtail / *Crowtail Buzzer* | 1 | Cảnh báo âm thanh / *Audio alert* |
| 4 | Cáp Crowtail 4-chân / *Crowtail 4-pin cable* | 3 | Kết nối linh kiện / *Connect components* |
| 5 | Bo mạch mở rộng Crowtail / *Crowtail breakout board* | 1 | Kết nối micro:bit / *micro:bit interface* |
| 6 | Dây USB / *USB cable* | 1 | Lập trình / *Programming* |
| 7 | Máy tính / Laptop | 1 | Cài MakeCode / *Run MakeCode* |
| 8 | Thước kẻ / *Ruler* | 1 | Kiểm tra độ chính xác / *Verify accuracy* |
| 9 | Vật thể thử nghiệm / *Test objects* | vài cái / *several* | Bìa cứng, hộp sữa... / *Cardboard, milk carton...* |

---

## 6. Sơ Đồ Kết Nối / Wiring & Connection

### Mô tả kết nối / *Connection Description:*

```
[micro:bit] ←→ [Crowtail Breakout Board]
                        │
         ┌──────────────┼──────────────┐
         │              │              │
    [P1+P2]           [P0]           [3V/GND]
  Cảm biến          Buzzer          Nguồn
  Siêu âm         (Buzzer)         (Power)
(Ultrasonic)
```

### Chi tiết từng kết nối / *Detailed connections:*

**Cảm biến siêu âm Crowtail / *Crowtail Ultrasonic Sensor:***
- Cổng **P1/P2** trên Crowtail Breakout Board  
  *(Port P1/P2 on Crowtail Breakout Board)*
- Dây **vàng/tín hiệu** → P1 (TRIG – kích hoạt) / *Yellow/signal wire → P1 (TRIG – trigger)*
- Dây **trắng/tín hiệu 2** → P2 (ECHO – nhận) / *White/signal 2 wire → P2 (ECHO – receive)*
- Dây **đỏ** → 5V / *Red wire → 5V*
- Dây **đen** → GND / *Black wire → GND*

> **Lưu ý quan trọng / Important note:** Cảm biến Crowtail Ultrasonic đã tích hợp mạch phân áp nên có thể kết nối thẳng với micro:bit 3.3V mà không cần thêm linh kiện.  
> *The Crowtail Ultrasonic sensor has a built-in voltage divider so it can connect directly to the 3.3V micro:bit without additional components.*

**Buzzer Crowtail / *Crowtail Buzzer:***
- Cổng **P0** trên Crowtail Breakout Board  
  *(Port P0 on Crowtail Breakout Board)*
- Tín hiệu điều khiển: PWM từ micro:bit / *Control signal: PWM from micro:bit*

**Ma trận LED micro:bit / *micro:bit LED matrix:***
- Tích hợp sẵn trên bo mạch micro:bit, không cần kết nối thêm  
  *(Built into the micro:bit board, no additional connection needed)*

---

## 7. Hướng Dẫn Lập Trình MakeCode / MakeCode Block Programming

### Mô tả khối lệnh – Hoạt động 1: Thước đo / *Block Description – Activity 1: Distance Meter*

```
╔══ KHI KHỞI ĐỘNG / ON START ═══════════════════════════════╗
║  Hiển thị chữ "DIST" trên ma trận LED                     ║
║  (Show text "DIST" on LED matrix)                          ║
║  Đợi 1 giây / Wait 1 second                                ║
╚════════════════════════════════════════════════════════════╝

╔══ LẶP MÃI / FOREVER ══════════════════════════════════════╗
║  [Bước 1 / Step 1] Phát xung TRIG                         ║
║    - Đặt P1 = 0 (LOW) trong 2 µs                          ║
║    - Đặt P1 = 1 (HIGH) trong 10 µs                        ║
║    - Đặt P1 = 0 (LOW)                                      ║
║    (Set P1=0 for 2µs, P1=1 for 10µs, P1=0)                ║
║                                                            ║
║  [Bước 2 / Step 2] Đo thời gian ECHO                      ║
║    - Đo thời gian P2 ở trạng thái HIGH (µs)               ║
║    (Measure duration P2 is HIGH in µs)                     ║
║                                                            ║
║  [Bước 3 / Step 3] Tính khoảng cách                       ║
║    - khoảng_cách = (thời_gian_echo × 34) / 2000           ║
║    (distance = (echo_time × 34) / 2000)                    ║
║                                                            ║
║  [Bước 4 / Step 4] Hiển thị kết quả                       ║
║    - Hiển thị số khoảng_cách trên LED                     ║
║    (Show distance number on LED matrix)                    ║
║                                                            ║
║  [Bước 5 / Step 5] Đợi 200 ms / Wait 200 ms              ║
╚════════════════════════════════════════════════════════════╝
```

### Mô tả khối lệnh – Hoạt động 2: Cảm biến đỗ xe / *Block Description – Activity 2: Parking Sensor*

```
╔══ LẶP MÃI / FOREVER ══════════════════════════════════════╗
║  [Tính khoảng cách như trên / Calculate distance as above] ║
║                                                            ║
║  NẾU khoảng_cách < 10 cm / IF distance < 10:              ║
║    → Hiển thị ký hiệu "X" / Show "X" icon                 ║
║    → Bật tất cả LED / Turn on ALL LEDs                    ║
║    → Buzzer kêu nhanh (200ms ON, 200ms OFF) x 3           ║
║    (Fast buzzer: 200ms ON, 200ms OFF, repeat 3 times)      ║
║                                                            ║
║  NGƯỢC LẠI NẾU khoảng_cách < 30 / ELSE IF distance < 30: ║
║    → Hiển thị "!" icon / Show "!" icon                    ║
║    → Bật một phần LED / Turn on PARTIAL LEDs              ║
║    → Buzzer kêu chậm (500ms ON, 500ms OFF) x 1            ║
║    (Slow buzzer: 500ms ON, 500ms OFF, once)                ║
║                                                            ║
║  NGƯỢC LẠI / ELSE (distance ≥ 30):                        ║
║    → Hiển thị dấu tick "✓" / Show checkmark icon          ║
║    → Tắt LED / Turn off LEDs                              ║
║    → Tắt buzzer / Buzzer silent                           ║
╚════════════════════════════════════════════════════════════╝
```

---

## 8. Mã MicroPython / MicroPython Code

```python
# ============================================================
# Bài 15: Cảm biến siêu âm - Thước đo điện tử
# Lesson 15: Ultrasonic Sensor - Electronic Ruler
# ============================================================
# Board: BBC micro:bit v2
# Kit: Elecrow Crowtail STEAM Edu Kit
# Kết nối / Connections:
#   - Cảm biến siêu âm / Ultrasonic: TRIG=P1, ECHO=P2
#   - Buzzer: P0
#   - LED Matrix: Tích hợp / Built-in
# ============================================================

from microbit import *
import utime

# ============================================================
# CẤU HÌNH / CONFIGURATION
# ============================================================

# Chân kết nối / Pin assignments
TRIG_PIN = pin1   # Chân phát xung / Trigger pin
ECHO_PIN = pin2   # Chân nhận tín hiệu / Echo pin
BUZZ_PIN = pin0   # Chân buzzer / Buzzer pin

# Ngưỡng khoảng cách (cm) / Distance thresholds (cm)
DANGER_DISTANCE  = 10   # Vùng nguy hiểm / Danger zone
WARNING_DISTANCE = 30   # Vùng cảnh báo / Warning zone

# Tốc độ âm thanh (cm/µs) / Speed of sound (cm/µs)
SOUND_SPEED = 0.034

# ============================================================
# HÀM ĐO KHOẢNG CÁCH / DISTANCE MEASUREMENT FUNCTION
# ============================================================

def measure_distance():
    """
    Đo khoảng cách bằng cảm biến siêu âm HC-SR04.
    Measure distance using HC-SR04 ultrasonic sensor.
    
    Trả về khoảng cách tính bằng cm, hoặc -1 nếu lỗi.
    Returns distance in cm, or -1 if error.
    """
    # Bước 1: Đảm bảo TRIG ở mức thấp trước khi bắt đầu
    # Step 1: Ensure TRIG is LOW before starting
    TRIG_PIN.write_digital(0)
    utime.sleep_us(2)  # Chờ 2 micro giây / Wait 2 microseconds
    
    # Bước 2: Phát xung TRIG cao trong 10 µs
    # Step 2: Send HIGH TRIG pulse for 10 µs
    TRIG_PIN.write_digital(1)
    utime.sleep_us(10)  # Giữ HIGH trong 10 micro giây / Hold HIGH for 10 µs
    TRIG_PIN.write_digital(0)
    
    # Bước 3: Chờ ECHO lên cao (timeout = 30000 µs)
    # Step 3: Wait for ECHO to go HIGH (timeout = 30000 µs)
    timeout_start = utime.ticks_us()
    while ECHO_PIN.read_digital() == 0:
        if utime.ticks_diff(utime.ticks_us(), timeout_start) > 30000:
            return -1  # Timeout - không phát hiện vật thể / Timeout - no object detected
    
    # Bước 4: Ghi lại thời điểm ECHO lên cao
    # Step 4: Record the time when ECHO goes HIGH
    echo_start = utime.ticks_us()
    
    # Bước 5: Chờ ECHO xuống thấp
    # Step 5: Wait for ECHO to go LOW
    while ECHO_PIN.read_digital() == 1:
        if utime.ticks_diff(utime.ticks_us(), echo_start) > 30000:
            return -1  # Timeout - vật thể quá xa / Timeout - object too far
    
    # Bước 6: Tính thời gian ECHO
    # Step 6: Calculate ECHO duration
    echo_time = utime.ticks_diff(utime.ticks_us(), echo_start)
    
    # Bước 7: Tính khoảng cách bằng công thức
    # Step 7: Calculate distance using formula
    # Công thức / Formula: distance = (echo_time × 0.034) / 2
    distance = (echo_time * SOUND_SPEED) / 2
    
    return distance

# ============================================================
# HÀM BUZZER / BUZZER FUNCTIONS
# ============================================================

def buzz(duration_ms, times=1):
    """
    Kích hoạt buzzer.
    Activate the buzzer.
    
    duration_ms: Thời gian bật (ms) / ON duration (ms)
    times: Số lần kêu / Number of beeps
    """
    for i in range(times):
        BUZZ_PIN.write_digital(1)   # Bật buzzer / Turn on buzzer
        sleep(duration_ms)
        BUZZ_PIN.write_digital(0)   # Tắt buzzer / Turn off buzzer
        sleep(duration_ms)

def danger_alert():
    """
    Cảnh báo nguy hiểm: buzzer nhanh.
    Danger alert: fast buzzer.
    """
    buzz(150, times=3)

def warning_alert():
    """
    Cảnh báo: buzzer chậm.
    Warning alert: slow buzzer.
    """
    buzz(400, times=1)

# ============================================================
# HOẠT ĐỘNG 1: THƯỚC ĐO KHOẢNG CÁCH
# ACTIVITY 1: DISTANCE METER
# ============================================================

def activity1_distance_meter():
    """
    Hiển thị khoảng cách liên tục trên ma trận LED.
    Continuously display distance on the LED matrix.
    """
    display.scroll("DIST", delay=80)
    
    while True:
        dist = measure_distance()
        
        if dist == -1:
            # Lỗi đo / Measurement error
            display.show("E")
        elif dist < 2:
            # Quá gần, ngoài tầm đo tối thiểu
            # Too close, below minimum range
            display.show("<2")
        elif dist > 400:
            # Quá xa, ngoài tầm đo tối đa
            # Too far, beyond maximum range
            display.show(">400")
        else:
            # Hiển thị khoảng cách tính bằng cm
            # Display distance in cm
            display.scroll(str(int(dist)) + "cm", delay=80)
        
        sleep(300)  # Cập nhật mỗi 300ms / Update every 300ms

# ============================================================
# HOẠT ĐỘNG 2: CẢM BIẾN ĐỖ XE
# ACTIVITY 2: PARKING SENSOR
# ============================================================

def activity2_parking_sensor():
    """
    Hệ thống cảm biến đỗ xe với 3 vùng cảnh báo:
    Parking sensor system with 3 warning zones:
    
    VÙNG NGUY HIỂM (< 10cm):
    DANGER ZONE (< 10cm):
      - Hiển thị hình X (NGUY HIỂM)
      - Show X icon (DANGER)
      - Buzzer kêu nhanh
      - Fast buzzer
    
    VÙNG CẢNH BÁO (10-30cm):
    WARNING ZONE (10-30cm):
      - Hiển thị dấu chấm than (!)
      - Show exclamation mark
      - Buzzer kêu chậm
      - Slow buzzer
    
    VÙNG AN TOÀN (> 30cm):
    SAFE ZONE (> 30cm):
      - Hiển thị dấu tick (✓)
      - Show checkmark
      - Không buzzer / No buzzer
    """
    
    # Các hình ảnh LED tùy chỉnh / Custom LED images
    # Hình X (nguy hiểm) / X shape (danger)
    danger_image = Image(
        "90009:"
        "06060:"
        "00900:"
        "06060:"
        "90009"
    )
    
    # Hình chấm than (cảnh báo) / Exclamation mark (warning)
    warning_image = Image(
        "00900:"
        "00900:"
        "00900:"
        "00000:"
        "00900"
    )
    
    # Hình tick (an toàn) / Checkmark (safe)
    safe_image = Image(
        "00009:"
        "00090:"
        "90900:"
        "09000:"
        "00000"
    )
    
    display.scroll("PARK", delay=80)
    
    while True:
        dist = measure_distance()
        
        if dist == -1:
            display.show("E")
            sleep(500)
            continue
        
        if dist < DANGER_DISTANCE:
            # ========== VÙNG NGUY HIỂM / DANGER ZONE ==========
            display.show(danger_image)
            danger_alert()  # Buzzer nhanh / Fast buzzer
            
        elif dist < WARNING_DISTANCE:
            # ========== VÙNG CẢNH BÁO / WARNING ZONE ==========
            display.show(warning_image)
            warning_alert()  # Buzzer chậm / Slow buzzer
            
        else:
            # ========== VÙNG AN TOÀN / SAFE ZONE ==========
            display.show(safe_image)
            BUZZ_PIN.write_digital(0)  # Tắt buzzer / Turn off buzzer
        
        sleep(200)

# ============================================================
# CHƯƠNG TRÌNH CHÍNH / MAIN PROGRAM
# ============================================================

# Chọn hoạt động / Choose activity:
# Bỏ chú thích dòng muốn chạy / Uncomment the line you want to run

# activity1_distance_meter()   # Hoạt động 1 / Activity 1
activity2_parking_sensor()     # Hoạt động 2 / Activity 2 (mặc định / default)
```

---

## 9. Hoạt Động 1: Thước Đo Khoảng Cách / Activity 1: Distance Meter

### Mục tiêu / *Objective:*
Xây dựng thiết bị đo khoảng cách hiển thị giá trị theo cm trên màn hình LED.  
*Build a distance measuring device that displays values in cm on the LED display.*

### Các bước thực hiện / *Steps:*

**Bước 1 – Kết nối phần cứng / Step 1 – Hardware Setup:**
- Gắn micro:bit vào bo mạch Crowtail / *Insert micro:bit into Crowtail breakout board*
- Cắm cảm biến siêu âm vào cổng P1/P2 / *Connect ultrasonic sensor to P1/P2 port*
- Kết nối buzzer vào cổng P0 (chưa dùng ở Activity 1) / *Connect buzzer to P0 (not used in Activity 1)*
- Kết nối USB với máy tính / *Connect USB to computer*

**Bước 2 – Lập trình / Step 2 – Programming:**
- Mở MakeCode tại `makecode.microbit.org` / *Open MakeCode at makecode.microbit.org*
- Thêm extension "sonar" hoặc dùng MicroPython / *Add "sonar" extension or use MicroPython*
- Nhập code Activity 1 / *Enter Activity 1 code*
- Nạp code vào micro:bit / *Flash code to micro:bit*

**Bước 3 – Kiểm tra / Step 3 – Testing:**
- Đặt tay hoặc bìa cứng trước cảm biến / *Place your hand or cardboard in front of the sensor*
- Đọc số hiển thị trên LED / *Read the number displayed on LED*
- Dùng thước kẻ để kiểm tra độ chính xác / *Use a ruler to verify accuracy*

**Bước 4 – Ghi dữ liệu / Step 4 – Record Data:**

| Khoảng cách thực (thước kẻ) / *Actual distance (ruler)* | Khoảng cách hiển thị / *Displayed distance* | Sai số / *Error* |
|---|---|---|
| 5 cm | ___ cm | ___ cm |
| 10 cm | ___ cm | ___ cm |
| 20 cm | ___ cm | ___ cm |
| 50 cm | ___ cm | ___ cm |
| 100 cm | ___ cm | ___ cm |

**Câu hỏi kiểm tra / Check questions:**
1. Khi đặt vật thể ở 10 cm, LED hiển thị bao nhiêu? / *When the object is at 10 cm, what does the LED show?*
2. Sai số lớn nhất bạn đo được là bao nhiêu? / *What was the largest error you measured?*
3. Tại sao kết quả có thể sai lệch một chút? / *Why might the results be slightly off?*

---

## 10. Hoạt Động 2: Cảm Biến Đỗ Xe / Activity 2: Parking Sensor

### Mục tiêu / *Objective:*
Mô phỏng hệ thống cảnh báo đỗ xe ô tô với 3 mức độ cảnh báo khác nhau dựa vào khoảng cách.  
*Simulate a car parking warning system with 3 different alert levels based on distance.*

### Mô tả hệ thống / *System Description:*

```
Khoảng cách / Distance │ Hành động / Action
─────────────────────────────────────────────────────────
> 30 cm (AN TOÀN/SAFE)  │ ✓ LED + Im lặng / Silence
10–30 cm (CẢNH BÁO/WARN)│ ! LED + Buzzer chậm / Slow beep
< 10 cm (NGUY HIỂM/DANG)│ X LED + Buzzer nhanh / Fast beep
```

### Thử nghiệm & Quan sát / *Test & Observe:*

**Thí nghiệm 1 / Experiment 1:** Từ từ đưa tay lại gần cảm biến và quan sát sự thay đổi của LED và buzzer.  
*Slowly bring your hand closer to the sensor and observe the changes in the LED and buzzer.*

**Thí nghiệm 2 / Experiment 2:** Thử với các bề mặt khác nhau:  
*Try with different surfaces:*
- Bề mặt phẳng (bìa cứng) / *Flat surface (cardboard)*
- Bề mặt mềm (khăn vải) / *Soft surface (cloth)*
- Bề mặt nghiêng 45° / *Surface angled at 45°*

Quan sát và ghi lại sự khác biệt. / *Observe and record the differences.*

| Bề mặt / *Surface* | Khoảng cách đo được / *Measured distance* | Nhận xét / *Observation* |
|---|---|---|
| Bìa cứng / Cardboard | ___ cm | |
| Khăn vải / Cloth | ___ cm | |
| Bề mặt nghiêng / Angled | ___ cm | |

---

## 11. Ghi Chú An Toàn / Safety Notes

> **⚠️ AN TOÀN ĐIỆN / ELECTRICAL SAFETY**
> 
> - Không để cảm biến tiếp xúc với nước hoặc độ ẩm cao / *Do not expose the sensor to water or high humidity*
> - Kiểm tra lại kết nối trước khi cấp nguồn / *Double-check connections before powering on*
> - Không kết nối ngược cực nguồn / *Do not reverse power polarity*
> - Chỉ sử dụng nguồn điện 3.3V–5V đúng quy định / *Use only the specified 3.3V–5V power supply*

> **⚠️ AN TOÀN KHI SỬ DỤNG / USAGE SAFETY**
> 
> - Không hướng cảm biến siêu âm vào mắt người trong thời gian dài / *Do not aim the ultrasonic sensor at human eyes for extended periods*
> - Buzzer phát ra âm thanh, không đặt sát tai / *The buzzer emits sound, do not place it close to ears*
> - Giữ dây cáp gọn gàng để tránh vấp ngã / *Keep cables tidy to avoid tripping*
> - Tắt nguồn khi thay đổi kết nối / *Power off when changing connections*

---

## 12. Câu Hỏi Thảo Luận / Discussion Questions

**Câu 1:** Tại sao cảm biến siêu âm không thể đo vật thể ở khoảng cách nhỏ hơn 2 cm?  
*Question 1: Why can't the ultrasonic sensor measure objects at distances less than 2 cm?*

**Câu 2:** Nếu nhiệt độ không khí tăng từ 20°C lên 40°C, kết quả đo khoảng cách sẽ thay đổi như thế nào? Tăng hay giảm?  
*Question 2: If the air temperature increases from 20°C to 40°C, how will the measured distance change? Increase or decrease?*

**Câu 3:** Tại sao cảm biến siêu âm không hoạt động tốt với vải hoặc bề mặt có lỗ? Giải thích bằng kiến thức về sóng âm.  
*Question 3: Why doesn't the ultrasonic sensor work well with fabric or porous surfaces? Explain using knowledge about sound waves.*

**Câu 4:** Trong ô tô thực tế, cần bao nhiêu cảm biến siêu âm để cảnh báo đỗ xe an toàn từ mọi phía? Tại sao?  
*Question 4: In a real car, how many ultrasonic sensors are needed to safely warn about parking from all sides? Why?*

**Câu 5:** So sánh cảm biến siêu âm với cảm biến laser (LiDAR) trong robot tự lái. Ưu điểm và nhược điểm của mỗi loại là gì?  
*Question 5: Compare ultrasonic sensors with laser sensors (LiDAR) in self-driving robots. What are the advantages and disadvantages of each?*

---

## 13. Bảng Đánh Giá / Assessment Rubric

| Tiêu chí / *Criteria* | Xuất sắc (4) / *Excellent (4)* | Tốt (3) / *Good (3)* | Đạt (2) / *Satisfactory (2)* | Cần cải thiện (1) / *Needs Improvement (1)* |
|---|---|---|---|---|
| **Hiểu lý thuyết** / *Theory Understanding* | Giải thích đầy đủ nguyên lý ToF, tốc độ âm, HC-SR04 / *Fully explains ToF principle, sound speed, HC-SR04* | Giải thích được hầu hết, còn thiếu một số chi tiết / *Explains most parts, missing some details* | Hiểu cơ bản, cần gợi ý thêm / *Basic understanding, needs prompting* | Chưa hiểu nguyên lý / *Does not understand the principle* |
| **Kỹ năng lập trình** / *Programming Skills* | Code chạy đúng, có chú thích rõ ràng, xử lý được lỗi / *Code works correctly, well-commented, handles errors* | Code chạy đúng với một vài lỗi nhỏ / *Code works with minor errors* | Code chạy được nhưng thiếu nhiều tính năng / *Code runs but missing many features* | Code không chạy được / *Code does not run* |
| **Tính toán** / *Calculation* | Tính chính xác công thức, giải thích rõ từng bước / *Accurately computes formula, clearly explains each step* | Tính đúng kết quả, giải thích chưa đầy đủ / *Gets correct result, explanation incomplete* | Tính được một phần, có sai sót / *Partial calculation, has errors* | Không tính được / *Cannot calculate* |
| **Thực hành & Sáng tạo** / *Practice & Creativity* | Hoàn thành cả 2 hoạt động, thêm tính năng sáng tạo / *Completes both activities, adds creative features* | Hoàn thành cả 2 hoạt động đúng yêu cầu / *Completes both activities correctly* | Hoàn thành 1 hoạt động / *Completes 1 activity* | Chưa hoàn thành hoạt động nào / *Completes no activities* |

**Thang điểm / *Scoring:*** 13–16: Xuất sắc / *Excellent* | 9–12: Tốt / *Good* | 5–8: Đạt / *Satisfactory* | 4: Cần cải thiện / *Needs Improvement*

---

## 14. Thám Hiểm Thêm / Further Exploration & Challenge

### Thử thách cơ bản / *Basic Challenge:*
Thêm chức năng hiển thị khoảng cách theo mét thay vì cm (chia cho 100).  
*Add a function to display distance in meters instead of cm (divide by 100).*

### Thử thách trung cấp / *Intermediate Challenge:*
Xây dựng hệ thống đo độ sâu của hộp bằng cách đặt cảm biến trên miệng hộp và đo khoảng cách xuống đáy.  
*Build a box depth measurement system by placing the sensor at the opening and measuring down to the bottom.*

### Thử thách nâng cao / *Advanced Challenge:*
Kết hợp 2 cảm biến siêu âm (P1/P2 và P3/P4) để tạo hệ thống cảnh báo phía trước VÀ phía sau giống ô tô thực tế.  
*Combine 2 ultrasonic sensors (P1/P2 and P3/P4) to create a FRONT AND REAR warning system like a real car.*

### Dự án mở rộng / *Extension Project:*
Nghiên cứu về **LiDAR (Light Detection and Ranging)** – công nghệ đo khoảng cách bằng laser được dùng trong xe tự lái. So sánh với siêu âm về độ chính xác, tốc độ đo và chi phí.  
*Research LiDAR (Light Detection and Ranging) – the laser-based distance measurement technology used in self-driving cars. Compare it with ultrasound on accuracy, measurement speed, and cost.*

---

## 15. Từ Vựng / Vocabulary List

| Thuật ngữ / *Term* | Định nghĩa tiếng Việt | *English Definition* |
|---|---|---|
| **Siêu âm** / *Ultrasound* | Sóng âm có tần số > 20.000 Hz, tai người không nghe được | *Sound waves with frequency > 20,000 Hz, inaudible to humans* |
| **Tần số** / *Frequency* | Số dao động trong một giây, đơn vị Hz | *Number of oscillations per second, unit: Hz* |
| **Thời gian bay** / *Time of Flight* | Thời gian sóng đi từ nguồn phát đến vật thể và quay lại | *Time for a wave to travel from emitter to object and back* |
| **Phản xạ âm** / *Sound reflection* | Sóng âm bật lại khi gặp vật thể cứng | *Sound waves bouncing back when hitting a solid object* |
| **TRIG (Trigger)** | Chân phát xung kích hoạt cảm biến siêu âm | *Pin that sends the activation pulse to the ultrasonic sensor* |
| **ECHO** | Chân nhận tín hiệu phản hồi từ cảm biến siêu âm | *Pin that receives the reflected signal from the ultrasonic sensor* |
| **PWM** | Điều chế độ rộng xung – phương pháp điều khiển thiết bị bằng xung | *Pulse Width Modulation – method of controlling devices with pulses* |
| **Micro giây (µs)** / *Microsecond* | Một phần triệu giây (1 µs = 0.000001 s) | *One millionth of a second (1 µs = 0.000001 s)* |
| **HC-SR04** | Model cảm biến siêu âm phổ biến, tầm đo 2–400 cm | *Popular ultrasonic sensor model, range 2–400 cm* |
| **Tốc độ âm thanh** / *Speed of sound* | Tốc độ truyền âm trong không khí ≈ 343 m/s ở 20°C | *Speed of sound transmission in air ≈ 343 m/s at 20°C* |
| **Vùng mù** / *Blind zone* | Khoảng cách dưới 2 cm mà cảm biến không đo được | *Distance below 2 cm that the sensor cannot measure* |
| **LiDAR** | Đo khoảng cách bằng laser – dùng trong xe tự lái | *Laser-based distance measurement – used in self-driving cars* |

---

*© Elecrow Crowtail STEAM Edu Kit Curriculum – Bài 15 / Lesson 15*  
*Được thiết kế cho học sinh lớp 6–12 / Designed for students grades 6–12*
