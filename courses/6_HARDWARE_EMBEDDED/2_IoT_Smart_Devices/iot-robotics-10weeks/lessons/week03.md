# Tuần 3: Giao Thức Truyền Thông Serial (UART, SPI, I2C), Màn Hình OLED & MPU6050

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững 3 chuẩn giao tiếp Serial tiêu chuẩn trong hệ thống nhúng: **UART**, **I2C (Inter-Integrated Circuit)**, và **SPI (Serial Peripheral Interface)**.
- Hiểu kiến trúc Bus I2C: Chân `SDA` (Serial Data), `SCL` (Serial Clock), địa chỉ I2C ($7$-bit Master-Slave Architecture) và điện trở Kéo lên (Pull-up Resistors).
- Lập trình hiển thị giao diện đồ họa, văn bản và ký hiệu biểu tượng trên màn hình **OLED SSD1306 (128x64 pixels)** bằng thư viện `Adafruit_SSD1306`.
- Đọc dữ liệu gia tốc 3 trục ($a_x, a_y, a_z$) và tốc độ góc ($g_x, g_y, g_z$) từ cảm biến **MPU6050** để tính toán góc nghiêng (Pitch, Roll).

### English
- Master the 3 core serial communication protocols in embedded systems: **UART**, **I2C**, and **SPI**.
- Understand I2C Bus architecture: `SDA`, `SCL`, 7-bit Master-Slave addressing, and Pull-up resistors.
- Program graphical interfaces, text, and icons on the **OLED SSD1306 (128x64 pixels)** display via `Adafruit_SSD1306`.
- Acquire 3-axis acceleration ($a_x, a_y, a_z$) and angular velocity ($g_x, g_y, g_z$) from the **MPU6050** IMU to compute Pitch and Roll angles.

---

## Lý Thuyết / Theory

### 1. So Sánh Giao Thức UART, I2C và SPI / Serial Protocols Comparison

| Tiêu chí / Protocol | UART | I2C | SPI |
| :--- | :--- | :--- | :--- |
| **Số dây tín hiệu** | 2 dây (TX, RX) | 2 dây (SDA, SCL) | 4 dây (MOSI, MISO, SCK, CS) |
| **Tốc độ truyền dữ liệu** | 9600 - 115200 bps | 100 kbps (Standard) - 400 kbps (Fast) | 10 - 50+ Mbps (Rất nhanh) |
| **Số thiết bị hỗ trợ** | 1 - 1 (Peer-to-Peer) | Nhiều Slave trên cùng bus (Địa chỉ 7-bit) | Nhiều Slave (Chân CS riêng) |
| **Đồng bộ Clock** | Đổng bộ không dây (Asynchronous) | Đồng bộ qua dây SCL (Synchronous) | Đồng bộ qua dây SCK (Synchronous) |

---

### 2. Công Thức Tính Góc Nghiêng Từ MPU6050 (Pitch & Roll)

$$\text{Roll} = \arctan\left(\frac{a_y}{\sqrt{a_x^2 + a_z^2}}\right) \times \frac{180}{\pi}$$
$$\text{Pitch} = \arctan\left(\frac{-a_x}{\sqrt{a_y^2 + a_z^2}}\right) \times \frac{180}{\pi}$$

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: OLED SSD1306 & MPU6050 Angle Monitor via I2C Bus
```cpp
/*
 * Lesson 3: MPU6050 IMU Data Visualizer on OLED Display via I2C Bus
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_MPU6050.h>
#include <Adafruit_Sensor.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, -1);
Adafruit_MPU6050 mpu;

void setup() {
    Serial.begin(115200);
    Wire.begin(21, 22); // ESP32 I2C Pins: SDA = GPIO 21, SCL = GPIO 22

    if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
        Serial.println("[-] OLED SSD1306 allocation failed!");
        for(;;);
    }
    
    if (!mpu.begin(0x68)) {
        Serial.println("[-] MPU6050 sensor not found!");
        for(;;);
    }

    display.clearDisplay();
    display.setTextSize(1);
    display.setTextColor(WHITE);
    display.setCursor(10, 20);
    display.println("MPU6050 READY!");
    display.display();
    delay(1000);
}

void loop() {
    sensors_event_t a, g, temp;
    mpu.getEvent(&a, &g, &temp);

    // Calculate Roll and Pitch angles in degrees
    float roll = atan2(a.acceleration.y, a.acceleration.z) * 180.0 / M_PI;
    float pitch = atan2(-a.acceleration.x, sqrt(a.acceleration.y * a.acceleration.y + a.acceleration.z * a.acceleration.z)) * 180.0 / M_PI;

    display.clearDisplay();
    display.setCursor(0, 0);
    display.println("--- IMU MONITOR ---");
    display.printf("Roll : %.1f deg\n", roll);
    display.printf("Pitch: %.1f deg\n", pitch);
    display.printf("Temp : %.1f C\n", temp.temperature);

    // Draw horizon bar graphic
    int barX = map(roll, -90, 90, 0, 128);
    display.drawLine(barX, 50, barX, 64, WHITE);
    display.display();
    
    delay(100);
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao bus I2C chỉ cần 2 dây tín hiệu nhưng lại kết nối được hàng chục thiết bị cảm biến khác nhau?
2. Mục đích của điện trở Kéo lên (Pull-up Resistors) trên đường dây SDA và SCL là gì?
3. Tại sao trong các ứng dụng Robot cân bằng, người ta phải kết hợp dữ liệu gia tốc (Accelerometer) và con quay hồi chuyển (Gyroscope) bằng Bộ lọc Kalman hoặc Bộ lọc Bù (Complementary Filter)?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 3.1: Trình Quét Địa Chỉ I2C (I2C Scanner)
Viết script C++ quét toàn bộ địa chỉ I2C từ `0x01` đến `0x7F` trên ESP32. In ra Serial Monitor danh sách các thiết bị tìm thấy (ví dụ OLED: `0x3C`, MPU6050: `0x68`).

#### Bài 3.2: Đồng Hồ Đếm Giờ Đồ Họa Trên OLED
Lập trình màn hình OLED SSD1306 hiển thị một đồng hồ đếm thời gian dạng `HH:MM:SS` và vẽ thanh tiến trình Progress Bar chạy từ 0% đến 100%.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 3.3: Thước Livo Điện Tử 2 Trục (Digital 2-Axis Bubble Level)
Viết chương trình hiển thị một hình tròn nhỏ (giọt nước livo) di chuyển trên màn hình OLED theo góc nghiêng Pitch/Roll từ cảm biến MPU6050.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 3.4: Giả Lập MPU6050 + OLED SSD1306 Trên Wokwi Online
Mở Wokwi Simulator, lắp mạch ESP32 + OLED + MPU6050. Lập trình đọc góc nghiêng và cảnh báo `[WARNING: TIPPED OVER!]` khi góc nghiêng $> 45^\circ$.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Wire.h>
#include <Adafruit_SSD1306.h>
#include <Adafruit_MPU6050.h>

Adafruit_SSD1306 display(128, 64, &Wire, -1);
Adafruit_MPU6050 mpu;

void setup() {
    Serial.begin(115200);
    Wire.begin(21, 22);
    display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
    mpu.begin(0x68);
}

void loop() {
    sensors_event_t a, g, t;
    mpu.getEvent(&a, &g, &t);
    float roll = atan2(a.acceleration.y, a.acceleration.z) * 180.0 / M_PI;
    
    display.clearDisplay();
    display.setCursor(0, 10);
    display.setTextSize(1);
    display.setTextColor(WHITE);
    display.printf("Roll: %.1f deg\n", roll);
    if (abs(roll) > 45.0) {
        display.setTextSize(2);
        display.setCursor(0, 35);
        display.println("TIPPED OVER!");
    }
    display.display();
    delay(100);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Giao Thức Serial** | Phân tích sâu sắc sự khác biệt giữa UART, I2C, SPI, địa chỉ Bus I2C và công thức tính Roll/Pitch. | Hiểu nguyên lý I2C, OLED SSD1306 và đọc cảm biến MPU6050. | Nắm được định nghĩa I2C nhưng chưa tính được góc nghiêng. | Sai địa chỉ I2C không đọc được mạch. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (I2C Scanner, OLED Stopwatch, Digital Bubble Level & Wokwi Lab). | Hoàn thành Bài 3.1 và Bài 3.2 đúng yêu cầu. | Code có lỗi hiển thị OLED hoặc đơ Bus I2C. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
