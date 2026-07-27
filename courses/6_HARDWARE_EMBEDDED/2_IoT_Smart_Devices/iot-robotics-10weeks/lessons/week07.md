# Tuần 7: Nền Tảng Cloud IoT - Blynk 2.0, ThingSpeak & Adafruit IO (Cloud Dashboards)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nguyên lý hoạt động của các nền tảng Điện toán đám mây IoT (**Cloud IoT Platforms**).
- Kết nối và cấu hình Dashboard tương tác trên **Blynk 2.0** (Datastreams, Gauge, Switch Widgets) trên Smartphone & Web.
- Sử dụng nền tảng **ThingSpeak Cloud** để lưu trữ và phân tích dữ liệu chuỗi thời gian (Time-series Data Analysis) bằng biểu đồ MATLAB nhúng.
- Tự động hóa gửi cảnh báo qua Email / Telegram Bot khi các thông số vượt ngưỡng an toàn.
- Thực hành xây dựng hệ thống theo dõi trạm thời tiết tự động đẩy dữ liệu lên Cloud Dashboard.

### English
- Understand Cloud IoT Platform architectures and remote data telemetry.
- Connect and configure interactive Dashboards on **Blynk 2.0** (Datastreams, Gauges, Switches) for Mobile and Web apps.
- Use **ThingSpeak Cloud** for time-series sensor data logging and embedded MATLAB graph analytics.
- Automate instant alerts via Email or Telegram Bot when sensor parameters exceed safety thresholds.
- Practice building an automated Cloud IoT weather monitoring station.

---

## Lý Thuyết / Theory

### 1. So Sánh Nền Tảng Blynk 2.0, ThingSpeak và Adafruit IO

| Tiêu chí / Platform | Blynk 2.0 | ThingSpeak | Adafruit IO |
| :--- | :--- | :--- | :--- |
| **Giao diện người dùng** | Dashboard di động/Web kéo thả mượt mà | Biểu đồ đồ thị chuỗi thời gian | Giao diện Widget kéo thả |
| **Tần suất đẩy dữ liệu** | Real-time (<100ms) | 15 giây/lần (Free Tier) | 1 giây/lần (30 data points/min) |
| **Phân tích dữ liệu** | Cơ bản | **Tích hợp MATLAB Analytics** | Trực quan hóa cơ bản |
| **Cảnh báo (Alerts)** | Push Notification, Email | Webhooks, Twitter, Email | Triggers & Email Alerts |

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: ESP32 Blynk 2.0 Sensor & Actuator Telemetry
```cpp
/*
 * Lesson 7: Blynk 2.0 Cloud Dashboard Integration for ESP32
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#define BLYNK_TEMPLATE_ID "TMPLxxxxxx"
#define BLYNK_TEMPLATE_NAME "ESP32 Smart Home"
#define BLYNK_AUTH_TOKEN "YourAuthTokenHere"

#include <WiFi.h>
#include <WiFiClient.h>
#include <BlynkSimpleEsp32.h>
#include "DHT.h"

char ssid[] = "WOKWI-GUEST";
char pass[] = "";

#define DHTPIN 15
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

BlynkTimer timer;
const int RELAY_PIN = 23;

// Blynk V0: Switch Widget controls Relay
BLYNK_WRITE(V0) {
    int pinValue = param.asInt();
    digitalWrite(RELAY_PIN, pinValue ? HIGH : LOW);
    Serial.printf("[BLYNK] Relay Command Received -> %s\n", pinValue ? "ON" : "OFF");
}

// Function to send sensor data to Blynk Cloud Datastreams
void sendSensorData() {
    float h = dht.readHumidity();
    float t = dht.readTemperature();

    if (isnan(h) || isnan(t)) {
        Serial.println("[-] Failed to read from DHT sensor!");
        return;
    }

    // Push data to Virtual Pins
    Blynk.virtualWrite(V1, t); // V1: Temperature Datastream
    Blynk.virtualWrite(V2, h); // V2: Humidity Datastream

    Serial.printf("[BLYNK CLOUD] Pushed Temp: %.1f C | Humidity: %.1f %%\n", t, h);
}

void setup() {
    Serial.begin(115200);
    pinMode(RELAY_PIN, OUTPUT);
    dht.begin();

    // Initialize Blynk connection
    Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);

    // Setup timer to send sensor data every 2 seconds
    timer.setInterval(2000L, sendSensorData);
}

void loop() {
    Blynk.run();
    timer.run();
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Sự khác biệt giữa chân Virtual Pin (V0, V1, V2...) trong Blynk và chân Physical GPIO phần cứng là gì?
2. Tại sao trên các tài khoản Free Tier của Cloud IoT (như ThingSpeak), người ta phải giới hạn khoảng thời gian đẩy dữ liệu giữa 2 lần liên tiếp?
3. Webhook đóng vai trò gì trong việc chuyển tiếp dữ liệu cảnh báo từ Cloud IoT sang ứng dụng Telegram Bot?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 7.1: Tạo Dashboard Blynk 2.0 Điều Khiển 2 Đèn
Tạo tài khoản Blynk.cloud, cấu hình Template gồm 2 Datastream $V_0$ và $V_1$. Lập trình ESP32 nhận lệnh điều khiển bật/tắt 2 đèn LED độc lập từ App Blynk trên điện thoại.

#### Bài 7.2: Đẩy Dữ Liệu Lên ThingSpeak Cloud
Viết script ESP32 dùng HTTP GET API đẩy 2 thông số Nhiệt độ và Độ ẩm lên kênh ThingSpeak mỗi 15 giây (`https://api.thingspeak.com/update?api_key=YOUR_KEY&field1=28.5&field2=65.0`).

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 7.3: Tự Động Gửi Cảnh Báo Qua Telegram Bot
Lập trình ESP32 đo nhiệt độ từ cảm biến DHT22. Khi nhiệt độ vượt ngưỡng $35^\circ\text{C}$, ESP32 tự động gửi gói tin HTTP POST sang Telegram Bot API để bắn tin nhắn cảnh báo `[🚨 WARNING] High temperature detected: 36.2°C!` trực tiếp vào điện thoại.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 7.4: Giả Lập Mạch Weather Station Đẩy Cloud Trên Wokwi
Mở Wokwi Simulator, lắp mạch ESP32 + DHT22. Lập trình đẩy dữ liệu lên ThingSpeak Cloud và hiển thị biểu đồ nhiệt độ đồ họa trực tuyến.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <WiFi.h>
#include <HTTPClient.h>
#include "DHT.h"

DHT dht(15, DHT22);
const char* serverName = "http://api.thingspeak.com/update";
String apiKey = "YOUR_THINGSPEAK_API_KEY";

void setup() {
    Serial.begin(115200); dht.begin();
    WiFi.begin("Wokwi-GUEST", "");
    while (WiFi.status() != WL_CONNECTED) delay(500);
}

void loop() {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        float t = dht.readTemperature();
        String url = String(serverName) + "?api_key=" + apiKey + "&field1=" + String(t);
        
        http.begin(url);
        int httpCode = http.GET();
        Serial.printf("[THINGSPEAK] Pushed Temp: %.1f C | Response Code: %d\n", t, httpCode);
        http.end();
    }
    delay(15000); // ThingSpeak rate limit
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Cloud IoT** | Giải thích sâu sắc Blynk 2.0 Virtual Pins, ThingSpeak API, Telegram Bot Webhooks và giới hạn băng thông Cloud. | Hiểu cách tạo Dashboard Blynk và đẩy dữ liệu lên ThingSpeak. | Nắm được định nghĩa Cloud IoT nhưng chưa cấu hình được Datastreams. | Không đẩy được dữ liệu Cloud. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Blynk 2.0 Dashboard, ThingSpeak Logger, Telegram Alert Bot & Wokwi Lab). | Hoàn thành Bài 7.1 và Bài 7.2 đúng yêu cầu. | Code có lỗi rớt mạng Wi-Fi hoặc sai Token API. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
