# Tuần 10: Tích Hợp Hệ Thống Pico STEM & Bảo Vệ Dự Án Capstone (Capstone Project & Demo Day)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tóm tắt và kết nối toàn bộ 10 tuần kiến thức: Vi điều khiển RP2040, Cảm biến ADC/I2C, Thiết bị chấp hành PWM/Servo, Kết nối không dây Wi-Fi (Pico W), MQTT Telemetry, Khối PIO và MicroPython thành một **Hệ Thống STEM Nhúng Thực Chiến Hoàn Chỉnh**.
- Thấu hiểu quy trình thiết kế kỹ thuật chuẩn **Engineering Design Process**: Xác định bài toán $\to$ Lựa chọn linh kiện $\to$ Tạo mẫu phần cứng $\to$ Kiểm thử & Bảo vệ.
- Đóng gói mã nguồn MicroPython đạt chuẩn công nghiệp, viết tài liệu sơ đồ mạch điện Schematic và đẩy mã nguồn lên GitHub.
- Bảo vệ Dự án Tốt nghiệp Capstone (Demo Day) trước hội đồng đánh giá và trình diễn sản phẩm chạy thực tế.

### English
- Synthesize all 10-week embedded Pico modules: RP2040 core, ADC/I2C sensors, PWM/Servo actuators, Pico W Wi-Fi networking, MQTT telemetry, PIO state machines, and MicroPython into an **Integrated Embedded STEM System**.
- Master the **Engineering Design Process**: Problem Definition $\to$ Component Selection $\to$ Hardware Prototyping $\to$ Testing & Defense.
- Package production-grade MicroPython code, document schematic wiring diagrams, and publish source code to GitHub.
- Present and defend the Final Capstone Project during Demo Day with live physical hardware demonstrations.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Tích Hợp Hệ Thống Raspberry Pi Pico W STEM

```text
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              EMBEDDED HARDWARE LAYER (PICO W)                          │
 │                                                                                        │
 │  [Sensors: DHT11, HC-SR04, MPU6050, ADC] ───► [Pico W RP2040] ───► [Actuators: L298N, Servo]│
 └──────────────────────────────────────────┬─────────────────────────────────────────────┘
                                            │
                                            ▼
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              CONNECTIVITY & CLOUD LAYER                                │
 │                                                                                        │
 │  [Wi-Fi 802.11n] ───► [MQTT Broker: Mosquitto] ───► [Cloud Dashboards: Blynk / Telegram] │
 └────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Complete MicroPython Capstone Baseline - Smart Irrigation & Cloud Telemetry
```python
# MicroPython Code for Raspberry Pi Pico W
# Lesson 10: Capstone Integrated Smart Irrigation & Cloud Telemetry Gateway

import network
import time
from machine import Pin, ADC
from umqtt.simple import MQTTClient

# Hardware Definitions
SOIL_ADC = ADC(26)
RELAY_PIN = Pin(15, Pin.OUT, value=0)

SSID = "Wokwi-GUEST"
PASSWORD = ""
MQTT_BROKER = "broker.hivemq.com"

def connect_wifi():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(SSID, PASSWORD)
    while not wlan.isconnected(): time.sleep(0.5)
    print("[+] Wi-Fi Connected! IP:", wlan.ifconfig()[0])

connect_wifi()
mqtt = MQTTClient("PicoW_Capstone_Node", MQTT_BROKER)
mqtt.connect()
print("[+] MQTT Connected!")

while True:
    raw_soil = SOIL_ADC.read_u16()
    moisture_pct = int((65535 - raw_soil) * 100 / 65535)

    if moisture_pct < 30:
        RELAY_PIN.value(1) # Turn Pump ON
        time.sleep(3)
        RELAY_PIN.value(0) # Turn Pump OFF
    else:
        RELAY_PIN.value(0)

    # Publish Telemetry
    payload = '{"moisture": %d}' % moisture_pct
    mqtt.publish("picow/capstone/telemetry", payload)
    print(f"[+] Telemetry Pushed: {payload}")

    time.sleep(5)
```

---

## Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix

| Tuần | Chủ Đề Chính | Kỹ Thuật & Sản Phẩm Đạt Được |
| :--- | :--- | :--- |
| **Week 1** | Pico RP2040 & MicroPython | Kiến trúc RP2040, Thonny IDE, Nạp UF2, `machine.Pin`, LED Traffic Signal & Buttons. |
| **Week 2** | ADC 12-bit, PWM & Ngắt IRQ | ADC 16-bit scaling `read_u16()`, PWM Dimmer $1\text{kHz}$, Ngắt phần cứng `irq()` & Debounce. |
| **Week 3** | Giao Thức I2C, OLED & MPU6050 | Bus I2C `0x3C`, Thư viện `ssd1306.py`, Cảm biến MPU6050 IMU & Tính góc Roll/Pitch. |
| **Week 4** | Động Cơ DC, Cầu H & Servo SG90 | Mạch cầu H L298N, Điều tốc động cơ DC bằng PWM, Servo SG90 & VU Meter âm thanh. |
| **Week 5** | Kết Nối Wi-Fi Pico W & Web Server | Wi-Fi CYW43439 STA/AP Mode, Socket API, HTTP Web Server & REST API JSON. |
| **Week 6** | Giao Thức MQTT & Cloud IoT | Thư viện `umqtt.simple`, Broker Mosquitto, Blynk 2.0 Cloud & ThingSpeak Telemetry. |
| **Week 7** | Nông Nghiệp & Smart Home System | Mô hình tưới cây tự động, Relay bơm nước 5V, Cảnh báo an ninh Telegram Bot API. |
| **Week 8** | Xe Robot Pico Tự Hành 2 Bánh | Mạch cầu H L298N, Cảm biến dò đường IR vạch đen & Xe né vật cản siêu âm HC-SR04. |
| **Week 9** | Khối PIO & Tối Ưu Bộ Nhớ RAM | Khối máy trạng thái PIO `@rp2.asm_pio`, Đèn LED Neopixel RGB & Giải phóng bộ nhớ `gc.collect()`. |
| **Week 10** | Tích Hợp Hệ Thống & Capstone | Tích hợp Hệ sinh thái Pico STEM, Slide thuyết trình, Code GitHub & Demo Day. |

---

## Đánh Giá Capstone & Demo Day Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Mạch Phần Cứng (Hardware Model)** | Mạch STEM cắm Breadboard gọn gàng, cách ly nguồn tốt, an toàn điện tuyệt đối. | Lắp mạch chạy đúng nhưng dây nối còn rườm rà. | Mạch chạy được nhưng thỉnh thoảng sụt nguồn. | Mạch bị hỏng không chạy được. |
| **Hoàn Thành Bài Tập & Capstone** | Hoàn thành xuất sắc cả 4 bài, sản phẩm Capstone chạy mượt mà, slide thuyết trình ấn tượng và bảo vệ thành công. | Hoàn thành Bài 10.1 và Bài 10.2 chạy đúng không lỗi. | Code có lỗi xử lý logic hoặc chưa nộp slide. | Không nộp dự án Capstone. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
