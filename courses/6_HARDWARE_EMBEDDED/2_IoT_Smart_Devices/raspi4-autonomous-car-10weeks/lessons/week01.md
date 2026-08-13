# Tuần 1: Kiến Trúc Raspberry Pi 4, Hệ Điều Hành Linux & Lập Trình GPIO / Week 1: Raspberry Pi 4 Architecture, Linux OS & GPIO

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc phần cứng của máy tính nhúng **Raspberry Pi 4 Model B** (Vi xử lý Broadcom BCM2711 Quad-Core Cortex-A72 1.5GHz, 4GB/8GB LPDDR4 RAM, Wi-Fi 5GHz, Bluetooth 5.0, Cổng Gigabit Ethernet, Dual Micro-HDMI 4K, Cổng Camera CSI).
- Làm quen với Hệ điều hành **Raspberry Pi OS 64-bit (Debian Linux)** và các câu lệnh dòng lệnh Bash Terminal cơ bản (`ls`, `cd`, `sudo`, `apt`, `systemctl`).
- Cấu hình kết nối không dây điều khiển từ xa qua giao thức **SSH (Secure Shell)** và giao diện đồ họa **VNC Viewer**.
- Hiểu sơ đồ 40 chân **GPIO Header (General Purpose Input/Output)**, điện áp hoạt động $3.3\text{V}$ và điều khiển GPIO bằng thư viện Python `RPi.GPIO` / `pigpio`.

### English
- Master the hardware architecture of the **Raspberry Pi 4 Model B** embedded single-board computer (Broadcom BCM2711 Quad-Core Cortex-A72 1.5GHz, 4GB/8GB LPDDR4 RAM, Wi-Fi 5GHz, Gigabit Ethernet, Dual Micro-HDMI 4K, CSI Camera connector).
- Get familiar with **Raspberry Pi OS 64-bit (Debian Linux)** and essential Linux terminal CLI commands (`ls`, `cd`, `sudo`, `apt`, `systemctl`).
- Configure wireless remote access protocols via **SSH** and **VNC Viewer** graphical desktop interfaces.
- Understand the **40-Pin GPIO Header**, 3.3V logic level constraints, and program GPIO lines via `RPi.GPIO` and `pigpio` Python libraries.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- 1 x Bo mạch Raspberry Pi 4 Model B (4GB RAM).
- 1 x Thẻ nhớ MicroSD 32GB Class 10 đã nạp Raspberry Pi OS 64-bit.
- 1 x Nguồn USB-C 5V/3A chuẩn cho Raspberry Pi 4.
- 1 x Breadboard + 3 x Đèn LED + 3 x Điện trở $220\,\Omega$ + Dây cắm đực-cái.
- Phần mềm: Raspberry Pi Imager, PuTTY / Terminal, VNC Viewer.

### English
- 1 x Raspberry Pi 4 Model B (4GB RAM).
- 1 x 32GB MicroSD Card Class 10 with Raspberry Pi OS 64-bit flashed.
- 1 x USB-C 5V/3A Official Power Adapter.
- 1 x Breadboard + 3 x LEDs + 3 x $220\,\Omega$ Resistors + Female-to-Male Jumpers.
- Software: Raspberry Pi Imager, PuTTY / Terminal, VNC Viewer.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Bo Mạch Raspberry Pi 4 Model B / Raspberry Pi 4 Hardware

#### Tiếng Việt
Raspberry Pi 4 Model B là một máy tính đơn bo (Single-Board Computer - SBC) mạnh mẽ vượt trội so với các vi điều khiển như Arduino/ESP32:
- **SoC CPU:** Broadcom BCM2711, 64-bit Quad-Core ARM Cortex-A72 xung nhịp 1.5 GHz.
- **Bộ nhớ RAM:** 4GB hoặc 8GB LPDDR4-2400 SDRAM.
- **Ngoại vi:** 2 cổng USB 3.0 (xanh dương, 5Gbps), 2 cổng USB 2.0, 2 cổng Micro-HDMI (xuất 4K60Hz), 1 Cổng Camera CSI, 1 Cổng Display DSI, 1 Cổng Jack Âm thanh 3.5mm.
- **Sơ đồ 40-Pin GPIO Header:** 28 chân GPIO kỹ thuật số (mức điện áp 3.3V), tích hợp các giao tiếp UART, SPI, I2C, PWM.

```text
                           Raspberry Pi 4 GPIO Header (40 Pins)
                   3.3V DC Power  [ 01 ] [ 02 ]  5.0V DC Power
                 GPIO 02 (SDA1)  [ 03 ] [ 04 ]  5.0V DC Power
                 GPIO 03 (SCL1)  [ 05 ] [ 06 ]  Ground (GND)
             GPIO 04 (GPCLK0)  [ 07 ] [ 08 ]  GPIO 14 (TXD0)
                 Ground (GND)  [ 09 ] [ 10 ]  GPIO 15 (RXD0)
                 GPIO 17 (GEN0)  [ 11 ] [ 12 ]  GPIO 18 (PCM_CLK / PWM)
                 GPIO 27 (GEN2)  [ 13 ] [ 14 ]  Ground (GND)
                 GPIO 22 (GEN3)  [ 15 ] [ 16 ]  GPIO 23 (GEN4)
                   3.3V DC Power  [ 17 ] [ 18 ]  GPIO 24 (GEN5)
               GPIO 10 (SPI_MOSI)[ 19 ] [ 20 ]  Ground (GND)
               ...
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - Non-blocking LED Flasher & GPIO Button Reader
```python
"""
Lesson 1: Raspberry Pi 4 Non-blocking GPIO Control via RPi.GPIO
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import RPi.GPIO as GPIO
import time

# Pin Definitions (BCM Numbering)
LED_RED_PIN = 17
LED_GREEN_PIN = 27
BUTTON_PIN = 22

def setup_gpio():
    # Use BCM GPIO numbering
    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)

    # Configure LED pins as OUTPUT
    GPIO.setup(LED_RED_PIN, GPIO.OUT, initial=GPIO.LOW)
    GPIO.setup(LED_GREEN_PIN, GPIO.OUT, initial=GPIO.LOW)

    # Configure Button pin as INPUT with internal PULL-UP resistor
    GPIO.setup(BUTTON_PIN, GPIO.IN, pull_up_down=GPIO.PUD_UP)

def main():
    setup_gpio()
    print("[+] Raspberry Pi 4 GPIO System Initialized!")
    print("[+] Press the button on GPIO 22 to toggle system state (Ctrl+C to Exit)...")

    led_state = False
    try:
        while True:
            # Read Button State (Active LOW)
            button_pressed = not GPIO.input(BUTTON_PIN)
            
            if button_pressed:
                led_state = not led_state
                print(f"[+] Button Pressed! Red LED State -> {led_state}")
                GPIO.output(LED_RED_PIN, GPIO.HIGH if led_state else GPIO.LOW)
                time.sleep(0.3) # Debounce delay
            
            # Blink Green LED heartbeat
            GPIO.output(LED_GREEN_PIN, GPIO.HIGH)
            time.sleep(0.1)
            GPIO.output(LED_GREEN_PIN, GPIO.LOW)
            time.sleep(0.1)

    except KeyboardInterrupt:
        print("\n[-] Cleaning up GPIO pins and exiting...")
    finally:
        GPIO.cleanup()

if __name__ == "__main__":
    main()
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Sự khác biệt cơ bản về mặt kiến trúc phần mềm và phần cứng giữa bo mạch Raspberry Pi 4 (Single-Board Computer running Linux OS) và vi điều khiển ESP32 / Arduino là gì?
2. Tại sao chân GPIO của Raspberry Pi 4 chỉ chịu điện áp $3.3\text{V}$ và nếu cắm nhầm nguồn $5\text{V}$ vào chân GPIO thì điều gì sẽ xảy ra?
3. Phân biệt giữa 2 chế độ đánh số chân GPIO trong thư viện `RPi.GPIO`: `GPIO.BOARD` (theo số thứ tự chân vật lý 1-40) và `GPIO.BCM` (theo tên chip Broadcom).

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Đội Đèn LED Giao Thông 3 Màu (Traffic Light Signal)
Viết script Python `traffic_light.py` điều khiển 3 LED (Đỏ: GPIO 17, Vàng: GPIO 27, Xanh: GPIO 22) chạy chu kỳ tín hiệu giao thông: Đỏ sáng 5s $\to$ Xanh sáng 4s $\to$ Vàng sáng 2s.

#### Bài 1.2: Giám Sát Nhiệt Độ CPU Raspberry Pi 4
Viết script Python đọc nhiệt độ chip CPU Broadcom từ file hệ thống Linux `/sys/class/thermal/thermal_zone0/temp` và in ra màn hình Terminal mỗi 2 giây.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Trình Điều Khiển Xung PWM Điều Chỉnh Độ Sáng Đèn (LED Dimmer via Hardware PWM)
Viết chương trình Python điều khiển độ sáng của đèn LED nối vào chân GPIO 18 (Hỗ trợ Hardware PWM) tăng giảm độ sáng mịn mượt từ $0\% \to 100\%$ bằng thư viện `RPi.GPIO.PWM`.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Linux (Hands-on Colab Lab)

#### Bài 1.4: Viết Script Python Quản Lý File Log Hệ Thống Trên Google Colab
Mở Google Colab, viết script Python mô phỏng hệ thống tự động ghi mốc thời gian và trạng thái nhiệt độ CPU vào tệp `system_log.txt` định dạng CSV.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# Python Reference Solution for CPU Temperature Logger
import time

def read_cpu_temp_simulated():
    # Simulated CPU temperature read
    import random
    return round(45.0 + random.uniform(0, 10.0), 2)

with open("cpu_temp_log.csv", "w") as f:
    f.write("Timestamp,CPU_Temp_C\n")
    for i in range(5):
        t_str = time.strftime("%Y-%m-%d %H:%M:%S")
        temp = read_cpu_temp_simulated()
        f.write(f"{t_str},{temp}\n")
        print(f"[LOGGED] {t_str} -> Temp: {temp} C")
        time.sleep(1)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Raspberry Pi 4 & Linux** | Giải thích sâu sắc kiến trúc BCM2711, Linux Debian OS, sơ đồ 40-pin GPIO, điện áp 3.3V và giao thức SSH/VNC. | Hiểu câu lệnh Linux cơ bản và cách điều khiển GPIO bằng Python. | Nắm được định nghĩa Pi 4 nhưng chưa cấu hình được SSH. | Không khởi động được OS. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Traffic Light, CPU Temp Monitor, PWM Dimmer & Colab Logger Lab). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi dội nút nhấn hoặc quên `GPIO.cleanup()`. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.
