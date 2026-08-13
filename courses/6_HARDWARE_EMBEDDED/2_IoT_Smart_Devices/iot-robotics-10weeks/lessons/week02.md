# Tuần 2: Giao Tiếp Cảm Biến & Xử Lý Tín Hiệu Analog/Digital (Sensors, ADC/DAC & Signal Processing)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu nguyên lý hoạt động của các loại **Cảm biến Analog** (LDR Quang trở, Biến trở) và **Cảm biến Digital** (DHT22, Siêu âm HC-SR04).
- Nắm vững bộ chuyển đổi Tương tự - Số **ADC 12-bit (Analog-to-Digital Converter)** của ESP32 với độ phân giải $2^{12} = 4096$ mức ($0 - 4095$).
- Sử dụng hàm ánh xạ tuyến tính `map()` và kỹ thuật lọc trung bình cộng (Moving Average Filter) để làm mịn nhiễu tín hiệu cảm biến.
- Thực hành lập trình đọc nhiệt độ, độ ẩm từ DHT22 và đo khoảng cách chính xác bằng sóng siêu âm HC-SR04.

### English
- Understand the working principles of **Analog Sensors** (LDR Photoresistor, Potentiometer) and **Digital Sensors** (DHT22, Ultrasonic HC-SR04).
- Master ESP32's **12-bit ADC (Analog-to-Digital Converter)** with $2^{12} = 4096$ quantization levels ($0 - 4095$).
- Use linear mapping functions `map()` and Moving Average Filters to smooth noisy sensor readings.
- Practice programming digital readouts for temperature/humidity (DHT22) and ultrasonic distance measurement (HC-SR04).

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- 1 x Board ESP32 DevKit V1.
- 1 x Cảm biến nhiệt độ độ ẩm DHT22 (hoặc DHT11).
- 1 x Cảm biến siêu âm HC-SR04.
- 1 x Quang trở LDR + 1 x Điện trở $10\,\text{k}\Omega$ (Mạch phân áp).
- 1 x Biến trở xoay $10\,\text{k}\Omega$.
- Dây cắm Breadboard & Còi chip Buzzer 5V.

### English
- 1 x ESP32 DevKit V1 Board.
- 1 x DHT22 Temperature & Humidity Sensor.
- 1 x HC-SR04 Ultrasonic Ranging Sensor.
- 1 x LDR Photoresistor + $10\,\text{k}\Omega$ Resistor (Voltage Divider).
- 1 x $10\,\text{k}\Omega$ Potentiometer.
- Jumper Wires & 5V Active Buzzer.

---

## Lý Thuyết / Theory

### 1. Mạch Phân Áp & Chuyển Đổi ADC 12-bit / Voltage Divider & ADC

#### Tiếng Việt
Vi điều khiển không thể đọc trực tiếp sự thay đổi điện trở của Quang trở LDR. Do đó, ta phải dùng **Mạch phân áp (Voltage Divider)** để chuyển đổi sự thay đổi điện trở thành sự thay đổi điện áp:

$$V_{\text{out}} = V_{\text{CC}} \times \frac{R_2}{R_1 + R_2}$$

Giá trị điện áp $V_{\text{out}}$ được đọc bởi ADC 12-bit của ESP32 thành số nguyên $N \in [0, 4095]$:

$$V_{\text{measured}} = \frac{N}{4095} \times 3.3\,\text{V}$$

```text
[ 3.3V ] ─── [ LDR (R1) ] ───┬─── [ 10k Ohm (R2) ] ─── [ GND ]
                             │
                      [ ESP32 GPIO 34 (ADC1) ]
```

---

### 2. Nguyên Lý Đo Khoảng Cách Siêu Âm (HC-SR04)

#### Tiếng Việt
Cảm biến HC-SR04 phát ra xung siêu âm $40\,\text{kHz}$ từ chân `Trig` và đo thời gian $t$ (microsecond) sóng phản hồi quay trở lại chân `Echo`.

**Công thức tính khoảng cách $d$ (cm):**
$$d = \frac{v \times t}{2} = \frac{0.0343\,\text{cm/\mu s} \times t}{2}$$

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: Ultrasonic HC-SR04 Distance Measurement & Moving Average Filter
```cpp
/*
 * Lesson 2: HC-SR04 Ultrasonic Distance Sensor with Moving Average Filter
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>

const int TRIG_PIN = 5;
const int ECHO_PIN = 18;
const int BUZZER_PIN = 19;

const int FILTER_SIZE = 5;
float readings[FILTER_SIZE];
int readIndex = 0;
float total = 0;

float getFilteredDistance() {
    // Send 10us HIGH pulse to Trig
    digitalWrite(TRIG_PIN, LOW);
    delayMicroseconds(2);
    digitalWrite(TRIG_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN, LOW);

    // Measure Echo pulse width in microseconds
    long duration = pulseIn(ECHO_PIN, HIGH, 30000); // 30ms timeout
    float rawDistance = (duration * 0.0343) / 2.0;

    // Apply Moving Average Filter
    total -= readings[readIndex];
    readings[readIndex] = rawDistance;
    total += readings[readIndex];
    readIndex = (readIndex + 1) % FILTER_SIZE;

    return total / FILTER_SIZE;
}

void setup() {
    Serial.begin(115200);
    pinMode(TRIG_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);
    pinMode(BUZZER_PIN, OUTPUT);

    for (int i = 0; i < FILTER_SIZE; i++) readings[i] = 0;
}

void loop() {
    float dist = getFilteredDistance();
    Serial.print("[+] Distance: ");
    Serial.print(dist);
    Serial.println(" cm");

    // Trigger Buzzer alarm if obstacle is closer than 15 cm
    if (dist > 0 && dist < 15.0) {
        digitalWrite(BUZZER_PIN, HIGH);
    } else {
        digitalWrite(BUZZER_PIN, LOW);
    }
    delay(100);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Độ phân giải 12-bit ADC của ESP32 cung cấp độ chính xác điện áp nhỏ nhất (Step size) là bao nhiêu millivolt?
2. Tại sao thời gian tính khoảng cách của cảm biến HC-SR04 lại phải chia cho 2?
3. Bộ lọc trung bình động (Moving Average Filter) giúp loại bỏ nhiễu tín hiệu cảm biến như thế nào?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 2.1: Trạm Đo Môi Trường DHT22
Lập trình ESP32 đọc nhiệt độ và độ ẩm từ cảm biến DHT22 mỗi 2 giây. In dữ liệu ra Serial Monitor dạng JSON: `{"temp": 28.5, "humidity": 65.0}`.

#### Bài 2.2: Hệ Thống Đèn Tự Động Theo Ánh Sáng (Smart Streetlight)
Sử dụng mạch phân áp LDR nối vào GPIO 34. Khi ánh sáng tối (ADC $> 2500$), tự động bật đèn LED (GPIO 23). Khi trời sáng (ADC $< 1000$), tắt đèn LED.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 2.3: Thước Đo Siêu Âm Báo Động Đa Cấp (Multi-stage Ultrasonic Parking Sensor)
Lập trình cảm biến HC-SR04 điều khiển còi Buzzer phát tiếng bíp theo tần số dồn dập khi khoảng cách đến vật cản càng gần (Tương tự cảm biến lùi xe ô tô).

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 2.4: Giả Lập Trạm Cảnh Báo Môi Trường Trên Wokwi
Mở Wokwi Simulator, lắp mạch DHT22 + HC-SR04 + Buzzer + LED. Viết code cảnh báo khi Nhiệt độ $> 35^\circ\text{C}$ hoặc Khoảng cách $< 10\,\text{cm}$.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Arduino.h>
#include "DHT.h"

#define DHTPIN 15
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

const int TRIG_PIN = 5, ECHO_PIN = 18, BUZZER_PIN = 19;

void setup() {
    Serial.begin(115200);
    dht.begin();
    pinMode(TRIG_PIN, OUTPUT); pinMode(ECHO_PIN, INPUT); pinMode(BUZZER_PIN, OUTPUT);
}

void loop() {
    float temp = dht.readTemperature();
    digitalWrite(TRIG_PIN, LOW); delayMicroseconds(2);
    digitalWrite(TRIG_PIN, HIGH); delayMicroseconds(10); digitalWrite(TRIG_PIN, LOW);
    float dist = (pulseIn(ECHO_PIN, HIGH) * 0.0343) / 2.0;

    Serial.printf("[ENVIRONMENT] Temp: %.1f C | Dist: %.1f cm\n", temp, dist);
    if (temp > 35.0 || (dist > 0 && dist < 10.0)) {
        digitalWrite(BUZZER_PIN, HIGH);
    } else {
        digitalWrite(BUZZER_PIN, LOW);
    }
    delay(1000);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Cảm Biến & ADC** | Giải thích sâu sắc ADC 12-bit, mạch phân áp, công thức HC-SR04 và thuật toán lọc nhiễu. | Hiểu cách đọc cảm biến DHT22, HC-SR04 và LDR. | Nắm được định nghĩa cảm biến nhưng chưa tính được khoảng cách. | Đọc sai chân tín hiệu. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (DHT22 JSON, LDR Streetlight, Parking Sensor & Wokwi Lab). | Hoàn thành Bài 2.1 và Bài 2.2 đúng yêu cầu. | Code có lỗi đọc khoảng cách sai hoặc treo chương trình. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 02](../code/week02/README.md), học lần lượt từ `01_...` đến `20_...`.
