# Tuần 6: Giao Thức IoT - MQTT, HTTP Server & Parse JSON (MQTT & HTTP Web API)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu kiến trúc giao thức truyền nhận dữ liệu nhẹ chuẩn công nghiệp **MQTT (Message Queuing Telemetry Transport)**: Broker, Publisher, Subscriber, Topics và QoS Levels ($0, 1, 2$).
- Nắm vững định dạng dữ liệu **JSON (JavaScript Object Notation)** và kỹ thuật đóng gói/giải mã bằng thư viện `ArduinoJson`.
- Xây dựng **HTTP RESTful AsyncWebServer** trên ESP32 hỗ trợ các phương thức GET/POST.
- Thực hành truyền nhận dữ liệu cảm biến hai chiều giữa ESP32 và máy chủ MQTT Broker (Mosquitto / HiveMQ).

### English
- Master the industrial IoT standard protocol **MQTT**: Broker, Publisher, Subscriber, Topics, and Quality of Service (QoS 0, 1, 2).
- Understand **JSON** data serialization and deserialization using the `ArduinoJson` library.
- Build an asynchronous **HTTP RESTful AsyncWebServer** on ESP32 handling GET/POST requests.
- Practice 2-way sensor telemetry publishing and command subscription with an MQTT Broker (Mosquitto / HiveMQ).

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Giao Thức MQTT / MQTT Protocol Architecture

#### Tiếng Việt
MQTT hoạt động theo mô hình **Publish / Subscribe** chạy trên nền TCP/IP với Header gói tin siêu nhẹ (chỉ 2 bytes):
- **MQTT Broker:** Máy chủ trung tâm tiếp nhận và phân phối tin nhắn (ví dụ: `broker.hivemq.com` hoặc Mosquitto).
- **Topic:** Chuỗi định tuyến tin nhắn phân cấp (ví dụ: `smarthome/livingroom/temperature`).
- **Publisher:** Thiết bị gửi dữ liệu lên Topic (ESP32 gửi nhiệt độ).
- **Subscriber:** Thiết bị đăng ký nhận dữ liệu từ Topic (Smartphone / Web App nhận cảnh báo).

```text
 [ ESP32 Publisher ] ─── ( Publish: smarthome/temp = 28.5 ) ───► [ MQTT BROKER ]
                                                                       │
 [ Mobile App Subscriber ] ◄─── ( Forward Payload: 28.5 ) ─────────────┘
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: ESP32 MQTT Telemetry Publisher & Subscriber
```cpp
/*
 * Lesson 6: ESP32 MQTT Publisher & Subscriber via PubSubClient
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>

const char* SSID = "WOKWI-GUEST";
const char* PASSWORD = "";
const char* MQTT_BROKER = "broker.hivemq.com";
const int MQTT_PORT = 1883;

WiFiClient espClient;
PubSubClient mqttClient(espClient);

const int LED_PIN = 23;

// Callback executed when an MQTT message arrives on a subscribed topic
void mqttCallback(char* topic, byte* payload, unsigned int length) {
    Serial.printf("[MQTT] Message arrived on topic: %s\n", topic);
    
    // Parse JSON payload using ArduinoJson
    StaticJsonDocument<200> doc;
    DeserializationError error = deserializeJson(doc, payload, length);
    
    if (error) {
        Serial.println("[-] JSON Parsing failed!");
        return;
    }

    bool status = doc["status"];
    digitalWrite(LED_PIN, status ? HIGH : LOW);
    Serial.printf("[+] LED State Updated -> %s\n", status ? "ON" : "OFF");
}

void reconnectMQTT() {
    while (!mqttClient.connected()) {
        Serial.print("[+] Connecting to MQTT Broker...");
        String clientId = "ESP32Client-" + String(random(0xffff), HEX);
        
        if (mqttClient.connect(clientId.c_str())) {
            Serial.println(" CONNECTED!");
            // Subscribe to control topic
            mqttClient.subscribe("smarthome/livingroom/led_control");
        } else {
            Serial.print(" Failed, rc=");
            Serial.print(mqttClient.state());
            Serial.println(" Retrying in 5 seconds...");
            delay(5000);
        }
    }
}

void setup() {
    Serial.begin(115200);
    pinMode(LED_PIN, OUTPUT);
    
    WiFi.begin(SSID, PASSWORD);
    while (WiFi.status() != WL_CONNECTED) { delay(500); Serial.print("."); }
    Serial.println("\n[+] Wi-Fi Connected!");

    mqttClient.setServer(MQTT_BROKER, MQTT_PORT);
    mqttClient.setCallback(mqttCallback);
}

void loop() {
    if (!mqttClient.connected()) reconnectMQTT();
    mqttClient.loop();

    // Periodically publish telemetry JSON every 5 seconds
    static unsigned long lastPub = 0;
    if (millis() - lastPub > 5000) {
        lastPub = millis();

        StaticJsonDocument<200> doc;
        doc["temperature"] = 28.5;
        doc["humidity"] = 65.0;
        doc["device_id"] = "ESP32_DEV_01";

        char buffer[256];
        serializeJson(doc, buffer);
        
        mqttClient.publish("smarthome/livingroom/telemetry", buffer);
        Serial.printf("[+] Published Telemetry: %s\n", buffer);
    }
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao giao thức MQTT lại phù hợp hơn HTTP trong các ứng dụng IoT sử dụng pin và mạng di động 3G/4G chập chờn?
2. Phân biệt sự khác nhau giữa 3 cấp độ tin cậy QoS (Quality of Service) $0, 1, 2$ trong MQTT.
3. Thư viện `ArduinoJson` quản lý bộ nhớ đệm (StaticJsonDocument vs DynamicJsonDocument) như thế nào?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 6.1: Đóng Gói Chuỗi JSON Cảm Biến Với ArduinoJson
Viết script C++ đóng gói dữ liệu gồm 4 thông số: `temp`, `humidity`, `lux`, `motion_detected` thành chuỗi JSON chuẩn và in ra Serial Monitor.

#### Bài 6.2: MQTT Publisher Đơn Giản
Viết script ESP32 gửi giá trị khoảng cách từ cảm biến HC-SR04 lên topic MQTT `robot/distance` mỗi 1 giây.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 6.3: Trạm Điều Khiển Thiết Bị Đa Kênh MQTT JSON (Multi-channel MQTT Controller)
Lập trình ESP32 đăng ký topic `home/control`. Nhận gói tin JSON điều khiển 3 Relay/LED độc lập (`{"relay1": true, "relay2": false, "pwm_dimmer": 128}`) và phản hồi lại trạng thái thực tế.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 6.4: Giả Lập Mạch MQTT IoT Client Trên Wokwi Online
Mở Wokwi Simulator, lắp mạch ESP32 + DHT22 + LED. Kết nối vào HiveMQ Public Broker, gửi telemetry và nhận lệnh bật/tắt LED từ MQTT Web Client.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <WiFi.h>
#include <PubSubClient.h>
#include "DHT.h"

DHT dht(15, DHT22);
WiFiClient espClient;
PubSubClient client(espClient);

void setup() {
    Serial.begin(115200); dht.begin();
    WiFi.begin("Wokwi-GUEST", "");
    while (WiFi.status() != WL_CONNECTED) delay(500);
    client.setServer("broker.hivemq.com", 1883);
}

void loop() {
    if (!client.connected()) client.connect("ESP32_Wokwi_Client");
    client.loop();
    
    char msg[128];
    snprintf(msg, sizeof(msg), "{\"temp\":%.1f,\"hum\":%.1f}", dht.readTemperature(), dht.readHumidity());
    client.publish("wokwi/sensor/data", msg);
    delay(3000);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Giao Thức MQTT & JSON** | Giải thích sâu sắc mô hình Pub/Sub, QoS Levels, cú pháp JSON và thư viện `ArduinoJson`. | Hiểu quy trình kết nối MQTT Broker và đóng gói JSON. | Nắm được định nghĩa MQTT nhưng chưa parse được chuỗi JSON. | Không kết nối được MQTT Broker. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (JSON Serializer, MQTT Publisher, Multi-channel Controller & Wokwi Lab). | Hoàn thành Bài 6.1 và Bài 6.2 đúng yêu cầu. | Code có lỗi rò rỉ bộ nhớ JSON hoặc treo client MQTT. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 06](../code/week06/README.md), học lần lượt từ `01_...` đến `20_...`.
