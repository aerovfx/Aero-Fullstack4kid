# Tuần 8: Xe Robot Tự Hành AMR - Động Học 2 Bánh & Thuật Toán PID Tránh Vật Cản (Autonomous Mobile Robot Navigation)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững mô hình **Động học Xe Robot 2 Bánh Vi Sai (Differential Drive Kinematics)**: Vận tốc dài $v$, vận tốc góc $\omega$, và tốc độ quay từng bánh ($v_L, v_R$).
- Hiểu nguyên lý làm việc của Cảm biến Encoder đĩa quay quang học để đo phản hồi tốc độ bánh xe.
- Áp dụng thuật toán **Điều khiển Phản hồi PID (Proportional-Integral-Derivative)** để giữ ổn định tốc độ động cơ DC và đi đường thẳng.
- Lập trình thuật toán **Né vật cản tự động (Autonomous Obstacle Avoidance)** kết hợp cảm biến siêu âm HC-SR04 và động cơ Servo SG90 quét 3 hướng.

### English
- Master **Differential Drive Mobile Robot Kinematics**: Linear velocity $v$, angular velocity $\omega$, and individual wheel speeds ($v_L, v_R$).
- Understand Optical Wheel Encoder principles for closed-loop speed feedback.
- Apply **PID (Proportional-Integral-Derivative)** feedback control for motor speed stabilization and straight-line tracking.
- Program an **Autonomous Obstacle Avoidance** algorithm integrating ultrasonic HC-SR04 distance scanning and Servo SG90 panning.

---

## Lý Thuyết / Theory

### 1. Mô Hình Động Học Xe 2 Bánh Vi Sai / Differential Drive Kinematics

#### Tiếng Việt
Cho $L$ là khoảng cách giữa 2 bánh xe (Wheelbase), $R$ là bán kính bánh xe.
- **Vận tốc dài của xe ($v$):**
  $$v = \frac{v_R + v_L}{2}$$

- **Vận tốc góc của xe ($\omega$):**
  $$\omega = \frac{v_R - v_L}{L}$$

- **Tốc độ bánh xe phải và trái ($v_R, v_L$):**
  $$v_R = v + \frac{\omega \cdot L}{2}$$
  $$v_L = v - \frac{\omega \cdot L}{2}$$

---

### 2. Thuật Toán Điều Khiển PID Cho Động Cơ DC

#### Tiếng Việt
$$u(t) = K_p \cdot e(t) + K_i \cdot \int_{0}^{t} e(\tau) d\tau + K_d \cdot \frac{de(t)}{dt}$$

Trong đó $e(t) = \text{SetPoint} - \text{MeasuredValue}$ là sai số tốc độ.

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: Autonomous Obstacle Avoidance Robot Algorithm
```cpp
/*
 * Lesson 8: Autonomous Mobile Robot Obstacle Avoidance Engine
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>
#include <ESP32Servo.h>

// Motor Driver Pins (L298N)
const int ENA = 14, IN1 = 27, IN2 = 26;
const int ENB = 32, IN3 = 25, IN4 = 33;

// Ultrasonic Sensor & Servo
const int TRIG_PIN = 5, ECHO_PIN = 18, SERVO_PIN = 13;
Servo scanServo;

void setupMotors() {
    pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT);
    pinMode(IN3, OUTPUT); pinMode(IN4, OUTPUT);
    ledcAttachPin(ENA, 0); ledcSetup(0, 2000, 8);
    ledcAttachPin(ENB, 1); ledcSetup(1, 2000, 8);
}

void drive(int speedL, int speedR) {
    digitalWrite(IN1, speedL >= 0 ? HIGH : LOW);
    digitalWrite(IN2, speedL >= 0 ? LOW : HIGH);
    digitalWrite(IN3, speedR >= 0 ? HIGH : LOW);
    digitalWrite(IN4, speedR >= 0 ? LOW : HIGH);

    ledcWrite(0, abs(speedL));
    ledcWrite(1, abs(speedR));
}

float pingDistance() {
    digitalWrite(TRIG_PIN, LOW); delayMicroseconds(2);
    digitalWrite(TRIG_PIN, HIGH); delayMicroseconds(10);
    digitalWrite(TRIG_PIN, LOW);
    long dur = pulseIn(ECHO_PIN, HIGH, 25000);
    return (dur == 0) ? 400.0 : (dur * 0.0343) / 2.0;
}

void setup() {
    Serial.begin(115200);
    setupMotors();
    scanServo.attach(SERVO_PIN);
    scanServo.write(90); // Center position
    pinMode(TRIG_PIN, OUTPUT); pinMode(ECHO_PIN, INPUT);
    delay(1000);
}

void loop() {
    float centerDist = pingDistance();
    Serial.printf("[AMR] Front Distance: %.1f cm\n", centerDist);

    if (centerDist > 25.0) {
        // Clear path: Drive Forward
        drive(180, 180);
    } else {
        // Obstacle detected! Stop and scan
        drive(0, 0);
        delay(200);

        // Look Right (45 deg)
        scanServo.write(35); delay(300);
        float distRight = pingDistance();

        // Look Left (135 deg)
        scanServo.write(145); delay(300);
        float distLeft = pingDistance();

        // Reset Servo to Center
        scanServo.write(90); delay(200);

        // Decide turning direction based on clearer path
        if (distRight > distLeft && distRight > 20.0) {
            Serial.println("[AMR] Turning RIGHT...");
            drive(180, -180); delay(400); // Turn Right
        } else if (distLeft > 20.0) {
            Serial.println("[AMR] Turning LEFT...");
            drive(-180, 180); delay(400); // Turn Left
        } else {
            Serial.println("[AMR] Backing UP...");
            drive(-180, -180); delay(500); // Backup
        }
    }
    delay(50);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Mô hình xe 2 bánh vi sai (Differential Drive) thực hiện rẽ ngoặt tại chỗ (Zero-radius Turn) bằng cách điều khiển tốc độ 2 bánh như thế nào?
2. Tại sao nếu không có phản hồi vòng kín PID, xe robot 2 bánh DC thông thường lại rẽ lệch hướng khi điều khiển đi đường thẳng?
3. Ba thành phần $K_p, K_i, K_d$ trong bộ điều khiển PID đóng vai trò gì vào tốc độ đáp ứng và độ vọt lố của hệ thống?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 8.1: Lập Trình Các Chuyển Động Động Học Cơ Bản
Viết các hàm C++ `driveStraight(int speed)`, `spinRight(int speed)`, `spinLeft(int speed)` theo công thức động học vi sai.

#### Bài 8.2: Đọc Xung Encoder Bằng Ngắt GPIO
Viết script C++ đếm số xung từ đĩa quay Encoder đĩa quang nối vào chân ngắt GPIO 4 để tính vận tốc góc của bánh xe.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 8.3: Bộ Điều Khiển Tốc Độ Động Cơ PID Vòng Kín (Closed-loop PID Motor Speed Controller)
Lập trình bộ điều khiển PID trên ESP32 đọc phản hồi Encoder bánh xe để duy trì tốc độ quay bánh xe cố định $120\,\text{RPM}$ dù tải trọng thay đổi.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 8.4: Giả Lập Thuật Toán Xe Né Vật Cản Trên Wokwi
Mở Wokwi Simulator, lắp mạch ESP32 + 2 Động cơ DC + L298N + HC-SR04 + Servo SG90. Lập trình xe né vật cản thông minh và kiểm thử luồng di chuyển.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Arduino.h>
#include <ESP32Servo.h>

Servo s;
const int TRIG=5, ECHO=18, IN1=27, IN2=26, ENA=14;

void setup() {
    Serial.begin(115200); s.attach(13); s.write(90);
    pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT);
    ledcAttachPin(ENA, 0); ledcSetup(0, 2000, 8);
    pinMode(TRIG, OUTPUT); pinMode(ECHO, INPUT);
}

void loop() {
    digitalWrite(TRIG, LOW); delayMicroseconds(2);
    digitalWrite(TRIG, HIGH); delayMicroseconds(10); digitalWrite(TRIG, LOW);
    float d = (pulseIn(ECHO, HIGH) * 0.0343) / 2.0;

    if (d > 20.0) {
        digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW); ledcWrite(0, 180);
    } else {
        digitalWrite(IN1, LOW); digitalWrite(IN2, LOW); ledcWrite(0, 0);
        Serial.println("[OBSTACLE DETECTED] Robot Stopped!");
    }
    delay(100);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Động Học AMR & PID** | Giải thích sâu sắc công thức xe 2 bánh vi sai, đọc Encoder ngắt GPIO và phương pháp tinh chỉnh tham số PID. | Hiểu thuật toán né vật cản và cách điều khiển 2 bánh vi sai. | Nắm được định nghĩa xe robot nhưng chưa viết được thuật toán rẽ. | Xe bị đâm vào tường. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Kinematics Functions, Encoder ISR, Closed-loop PID & Wokwi AMR Lab). | Hoàn thành Bài 8.1 và Bài 8.2 đúng yêu cầu. | Code có lỗi rẽ sai hướng hoặc đơ Servo. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
