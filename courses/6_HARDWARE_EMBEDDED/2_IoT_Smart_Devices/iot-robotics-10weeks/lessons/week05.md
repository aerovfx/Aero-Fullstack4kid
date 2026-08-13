# Tuần 5: Kết Nối Không Dây Wi-Fi, Bluetooth BLE & Giao Thức ESP-NOW (Wireless Protocols)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Phân biệt các chế độ Wi-Fi của ESP32: **STA (Station Mode)** kết nối vào Router và **AP (Access Point Mode)** tự phát Wi-Fi Hotspot.
- Nắm vững kiến trúc giao tiếp **Bluetooth Low Energy (BLE)**: GATT Server/Client, Services, Characteristics và Advertising.
- Hiểu giao thức truyền thông không dây ngẫu nhiên tốc độ cao **ESP-NOW** (giao tiếp Peer-to-Peer 2.4GHz không cần qua Router Wi-Fi).
- Thực hành lập trình điều khiển thiết bị nhúng qua ứng dụng Smartphone BLE và truyền dữ liệu giữa 2 board ESP32 bằng ESP-NOW.

### English
- Distinguish ESP32 Wi-Fi modes: **Station Mode (STA)** connecting to AP Routers vs **Access Point Mode (AP)** hosting a local Wi-Fi Hotspot.
- Master **Bluetooth Low Energy (BLE)** architecture: GATT Server/Client, Services, Characteristics, and Advertising.
- Understand the **ESP-NOW** wireless protocol (high-speed peer-to-peer 2.4GHz connection without a Wi-Fi Router).
- Practice Smartphone BLE control apps and ESP-NOW board-to-board wireless telemetry.

---

## Lý Thuyết / Theory

### 1. So Sánh Wi-Fi, Bluetooth BLE và ESP-NOW / Wireless Comparison

| Tiêu chí / Protocol | Wi-Fi (STA/AP) | Bluetooth BLE 4.2/5.0 | ESP-NOW |
| :--- | :--- | :--- | :--- |
| **Băng thông / Tốc độ** | 150 Mbps (Rất cao) | 1 - 2 Mbps | 1 Mbps (Dữ liệu ngắn) |
| **Công suất tiêu thụ** | High (~100-240mA) | Low (~10-20mA) | Low-Medium (~50mA) |
| **Độ trễ (Latency)** | Medium (10-50ms) | Medium-High (20-100ms) | **Very Low (<2ms)** |
| **Yêu cầu Router Wi-Fi** | Có (STA Mode) | Không (Kết nối trực tiếp) | **Không (Peer-to-Peer MAC)** |
| **Khoảng cách tối đa** | 50m | 10m | **200m+ (LoS)** |

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: ESP-NOW Sender Protocol (Board A to Board B)
```cpp
/*
 * Lesson 5: ESP-NOW Peer-to-Peer Wireless Sender
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <esp_now.h>
#include <WiFi.h>

// Target Receiver ESP32 MAC Address (Replace with actual MAC)
uint8_t receiverMAC[] = {0x24, 0x6F, 0x28, 0xAA, 0xBB, 0xCC};

// Struct matching receiver layout
typedef struct struct_message {
    int packetId;
    float temp;
    float humidity;
} struct_message;

struct_message myData;
esp_now_peer_info_t peerInfo;

// Callback executed when data is sent
void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status) {
    Serial.print("[ESP-NOW] Packet Delivery Status: ");
    Serial.println(status == ESP_NOW_SEND_SUCCESS ? "SUCCESS ✅" : "FAILED ❌");
}

void setup() {
    Serial.begin(115200);
    WiFi.mode(WIFI_STA);

    if (esp_now_init() != ESP_OK) {
        Serial.println("[-] Error initializing ESP-NOW");
        return;
    }

    esp_now_register_send_cb(OnDataSent);

    // Register Peer
    memcpy(peerInfo.peer_addr, receiverMAC, 6);
    peerInfo.channel = 0;  
    peerInfo.encrypt = false;
    
    if (esp_now_add_peer(&peerInfo) != ESP_OK) {
        Serial.println("[-] Failed to add peer");
        return;
    }
}

void loop() {
    myData.packetId++;
    myData.temp = 28.5;
    myData.humidity = 65.0;

    esp_err_t result = esp_now_send(receiverMAC, (uint8_t *) &myData, sizeof(myData));
    delay(2000);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Giao thức ESP-NOW mang lại ưu thế vượt trội gì về độ trễ (Latency) và hạ tầng mạng khi chế tạo tay cầm điều khiển xe Robot?
2. Sự khác biệt giữa Bluetooth Classic (Truyền âm thanh/data lớn) và Bluetooth Low Energy BLE (Truyền sensor data tiết kiệm pin) là gì?
3. Tại sao trong chế độ Wi-Fi AP Mode, ESP32 có thể tự làm Web Server điều khiển mà không cần truy cập Internet?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 5.1: Bật Tắt LED Qua Web Server Wi-Fi AP Mode
Lập trình ESP32 phát Wi-Fi AP `ESP32_Control` mật khẩu `12345678`. Tạo trang Web HTML nhúng có 2 nút `ON` và `OFF` để điều khiển LED.

#### Bài 5.2: Đọc MAC Address Của ESP32
Viết script C++ in địa chỉ MAC Wi-Fi và Bluetooth BLE của ESP32 ra Serial Monitor.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 5.3: Tay Cầm Điều Khiển Xe Robot Từ Xa Bằng ESP-NOW (ESP-NOW Remote Controller)
Sử dụng 2 board ESP32: Board A làm tay cầm điều khiển (đọc biến trở/nút bấm) truyền lệnh di chuyển không dây qua ESP-NOW cho Board B lái động cơ xe Robot với độ trễ $<2\text{ms}$.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 5.4: Giả Lập Mạch Wi-Fi Web Server Điều Khiển Thiết Bị Trên Wokwi
Mở Wokwi Simulator, lắp mạch ESP32 + 2 LED. Lập trình Web Server hiển thị giao diện điều khiển đèn trực tiếp trên trình duyệt.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <WiFi.h>
#include <WebServer.h>

const char* ssid = "Wokwi-GUEST";
const char* password = "";
WebServer server(80);
const int LED_PIN = 23;

void handleRoot() {
    String html = "<h1>ESP32 Web Server</h1><a href='/on'><button>TURN ON</button></a> <a href='/off'><button>TURN OFF</button></a>";
    server.send(200, "text/html", html);
}

void setup() {
    Serial.begin(115200);
    pinMode(LED_PIN, OUTPUT);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) { delay(500); Serial.print("."); }
    Serial.println("\n[+] IP: " + WiFi.localIP().toString());
    
    server.on("/", handleRoot);
    server.on("/on", [](){ digitalWrite(LED_PIN, HIGH); handleRoot(); });
    server.on("/off", [](){ digitalWrite(LED_PIN, LOW); handleRoot(); });
    server.begin();
}

void loop() { server.handleClient(); }
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Mạng Không Dây** | Giải thích sâu sắc Wi-Fi STA/AP, BLE GATT architecture và ưu điểm độ trễ của ESP-NOW. | Hiểu cách tạo Web Server Wi-Fi và kết nối Bluetooth. | Nắm được định nghĩa Wi-Fi nhưng chưa tạo được AP Mode. | Không kết nối được Wi-Fi. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Wi-Fi AP Web Server, MAC Reader, ESP-NOW Remote & Wokwi Lab). | Hoàn thành Bài 5.1 và Bài 5.2 đúng yêu cầu. | Code có lỗi không nhận địa chỉ IP hoặc rớt mạng. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
