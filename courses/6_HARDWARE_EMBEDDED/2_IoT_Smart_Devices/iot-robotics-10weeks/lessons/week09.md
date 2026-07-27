# Tuần 9: Trí Tuệ Nhân Tạo Trên Vi Điều Khiển (Edge AI & TinyML)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững khái niệm **TinyML (Edge AI)**: Triển khai các mô hình Học máy (Machine Learning) trực tiếp trên các vi điều khiển có tài nguyên hạn chế.
- Hiểu quy trình phát triển mô hình TinyML chuẩn bằng **Edge Impulse**: Thu thập dữ liệu cảm biến (Data Collection) $\to$ Trích xuất đặc trưng (Feature Extraction) $\to$ Huấn luyện mô hình (Model Training) $\to$ Đóng gói thư viện C++ nhúng (C++ Library Export).
- Triển khai mô hình phân loại cử chỉ chuyển động (Gesture Classification) bằng cảm biến gia tốc MPU6050.
- Tìm hiểu ứng dụng nhận diện khuôn mặt / hình ảnh cơ bản với board **ESP32-CAM**.

### English
- Master **TinyML (Edge AI)** concepts: Deploying Machine Learning models directly onto resource-constrained microcontrollers.
- Understand the end-to-end TinyML workflow via **Edge Impulse**: Data Collection $\to$ Feature Extraction $\to$ Model Training $\to$ C++ Library Deployment.
- Deploy an IMU-based Motion Gesture Classification model using the MPU6050 sensor.
- Explore computer vision and image classification applications with the **ESP32-CAM** board.

---

## Lý Thuyết / Theory

### 1. Quy Trình Phát Triển TinyML Vớ Edge Impulse / TinyML Workflow

```text
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │ DATA LOGGING   │ ───► │ DSP FEATURE    │ ───► │ TENSORFLOW LITE│ ───► │ C++ LIBRARY    │
 │ ESP32 Sensors  │      │ Extraction     │      │ Neural Network │      │ Deployment     │
 └────────────────┘      └────────────────┘      └────────────────┘      └────────────────┘
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: TinyML Anomaly Classifier Deployment on ESP32
```cpp
/*
 * Lesson 9: TinyML On-Device Inference Engine for ESP32
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>

// Simulated TinyML Neural Network Classifier Output
enum GestureClass { GESTURE_IDLE, GESTURE_WAVE, GESTURE_FALL };

GestureClass classifyMotion(float ax, float ay, float az) {
    float magnitude = sqrt(ax * ax + ay * ay + az * az);
    
    // Threshold-based Rule Engine simulating TinyML Classifier output
    if (magnitude > 25.0) {
        return GESTURE_FALL; // Sudden impact detected!
    } else if (magnitude > 14.0) {
        return GESTURE_WAVE; // Active waving motion
    }
    return GESTURE_IDLE;
}

void setup() {
    Serial.begin(115200);
    Serial.println("[+] TinyML ESP32 Inference Engine Ready!");
}

void loop() {
    // Simulated Accelerometer Readings (m/s^2)
    float ax = random(-5, 5);
    float ay = random(-5, 5);
    float az = 9.81 + random(-2, 2);

    GestureClass result = classifyMotion(ax, ay, az);
    
    Serial.printf("[TINYML INFERENCE] Result: ");
    switch (result) {
        case GESTURE_IDLE: Serial.println("IDLE 🟢"); break;
        case GESTURE_WAVE: Serial.println("WAVING 🟡"); break;
        case GESTURE_FALL: Serial.println("⚠️ FALL DETECTED! 🔴"); break;
    }
    
    delay(500);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao lại gọi là "Edge AI" và việc xử lý AI trực tiếp trên vi điều khiển (TinyML) lại có ưu thế về quyền riêng tư (Privacy) và độ trễ (Latency) so với Cloud AI?
2. Bộ nhớ RAM hạn chế 520KB của ESP32 đặt ra những giới hạn gì khi thiết kế mạng Nơ-ron nhân tạo (Neural Network)?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 9.1: Thu Thập Chuỗi Dữ Liệu Gia Tốc MPU6050
Viết script C++ thu thập 100 mẫu dữ liệu gia tốc 3 trục từ MPU6050 dạng CSV (`ax,ay,az`) và in ra Serial Monitor để chuẩn bị làm dữ liệu huấn luyện TinyML.

#### Bài 9.2: Bộ Phân Loại Ngưỡng Quy Tắc (Rule-based Classifier)
Viết script C++ phát hiện hành vi rung lắc thiết bị mạnh và phát cảnh báo còi Buzzer.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 9.3: Huấn Luyện Mô Hình TinyML Trên Edge Impulse (TinyML Gesture Recognition)
1. Tạo dự án trên [Edge Impulse](https://edgeimpulse.com/).
2. Tải lên tập dữ liệu 3 hành vi (Đi bộ, Chạy bộ, Té ngã).
3. Huấn luyện mạng Nơ-ron phân loại (Neural Network Classifier).
4. Xuất thư viện C++ và nhúng vào mã nguồn ESP32.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 9.4: Giả Lập Mạch TinyML Fall Detector Trên Wokwi Online
Mở Wokwi Simulator, lắp mạch ESP32 + MPU6050 + OLED + Buzzer. Lập trình bộ suy luận TinyML phát hiện sự cố té ngã và cảnh báo lên màn hình OLED.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Wire.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_MPU6050.h>

Adafruit_SSD1306 display(128, 64, &Wire, -1);
Adafruit_MPU6050 mpu;

void setup() {
    Serial.begin(115200); Wire.begin(21, 22);
    display.begin(SSD1306_SWITCHCAPVCC, 0x3C); mpu.begin(0x68);
}

void loop() {
    sensors_event_t a, g, t; mpu.getEvent(&a, &g, &t);
    float mag = sqrt(a.acceleration.x*a.acceleration.x + a.acceleration.y*a.acceleration.y + a.acceleration.z*a.acceleration.z);

    display.clearDisplay(); display.setCursor(0, 10); display.setTextColor(WHITE);
    if (mag > 25.0) {
        display.setTextSize(2); display.println("FALL ALERT!");
    } else {
        display.setTextSize(1); display.printf("Mag: %.2f m/s2\nStatus: NORMAL", mag);
    }
    display.display(); delay(100);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức TinyML & Edge AI** | Giải thích sâu sắc quy trình Edge Impulse, kiến trúc mạng Nơ-ron nhúng và tối ưu bộ nhớ RAM/Flash. | Hiểu quy trình thu thập dữ liệu và triển khai TinyML trên ESP32. | Nắm được định nghĩa TinyML nhưng chưa thu thập được dữ liệu CSV. | Không chạy được mô hình. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (CSV Data Logger, Rule Classifier, Edge Impulse Model & Wokwi Lab). | Hoàn thành Bài 9.1 và Bài 9.2 đúng yêu cầu. | Code có lỗi suy luận sai kết quả. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
