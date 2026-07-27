# Khoá Học: Raspberry Pi Pico RP2040 & MicroPython STEM (10 Tuần) / Course: Raspberry Pi Pico RP2040 & MicroPython STEM (10 Weeks)

Chào mừng bạn đến với khoá học **Raspberry Pi Pico RP2040 & MicroPython STEM (10 Tuần)**. Chương trình đào tạo điện tử nhúng và lập trình MicroPython thực chiến chuẩn STEM, dựa trên vi điều khiển **Raspberry Pi Pico / Pico W (Chip RP2040 Dual-Core ARM Cortex-M0+)** và bộ linh kiện điện tử nhúng đa dạng.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 1: NỀN TẢNG PICO RP2040 & MICROPYTHON (W1-W4)    │
                                    │  PART 1: PICO RP2040 BASICS, GPIO & SENSORS            │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Kiến trúc Pico RP2040, Thư viện MicroPython `machine` & GPIO
                                         Tuần 2: ADC 12-bit, Xung PWM Dimmer & Ngắt phím bấm (IRQs)
                                         Tuần 3: Giao tiếp I2C màn hình OLED SSD1306 & MPU6050
                                         Tuần 4: Động cơ DC, Servo SG90 & Còi báo động Buzzer
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: PICO W WI-FI, CLOUD IOT & ROBOT (W5-W8)       │
                                    │  PART 2: PICO W WI-FI, CLOUD TELEMETRY & ROBOTICS      │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 5: Kết nối không dây Wi-Fi (Pico W), Web Server & HTTP API
                                         Tuần 6: Giao thức MQTT Telemetry & Dashboard Blynk Cloud
                                         Tuần 7: Hệ thống Nông nghiệp thông minh & Smart Home Gateway
                                         Tuần 8: Xe Robot Pico tự hành (Né vật cản & Dò đường vạch đen)
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 3: PIO ASSY, EDGE COMPUTING & CAPSTONE (W9-W10)  │
                                    │  PART 3: PIO STATE MACHINES & CAPSTONE DEMO DAY        │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 9: Khối máy trạng thái PIO (Programmable I/O) & Neopixel
                                         Tuần 10: Tích hợp Hệ thống Pico STEM & Bảo vệ Capstone
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
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/references/components.md) | Danh sách thiết bị Raspberry Pi Pico W & Sensor Kit với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/references/software.md) | Setup Thonny IDE, Nạp UF2 Firmware MicroPython, Wokwi Online |
| [An Toàn & Điện Áp / Safety Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/references/safety.md) | Quy tắc an toàn điện áp 3.3V, dòng điện GPIO và cách ly nguồn động cơ |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |
| [Google Colab MicroPython Notebooks](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/pico-stem-10weeks/notebooks/pico_colab.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/) Notebook thực hành thuật toán MicroPython trên Colab |

---

## 📦 Danh Mục Thiết Bị & Linh Kiện Phần Cứng (BOM) / Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| Raspberry Pi Pico W      | RP2040 Dual-Core ARM Cortex-M0+ 133MHz, 2MB Flash, Wi-Fi 2.4GHz | 1 | 185,000 VNĐ | Makerlab / Shopee |
| Breadboard MB-102 & Dây  | Breadboard 830 lỗ + 60 Dây cắm cắm đực-cái, đực-đực | 1 bộ | 40,000 VNĐ | Shopee / Lazada |
| Màn hình OLED 0.96 inch  | Chuẩn giao tiếp I2C, Độ phân giải 128x64 pixels | 1 | 45,000 VNĐ | Makerlab / Nshop |
| Cảm biến DHT11 / DHT22   | Đo nhiệt độ và độ ẩm kỹ thuật số | 1 | 35,000 VNĐ | Nshop / Shopee |
| Cảm biến siêu âm HC-SR04 | Đo khoảng cách bằng sóng siêu âm (2cm - 400cm) | 1 | 22,000 VNĐ | Shopee / Lazada |
| Cảm biến gia tốc MPU6050  | Giao tiếp I2C, 6-Axis Gyroscope & Accelerometer | 1 | 38,000 VNĐ | Makerlab / Nshop |
| Động cơ Servo SG90       | Động cơ Servo 9g (Góc quay 180 độ, 4.8V-6V) | 1 | 25,000 VNĐ | Shopee / Lazada |
| Mạch cầu H L298N & Xe    | Mạch lái 2 động cơ DC + Khung xe mica 2 bánh | 1 bộ | 130,000 VNĐ | Makerlab / Nshop |

**Tổng chi phí phần cứng ước tính:** ~ 520,000 VNĐ / Bộ thực hành Pico STEM tiết kiệm.

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Môi trường phát triển**: Thonny IDE (Windows / macOS / Linux), Wokwi Online.
- **Ngôn ngữ**: MicroPython 1.20+.
- **Thư viện MicroPython**: `machine` (Pin, ADC, PWM, I2C, SPI), `network`, `umqtt.simple`, `dht`.
