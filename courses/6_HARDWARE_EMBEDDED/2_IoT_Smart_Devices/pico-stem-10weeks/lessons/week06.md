# Tuần 6: Giao Thức MQTT & Dashboard Cloud IoT Blynk 2.0 (Pico W MQTT & Cloud Telemetry)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc giao thức truyền dữ liệu nhẹ chuẩn công nghiệp **MQTT (Message Queuing Telemetry Transport)** qua thư viện `umqtt.simple`.
- Hiểu các thành phần MQTT: Broker, Topics, Publisher, Subscriber.
- Đẩy dữ liệu cảm biến thời gian thực từ Pico W lên **Blynk 2.0 Cloud** và **ThingSpeak Cloud**.
- Nhận lệnh điều khiển từ xa từ App Blynk trên điện thoại di động về Pico W.

### English
- Master the industrial **MQTT protocol** using MicroPython's `umqtt.simple` library.
- Understand MQTT components: Broker, Topics, Publisher, and Subscriber architecture.
- Publish real-time sensor telemetry from Pico W to **Blynk 2.0 Cloud** and **ThingSpeak Cloud**.
- Subscribe to remote control commands sent from mobile Blynk apps back to Pico W.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Pico W MQTT Telemetry Publisher & Blynk Cloud
```python
# MicroPython Code for Raspberry Pi Pico W
# Lesson 6: MQTT Publisher via umqtt.simple & Blynk 2.0

import network
import time
from machine import Pin, ADC
from umqtt.simple import MQTTClient

SSID = "Wokwi-GUEST"
PASSWORD = ""
MQTT_BROKER = "broker.hivemq.com"
CLIENT_ID = "PicoW_Telemetry_Node"
TOPIC_PUB = "picow/sensor/telemetry"

adc_temp = ADC(4) # Internal temp sensor

def connect_wifi():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(SSID, PASSWORD)
    while not wlan.isconnected():
        time.sleep(0.5)
    print("[+] Wi-Fi Connected!")

connect_wifi()

client = MQTTClient(CLIENT_ID, MQTT_BROKER)
client.connect()
print(f"[+] Connected to MQTT Broker: {MQTT_BROKER}")

while True:
    raw = adc_temp.read_u16()
    volts = (raw / 65535.0) * 3.3
    temp_c = 27 - (volts - 0.706) / 0.001721

    payload = '{"temp": %.1f}' % temp_c
    client.publish(TOPIC_PUB, payload)
    print(f"[+] Published to {TOPIC_PUB}: {payload}")

    time.sleep(5)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 6.1: Đẩy Dữ Liệu Lên ThingSpeak Cloud API
Viết script MicroPython sử dụng thư viện `urequests` đẩy giá trị nhiệt độ lên ThingSpeak Channel mỗi 15 giây.

#### Bài 6.2: MQTT Subscriber Bật Tắt LED
Viết script Pico W đăng ký topic `picow/led_control`. Nhận chuỗi `"ON"` để bật LED, `"OFF"` để tắt LED.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 6.3: Tự Động Khôi Phục Kết Nối MQTT (Auto-Reconnect Pattern)
Viết hàm tự động thử kết nối lại Wi-Fi và MQTT Broker nếu bị rớt mạng chập chờn.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 6.4: Giả Lập Pico W MQTT Client Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico W + DHT11. Lập trình đẩy dữ liệu lên HiveMQ Public Broker.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi Pico W MQTT Reference Solution
from umqtt.simple import MQTTClient
import network, time

wlan = network.WLAN(network.STA_IF); wlan.active(True)
wlan.connect("Wokwi-GUEST", "")
while not wlan.isconnected(): pass

c = MQTTClient("PicoW_Wokwi", "broker.hivemq.com")
c.connect()
c.publish("wokwi/pico/test", "Hello from Pico W!")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức MQTT & Cloud IoT** | Giải thích sâu sắc mô hình Pub/Sub, MQTT Broker, thư viện `umqtt.simple`, Blynk 2.0 Datastreams và Auto-Reconnect. | Hiểu cách tạo MQTT Publisher và Subscriber trên Pico W. | Nắm được định nghĩa MQTT nhưng chưa đẩy được dữ liệu. | Không kết nối được Broker. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (ThingSpeak API, MQTT Subscriber, Auto-Reconnect & Wokwi Lab). | Hoàn thành Bài 6.1 và Bài 6.2 đúng yêu cầu. | Code có lỗi rớt kết nối Broker treo máy. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
