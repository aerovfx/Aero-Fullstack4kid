# Tuần 5: IMU, Điều Khiển PID & Lắp Ráp Hoàn Chỉnh / Week 5: IMU, PID Control & Full Assembly

Chào mừng các bạn đến với Tuần 5 của khóa học Xe Tự Hành Tự Làm! Trong tuần này, chúng ta sẽ đi sâu vào bộ não định vị và điều khiển của xe.
Welcome to Week 5 of the DIY Autonomous Car course! This week, we dive deep into the navigation and control brain of the car.

---

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
1. Hiểu và áp dụng được cảm biến IMU (MPU-6050) để đo lường gia tốc và vận tốc góc.
2. Nắm vững sự khác biệt giữa bộ lọc bù (Complementary Filter) và bộ lọc Kalman (Kalman Filter) trong lý thuyết và thực hành.
3. Tích hợp la bàn số HMC5883L để xác định hướng từ trường (Magnetic Heading) và hiệu chỉnh độ lệch từ (Magnetic Declination).
4. Áp dụng kỹ thuật kết hợp dữ liệu cảm biến (Sensor Fusion) để có góc hướng (Heading) chính xác nhất.
5. Hiểu sâu về bộ điều khiển PID (Proportional, Integral, Derivative) và cách tinh chỉnh (Tuning) bằng phương pháp Ziegler-Nichols.
6. Lắp ráp hoàn chỉnh tất cả các linh kiện lên khung xe và thực hiện bài kiểm tra tích hợp toàn hệ thống (System Integration Test).

### English (Tiếng Anh)
1. Understand and apply the IMU sensor (MPU-6050) to measure acceleration and angular velocity.
2. Master the differences between the Complementary Filter and the Kalman Filter in both theory and practice.
3. Integrate the HMC5883L digital compass to determine magnetic heading and apply magnetic declination correction.
4. Apply Sensor Fusion techniques to obtain the most accurate heading angle.
5. Gain a deep understanding of the PID controller (Proportional, Integral, Derivative) and how to tune it using the Ziegler-Nichols method.
6. Fully assemble all components onto the vehicle chassis and perform a System Integration Test.

---

## Linh Kiện & Dụng Cụ / Components & Tools

| STT | Tên Linh Kiện (VI) / Component (EN) | Số lượng / Qty | Đơn giá ước tính (VND) / Estimated Price | Ghi chú / Notes |
|:---:|:---|:---:|:---:|:---|
| 1 | Cảm biến IMU MPU-6050 / MPU-6050 IMU Sensor | 1 | 45,000 | Giao tiếp I2C, địa chỉ 0x68 / I2C interface, address 0x68 |
| 2 | La bàn số HMC5883L / HMC5883L Digital Compass | 1 | 35,000 | Giao tiếp I2C / I2C interface |
| 3 | Khung xe Robot 4 bánh / 4-Wheel Robot Chassis | 1 | 150,000 | Khung Mica hoặc Nhôm / Acrylic or Aluminum chassis |
| 4 | Mạch điều khiển động cơ L298N / L298N Motor Driver | 1 | 30,000 | Dùng để băm xung PWM điều khiển tốc độ / Used for PWM speed control |
| 5 | Dây cắm Breadboard (Đực-Cái, Đực-Đực) / Jumper Wires | 40 | 20,000 | Dùng kết nối mạch / Used for circuit connections |
| 6 | Arduino UNO R3 (hoặc Mega 2560) / Arduino Board | 1 | 120,000 | Vi điều khiển trung tâm / Central Microcontroller |
| 7 | Pin Lipo 2S 7.4V / 2S 7.4V LiPo Battery | 1 | 150,000 | Nguồn cấp cho hệ thống / Power supply for the system |
| 8 | Ốc, vít, và dây thít nhựa / Screws, nuts, zip ties | 1 | 15,000 | Dụng cụ lắp ráp cơ khí / Mechanical assembly tools |

> **Tổng chi phí dự kiến / Estimated Total Cost:** ~565,000 VND

---

## Lý Thuyết / Theory

### 1. Cảm biến MPU-6050 (IMU)
MPU-6050 là một cảm biến IMU (Inertial Measurement Unit) cực kỳ phổ biến. Nó bao gồm:
*   **Con quay hồi chuyển 3 trục (3-axis Gyroscope):** Đo tốc độ góc (độ/giây) quanh 3 trục X, Y, Z.
*   **Gia tốc kế 3 trục (3-axis Accelerometer):** Đo gia tốc lực tĩnh và động (như lực hấp dẫn) trên 3 trục X, Y, Z.

**English:** The MPU-6050 is an extremely popular IMU (Inertial Measurement Unit). It contains:
*   **3-axis Gyroscope:** Measures angular velocity (degrees/second) around the X, Y, and Z axes.
*   **3-axis Accelerometer:** Measures static and dynamic acceleration forces (like gravity) on the X, Y, and Z axes.

Địa chỉ I2C mặc định của MPU-6050 thường là `0x68`. Nếu chân AD0 được nối lên mức cao, địa chỉ sẽ là `0x69`.
Default I2C address is `0x68`. If AD0 pin is pulled HIGH, it becomes `0x69`.

### 2. Sự trôi của Gyroscope và Lọc Dữ Liệu (Gyro Drift & Filtering)
**Tại sao Gyro lại bị trôi? (Why pure gyro drifts?)**
Góc đo được từ gyro là kết quả của việc tích phân vận tốc góc theo thời gian ($ \theta = \int \omega dt $). Tuy nhiên, cảm biến luôn có sai số do nhiễu, sai số bù (bias error), và trôi theo nhiệt độ (temperature drift). Khi tích phân, sai số nhỏ này cộng dồn, làm cho góc bị lệch dần theo thời gian (drift).

**English:** The angle calculated from a gyro is the integral of angular velocity over time. However, sensors always have noise, bias errors, and temperature drifts. When integrated, these small errors accumulate, causing the calculated angle to drift over time.

### 3. Bộ lọc Bù (Complementary Filter) vs Bộ lọc Kalman (Kalman Filter)
Để giải quyết sự trôi của Gyro, ta dùng thuật toán kết hợp với gia tốc kế.
*   **Bộ lọc bù (Complementary Filter):** Rất nhẹ, tính toán nhanh. Nó tin tưởng Gyro trong ngắn hạn (vì Gyro phản hồi nhanh, ít nhiễu rung) và tin tưởng Accelerometer trong dài hạn (vì Accel không bị trôi, luôn hướng xuống tâm trái đất).
*   **Bộ lọc Kalman (Kalman Filter):** Là thuật toán tối ưu toán học, dựa trên phương sai nhiễu. Nó rất chính xác nhưng yêu cầu năng lực tính toán lớn hơn (ma trận). Trong dự án này, bộ lọc bù là đủ tốt.

**English:** To solve gyro drift, we combine it with the accelerometer.
*   **Complementary Filter:** Very lightweight, fast to compute. It trusts the Gyro in the short term (fast response, insensitive to vibration) and the Accelerometer in the long term (no drift, always points to gravity).
*   **Kalman Filter:** A mathematically optimal algorithm based on noise variance. Highly accurate but computationally heavy (matrix operations). For our DIY car, the complementary filter is sufficient.

### 4. La bàn số HMC5883L & Hiệu chỉnh Độ Lệch Từ (Digital Compass & Magnetic Declination)
Cảm biến HMC5883L đo lường từ trường trái đất để tìm ra hướng Bắc Từ (Magnetic North). Tuy nhiên, hướng Bắc Từ không trùng với hướng Bắc Địa Lý (True North). Khoảng cách góc giữa chúng gọi là độ lệch từ (Magnetic Declination).
*Tại Hà Nội, Việt Nam, độ lệch từ khoảng -1° (West).*
*At Hanoi, Vietnam, magnetic declination is approx -1° (West).*

**Sensor Fusion (Kết hợp cảm biến):**
*   **GPS Heading:** Chỉ chính xác khi xe di chuyển nhanh.
*   **Gyroscope:** Tốt khi xe quay đầu nhanh, nhưng bị trôi.
*   **Compass:** Tốt khi xe đứng yên hoặc di chuyển chậm, nhưng dễ bị nhiễu bởi kim loại cục bộ (Hard/Soft iron anomalies).
=> Sự kết hợp của cả ba tạo ra hướng (Heading) hoàn hảo.

### 5. Bộ Điều Khiển PID (PID Controller Deep Dive)
PID là viết tắt của Proportional (Tỷ lệ), Integral (Tích phân), Derivative (Đạo hàm).
PID is short for Proportional, Integral, Derivative.

*   **P (Proportional):** Điều khiển tỷ lệ với sai số. Càng lệch xa mục tiêu, đánh lái càng mạnh. $ P = K_p \times error $.
    *English: Steer proportionally to the heading error. Further away = steer harder.*
*   **I (Integral):** Cộng dồn sai số theo thời gian. Khắc phục sai số trạng thái bền (ví dụ xe bị lệch trọng tâm nên chạy thẳng vẫn bị xéo). $ I = I + K_i \times error \times \Delta t $.
    *English: Accumulates error over time to correct steady-state drift (e.g., uneven weight causing the car to veer).*
*   **D (Derivative):** Tỷ lệ với tốc độ thay đổi của sai số. Chống rung lắc (Overshoot), giúp xe hội tụ mượt mà về mục tiêu. $ D = K_d \times \frac{\Delta error}{\Delta t} $.
    *English: Dampens oscillations. Proportional to the rate of change of error, allowing smooth convergence.*

**Heading PID for steering:**
Sai số hướng (Error) = Hướng mục tiêu (Target Bearing) - Hướng hiện tại (Current Heading).
Heading Error = Target Bearing - Current Heading.
Kết quả của PID sẽ được dùng để điều chỉnh chênh lệch tốc độ giữa bánh trái và bánh phải. (Differential Drive).

### 6. Phương pháp tinh chỉnh Ziegler-Nichols (Ziegler-Nichols Tuning Method)
Đây là cách thủ công có hệ thống (Manual tuning steps):
1. Đặt $K_i = 0$ và $K_d = 0$.
2. Tăng dần $K_p$ cho đến khi hệ thống bắt đầu dao động ổn định (rung lắc qua lại không ngừng). Gọi giá trị này là $K_u$ (Ultimate Gain). Ghi lại chu kỳ dao động là $T_u$.
3. Sử dụng bảng Ziegler-Nichols để tính toán thông số chuẩn:
   - $K_p = 0.6 \times K_u$
   - $K_i = 1.2 \times \frac{K_u}{T_u}$
   - $K_d = 0.075 \times K_u \times T_u$

---

## Công Thức / Formulas

Dưới đây là các công thức toán học quan trọng được áp dụng trực tiếp vào mã nguồn.
Here are the important mathematical formulas directly applied in our source code.

**1. Tích phân Vận tốc góc (Gyro Integration):**
$$ \theta_{gyro} = \theta_{current} + \omega_{z} \times \Delta t $$
*(Trong đó $\omega_{z}$ là tốc độ quay quanh trục Z, $\Delta t$ là thời gian vòng lặp).*

**2. Bộ lọc bù (Complementary Filter):**
$$ Heading = \alpha \times (\text{Heading\_cũ} + \omega_{z} \times \Delta t) + (1 - \alpha) \times \text{Heading\_compass} $$
*(Thường $\alpha = 0.98$ hoặc $0.96$).*

**3. Phương trình PID tổng quát (Standard PID Equation):**
$$ Output(t) = K_p e(t) + K_i \int_{0}^{t} e(\tau) d\tau + K_d \frac{de(t)}{dt} $$
*(Dạng rời rạc trong code / Discrete form in code:)*
$$ P = K_p \times e_{k} $$
$$ I = I_{k-1} + K_i \times e_{k} \times dt $$
$$ D = K_d \times \frac{e_{k} - e_{k-1}}{dt} $$
$$ Output = P + I + D $$

> **Ví dụ (Worked Example):**
> Target Bearing = 90°, Current Heading = 80°. Error = 10°.
> dt = 0.1s. $K_p = 2, K_i = 0.1, K_d = 1$. Prev_Error = 12°.
> P = $2 \times 10 = 20$.
> I = $I_{old} + 0.1 \times 10 \times 0.1 = I_{old} + 0.1$.
> D = $1 \times (10 - 12) / 0.1 = -20$.
> PID Output = $20 + I + (-20) = I$. (Xe đang quay quá nhanh về hướng mục tiêu, D âm để hãm phanh lại).
> *Car is turning too fast toward target, negative D acts as a brake.*

---

## Sơ Đồ Kết Nối / Wiring Diagram

Giao tiếp I2C rất đơn giản, chúng ta có thể nối song song nhiều cảm biến trên cùng 2 đường dây SDA và SCL.
I2C communication is very simple; multiple sensors can be connected in parallel on the same SDA and SCL lines.

**Arduino UNO / Mega to MPU-6050 & HMC5883L:**
*   **VCC** -> 5V (hoặc 3.3V tùy board cảm biến, nên dùng 5V cho MPU6050 module chuẩn)
*   **GND** -> GND
*   **SDA** -> A4 (Trên UNO) / Pin 20 (Trên Mega)
*   **SCL** -> A5 (Trên UNO) / Pin 21 (Trên Mega)

**Arduino to L298N Motor Driver:**
*   **ENA** -> Pin 10 (PWM)
*   **IN1** -> Pin 9
*   **IN2** -> Pin 8
*   **IN3** -> Pin 7
*   **IN4** -> Pin 6
*   **ENB** -> Pin 5 (PWM)

> ⚠️ **CẢNH BÁO AN TOÀN (SAFETY WARNINGS):**
> 1. Không bao giờ cắm ngược cực Pin LiPo. Việc này có thể gây nổ mạch L298N và cháy nổ pin.
> 2. Đảm bảo rút dây nguồn LiPo khi đang nạp code bằng cổng USB. Việc cấp nguồn kép từ cả USB và LiPo (nếu mạch không có diode bảo vệ tốt) có thể làm cháy cổng USB của máy tính.
> 3. Cẩn thận với dây dợ lùng nhùng, xe chạy có thể cuốn dây vào bánh răng. (Cable management is critical!)

---

## Thực Hành / Hands-On

### Bước 1: Lắp ráp cơ khí (Full Vehicle Assembly)
1. Cố định 4 động cơ DC vào khung xe bằng ốc dài và giá đỡ chữ T.
2. Nối dây điện cho các động cơ. Khuyên dùng ống co nhiệt để bảo vệ các mối hàn.
3. Lắp mạch L298N ở phía sau xe.
4. Lắp Arduino UNO lên tầng trên của khung xe.
5. Cố định module MPU-6050 ở **vị trí trọng tâm (Center of Gravity - CoG)** của xe. Điều này cực kỳ quan trọng để trục quay Z không bị lẫn với trục tịnh tiến.
   *(Mount MPU-6050 at the center of gravity of the car. This is crucial so Z-axis rotation isn't mixed with translation).*

### Bước 2: Quản lý cáp (Cable Management)
Sử dụng dây thít nhựa (Zip ties) để bó gọn dây cắm. Đảm bảo không có dây nào quét xuống mặt đất hoặc vướng vào bánh xe. Tách biệt đường dây nguồn (chạy dòng cao từ LiPo) khỏi đường dây tín hiệu I2C để tránh nhiễu điện từ (EMI).
*(Separate power cables from I2C signal cables to avoid Electromagnetic Interference).*

### Bước 3: Quét địa chỉ I2C (I2C Scanner)
Trước khi lập trình sâu, hãy nạp một đoạn code I2C Scanner nhỏ (có sẵn trong thư viện Arduino IDE: `File -> Examples -> Wire -> i2c_scanner`).
Mở Serial Monitor. Nếu kết nối đúng, bạn sẽ thấy thiết bị ở địa chỉ `0x68` (MPU6050) và `0x1E` (HMC5883L).

### Bước 4: Kiểm tra tích hợp hệ thống (System Integration Test & Pre-Run Checklist)
**Pre-run checklist:**
*   [ ] Pin LiPo đã sạc đầy (>7.4V, kiểm tra bằng đồng hồ đo).
*   [ ] I2C scanner nhận diện đủ 2 thiết bị.
*   [ ] Các bánh xe quay tự do khi dùng tay quay nhẹ.
*   [ ] Dây nguồn đã bọc cách điện hoàn toàn.
*   [ ] Mã nguồn (code) đã biên dịch thành công mà không có cảnh báo (Warnings).

---

## Code Arduino

Dưới đây là mã nguồn tích hợp MPU6050 đọc Yaw rate, áp dụng bộ lọc bù và sử dụng PID để điều khiển hai động cơ chạy thẳng theo một góc cố định (Heading hold).

Here is the integrated source code reading MPU6050 Yaw rate, applying a complementary filter, and using PID to control the two motors to drive straight on a fixed heading.

```cpp
/*
 * Course: DIY Autonomous Car - Week 5
 * Description: IMU Reading + PID Heading Control
 * Dependencies: Wire.h (Tích hợp sẵn / Built-in)
 * 
 * Lưu ý: Code này giả định bạn đã đo được bias của GyroZ.
 * Note: This code assumes you have calibrated GyroZ bias.
 */

#include <Wire.h>

// --- L298N Motor Pins ---
const int ENA = 10; // Cấp xung PWM bánh trái (Left PWM)
const int IN1 = 9;  // Hướng bánh trái (Left Dir 1)
const int IN2 = 8;  // Hướng bánh trái (Left Dir 2)
const int IN3 = 7;  // Hướng bánh phải (Right Dir 1)
const int IN4 = 6;  // Hướng bánh phải (Right Dir 2)
const int ENB = 5;  // Cấp xung PWM bánh phải (Right PWM)

// --- IMU MPU6050 ---
const int MPU_ADDR = 0x68; // I2C address of MPU-6050
float gyroZ_bias = 0.0; // Phải hiệu chuẩn trước (Must be calibrated)
float current_heading = 0.0; 
unsigned long last_time;

// --- PID Constants ---
// Cần tinh chỉnh thủ công theo xe của bạn (Tune these for your chassis)
float Kp = 3.5;
float Ki = 0.01;
float Kd = 1.2;

float pid_p = 0, pid_i = 0, pid_d = 0;
float prev_error = 0;
float target_heading = 0.0; // Mục tiêu là giữ góc 0 độ (Target heading 0)

// Tốc độ cơ sở (Base speed)
int base_speed = 120; // 0-255

void setup() {
  Serial.begin(115200);
  Wire.begin();
  
  // Khởi tạo MPU6050 (Initialize MPU6050)
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x6B); // Power Management register
  Wire.write(0);    // Wake up MPU6050 (0 = bật)
  Wire.endTransmission(true);

  // Khởi tạo các chân động cơ (Init motor pins)
  pinMode(ENA, OUTPUT); pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT);
  pinMode(ENB, OUTPUT); pinMode(IN3, OUTPUT); pinMode(IN4, OUTPUT);
  
  // Calibrate Gyro (Đo đạc tĩnh để tìm bias)
  calibrateGyro();
  
  last_time = millis();
  Serial.println("System Ready. Starting PID...");
  delay(2000); // Đợi 2 giây trước khi chạy
}

void loop() {
  unsigned long current_time = millis();
  float dt = (current_time - last_time) / 1000.0; // Đổi sang giây (Seconds)
  last_time = current_time;

  // 1. Đọc dữ liệu Gyro trục Z (Read Z-axis Gyro)
  Wire.beginTransmission(MPU_ADDR);
  Wire.write(0x47); // Thanh ghi GYRO_ZOUT_H
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_ADDR, 2, true);
  int16_t gyro_Z_raw = Wire.read() << 8 | Wire.read();

  // Chuyển đổi sang độ/giây (Convert raw to degrees/sec)
  // Scale factor cho +/- 250 deg/s là 131.0
  float gyro_Z_rate = (gyro_Z_raw / 131.0) - gyroZ_bias;

  // 2. Tích phân để lấy góc (Integrate to get heading)
  // Trong thực tế, dùng bộ lọc bù với la bàn ở đây.
  // In reality, apply complementary filter with compass here.
  current_heading += gyro_Z_rate * dt; 

  // 3. Tính toán PID (Calculate PID)
  float error = target_heading - current_heading;
  
  pid_p = Kp * error;
  pid_i += Ki * error * dt;
  pid_d = Kd * ((error - prev_error) / dt);
  
  float pid_output = pid_p + pid_i + pid_d;
  prev_error = error;

  // 4. Áp dụng xuất tín hiệu ra động cơ (Apply motor output)
  // Nếu sai số dương (xe lệch trái), pid_output dương.
  // Ta cần tăng bánh trái, giảm bánh phải để quay phải.
  int speed_left = base_speed + pid_output;
  int speed_right = base_speed - pid_output;

  // Ràng buộc giới hạn PWM (Constrain PWM limits)
  speed_left = constrain(speed_left, 0, 255);
  speed_right = constrain(speed_right, 0, 255);

  driveMotors(speed_left, speed_right);

  // In ra Serial Monitor để vẽ đồ thị (Serial plotter format)
  Serial.print("Heading:"); Serial.print(current_heading);
  Serial.print(" Target:"); Serial.print(target_heading);
  Serial.print(" Output:"); Serial.println(pid_output);
  
  // Tần số vòng lặp ~100Hz (Loop rate)
  delay(10); 
}

// Hàm điều khiển động cơ (Motor control function)
void driveMotors(int left_pwm, int right_pwm) {
  // Cho xe chạy tới (Forward)
  digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW);
  digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW);
  analogWrite(ENA, left_pwm);
  analogWrite(ENB, right_pwm);
}

// Hàm hiệu chuẩn Gyro (Gyro calibration routine)
void calibrateGyro() {
  Serial.println("Calibrating Gyro... DO NOT MOVE!");
  long sum = 0;
  for(int i=0; i<500; i++) {
    Wire.beginTransmission(MPU_ADDR);
    Wire.write(0x47);
    Wire.endTransmission(false);
    Wire.requestFrom(MPU_ADDR, 2, true);
    int16_t gz = Wire.read() << 8 | Wire.read();
    sum += gz;
    delay(3);
  }
  gyroZ_bias = (sum / 500.0) / 131.0;
  Serial.print("Gyro Bias Z: ");
  Serial.println(gyroZ_bias);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. **(VI)** Tại sao chúng ta không thể chỉ sử dụng riêng gia tốc kế (Accelerometer) để tính toán hướng quay (Yaw/Heading)?
   **(EN)** Why can't we use only the accelerometer to calculate the Yaw/Heading angle?
2. **(VI)** Điều gì sẽ xảy ra nếu thông số $K_p$ trong thuật toán PID được cài đặt quá lớn? Nêu hiện tượng thực tế trên xe.
   **(EN)** What happens if the $K_p$ parameter in the PID algorithm is set too high? Describe the physical phenomenon on the car.
3. **(VI)** Giải thích vai trò của thành phần Đạo Hàm (Derivative - D) trong việc chống lại quán tính của xe.
   **(EN)** Explain the role of the Derivative (D) component in counteracting the car's inertia.
4. **(VI)** Nhiễu kim loại (sắt cứng/sắt mềm - Hard/Soft Iron) ảnh hưởng thế nào đến la bàn HMC5883L? Bạn có gợi ý cách nào để đặt la bàn tốt nhất không?
   **(EN)** How do Hard/Soft Iron magnetic anomalies affect the HMC5883L compass? What are your suggestions for the best compass placement?
5. **(VI)** Nếu thời gian vòng lặp (dt) không ổn định (lúc nhanh lúc chậm), nó sẽ ảnh hưởng thế nào đến bộ lọc bù và thành phần D của PID?
   **(EN)** If the loop time (dt) is inconsistent (sometimes fast, sometimes slow), how does it affect the complementary filter and the D component of the PID?

---

## Bài Về Nhà / Homework

### Bài tập lý thuyết (Theory Assignment):
Nghiên cứu về **Gimbal Lock** trong không gian 3 chiều. Tại sao khi sử dụng góc Euler (Pitch, Roll, Yaw) lại gặp hiện tượng Gimbal Lock? Tìm hiểu qua về Quaternion và viết một đoạn văn (khoảng 150 chữ) giải thích tại sao Quaternion khắc phục được vấn đề này.
*Research **Gimbal Lock** in 3D space. Why do Euler angles (Pitch, Roll, Yaw) suffer from Gimbal Lock? Look into Quaternions and write a short paragraph (150 words) explaining how they solve this issue.*

### Mini-project Thực Hành (Hands-on Mini-project): "Lái Xe Hình Vuông" (Square Driving)
Sử dụng code mẫu ở trên, hãy sửa đổi (modify) hàm `loop()` để xe thực hiện tự động chạy theo quỹ đạo hình vuông khép kín.
*Use the provided sample code and modify the `loop()` function to make the car autonomously drive in a closed square trajectory.*

**Yêu cầu (Requirements):**
1. Đi thẳng 2 giây (Drive straight for 2 seconds).
2. Dừng lại, tăng góc `target_heading` thêm 90 độ. Xe sẽ tự dùng PID để xoay tại chỗ (Turn 90 degrees in place using PID).
3. Đợi cho đến khi sai số `error` nhỏ hơn 2 độ (Wait until error < 2°).
4. Lặp lại 4 lần để hoàn thành hình vuông.

---

## Đánh Giá / Assessment Rubric

Sử dụng bảng dưới đây để chấm điểm Mini-project của học viên (Use this table to grade the student's mini-project):

| Tiêu Chí / Criteria | Xuất Sắc (Excellent - 10đ) | Khá (Good - 8đ) | Đạt (Pass - 6đ) | Cần Cải Thiện (Needs Work - <5đ) |
|:---|:---|:---|:---|:---|
| **Mã nguồn (Code Quality)** | Code sạch, biến rõ ràng, có chú thích đầy đủ. Sử dụng hàm chia nhỏ logic. (Clean, fully commented, modular) | Code chạy tốt nhưng thiếu một số chú thích. (Works well, some missing comments) | Chạy được nhưng logic lộn xộn, dùng delay cứng nhiều. (Works but messy, heavy use of hard delay) | Không biên dịch được hoặc sai logic hoàn toàn. (Fails to compile, bad logic) |
| **PID Tuning** | Xe đi cực kỳ thẳng, xoay góc 90 độ dứt khoát không bị rung lắc (Overshoot < 2 độ). | Xe xoay góc 90 độ được nhưng bị rung lắc nhẹ trước khi dừng. (Slight overshoot) | Góc xoay chưa chính xác hẳn, phải điều chỉnh bằng tay nhiều. (Inaccurate turning) | Xe quay mòng mòng không kiểm soát. Chưa tune được PID. (Spins out of control) |
| **Góc Vuông (Square Path)** | Xe vẽ thành hình vuông hoàn hảo, về đúng điểm xuất phát (Sai số < 10cm). (Perfect square, <10cm error) | Xe đi hình vuông nhưng điểm cuối lệch khoảng 10-30cm. (10-30cm error) | Xe đi thành hình bình hành hoặc quỹ đạo méo. (Parallelogram/skewed path) | Xe không thể rẽ được góc 90 độ, đi lung tung. (Fails to turn 90 deg) |
| **Kiến Thức (Knowledge)** | Trả lời hoàn hảo các câu hỏi thảo luận, hiểu rõ vai trò P, I, D. (Perfect Q&A answers) | Trả lời được nhưng đôi chỗ còn nhầm lẫn giữa P và D. (Minor confusions between P and D) | Trả lời chung chung, chưa hiểu bản chất Gyro drift. (Generic answers, lacks depth) | Không nắm được kiến thức, không thể giải thích code. (No knowledge demonstrated) |

---
*End of Week 5 Materials. Chuẩn bị cho Tuần 6: Tích hợp Cảm biến Siêu Âm và Lập Bản Đồ Tránh Vật Cản (Week 6: Ultrasonic Sensors and Obstacle Avoidance Mapping).*
