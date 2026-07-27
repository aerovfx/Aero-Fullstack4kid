# Khoá Học: Lập Trình IoT, Thiết Bị Thông Minh & Robot Nhúng (10 Tuần) / Course: Applied IoT, Smart Devices & Embedded Robotics (10 Weeks)

Chào mừng bạn đến với khoá học **Lập Trình IoT, Thiết Bị Thông Minh & Robot Nhúng (10 Tuần)**. Chương trình đào tạo chuẩn STEM được thiết kế nhằm trang bị cho học viên nền tảng điện tử nhúng, kỹ thuật giao tiếp vi điều khiển (ESP32/Arduino), các chuẩn truyền thông mạng (MQTT, HTTP, BLE, ESP-NOW), điều khiển động cơ robot (PWM, PID, Kinematics), và ứng dụng Trí tuệ nhân tạo trên vi điều khiển (TinyML).

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 1: VI ĐIỀU KHIỂN, CẢM BIẾN & GIAO TIẾP (W1-W4)   │
                                    │  PART 1: MICROCONTROLLER, SENSORS & PROTOCOLS           │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Kiến trúc ESP32/Arduino, GPIO, PWM & Ngắt
                                         Tuần 2: Cảm biến & Đọc tín hiệu Analog/Digital (ADC/DAC)
                                         Tuần 3: Giao thức truyền thông Serial (UART, SPI, I2C)
                                         Tuần 4: Điều khiển Động cơ (DC, Servo, Stepper) & H-Bridge
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: KẾT NỐI KHÔNG DÂY, CLOUD IOT & ROBOT (W5-W8)  │
                                    │  PART 2: WIRELESS, CLOUD IOT & MOBILE ROBOTICS         │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 5: Kết nối không dây (Wi-Fi STA/AP, BLE, ESP-NOW)
                                         Tuần 6: Giao thức IoT (MQTT, HTTP Web Server, JSON API)
                                         Tuần 7: Nền tảng Cloud IoT (Blynk, ThingSpeak, Adafruit IO)
                                         Tuần 8: Xe Robot tự hành (Differential Drive & PID Control)
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 3: EDGE AI (TINYML) & CAPSTONE PROJECT (W9-W10)  │
                                    │  PART 3: TINYML & CAPSTONE DEMO DAY                    │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 9: AI trên vi điều khiển (TinyML & ESP32-CAM)
                                         Tuần 10: Xây dựng Hệ sinh thái IoT Smart Home & Bảo vệ Capstone
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             BẢO VỆ DỰ ÁN CUỐI KHOÁ / DEMO DAY          │
                                    └──────────────────────────┬─────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/references/components.md) | Danh sách linh kiện phần cứng (Kit ESP32, Cảm biến, Động cơ) với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/references/software.md) | Setup Arduino IDE 2.0, ESP32 Board Manager, VS Code + PlatformIO, Wokwi |
| [An Toàn Điện & Linh Kiện / Safety Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/references/safety.md) | Quy tắc an toàn điện áp, bảo vệ vi điều khiển, chống ngược cực & ngắn mạch |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |
| [Google Colab & Wokwi Notebooks](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/iot-robotics-10weeks/notebooks/iot_robotics_colab.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/) Notebook thực hành mô phỏng trực tiếp trên trình duyệt / Mobile |

---

## 📦 Danh Mục Thiết Bị & Linh Kiện Phần Cứng (BOM) / Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| Board ESP32 DevKit V1    | Wi-Fi + Bluetooth BLE, 30 pins GPIO, Dual-Core 240MHz | 1 | 115,000 VNĐ | Makerlab / Shopee |
| Mạch điều khiển động cơ L298N | H-Bridge Driver Dual DC Motor (5V-35V 2A) | 1 | 35,000 VNĐ | Nshop / Shopee |
| Khung xe Robot 2 bánh    | Khung Mica + 2 Động cơ DC Vàng + 2 Bánh xe + Bánh dẫn hướng | 1 bộ | 95,000 VNĐ | Makerlab / Nshop |
| Động cơ Servo SG90       | Động cơ Servo 9g (Góc quay 180 độ, 4.8V-6V) | 1 | 25,000 VNĐ | Shopee / Lazada |
| Màn hình OLED 0.96 inch  | Chuẩn giao tiếp I2C, Độ phân giải 128x64 pixels | 1 | 45,000 VNĐ | Makerlab / Nshop |
| Cảm biến DHT22           | Đo nhiệt độ và độ ẩm kỹ thuật số chính xác cao | 1 | 65,000 VNĐ | Nshop / Shopee |
| Cảm biến siêu âm HC-SR04 | Đo khoảng cách bằng sóng siêu âm (2cm - 400cm) | 1 | 22,000 VNĐ | Shopee / Lazada |
| Cảm biến gia tốc MPU6050  | Giao tiếp I2C, 6-Axis Gyroscope & Accelerometer | 1 | 38,000 VNĐ | Makerlab / Nshop |
| Breadboard MB-102 & Dây cắm | Breadboard 830 lỗ + 60 Dây cắm cắm đực-cái, đực-đực | 1 bộ | 40,000 VNĐ | Shopee / Lazada |
| Pin 18650 & Đế pin 2 cell | 2 Pin Li-ion 18650 3.7V 2200mAh + Đế pin ra dây | 1 bộ | 85,000 VNĐ | Nshop / Shopee |

**Tổng chi phí phần cứng ước tính:** ~ 565,000 VNĐ / Bộ thực hành.

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Windows, macOS hoặc Linux.
- **Môi trường phát triển (IDE)**:
  - **Arduino IDE 2.3+**: Nền tảng lập trình C++ cho vi điều khiển.
  - **VS Code + Extension PlatformIO**: Trình biên dịch C/C++ chuyên nghiệp.
  - **Giả lập Wokwi Online**: Giả lập mạch điện ESP32/Arduino 100% trên Web.
- **Thư viện C++ tiêu chuẩn**:
  - `WiFi.h`, `HTTPClient.h`, `PubSubClient.h` (MQTT).
  - `ArduinoJson.h` (Parse dữ liệu JSON).
  - `Adafruit_SSD1306.h`, `Adafruit_MPU6050.h`, `DHT.h`.
- **Thư viện Python (Cloud/AI)**:
  - `paho-mqtt`, `requests`, `pandas`, `scikit-learn` (TinyML & Cloud telemetry).

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết Điện tử & Giao thức nhúng**: 30%
- **Thực hành Lắp mạch & Lập trình Vi điều khiển**: 40%
- **Xây dựng Hệ thống IoT & Xe Robot Thực chiến**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập & Mạch thực hành tuần**: 40%
- **Mã nguồn GitHub & Bài lab Wokwi**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Mạch phần cứng/Xe Robot hoàn chỉnh, Code C++, Báo cáo và Demo Day).
