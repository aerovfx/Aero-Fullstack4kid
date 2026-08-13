# Tuần 5: Kết Nối Không Dây Wi-Fi Trên Pico W & Lập Trình Web Server (Pico W Wi-Fi & Web API)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc mô-đun Wi-Fi CYW43439 tích hợp trên bo mạch **Raspberry Pi Pico W**.
- Sử dụng thư viện `network` để quản lý kết nối Wi-Fi ở chế độ **STA (Station Mode)** và **AP (Access Point Mode)**.
- Xây dựng **HTTP Web Server nhúng** đơn giản phục vụ giao diện trang Web HTML điều khiển thiết bị qua điện thoại/máy tính.
- Xử lý các yêu cầu HTTP GET/POST và trả về dữ liệu trạng thái dạng JSON.

### English
- Master the onboard CYW43439 Wi-Fi chip architecture on **Raspberry Pi Pico W**.
- Use the MicroPython `network` module to connect via **Station Mode (STA)** and **Access Point Mode (AP)**.
- Build an embedded **HTTP Web Server** serving HTML control interfaces for mobile devices and PCs.
- Handle HTTP GET/POST endpoints and serve JSON status payloads.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Pico W Async Web Server Controller
```python
# MicroPython Code for Raspberry Pi Pico W
# Lesson 5: Embedded Web Server Device Controller

import network
import socket
import time
from machine import Pin

# Onboard LED on Pico W
led = Pin("LED", Pin.OUT)

SSID = "Your_WiFi_SSID"
PASSWORD = "Your_WiFi_Password"

def connect_wifi():
    wlan = network.WLAN(network.STA_IF)
    wlan.active(True)
    wlan.connect(SSID, PASSWORD)

    print("[+] Connecting to Wi-Fi...")
    timeout = 10
    while not wlan.isconnected() and timeout > 0:
        time.sleep(1)
        timeout -= 1

    if wlan.isconnected():
        print(f"[+] Wi-Fi Connected! Pico W IP: {wlan.ifconfig()[0]}")
        return wlan.ifconfig()[0]
    else:
        print("[-] Wi-Fi Connection Failed!")
        return None

ip_addr = connect_wifi()

if ip_addr:
    # Start Socket Web Server on Port 80
    addr = socket.getaddrinfo('0.0.0.0', 80)[0][-1]
    server = socket.socket()
    server.bind(addr)
    server.listen(1)
    print(f"[+] Web Server Listening at http://{ip_addr}:80/")

    while True:
        conn, addr = server.accept()
        request = conn.recv(1024).decode('utf-8')

        if '/light/on' in request:
            led.value(1)
        elif '/light/off' in request:
            led.value(0)

        html = """<!DOCTYPE html><html>
        <head><title>Pico W Control</title></head>
        <body><h1>Pico W Web Dashboard</h1>
        <p><a href="/light/on"><button>TURN ON</button></a></p>
        <p><a href="/light/off"><button>TURN OFF</button></a></p>
        </body></html>"""

        conn.send('HTTP/1.1 200 OK\nContent-Type: text/html\n\n' + html)
        conn.close()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 5.1: Đọc Địa Chỉ IP & MAC Của Pico W
Viết script MicroPython kết nối Wi-Fi và in ra địa chỉ IP, Subnet Mask, Gateway và MAC Address của Pico W.

#### Bài 5.2: Chế Độ Wi-Fi Access Point (AP Mode)
Viết script cấu hình Pico W tự phát Wi-Fi Hotspot `PicoW_Hotspot` mật khẩu `12345678`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 5.3: Web API Trả Dữ Liệu Cảm Biến JSON
Lập trình Web Server nhúng trả về chuỗi JSON khi truy cập đường dẫn `/api/status`: `{"temp": 28.5, "led": true}`.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 5.4: Giả Lập Pico W Web Server Trên Wokwi Online
Mở Wokwi Simulator, chọn Raspberry Pi Pico W. Lập trình Web Server điều khiển LED trực tiếp từ trình duyệt web Wokwi.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```python
# Wokwi Pico W Web Server Reference Solution
import network, socket
from machine import Pin

wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.connect("Wokwi-GUEST", "")

while not wlan.isconnected(): pass
print("IP:", wlan.ifconfig()[0])
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Mạng Không Dây Pico W** | Giải thích sâu sắc vi chip CYW43439, Wi-Fi STA/AP Mode, Socket API, HTTP GET/POST và chuỗi JSON. | Hiểu cách kết nối Wi-Fi và tạo Web Server cơ bản. | Nắm được định nghĩa Wi-Fi nhưng chưa tạo được Web Server. | Không kết nối được Wi-Fi. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Network Info, AP Mode, JSON Web API & Wokwi Lab). | Hoàn thành Bài 5.1 và Bài 5.2 đúng yêu cầu. | Code có lỗi rớt kết nối Wi-Fi không tự phục hồi. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
