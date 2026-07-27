# Tuần 4: Điều Khiển Động Cơ & Mạch Cầu H (DC Motors, Servo, Stepper & H-Bridge)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu nguyên lý làm việc của 3 loại động cơ phổ biến trong Robotics: **Động cơ DC**, **Động cơ Servo SG90** và **Động cơ Bước (Stepper Motor 28BYJ-48)**.
- Phân tích nguyên lý đảo chiều quay và điều tốc động cơ DC bằng **Mạch cầu H L298N / TB6612FNG**.
- Sử dụng tín hiệu xung PWM từ ESP32 để điều khiển tốc độ góc ($0 - 100\%$) và góc quay của Servo ($0^\circ - 180^\circ$).
- Thực hành lắp mạch điều khiển 2 động cơ DC độc lập và động cơ Servo trên bánh lái robot.

### English
- Master the operating principles of 3 common motor types in Robotics: **DC Motors**, **Servo Motors (SG90)**, and **Stepper Motors (28BYJ-48)**.
- Analyze motor direction reversal and speed regulation using the **L298N / TB6612FNG H-Bridge Driver**.
- Use ESP32 PWM signals to control DC motor rotational speed ($0 - 100\%$) and Servo angular positioning ($0^\circ - 180^\circ$).
- Practice wiring dual DC motor drive circuits and steering servo mechanisms.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Mạch Cầu H (H-Bridge Driver L298N)

#### Tiếng Việt
Mạch cầu H gồm 4 công tắc bán dẫn (Transistor/MOSFET). Việc bật/tắt các cặp công tắc chéo nhau cho phép thay đổi chiều dòng điện chạy qua động cơ DC:
- **Tới (Forward):** $Q_1, Q_4$ Đóng $\implies$ Dòng điện chảy từ Trái qua Phải.
- **Lùi (Reverse):** $Q_2, Q_3$ Đóng $\implies$ Dòng điện chảy từ Phải qua Trái.
- **Hãm (Brake):** $Q_1, Q_3$ Đóng $\implies$ Ngắn mạch động cơ để hãm dừng nhanh.

```text
                  [ VMS (+7.4V Motor Power) ]
                             │
                  ┌──────────┴──────────┐
                  │                     │
               [ Q1 ]                [ Q2 ]
                  │                     │
                  ├───── ( Motor ) ─────┤
                  │                     │
               [ Q3 ]                [ Q4 ]
                  │                     │
                  └──────────┬──────────┘
                             │
                          [ GND ]
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: Dual DC Motor Speed & Direction Control via L298N
```cpp
/*
 * Lesson 4: Dual DC Motor Driver via L298N H-Bridge & ESP32 PWM
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>

// Left Motor (Motor A)
const int ENA = 14; // PWM Speed Pin
const int IN1 = 27; // Direction Pin 1
const int IN2 = 26; // Direction Pin 2

// Right Motor (Motor B)
const int ENB = 32; // PWM Speed Pin
const int IN3 = 25; // Direction Pin 1
const int IN4 = 33; // Direction Pin 2

void setupMotorPins() {
    pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT);
    pinMode(IN3, OUTPUT); pinMode(IN4, OUTPUT);
    
    // Configure PWM channels for speed control
    ledcAttachPin(ENA, 0); ledcSetup(0, 2000, 8); // Channel 0
    ledcAttachPin(ENB, 1); ledcSetup(1, 2000, 8); // Channel 1
}

void setMotorSpeed(int leftSpeed, int rightSpeed) {
    // Left Motor Direction
    if (leftSpeed > 0) {
        digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW);
    } else if (leftSpeed < 0) {
        digitalWrite(IN1, LOW); digitalWrite(IN2, HIGH);
        leftSpeed = -leftSpeed;
    } else {
        digitalWrite(IN1, LOW); digitalWrite(IN2, LOW);
    }

    // Right Motor Direction
    if (rightSpeed > 0) {
        digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW);
    } else if (rightSpeed < 0) {
        digitalWrite(IN3, LOW); digitalWrite(IN4, HIGH);
        rightSpeed = -rightSpeed;
    } else {
        digitalWrite(IN3, LOW); digitalWrite(IN4, LOW);
    }

    // Set PWM Duty Cycle (0 - 255)
    ledcWrite(0, constrain(leftSpeed, 0, 255));
    ledcWrite(1, constrain(rightSpeed, 0, 255));
}

void setup() {
    Serial.begin(115200);
    setupMotorPins();
    Serial.println("[+] L298N Dual Motor Driver initialized!");
}

void loop() {
    Serial.println("[+] Moving FORWARD (Full Speed)...");
    setMotorSpeed(200, 200);
    delay(2000);

    Serial.println("[+] Turning RIGHT...");
    setMotorSpeed(200, -200);
    delay(1000);

    Serial.println("[+] STOPPING...");
    setMotorSpeed(0, 0);
    delay(2000);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Điốt dập xung ngược (Flyback Diode) trên mạch cầu H L298N có vai trò gì trong việc bảo vệ mạch điện?
2. Sự khác biệt cơ bản giữa Động cơ Servo (điều khiển vị trí góc) và Động cơ DC (điều khiển tốc độ quay) là gì?
3. Tại sao không được cấp nguồn động cơ DC trực tiếp từ chân `3V3` hoặc `5V` của vi điều khiển ESP32?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 4.1: Điều Khiển Quét Góc Servo SG90
Lập trình động cơ Servo SG90 nối vào GPIO 13 quét tự động từ $0^\circ \to 180^\circ$ và ngược lại từ $180^\circ \to 0^\circ$ mỗi bước $5^\circ$.

#### Bài 4.2: Hàm Di Chuyển Khung Xe 4 Hướng
Viết các hàm C++ `moveForward()`, `moveBackward()`, `turnLeft()`, `turnRight()`, `stopMotors()` để điều khiển khung xe robot 2 bánh.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 4.3: Radar Quét Khoảng Cách Siêu Âm 180 Độ (Ultrasonic Servo Radar)
Gắn cảm biến siêu âm HC-SR04 lên đầu động cơ Servo SG90. Lập trình Servo quét từ $0^\circ$ đến $180^\circ$, tại mỗi góc $15^\circ$ đo khoảng cách và in ra Serial dạng `[RADAR] Angle: 45 deg | Distance: 32 cm`.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 4.4: Giả Lập Mạch Servo Radar Trên Wokwi Online
Mở Wokwi Simulator, lắp mạch ESP32 + Servo SG90 + HC-SR04. Lập trình Servo xoay và hiển thị bản đồ quét vật cản lên Serial Monitor.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Arduino.h>
#include <ESP32Servo.h>

Servo radarServo;
const int TRIG_PIN = 5, ECHO_PIN = 18, SERVO_PIN = 13;

void setup() {
    Serial.begin(115200);
    radarServo.attach(SERVO_PIN);
    pinMode(TRIG_PIN, OUTPUT); pinMode(ECHO_PIN, INPUT);
}

float measureDist() {
    digitalWrite(TRIG_PIN, LOW); delayMicroseconds(2);
    digitalWrite(TRIG_PIN, HIGH); delayMicroseconds(10); digitalWrite(TRIG_PIN, LOW);
    return (pulseIn(ECHO_PIN, HIGH) * 0.0343) / 2.0;
}

void loop() {
    for (int angle = 0; angle <= 180; angle += 15) {
        radarServo.write(angle);
        delay(150);
        float d = measureDist();
        Serial.printf("Angle: %d deg | Dist: %.1f cm\n", angle, d);
    }
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Động Cơ & Cầu H** | Giải thích sâu sắc nguyên lý cầu H L298N, xung PWM điều tốc và cơ chế Servo. | Hiểu cách điều khiển động cơ DC và Servo SG90. | Nắm được định nghĩa động cơ nhưng chưa đảo được chiều quay. | Đấu sai dây nguồn động cơ. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Servo Sweep, Move Functions, Ultrasonic Radar & Wokwi Lab). | Hoàn thành Bài 4.1 và Bài 4.2 đúng yêu cầu. | Code có lỗi Servo bị giật hoặc động cơ không chạy. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
