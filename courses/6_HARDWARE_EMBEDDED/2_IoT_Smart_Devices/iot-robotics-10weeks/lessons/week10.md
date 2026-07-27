# Tuần 10: Tích Hợp Hệ Thống IoT Smart Home / Xe Robot Tự Hành & Bảo Vệ Capstone (Capstone Project & Demo Day)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tóm tắt và kết nối toàn bộ 10 tuần kiến thức: Vi điều khiển, Cảm biến, Động cơ, Mạng không dây (Wi-Fi, BLE, ESP-NOW, MQTT), Cloud IoT và TinyML thành một **Hệ Thống Nhúng IoT Thực Chiến Hoàn Chỉnh**.
- Thấu hiểu quy trình thiết kế và tối ưu hóa hệ thống IoT thực tế: Tự động khôi phục kết nối (Auto-Reconnect), Quản lý điện năng tiết kiệm pin (Deep Sleep Mode), và Bảo vệ an toàn phần cứng.
- Đóng gói mã nguồn C++ đạt chuẩn công nghiệp, viết tài liệu hướng dẫn lắp mạch Schematic và đẩy mã nguồn lên GitHub.
- Bảo vệ Dự án Tốt nghiệp Capstone (Demo Day) trước hội đồng đánh giá và trình diễn sản phẩm chạy thực tế.

### English
- Synthesize all 10-week embedded IoT modules: Microcontrollers, Sensors, Actuators, Wireless Networking (Wi-Fi, BLE, ESP-NOW, MQTT), Cloud Telemetry, and TinyML into an **Integrated Embedded IoT System**.
- Understand production-grade embedded design patterns: Auto-reconnection handlers, Deep Sleep power optimization, and hardware safety protections.
- Package industry-standard C++ firmware, create circuit schematic documentation, and publish code to GitHub.
- Present and defend the Final Capstone Project during Demo Day with live hardware demonstrations.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Tích Hợp Hệ Thống IoT Hoàn Chỉnh / Full System Architecture

```text
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              EMBEDDED HARDWARE LAYER (ESP32)                           │
 │                                                                                        │
 │  [Sensors: DHT22, HC-SR04, MPU6050, LDR] ───► [ESP32 Core] ───► [Actuators: L298N, Servo]│
 └──────────────────────────────────────────┬─────────────────────────────────────────────┘
                                            │
                                            ▼
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              CONNECTIVITY & CLOUD LAYER                                │
 │                                                                                        │
 │  [Wi-Fi / BLE] ───► [MQTT Broker: Mosquitto] ───► [Cloud Dashboards: Blynk / ThingSpeak]│
 └────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: Complete Integrated Smart Home IoT Gateway & AMR System Baseline
```cpp
/*
 * Lesson 10: Capstone Integrated Smart Home & AMR Control Baseline
 * Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks
 */

#include <WiFi.h>
#include <PubSubClient.h>
#include <ESP32Servo.h>
#include "DHT.h"

// Hardware Pin Definitions
const int DHT_PIN = 15;
const int SERVO_PIN = 13;
const int RELAY_PIN = 23;
const int TRIG_PIN = 5, ECHO_PIN = 18;

DHT dht(DHT_PIN, DHT22);
Servo panServo;
WiFiClient espClient;
PubSubClient mqttClient(espClient);

const char* SSID = "WOKWI-GUEST";
const char* PASSWORD = "";
const char* MQTT_BROKER = "broker.hivemq.com";

void setupHardware() {
    pinMode(RELAY_PIN, OUTPUT);
    pinMode(TRIG_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);
    dht.begin();
    panServo.attach(SERVO_PIN);
    panServo.write(90);
}

void mqttCallback(char* topic, byte* payload, unsigned int length) {
    String message = "";
    for (int i = 0; i < length; i++) message += (char)payload[i];
    Serial.printf("[CAPSTONE SYSTEM] Received Command on %s: %s\n", topic, message.c_str());

    if (String(topic) == "smarthome/relay") {
        digitalWrite(RELAY_PIN, message == "ON" ? HIGH : LOW);
    } else if (String(topic) == "smarthome/servo") {
        int angle = message.toInt();
        panServo.write(constrain(angle, 0, 180));
    }
}

void reconnectWiFiAndMQTT() {
    if (WiFi.status() != WL_CONNECTED) {
        WiFi.begin(SSID, PASSWORD);
        while (WiFi.status() != WL_CONNECTED) { delay(500); Serial.print("."); }
        Serial.println("\n[+] Wi-Fi Reconnected!");
    }
    if (!mqttClient.connected()) {
        while (!mqttClient.connected()) {
            if (mqttClient.connect("CapStone_ESP32_Gateway")) {
                mqttClient.subscribe("smarthome/relay");
                mqttClient.subscribe("smarthome/servo");
                Serial.println("[+] MQTT Broker Reconnected!");
            } else {
                delay(2000);
            }
        }
    }
}

void setup() {
    Serial.begin(115200);
    setupHardware();
    mqttClient.setServer(MQTT_BROKER, 1883);
    mqttClient.setCallback(mqttCallback);
    Serial.println("=== CAPSTONE IOT SYSTEM INITIALIZED ===");
}

void loop() {
    reconnectWiFiAndMQTT();
    mqttClient.loop();

    static unsigned long lastSend = 0;
    if (millis() - lastSend > 3000) {
        lastSend = millis();
        float temp = dht.readTemperature();
        float hum = dht.readHumidity();

        char buffer[128];
        snprintf(buffer, sizeof(buffer), "{\"temp\":%.1f,\"hum\":%.1f}", temp, hum);
        mqttClient.publish("smarthome/telemetry", buffer);
        Serial.printf("[SYSTEM TELEMETRY] Pushed: %s\n", buffer);
    }
}
```

---

## Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix

| Tuần | Chủ Đề Chính | Kỹ Thuật & Sản Phẩm Đạt Được |
| :--- | :--- | :--- |
| **Week 1** | Vi Điều Khiển ESP32 & GPIO | Kiến trúc ESP32, GPIO Modes, Xung PWM Dimmer, Ngắt GPIO ISR & Button Debounce. |
| **Week 2** | Cảm Biến & ADC/DAC | ADC 12-bit, Mạch phân áp LDR, Đọc DHT22, HC-SR04 & Lọc trung bình động (Moving Average). |
| **Week 3** | Giao Thức Serial & MPU6050 | Phân biệt UART/I2C/SPI, Màn hình OLED SSD1306, Cảm biến MPU6050 & Tính góc Pitch/Roll. |
| **Week 4** | Điều Khiển Động Cơ & Cầu H | Mạch cầu H L298N, Điều tốc động cơ DC bằng PWM, Servo SG90 & Động cơ bước 28BYJ-48. |
| **Week 5** | Kết Nối Không Dây | Wi-Fi STA/AP Mode, Bluetooth Low Energy BLE 4.2 & Giao thức không dây ESP-NOW Peer-to-Peer. |
| **Week 6** | Giao Thức IoT (MQTT & HTTP) | Mô hình Pub/Sub MQTT, Broker Mosquitto, AsyncWebServer, REST API & Parse JSON ArduinoJson. |
| **Week 7** | Cloud IoT Dashboards | Dashboard Blynk 2.0, ThingSpeak Time-series Data Logging & Cảnh báo Telegram Bot. |
| **Week 8** | Xe Robot Tự Hành AMR | Động học 2 bánh vi sai (Differential Drive), Wheel Encoders, PID Control & Robot né vật cản. |
| **Week 9** | Edge AI & TinyML | Nhập môn TinyML, Edge Impulse workflow, Nhận diện cử chỉ MPU6050 & ESP32-CAM. |
| **Week 10** | Tích Hợp Hệ Thống & Capstone | Tích hợp hệ thống IoT Smart Home / AMR Robot, hoàn thiện Slide, Code GitHub & Demo Day. |

---

## Đánh Giá Capstone & Demo Day Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Mạch Phần Cứng (Hardware Quality)** | Lắp mạch gọn gàng, cách ly nguồn tốt, dây nối chắc chắn, an toàn điện tuyệt đối. | Lắp mạch chạy đúng nhưng dây nối còn rườm rà. | Mạch chạy được nhưng thiếu dây nối chung đất GND. | Mạch bị ngắn mạch hoặc cháy vi điều khiển. |
| **Hoàn Thành Bài Tập & Capstone** | Hoàn thành xuất sắc cả 4 bài, sản phẩm Capstone chạy mượt mà, slide thuyết trình ấn tượng và bảo vệ thành công. | Hoàn thành Bài 10.1 và Bài 10.2 chạy đúng không lỗi. | Code có lỗi xử lý ngoại lệ rớt mạng Wi-Fi hoặc chưa nộp slide. | Không nộp dự án Capstone. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
