# Tuần 1: Kiến Trúc Raspberry Pi Pico RP2040, GPIO & Lập Trình MicroPython / Week 1: Pico RP2040, GPIO & MicroPython

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc phần cứng của vi điều khiển **Raspberry Pi Pico / Pico W** (Chip RP2040 Dual-Core ARM Cortex-M0+ xung nhịp 133MHz, 264KB SRAM, 2MB Flash, 26 chân GPIO đa năng 3.3V).
- Cài đặt firmware **MicroPython UF2** và thành thạo môi trường phát triển **Thonny IDE**.
- Hiểu và sử dụng module `machine` trong MicroPython: Cấu hình chân GPIO làm `Pin.OUT` và `Pin.IN`.
- Lập trình chớp tắt LED onboard, điều khiển dàn đèn LED ngoài và đọc trạng thái nút nhấn cơ bản.

### English
- Master the **Raspberry Pi Pico / Pico W** hardware architecture (RP2040 Dual-Core ARM Cortex-M0+ at 133MHz, 264KB SRAM, 2MB Flash, 26 multi-function 3.3V GPIO pins).
- Flash the **MicroPython UF2** firmware and master **Thonny IDE**.
- Understand MicroPython's `machine` module: Configuring GPIO pins as `Pin.OUT` and `Pin.IN`.
- Program onboard LED blinks, external LED sequences, and pushbutton input polling.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- 1 x Board Raspberry Pi Pico W.
- 1 x Cáp Micro-USB truyền dữ liệu.
- 1 x Breadboard MB-102.
- 3 x Đèn LED (Đỏ, Vàng, Xanh) + 3 x Điện trở $220\,\Omega$.
- 2 x Nút nhấn nhả + 2 x Điện trở $10\,\text{k}\Omega$.
- Phần mềm: Thonny IDE.

### English
- 1 x Raspberry Pi Pico W Board.
- 1 x Micro-USB Data Cable.
- 1 x Breadboard MB-102.
- 3 x LEDs + 3 x $220\,\Omega$ Resistors.
- 2 x Pushbuttons + 2 x $10\,\text{k}\Omega$ Resistors.
- Software: Thonny IDE.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Chip Vi Điều Khiển RP2040 / RP2040 Architecture

#### Tiếng Việt
RP2040 là vi điều khiển đầu tiên do Raspberry Pi tự thiết kế:
- **CPU Dual-Core:** 2 nhân ARM Cortex-M0+ chạy ở xung nhịp mặc định 133 MHz.
- **SRAM:** 264 KB SRAM chia thành 6 ngân hàng bộ nhớ độc lập.
- **GPIO:** 26 chân GPIO hoạt động ở mức điện áp **3.3V**.
- **Khối ngoại vi đặc biệt:** Khối máy trạng thái **PIO (Programmable I/O)** cho phép tự thiết kế chuẩn giao tiếp phần cứng riêng.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - GPIO Input/Output & LED Traffic Signal
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 1: GPIO Control & Traffic Light Controller

from machine import Pin
import time

# Pin Definitions
LED_RED = Pin(14, Pin.OUT)
LED_YELLOW = Pin(15, Pin.OUT)
LED_GREEN = Pin(16, Pin.OUT)
BTN_PIN = Pin(17, Pin.IN, Pin.PULL_UP)

print("[+] Raspberry Pi Pico RP2040 GPIO Initialized!")

def set_traffic_light(red, yellow, green):
    LED_RED.value(red)
    LED_YELLOW.value(yellow)
    LED_GREEN.value(green)

while True:
    # Read Button (Active LOW with PULL_UP)
    if not BTN_PIN.value():
        print("[+] Emergency Button Pressed! Flashing Red LED...")
        for _ in range(5):
            set_traffic_light(1, 0, 0)
            time.sleep(0.2)
            set_traffic_light(0, 0, 0)
            time.sleep(0.2)
    else:
        # Standard Traffic Cycle
        set_traffic_light(1, 0, 0) # RED ON
        time.sleep(2)
        set_traffic_light(0, 0, 1) # GREEN ON
        time.sleep(2)
        set_traffic_light(0, 1, 0) # YELLOW ON
        time.sleep(1)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Trình Chớp Tắt LED Trái Tim Onboard
Viết script MicroPython nhấp nháy LED tích hợp trên Pico theo nhịp tim (Blink 200ms, tắt 200ms, blink 200ms, tắt 800ms).

#### Bài 1.2: Bật Tắt LED Bằng Nút Nhấn Đảo Trạng Thái (Toggle Button)
Viết script MicroPython: Mỗi lần nhấn nút bấm, trạng thái LED đảo từ Bật $\to$ Tắt hoặc ngược lại.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Đèn LED Đuổi Nhạc 4 Cổng (4-Channel Knight Rider LED Chaser)
Viết script điều khiển dàn 4 đèn LED sáng đuổi từ trái sang phải và từ phải sang trái với tốc độ linh hoạt.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 1.4: Giả Lập Mạch Pico GPIO Trên Wokwi Online
Mở Wokwi Simulator, chọn Raspberry Pi Pico. Lắp mạch 3 LED + 1 Button, dán mã nguồn MicroPython và kiểm thử kết quả.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi MicroPython Reference Solution
from machine import Pin
import time

led = Pin("LED", Pin.OUT)
while True:
    led.toggle()
    time.sleep(0.5)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Pico RP2040** | Giải thích sâu sắc kiến trúc RP2040, điện áp 3.3V, module `machine.Pin` và chế độ Pull-up/Pull-down. | Hiểu cách sử dụng Thonny IDE và điều khiển GPIO. | Nắm được định nghĩa Pico nhưng chưa lập trình được nút nhấn. | Không nạp được firmware. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Heartbeat LED, Toggle Button, Knight Rider & Wokwi Lab). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi dội nút nhấn hoặc quên `Pin.PULL_UP`. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
