# Bài 29: Nhà Thông Minh — Lesson 29: Smart Home

---

| | |
|---|---|
| **Cấp độ / Level** | Lớp 6–12 / Grade 6–12 |
| **Thời lượng / Duration** | 90 phút / 90 minutes |
| **Ngôn ngữ / Language** | Tiếng Việt + English (Song ngữ / Bilingual) |
| **Công cụ / Tools** | micro:bit v1/v2, MakeCode, MicroPython |
| **Chủ đề / Topic** | IoT, Tự động hóa / Automation, Hệ thống sự kiện / Event-driven systems |

---

## 1. MỤC TIÊU / OBJECTIVES

Sau bài học này, học sinh có thể: *(After this lesson, students will be able to:)*

1. **Giải thích** khái niệm "nhà thông minh" và các thành phần cảm biến cơ bản.  
   *Explain the concept of a "smart home" and its basic sensor components.*

2. **Kết nối và sử dụng** cảm biến chạm (Touch Sensor) để bật/tắt thiết bị điện.  
   *Connect and use a Touch Sensor to toggle electronic devices on and off.*

3. **Lập trình** phản hồi theo mức âm thanh từ Sound Sensor để kích hoạt báo động.  
   *Program a sound-level response using a Sound Sensor to trigger an alarm.*

4. **Điều khiển servo** SG90 để mô phỏng cửa tự động mở/đóng theo lệnh hoặc sự kiện.  
   *Control an SG90 servo to simulate an automatic door that opens/closes on command or event.*

5. **Tích hợp nhiều cảm biến** vào một hệ thống duy nhất, xử lý các sự kiện song song.  
   *Integrate multiple sensors into a single system, handling events concurrently.*

6. **Thiết kế chế độ ban đêm** (Night Mode) với ngưỡng cảm biến thích nghi.  
   *Design a Night Mode with adaptive sensor thresholds.*

7. **Hiển thị trạng thái** nhà thông minh lên LED matrix của micro:bit.  
   *Display smart home status on the micro:bit LED matrix.*

8. **Phân tích và gỡ lỗi** chương trình đa cảm biến trong môi trường thực tế.  
   *Analyze and debug a multi-sensor program in a real-world environment.*

---

## 2. THIẾT BỊ / COMPONENTS

| Thiết bị / Device | Số lượng / Qty | Mô tả / Description |
|---|---|---|
| BBC micro:bit v1/v2 | 1 | Vi điều khiển chính / Main microcontroller |
| Crowtail Touch Sensor | 1 | Cảm biến chạm điện dung / Capacitive touch sensor |
| Crowtail Sound Sensor | 1 | Cảm biến mức âm thanh tương tự / Analog sound level sensor |
| Servo motor SG90 | 1 | Động cơ servo 0°–180° / 0°–180° servo motor |
| Crowtail LED Module | 1 | Đèn LED điều khiển số / Digital-controlled LED light |
| Buzzer (active) | 1 | Còi báo động chủ động / Active buzzer for alarm |
| Cáp USB / USB Cable | 1 | Nạp chương trình & cấp nguồn / Programming & power |
| Hộp pin / Battery Pack | 1 | 3×AA (4.5 V) cấp nguồn độc lập / Standalone power supply |
| Dây cắm / Jumper Wires | ≥ 8 | Kết nối các module / Connecting modules |
| Breadboard (tùy chọn) | 1 | Để cắm thử mạch / Optional prototyping board |

---

## 3. LÝ THUYẾT / THEORY

### 3.1 Nhà thông minh là gì? / What is a Smart Home?

**Tiếng Việt:**  
Nhà thông minh *(Smart Home)* là ngôi nhà sử dụng các thiết bị điện tử, cảm biến và mạng truyền thông để tự động hóa các chức năng sinh hoạt như ánh sáng, an ninh, điều hòa và giải trí. Các hệ thống này thường hoạt động theo mô hình **sự kiện–phản hồi** *(event–response)*: khi có sự kiện xảy ra (ví dụ: có tiếng động, có người chạm cảm biến), hệ thống tự động phản ứng mà không cần con người can thiệp trực tiếp.

**English:**  
A smart home uses electronic devices, sensors, and communication networks to automate household functions such as lighting, security, climate control, and entertainment. These systems typically follow an **event–response** model: when an event occurs (e.g., a noise is detected, a sensor is touched), the system reacts automatically without direct human intervention. Modern smart homes integrate platforms such as Google Home, Amazon Alexa, and Apple HomeKit to unify control through voice or mobile apps.

---

### 3.2 Cảm biến chạm (Touch Sensor) / Touch Sensor

**Tiếng Việt:**  
Cảm biến chạm điện dung *(capacitive touch sensor)* phát hiện sự thay đổi điện trường do ngón tay người tạo ra. Khi chạm vào bề mặt cảm biến, tụ điện bên trong thay đổi điện dung, mạch xử lý tín hiệu chuyển đổi điều này thành tín hiệu số HIGH (1). Cảm biến Crowtail Touch cho ra tín hiệu số: **0** = không chạm, **1** = đang chạm.

**English:**  
A capacitive touch sensor detects changes in the electric field caused by a human finger. When the sensor surface is touched, the internal capacitor changes its capacitance, and the signal processing circuit converts this into a HIGH (1) digital signal. The Crowtail Touch Sensor outputs a digital signal: **0** = not touched, **1** = touched.

> **Ứng dụng thực tế / Real-world application:** Màn hình điện thoại thông minh, bàn phím cảm ứng, công tắc đèn thông minh.  
> *Smartphone screens, touch keypads, smart light switches.*

---

### 3.3 Cảm biến âm thanh (Sound Sensor) / Sound Sensor

**Tiếng Việt:**  
Cảm biến âm thanh sử dụng microphone điện tử để chuyển đổi sóng âm thanh thành tín hiệu điện tương tự. Mức tín hiệu ra (0–1023 trên micro:bit) tương ứng với cường độ âm thanh môi trường. Người lập trình đặt một **ngưỡng** *(threshold)* — nếu giá trị đọc vượt ngưỡng, hệ thống kích hoạt hành động tương ứng (ví dụ: bật còi báo động).

**English:**  
A sound sensor uses an electret microphone to convert sound waves into an analog electrical signal. The output level (0–1023 on micro:bit) corresponds to the ambient sound intensity. The programmer sets a **threshold** — if the read value exceeds it, the system triggers a corresponding action (e.g., activating an alarm buzzer).

> **Lưu ý kỹ thuật / Technical note:** Ngưỡng cần được hiệu chỉnh *(calibrated)* theo môi trường. Trong phòng yên tĩnh, giá trị nền *(baseline)* thường là 400–500; tiếng vỗ tay mạnh có thể đạt 800–1000.

---

### 3.4 Điều khiển Servo làm cửa tự động / Servo as Automatic Door

**Tiếng Việt:**  
Servo SG90 là loại động cơ nhỏ có thể quay đến góc chỉ định (0°–180°) với độ chính xác cao. micro:bit điều khiển servo bằng tín hiệu **PWM** *(Pulse Width Modulation)*:
- Chu kỳ xung: **20ms** (tần số 50 Hz)
- Độ rộng xung: **0.5ms** = 0°, **1.5ms** = 90°, **2.5ms** = 180°

Trong mô hình nhà thông minh, servo 0° = cửa đóng, servo 90° = cửa mở một phần, servo 180° = cửa mở hoàn toàn.

**English:**  
The SG90 servo is a small motor that can rotate to a specified angle (0°–180°) with high precision. The micro:bit controls servos using **PWM** *(Pulse Width Modulation)* signals:
- Pulse period: **20ms** (50 Hz frequency)
- Pulse width: **0.5ms** = 0°, **1.5ms** = 90°, **2.5ms** = 180°

In the smart home model: servo 0° = door closed, servo 90° = door half-open, servo 180° = door fully open.

```
PWM Signal:
|‾‾|_________________|‾‾‾‾|________________|
 0.5ms     19.5ms     1.5ms    18.5ms
  0°                  90°
```

---

### 3.5 Tích hợp nhiều cảm biến / Multi-Sensor Integration

**Tiếng Việt:**  
Trong một hệ thống nhà thông minh, nhiều cảm biến hoạt động đồng thời trong một **vòng lặp chính** *(main loop)*. Mỗi vòng lặp, vi điều khiển:
1. Đọc tất cả giá trị cảm biến.
2. Kiểm tra điều kiện cho từng cảm biến.
3. Thực hiện hành động tương ứng.
4. Cập nhật màn hình hiển thị.
5. Chờ một khoảng thời gian ngắn rồi lặp lại.

**English:**  
In a smart home system, multiple sensors operate simultaneously within a **main loop**. Each loop iteration, the microcontroller:
1. Reads all sensor values.
2. Checks conditions for each sensor.
3. Executes corresponding actions.
4. Updates the display.
5. Waits briefly, then repeats.

> **Thách thức / Challenge:** Khi nhiều sự kiện xảy ra cùng lúc (tiếng ồn lớn + cảm biến chạm + nhấn nút), hệ thống phải ưu tiên xử lý theo thứ tự hợp lý.  
> *When multiple events occur simultaneously (loud noise + touch + button press), the system must prioritize processing in a logical order.*

---

### 3.6 Hệ thống Sự kiện (Event-Driven) / Event-Driven Systems

**Tiếng Việt:**  
Lập trình hướng sự kiện *(event-driven programming)* là mô hình lập trình trong đó luồng chương trình được quyết định bởi các sự kiện bên ngoài như nhấn nút, cảm biến kích hoạt, hoặc hết giờ. Đây là nền tảng của hầu hết các hệ thống nhúng và IoT hiện đại.

**English:**  
Event-driven programming is a paradigm in which the program's flow is determined by external events such as button presses, sensor triggers, or timer expirations. This is the foundation of most modern embedded systems and IoT devices.

| Mô hình / Model | Mô tả / Description | Ví dụ / Example |
|---|---|---|
| Polling (tuần hoàn) | Liên tục kiểm tra trạng thái / Continuously checks state | `while True: read_sensor()` |
| Interrupt (ngắt) | Phần cứng kích hoạt hàm / Hardware triggers function | Nút nhấn ngắt IRQ / Button IRQ |
| Event Queue (hàng đợi sự kiện) | Sự kiện được xếp hàng xử lý / Events queued for processing | RTOS, MicroPython asyncio |

---

## 4. THỰC HÀNH / HANDS-ON PRACTICE

### Sơ đồ kết nối / Wiring Diagram

```
micro:bit Pin  →  Module
─────────────────────────────────────────
Pin 0 (PWM)    →  Servo SG90 (Signal/Orange)
Pin 1 (Digital)→  Touch Sensor (SIG)
Pin 2 (Analog) →  Sound Sensor (SIG)
Pin 3 (Digital)→  LED Module (SIG)
Pin 4 (Digital)→  Buzzer (+)
3V             →  VCC tất cả module / VCC all modules
GND            →  GND tất cả module / GND all modules
```

> ⚠️ **Lưu ý nguồn điện / Power Warning:** Servo SG90 tiêu thụ đến 250mA khi hoạt động. Nên sử dụng hộp pin riêng cho servo và nối chung GND với micro:bit.  
> *The SG90 servo draws up to 250mA when operating. Use a separate battery pack for the servo and share GND with the micro:bit.*

---

### Bước 1: Cảm biến chạm → Bật/tắt Đèn LED / Step 1: Touch Sensor → Toggle LED

**Mục tiêu / Goal:** Khi chạm vào Touch Sensor, đèn LED bật/tắt xen kẽ.  
*When the Touch Sensor is touched, the LED toggles on/off alternately.*

**Giải thích / Explanation:**
- Đọc tín hiệu số từ Pin 1.
- Dùng biến `led_on` để theo dõi trạng thái đèn.
- Thêm delay 300ms để tránh đọc nhiều lần trong một lần chạm *(debounce)*.

```python
from microbit import *

LED_PIN = pin3
TOUCH_PIN = pin1
led_on = False

while True:
    if TOUCH_PIN.read_digital() == 1:
        led_on = not led_on
        LED_PIN.write_digital(1 if led_on else 0)
        if led_on:
            display.show(Image.HAPPY)
        else:
            display.show(Image.ASLEEP)
        sleep(300)  # Debounce / Chống rung
    sleep(50)
```

**Quan sát / Observe:**
- Chạm nhẹ → Đèn bật, hiển thị 😊
- Chạm lần 2 → Đèn tắt, hiển thị 😴

---

### Bước 2: Tiếng ồn lớn → Báo động / Step 2: Loud Sound → Alarm

**Mục tiêu / Goal:** Khi tiếng ồn vượt ngưỡng, còi báo động kêu 2 lần.  
*When noise exceeds the threshold, the buzzer sounds twice.*

```python
from microbit import *

SOUND_PIN = pin2
BUZZER_PIN = pin4
SOUND_THRESHOLD = 700

while True:
    sound_level = SOUND_PIN.read_analog()
    # Hiển thị mức âm thanh lên Serial / Display sound level to Serial
    print("Sound:", sound_level)
    
    if sound_level > SOUND_THRESHOLD:
        display.show(Image.SURPRISED)
        for _ in range(2):
            BUZZER_PIN.write_digital(1)
            sleep(300)
            BUZZER_PIN.write_digital(0)
            sleep(200)
        display.clear()
    sleep(100)
```

**Thử nghiệm / Test:**
1. Chạy chương trình và mở Serial Monitor.
2. Quan sát giá trị Sound Level trong phòng yên tĩnh (baseline).
3. Vỗ tay gần cảm biến → còi kêu + màn hình hiện 😲.
4. Điều chỉnh `SOUND_THRESHOLD` cho phù hợp với môi trường.

---

### Bước 3: Servo điều khiển cửa / Step 3: Servo Door Control

**Mục tiêu / Goal:** Nhấn nút A mở cửa, nút B đóng cửa.  
*Press button A to open the door, button B to close it.*

```python
from microbit import *

SERVO_PIN = pin0

def set_servo_angle(angle):
    """
    Chuyển góc (0-180) sang tín hiệu PWM / Convert angle (0-180) to PWM
    Pulse width: 500µs (0°) → 2500µs (180°)
    Period: 20000µs (50Hz)
    """
    pulse_us = 500 + int(angle * 2000 / 180)
    duty = int(pulse_us * 1023 / 20000)
    SERVO_PIN.set_analog_period(20)  # 20ms period = 50Hz
    SERVO_PIN.write_analog(duty)

def open_door():
    set_servo_angle(90)
    display.show(Image.ARROW_E)
    sleep(500)
    display.scroll("OPEN", delay=80)

def close_door():
    set_servo_angle(0)
    display.show(Image.ARROW_W)
    sleep(500)
    display.scroll("CLOSE", delay=80)

# Khởi động: đảm bảo cửa đóng / Startup: ensure door is closed
close_door()
sleep(1000)

while True:
    if button_a.was_pressed():
        open_door()
    if button_b.was_pressed():
        close_door()
    sleep(100)
```

**Kiểm tra / Check:**
- Servo quay từ từ khi nhấn nút.
- Nếu servo giật hoặc không quay đúng: kiểm tra nguồn điện và kết nối GND chung.

---

### Bước 4: Kết hợp tất cả cảm biến / Step 4: Combine All Sensors

**Mục tiêu / Goal:** Hệ thống nhà thông minh cơ bản hoạt động đầy đủ.  
*A complete basic smart home system.*

```python
from microbit import *

# Cấu hình chân / Pin configuration
TOUCH_PIN  = pin1
SOUND_PIN  = pin2
LED_PIN    = pin3
SERVO_PIN  = pin0
BUZZER_PIN = pin4

SOUND_THRESHOLD = 700
led_on    = False
door_open = False

def set_servo_angle(angle):
    pulse_us = 500 + int(angle * 2000 / 180)
    duty = int(pulse_us * 1023 / 20000)
    SERVO_PIN.set_analog_period(20)
    SERVO_PIN.write_analog(duty)

def open_door():
    global door_open
    door_open = True
    set_servo_angle(90)
    display.show(Image.ARROW_E)

def close_door():
    global door_open
    door_open = False
    set_servo_angle(0)
    display.show(Image.ARROW_W)

# Khởi động / Startup
close_door()
LED_PIN.write_digital(0)
sleep(1000)
display.scroll("HOME", delay=80)

while True:
    # --- Cảm biến chạm: bật/tắt đèn / Touch: toggle light ---
    if TOUCH_PIN.read_digital() == 1:
        led_on = not led_on
        LED_PIN.write_digital(1 if led_on else 0)
        sleep(300)

    # --- Cảm biến âm thanh: báo động / Sound: alarm ---
    sound_level = SOUND_PIN.read_analog()
    if sound_level > SOUND_THRESHOLD:
        BUZZER_PIN.write_digital(1)
        display.show(Image.SURPRISED)
        sleep(500)
        BUZZER_PIN.write_digital(0)
        display.clear()

    # --- Nút A: mở cửa / Button A: open door ---
    if button_a.was_pressed():
        open_door()

    # --- Nút B: đóng cửa / Button B: close door ---
    if button_b.was_pressed():
        close_door()

    sleep(100)
```

---

### Bước 5: Thêm chế độ ban đêm / Step 5: Add Night Mode

**Mục tiêu / Goal:** Nhấn A+B cùng lúc để bật/tắt chế độ ban đêm. Ở chế độ ban đêm, ngưỡng âm thanh thấp hơn và đèn LED tắt tự động.  
*Press A+B simultaneously to toggle Night Mode. In Night Mode, the sound threshold is lower and the LED turns off automatically.*

```python
from microbit import *

TOUCH_PIN  = pin1
SOUND_PIN  = pin2
LED_PIN    = pin3
SERVO_PIN  = pin0
BUZZER_PIN = pin4

SOUND_THRESHOLD_DAY   = 700
SOUND_THRESHOLD_NIGHT = 400

led_on     = False
door_open  = False
night_mode = False

def set_servo_angle(angle):
    pulse_us = 500 + int(angle * 2000 / 180)
    duty = int(pulse_us * 1023 / 20000)
    SERVO_PIN.set_analog_period(20)
    SERVO_PIN.write_analog(duty)

def open_door():
    global door_open
    door_open = True
    set_servo_angle(90)

def close_door():
    global door_open
    door_open = False
    set_servo_angle(0)

def show_status():
    """Hiển thị trạng thái / Display status"""
    if night_mode:
        display.show(Image.ASLEEP)
    elif led_on and door_open:
        display.show(Image.HAPPY)
    elif led_on:
        display.show("L")
    elif door_open:
        display.show("D")
    else:
        display.show(Image.SQUARE_SMALL)

# Khởi động / Startup
close_door()
LED_PIN.write_digital(0)
display.scroll("HOME v2", delay=80)

while True:
    threshold = SOUND_THRESHOLD_NIGHT if night_mode else SOUND_THRESHOLD_DAY

    # Bật/tắt chế độ ban đêm / Toggle night mode (A + B)
    if button_a.is_pressed() and button_b.is_pressed():
        night_mode = not night_mode
        if night_mode:
            led_on = False
            LED_PIN.write_digital(0)
            display.scroll("NIGHT", delay=80)
        else:
            display.scroll("DAY", delay=80)
        sleep(800)

    # Cảm biến chạm / Touch sensor (chỉ hoạt động ban ngày / day only)
    elif not night_mode and TOUCH_PIN.read_digital() == 1:
        led_on = not led_on
        LED_PIN.write_digital(1 if led_on else 0)
        sleep(300)

    # Cảm biến âm thanh / Sound sensor
    sound_level = SOUND_PIN.read_analog()
    if sound_level > threshold:
        BUZZER_PIN.write_digital(1)
        display.show(Image.SURPRISED)
        sleep(500)
        BUZZER_PIN.write_digital(0)

    # Nút A: mở cửa / Button A: open door
    if button_a.was_pressed() and not button_b.is_pressed():
        open_door()

    # Nút B: đóng cửa / Button B: close door
    if button_b.was_pressed() and not button_a.is_pressed():
        close_door()

    show_status()
    sleep(100)
```

---

### Bước 6: Hiển thị trạng thái nhà lên LED / Step 6: Display Home Status on LED

**Mục tiêu / Goal:** Thiết kế hình ảnh LED tùy chỉnh biểu thị trạng thái đầy đủ của ngôi nhà.  
*Design custom LED images representing the full state of the home.*

```python
from microbit import *

# Hình ảnh tùy chỉnh / Custom images
HOME_ICON = Image(
    "09090:"
    "09990:"
    "99999:"
    "09090:"
    "09090"
)

DOOR_OPEN_ICON = Image(
    "99999:"
    "90009:"
    "90009:"
    "90009:"
    "99999"
)

ALARM_ICON = Image(
    "09990:"
    "99999:"
    "90909:"
    "99999:"
    "09990"
)

NIGHT_ICON = Image(
    "00099:"
    "00990:"
    "09900:"
    "99000:"
    "09090"
)

def show_home_status(led_on, door_open, night_mode, alarm):
    """Hiển thị hình ảnh phù hợp / Show appropriate image"""
    if alarm:
        display.show(ALARM_ICON)
    elif night_mode:
        display.show(NIGHT_ICON)
    elif door_open:
        display.show(DOOR_OPEN_ICON)
    else:
        display.show(HOME_ICON)

# Kiểm tra từng hình ảnh / Test each image
images = [HOME_ICON, DOOR_OPEN_ICON, ALARM_ICON, NIGHT_ICON]
labels = ["HOME", "DOOR", "ALARM", "NIGHT"]

for img, label in zip(images, labels):
    display.scroll(label, delay=80)
    display.show(img)
    sleep(1500)
```

---

## 5. CHƯƠNG TRÌNH TÍCH HỢP ĐẦY ĐỦ / COMPLETE INTEGRATED PROGRAM

### MicroPython — Smart Home v3.0

```python
from microbit import *

# ══════════════════════════════════════════════════════
#  BÀI 29: NHÀ THÔNG MINH / LESSON 29: SMART HOME
#  micro:bit MicroPython v3.0
#  Tác giả / Author: STEM Lab
# ══════════════════════════════════════════════════════

# ── Cấu hình chân / Pin configuration ─────────────────
TOUCH_PIN  = pin1    # Cảm biến chạm / Touch sensor
SOUND_PIN  = pin2    # Cảm biến âm thanh / Sound sensor
LED_PIN    = pin3    # Đèn LED / LED light
SERVO_PIN  = pin0    # Servo cửa / Door servo
BUZZER_PIN = pin4    # Còi / Buzzer

# ── Ngưỡng & hằng số / Thresholds & constants ─────────
SOUND_THRESHOLD_DAY   = 700   # Ngưỡng ban ngày / Daytime threshold
SOUND_THRESHOLD_NIGHT = 400   # Ngưỡng ban đêm / Nighttime threshold
DOOR_AUTO_CLOSE_MS    = 5000  # Tự đóng sau 5 giây / Auto-close after 5s

# ── Trạng thái hệ thống / System state ────────────────
led_on       = False
door_open    = False
night_mode   = False
alarm_active = False
door_opened_at = 0    # Thời điểm cửa mở / Time door was opened

# ── Hình ảnh LED tùy chỉnh / Custom LED images ────────
HOME_ICON = Image(
    "09090:"
    "09990:"
    "99999:"
    "09090:"
    "09090"
)
DOOR_OPEN_ICON = Image(
    "99999:"
    "90009:"
    "90009:"
    "90009:"
    "99999"
)
ALARM_ICON = Image(
    "09990:"
    "99999:"
    "90909:"
    "99999:"
    "09990"
)
NIGHT_ICON = Image(
    "00099:"
    "00990:"
    "09900:"
    "99000:"
    "09090"
)

# ══════════════════════════════════════════════════════
#  HÀM SERVO / SERVO FUNCTIONS
# ══════════════════════════════════════════════════════

def set_servo_angle(angle):
    """
    Điều khiển servo theo góc (0–180°)
    Control servo by angle (0–180°)
    """
    angle = max(0, min(180, angle))          # Giới hạn / Clamp
    pulse_us = 500 + int(angle * 2000 / 180) # µs pulse width
    duty = int(pulse_us * 1023 / 20000)      # 10-bit duty cycle
    SERVO_PIN.set_analog_period(20)           # 50 Hz PWM
    SERVO_PIN.write_analog(duty)

def open_door():
    """Mở cửa / Open door"""
    global door_open, door_opened_at
    door_open = True
    door_opened_at = running_time()
    set_servo_angle(90)

def close_door():
    """Đóng cửa / Close door"""
    global door_open
    door_open = False
    set_servo_angle(0)

# ══════════════════════════════════════════════════════
#  HÀM HIỂN THỊ / DISPLAY FUNCTIONS
# ══════════════════════════════════════════════════════

def show_status():
    """
    Hiển thị trạng thái hệ thống lên LED matrix
    Display system status on LED matrix
    """
    if alarm_active:
        display.show(ALARM_ICON)
    elif night_mode:
        display.show(NIGHT_ICON)
    elif door_open:
        display.show(DOOR_OPEN_ICON)
    else:
        display.show(HOME_ICON)

def trigger_alarm():
    """
    Kích hoạt báo động / Trigger alarm
    Còi 2 tiếng + hiển thị cảnh báo
    """
    global alarm_active
    alarm_active = True
    for _ in range(2):
        BUZZER_PIN.write_digital(1)
        display.show(ALARM_ICON)
        sleep(300)
        BUZZER_PIN.write_digital(0)
        sleep(200)
    alarm_active = False

# ══════════════════════════════════════════════════════
#  KHỞI ĐỘNG HỆ THỐNG / SYSTEM STARTUP
# ══════════════════════════════════════════════════════

display.scroll("HOME", delay=70)
close_door()
LED_PIN.write_digital(0)
BUZZER_PIN.write_digital(0)
show_status()
sleep(500)

# ══════════════════════════════════════════════════════
#  VÒNG LẶP CHÍNH / MAIN LOOP
# ══════════════════════════════════════════════════════

while True:
    current_time = running_time()
    threshold = SOUND_THRESHOLD_NIGHT if night_mode else SOUND_THRESHOLD_DAY

    # ── 1. Kiểm tra A+B: chuyển chế độ đêm/ngày ────────
    #    Check A+B: toggle night/day mode
    if button_a.is_pressed() and button_b.is_pressed():
        night_mode = not night_mode
        if night_mode:
            # Ban đêm: tắt đèn, đóng cửa / Night: lights off, door closed
            led_on = False
            LED_PIN.write_digital(0)
            close_door()
            display.scroll("NIGHT", delay=70)
        else:
            display.scroll("DAY", delay=70)
        sleep(900)  # Tránh đọc hai sự kiện liên tiếp / Prevent double-trigger
        continue

    # ── 2. Cảm biến chạm: bật/tắt đèn ──────────────────
    #    Touch sensor: toggle LED (disabled in night mode)
    if TOUCH_PIN.read_digital() == 1:
        if not night_mode:
            led_on = not led_on
            LED_PIN.write_digital(1 if led_on else 0)
        sleep(300)  # Debounce

    # ── 3. Cảm biến âm thanh: báo động ──────────────────
    #    Sound sensor: alarm
    sound_level = SOUND_PIN.read_analog()
    if sound_level > threshold and not alarm_active:
        trigger_alarm()

    # ── 4. Nút A: mở cửa (chỉ khi không nhấn B) ─────────
    #    Button A: open door (only when B is not pressed)
    if button_a.was_pressed() and not button_b.is_pressed():
        open_door()

    # ── 5. Nút B: đóng cửa (chỉ khi không nhấn A) ───────
    #    Button B: close door (only when A is not pressed)
    if button_b.was_pressed() and not button_a.is_pressed():
        close_door()

    # ── 6. Tự động đóng cửa sau 5 giây ─────────────────
    #    Auto-close door after 5 seconds
    if door_open and (current_time - door_opened_at) > DOOR_AUTO_CLOSE_MS:
        close_door()
        display.scroll("AUTO", delay=70)

    # ── 7. Cập nhật hiển thị / Update display ─────────
    show_status()
    sleep(100)
```

---

## 6. MAKECODE — MÔ TẢ KHỐI LỆNH / BLOCK DESCRIPTION

Để lập trình bằng MakeCode (giao diện khối / block interface):

| Khối MakeCode / MakeCode Block | Chức năng / Function |
|---|---|
| `on start` | Khởi tạo biến, hiển thị "HOME", đóng servo | 
| `forever` | Vòng lặp chính kiểm tra tất cả cảm biến |
| `digital read pin P1` | Đọc tín hiệu Touch Sensor |
| `analog read pin P2` | Đọc mức âm thanh Sound Sensor |
| `digital write pin P3` | Bật/tắt đèn LED |
| `digital write pin P4` | Bật/tắt còi Buzzer |
| `analog set period pin P0 ms 20` + `analog write pin P0` | Điều khiển servo PWM |
| `on button A pressed` | Mở cửa |
| `on button B pressed` | Đóng cửa |
| `if ... then ... else` | Kiểm tra ngưỡng âm thanh |
| `show leds` | Hiển thị hình ảnh trạng thái |

**Gợi ý cấu trúc MakeCode / Suggested MakeCode structure:**

```
[on start]
  set led_on = false
  set door_open = false
  set night_mode = false
  servo P0 → 0°
  digital write P3 → 0
  show string "HOME"

[forever]
  if digital read P1 = 1 then
    toggle led_on
    digital write P3 = led_on
    pause 300ms
  
  if analog read P2 > 700 then
    digital write P4 = 1
    show icon "surprised"
    pause 500ms
    digital write P4 = 0

[on button A]
  servo P0 → 90°
  show arrow East

[on button B]
  servo P0 → 0°
  show arrow West
```

---

## 7. MỞ RỘNG / EXTENSION ACTIVITIES

### 7.1 Hẹn giờ tự đóng cửa / Auto-Close Door Timer

Trong chương trình tích hợp ở trên, biến `door_opened_at` lưu thời điểm cửa mở (`running_time()`). Mỗi vòng lặp kiểm tra nếu thời gian đã trôi qua vượt `DOOR_AUTO_CLOSE_MS` (5000ms = 5 giây) thì tự đóng cửa.

*In the integrated program above, `door_opened_at` stores the time the door opened (`running_time()`). Each loop checks if elapsed time exceeds `DOOR_AUTO_CLOSE_MS` (5000ms = 5 seconds) and auto-closes the door.*

**Thay đổi thời gian / Change timing:**
```python
DOOR_AUTO_CLOSE_MS = 3000   # 3 giây / 3 seconds
DOOR_AUTO_CLOSE_MS = 10000  # 10 giây / 10 seconds
```

### 7.2 Chế độ ban đêm thích nghi / Adaptive Night Mode

Cải tiến: Tự động phát hiện "ban đêm" dựa trên đồng hồ hoặc cảm biến ánh sáng.  
*Enhancement: Automatically detect "night" based on a clock or light sensor.*

```python
# Giả sử có cảm biến ánh sáng ở pin5 / Assume light sensor at pin5
LIGHT_PIN = pin5
LIGHT_THRESHOLD = 200  # Dưới 200 = tối / Below 200 = dark

# Trong vòng lặp / In the loop:
light_level = LIGHT_PIN.read_analog()
if light_level < LIGHT_THRESHOLD and not night_mode:
    night_mode = True
    display.scroll("AUTO NIGHT", delay=70)
elif light_level >= LIGHT_THRESHOLD and night_mode:
    night_mode = False
    display.scroll("AUTO DAY", delay=70)
```

### 7.3 Bộ đếm sự kiện / Event Counter

Đếm số lần báo động được kích hoạt trong một phiên:  
*Count the number of alarm triggers in a session:*

```python
alarm_count = 0

# Trong hàm trigger_alarm / In trigger_alarm():
alarm_count += 1
print("Alarm #", alarm_count)  # Xem trên Serial / View on Serial

# Hiển thị khi nhấn A+B dài / Display on long A+B press:
display.scroll("ALARMS: " + str(alarm_count), delay=70)
```

---

## 8. CÂU HỎI THẢO LUẬN / DISCUSSION QUESTIONS

1. **[VN]** Tại sao chúng ta cần thêm delay 300ms sau khi đọc cảm biến chạm? Điều gì xảy ra nếu không có delay này?  
   **[EN]** Why do we need a 300ms delay after reading the touch sensor? What happens if we remove this delay?

2. **[VN]** Giải thích sự khác biệt giữa tín hiệu **số (digital)** và tín hiệu **tương tự (analog)**. Cảm biến nào trong bài này dùng tín hiệu số, cảm biến nào dùng tín hiệu tương tự? Tại sao?  
   **[EN]** Explain the difference between **digital** and **analog** signals. Which sensors in this lesson use digital signals, and which use analog? Why?

3. **[VN]** Trong thực tế, nhà thông minh sử dụng Wi-Fi và điện toán đám mây. Hãy mô tả cách micro:bit có thể được kết nối với Internet thông qua module mở rộng để gửi cảnh báo đến điện thoại.  
   **[EN]** In real life, smart homes use Wi-Fi and cloud computing. Describe how a micro:bit could be connected to the Internet through an extension module to send alerts to a smartphone.

4. **[VN]** Nếu cả Touch Sensor và Sound Sensor cùng kích hoạt trong một vòng lặp, hệ thống xử lý theo thứ tự nào? Điều này có thể gây ra vấn đề gì không?  
   **[EN]** If both the Touch Sensor and Sound Sensor trigger in the same loop iteration, in what order does the system process them? Could this cause any problems?

5. **[VN]** Thiết kế một sơ đồ trạng thái *(state diagram)* cho hệ thống nhà thông minh này, liệt kê tất cả các trạng thái có thể và điều kiện chuyển đổi giữa chúng.  
   **[EN]** Design a **state diagram** for this smart home system, listing all possible states and the transition conditions between them.

---

## 9. BÀI TẬP VỀ NHÀ / HOMEWORK

### Bài tập bắt buộc / Required Assignment

**[VN]** Dựa trên chương trình tích hợp đã hoàn thiện, hãy:
1. Thêm chức năng **ghi lại nhật ký** sự kiện: mỗi khi báo động kêu, lưu thời điểm (`running_time()`) vào một danh sách.
2. Khi nhấn **A + B giữ 2 giây**, hiển thị tổng số lần báo động lên LED matrix.
3. Viết mô tả bằng tiếng Việt giải thích cách hoạt động của chương trình mở rộng này.

**[EN]** Based on the completed integrated program:
1. Add an **event logging** feature: each time the alarm triggers, store the timestamp (`running_time()`) in a list.
2. When **A + B are held for 2 seconds**, display the total alarm count on the LED matrix.
3. Write a description in English explaining how this extended program works.

### Bài tập nâng cao / Advanced Assignment (Tùy chọn / Optional)

**[VN]** Thiết kế và xây dựng mô hình nhà thông minh 3D bằng bìa cứng hoặc que kem. Tích hợp toàn bộ hệ thống vào mô hình: cửa servo, đèn LED chiếu sáng phòng, còi báo động. Quay video trình bày và giải thích cách hoạt động.

**[EN]** Design and build a 3D smart home model using cardboard or popsicle sticks. Integrate the full system into the model: servo door, LED room lighting, alarm buzzer. Record a video demonstrating and explaining how it works.

---

## 10. BẢNG ĐÁNH GIÁ / ASSESSMENT RUBRIC

| Tiêu chí / Criteria | Xuất sắc (4) / Excellent | Đạt (3) / Proficient | Cần cải thiện (2) / Developing | Chưa đạt (1) / Beginning |
|---|---|---|---|---|
| **Kết nối phần cứng / Hardware wiring** | Kết nối chính xác tất cả module, chú thích rõ ràng | Kết nối đúng, ít lỗi nhỏ | Kết nối 3/5 module đúng | Không kết nối được |
| **Lập trình Touch Sensor / Touch programming** | Toggle LED hoạt động, có debounce | Toggle hoạt động, không có debounce | Đọc được cảm biến nhưng logic sai | Không đọc được |
| **Lập trình Sound Sensor / Sound programming** | Ngưỡng hiệu chỉnh đúng, còi hoạt động | Còi hoạt động, ngưỡng chưa tối ưu | Đọc được giá trị analog | Không đọc được |
| **Điều khiển Servo / Servo control** | Servo mở/đóng chính xác, tự động đóng | Servo mở/đóng theo nút | Servo quay nhưng góc không đúng | Servo không phản hồi |
| **Tích hợp đa cảm biến / Multi-sensor integration** | Tất cả cảm biến hoạt động đồng thời, không xung đột | 4/5 chức năng hoạt động | 2–3 chức năng hoạt động | Chỉ 1 chức năng hoạt động |
| **Chế độ ban đêm / Night mode** | Night Mode hoạt động đầy đủ, ngưỡng thích nghi | Night Mode hoạt động cơ bản | Toggle Night Mode nhưng không thay đổi hành vi | Không có Night Mode |
| **Hiển thị trạng thái / Status display** | Hình ảnh tùy chỉnh rõ ràng, phản ánh đúng trạng thái | Dùng icon mặc định, đúng trạng thái | Hiển thị đôi khi đúng | Không hiển thị trạng thái |
| **Giải thích & thuyết trình / Explanation** | Giải thích rõ ràng, dùng thuật ngữ kỹ thuật đúng | Giải thích được, đôi khi dùng sai thuật ngữ | Mô tả cơ bản, thiếu thuật ngữ kỹ thuật | Không giải thích được |

**Thang điểm / Scoring:**
- 29–32 điểm: **Xuất sắc / Excellent** ⭐⭐⭐⭐
- 22–28 điểm: **Đạt / Proficient** ⭐⭐⭐
- 14–21 điểm: **Cần cải thiện / Developing** ⭐⭐
- < 14 điểm: **Cần hỗ trợ thêm / Needs support** ⭐

---

## 11. TÀI LIỆU THAM KHẢO / REFERENCES

- [micro:bit MicroPython Documentation](https://microbit-micropython.readthedocs.io/)
- [Crowtail Touch Sensor Datasheet](https://www.elecrow.com/crowtail-touch-sensor.html)
- [SG90 Servo Datasheet](https://components101.com/motors/servo-motor-basics-pinout-datasheet)
- [Smart Home IoT Concepts — IEEE](https://www.ieee.org/publications/index.html)
- [MakeCode for micro:bit](https://makecode.microbit.org/)

---

*Bài 29 — Nhà Thông Minh | Lesson 29 — Smart Home*  
*Chương trình STEM micro:bit | micro:bit STEM Curriculum*  
*Cấp độ: Lớp 6–12 | Level: Grade 6–12 | Thời lượng: 90 phút / 90 minutes*
