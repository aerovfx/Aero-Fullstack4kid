# Tuần 7: Nông Nghiệp Thông Minh & Hệ Thống Nhà Thông Minh Pico W (Smart Plant Irrigation & Smart Home)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tích hợp vi điều khiển Raspberry Pi Pico W với các cảm biến và thiết bị chấp hành để chế tạo mô hình **Trực quan hóa Nông nghiệp thông minh** và **Giám sát Nhà thông minh**.
- Xây dựng **Hệ thống Tưới cây tự động**: Đọc cảm biến độ ẩm đất dung kháng, tự động kích hoạt máy bơm nước 5V qua Rơ-le (Relay) khi đất khô.
- Xây dựng **Hệ thống Cảnh báo Chống trộm**: Đọc cảm biến siêu âm HC-SR04, bật còi báo động Buzzer và gửi tin nhắn cảnh báo qua Telegram Bot API.
- Lập trình xử lý sự kiện ngắt kết nối mạng Wi-Fi và tự động thử lại (Reconnection Handler).

### English
- Integrate Raspberry Pi Pico W with sensors and actuators for **Smart Agriculture** and **Smart Home Monitoring**.
- Build an **Automated Plant Irrigation System**: Read soil moisture sensors, trigger 5V water pumps via Relays when soil dries out.
- Build a **Smart Security System**: Read HC-SR04 ultrasonic sensors, sound buzzers, and issue Telegram Bot API notifications.
- Implement robust Wi-Fi reconnection handling logic.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Pico W Smart Irrigation & Telegram Alert Gateway
```python
# MicroPython Code for Raspberry Pi Pico W
# Lesson 7: Smart Plant Irrigation & Telegram Alert Gateway

import network
import urequests
import time
from machine import Pin, ADC

# Pin Definitions
SOIL_ADC = ADC(26)   # Soil Moisture Sensor on GPIO 26
RELAY_PIN = Pin(15, Pin.OUT, value=0) # Water Pump Relay

BOT_TOKEN = "YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID = "YOUR_TELEGRAM_CHAT_ID"

def send_telegram_alert(message):
    url = f"https://api.telegram.org/bot{BOT_TOKEN}/sendMessage?chat_id={CHAT_ID}&text={message}"
    try:
        res = urequests.get(url)
        res.close()
        print("[+] Telegram Alert Sent!")
    except Exception as e:
        print(f"[-] Failed to send Telegram: {e}")

while True:
    raw_val = SOIL_ADC.read_u16()
    # Map raw value to soil moisture percentage
    moisture_pct = int((65535 - raw_val) * 100 / 65535)

    print(f"[SOIL] Moisture: {moisture_pct}%")

    if moisture_pct < 30:
        print("[!] Soil is Dry! Activating Water Pump for 3 seconds...")
        RELAY_PIN.value(1) # Turn Pump ON
        send_telegram_alert("⚠️ Alert: Soil moisture low! Auto-watering activated.")
        time.sleep(3)
        RELAY_PIN.value(0) # Turn Pump OFF
        time.sleep(10)     # Soak pause
    else:
        RELAY_PIN.value(0)

    time.sleep(2)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 7.1: Mái Che Nắng Tự Động Bằng Servo SG90
Lập trình đọc cảm biến ánh sáng LDR trên GPIO 27: Khi trời nắng gắt ($> 2.5\text{V}$), Servo SG90 tự động quay $90^\circ$ kéo mái che.

#### Bài 7.2: Hệ Thống Đèn Đường Thông Minh Pico W
Lập trình cảm biến siêu âm HC-SR04 kết hợp cảm biến ánh sáng: Đèn LED chỉ bật khi trời tối VÀ có người đi ngang qua ($< 20\,\text{cm}$).

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 7.3: Trạm Cảnh Báo An Ninh Điện Thoại Đa Kênh
Lập trình phát hiện xâm nhập bằng siêu âm, tự động bật còi hú dồn dập, nháy đèn Neopixel đỏ và gửi tin nhắn cảnh báo Telegram.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 7.4: Giả Lập Trạm Tưới Cây Tự Động Trên Wokwi Online
Mở Wokwi Simulator, chọn Pico W + Potentiometer (mô phỏng đất) + Relay + Servo. Viết script MicroPython chạy luồng tự động tưới cây.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi Smart Irrigation Reference Solution
from machine import Pin, ADC
import time

soil = ADC(26)
relay = Pin(15, Pin.OUT)

while True:
    if soil.read_u16() > 40000:
        relay.value(1); time.sleep(2); relay.value(0); time.sleep(5)
    else:
        relay.value(0)
    time.sleep(1)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Tích Hợp Pico W System** | Giải thích sâu sắc hệ thống vòng kín, mạch Relay, máy bơm 5V, Telegram Bot API và tự phục hồi kết nối. | Hiểu quy trình tưới cây tự động và gửi cảnh báo an ninh. | Nắm được định nghĩa Relay nhưng chưa kích được bơm. | Làm ngắn mạch điện khi kích Relay. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Smart Awning, Smart Streetlight, Telegram Security & Wokwi Lab). | Hoàn thành Bài 7.1 và Bài 7.2 đúng yêu cầu. | Code có lỗi rơ-le đóng cắt liên tục không dừng. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
