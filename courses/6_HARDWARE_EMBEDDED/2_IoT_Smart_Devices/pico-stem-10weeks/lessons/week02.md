# Tuần 2: Chuyển Đổi ADC 12-bit, Xung PWM & Ngắt Phần Cứng IRQ (ADC, PWM & Interrupts)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững bộ chuyển đổi Tương tự - Số **ADC 12-bit (`machine.ADC`)** của Pico RP2040 (3 kênh ADC ngoài: `ADC0`/GPIO26, `ADC1`/GPIO27, `ADC2`/GPIO28 và 1 kênh đọc nhiệt độ chip nội `ADC4`).
- Hiểu độ phân giải 16-bit của MicroPython ($0 - 65535$) khi đọc giá trị ADC (`read_u16()`).
- Điều khiển độ sáng mượt mà của đèn LED bằng **Xung PWM (`machine.PWM`)**.
- Lập trình **Ngắt phần cứng (`pin.irq()`)** xử lý sự kiện bấm nút tức thời mà không làm đứng chương trình.

### English
- Master the **12-bit ADC (`machine.ADC`)** on Pico RP2040 (`ADC0`/GPIO26, `ADC1`/GPIO27, `ADC2`/GPIO28, and internal CPU Temp sensor `ADC4`).
- Understand MicroPython's 16-bit scaling ($0 - 65535$) via `read_u16()`.
- Control LED brightness using **PWM (`machine.PWM`)**.
- Program **Hardware Interrupts (`pin.irq()`)** handling button inputs instantly without blocking execution.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - ADC Light Sensor & Hardware Interrupt ISR
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 2: ADC Potentiometer & Hardware Interrupt ISR

from machine import Pin, ADC, PWM
import time

# ADC0 on GPIO 26
pot = ADC(Pin(26))

# PWM Output on GPIO 15
led_pwm = PWM(Pin(15))
led_pwm.freq(1000) # 1kHz PWM frequency

# Button Interrupt on GPIO 14
btn = Pin(14, Pin.IN, Pin.PULL_UP)

toggle_state = True

def btn_isr(pin):
    global toggle_state
    toggle_state = not toggle_state

# Attach Hardware Interrupt on FALLING edge
btn.irq(trigger=Pin.IRQ_FALLING, handler=btn_isr)

while True:
    if toggle_state:
        # Read 16-bit ADC value (0 to 65535)
        adc_val = pot.read_u16()
        # Set PWM Duty Cycle (0 to 65535)
        led_pwm.duty_u16(adc_val)
        voltage = (adc_val / 65535.0) * 3.3
        print(f"[ADC] Raw: {adc_val} | Voltage: {voltage:.2f}V")
    else:
        led_pwm.duty_u16(0)
    time.sleep(0.1)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 2.1: Đọc Nhiệt Độ Chip CPU Nội (`ADC4`)
Viết script MicroPython đọc giá trị từ kênh `ADC(4)`, chuyển đổi sang độ C bằng công thức $T = 27 - \frac{V_{\text{adc}} - 0.706}{0.001721}$ và in ra Terminal.

#### Bài 2.2: Đèn LED Dimmer Tự Động
Lập trình đọc quang trở LDR nối vào GPIO 27: Khi trời tối, độ sáng đèn LED PWM tăng lên tương ứng.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 2.3: Bộ Đếm Xung Nút Nhấn Ngắt Chống Dội (Debounced Interrupt Counter)
Lập trình ngắt `pin.irq()` đếm số lần nhấn nút có tích hợp thuật toán dội phím (Debounce) bằng thời gian `time.ticks_ms()`.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 2.4: Giả Lập ADC & PWM Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico + Potentiometer + LED. Viết script MicroPython điều chỉnh độ sáng LED bằng biến trở.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi ADC PWM Reference Solution
from machine import Pin, ADC, PWM
import time

pot = ADC(26)
pwm = PWM(Pin(15))
pwm.freq(1000)

while True:
    pwm.duty_u16(pot.read_u16())
    time.sleep(0.05)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức ADC & PWM** | Giải thích sâu sắc độ phân giải ADC 12-bit, thang đọc 16-bit `read_u16()`, tần số PWM và ngắt IRQ. | Hiểu cách đọc biến trở ADC và điều khiển PWM. | Nắm được định nghĩa ADC nhưng chưa tính được điện áp. | Đọc sai chân ADC. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Internal CPU Temp, LDR Dimmer, Debounced ISR & Wokwi Lab). | Hoàn thành Bài 2.1 và Bài 2.2 đúng yêu cầu. | Code có lỗi dội phím làm ngắt kích hoạt nhiều lần. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
