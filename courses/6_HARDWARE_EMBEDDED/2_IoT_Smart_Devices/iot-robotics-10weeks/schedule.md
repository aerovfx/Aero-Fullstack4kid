# Lịch Trình Chi Tiết 10 Tuần (IoT, Thiết Bị Thông Minh & Robot Nhúng)

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ).

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Kiến trúc ESP32/Arduino, GPIO, Điện áp & Dòng điện | Lập trình Chớp tắt LED (Blink) & Nút nhấn cơ bản | Cài đặt Arduino IDE 2.0 & ESP32 Core |
| | Buổi 2 | Xung PWM (Pulse Width Modulation) & Ngắt GPIO | Lập trình Đèn LED Dimmer & Ngắt phím bấm (Interrupts) | Đọc tài liệu ESP32 Pinout |
| **Tuần 2** | Buổi 3 | Đọc tín hiệu Analog & Chuyển đổi ADC (Analog-to-Digital) | Lập trình đọc Quang trở LDR & Biến trở tinh chỉnh | Đọc tài liệu ADC 12-bit ESP32 |
| | Buổi 4 | Cảm biến Kỹ thuật số (DHT22, Siêu âm HC-SR04) | Lập trình Trạm đo Nhiệt độ/Độ ẩm & Đo khoảng cách | Đọc thư viện `DHT.h` |
| **Tuần 3** | Buổi 5 | Giao thức Serial UART & Màn hình OLED I2C | Lập trình hiển thị thông số cảm biến lên OLED SSD1306 | Đọc tài liệu I2C Address (0x3C) |
| | Buổi 6 | Cảm biến Gia tốc MPU6050 & Giao tiếp SPI | Lập trình đọc góc nghiêng Gyroscope/Accelerometer | Đọc thư viện `Adafruit_MPU6050` |
| **Tuần 4** | Buổi 7 | Mạch cầu H L298N & Điều khiển Động cơ DC | Lập trình Đổi chiều & Điều tốc động cơ bằng xung PWM | Lắp mạch cầu H L298N với 2 Động cơ |
| | Buổi 8 | Động cơ Servo SG90 & Động cơ Bước 28BYJ-48 | Lập trình quay Servo điều khiển góc & Xoay bước chính xác | Cài đặt thư viện `ESP32Servo.h` |
| **Tuần 5** | Buổi 9 | Chuẩn kết nối không dây Wi-Fi (STA Mode & AP Mode) | Lập trình ESP32 phát Wi-Fi Hotspot & Kết nối Router | Đọc tài liệu `WiFi.h` |
| | Buổi 10 | Bluetooth Classic & Bluetooth Low Energy (BLE) | Lập trình điều khiển bật/tắt thiết bị qua Smartphone App BLE | Tải App nRF Connect / Serial Bluetooth |
| **Tuần 6** | Buổi 11 | Giao thức MQTT (Message Queuing Telemetry Transport) | Lập trình Publish/Subscribe dữ liệu cảm biến qua Mosquitto | Cài đặt thư viện `PubSubClient.h` |
| | Buổi 12 | HTTP AsyncWebServer & Parse JSON API | Tạo Web Dashboard nhúng trực tiếp trên ESP32 để điều khiển | Đọc thư viện `ArduinoJson.h` |
| **Tuần 7** | Buổi 13 | Nền tảng Cloud IoT Blynk 2.0 & Adafruit IO | Kết nối ESP32 lên Dashboard Blynk 2.0 trên Điện thoại | Tạo tài khoản Blynk.cloud & Adafruit IO |
| | Buổi 14 | Nền tảng Phân tích Dữ liệu Telemetry ThingSpeak | Đẩy dữ liệu chuỗi thời gian (Time-series) & Vẽ biểu đồ | Tạo tài khoản ThingSpeak |
| **Tuần 8** | Buổi 15 | Động học Xe Robot Tự Hành (Differential Drive Kinematics) | Lắp ráp Khung xe Robot 2 bánh & Lập trình di chuyển | Chuẩn bị Khung xe 2 bánh & Pin 18650 |
| | Buổi 16 | Cảm biến Siêu âm Tránh Vật Cản & Thuật toán PID | Lập trình Robot tự động né vật cản & Giữ làn đường | Cấu hình mạch điều khiển động cơ L298N |
| **Tuần 9** | Buổi 17 | Nhập môn Edge AI & TinyML trên Vi Điều Khiển | Huấn luyện mô hình phân loại dữ liệu cảm biến Edge Impulse | Tạo tài khoản Edge Impulse |
| | Buổi 18 | Nhận diện Hình ảnh / Âm thanh với ESP32-CAM | Triển khai mô hình TinyML phát hiện khuôn mặt/ký tự | Chuẩn bị Board ESP32-CAM |
| **Tuần 10**| Buổi 19 | Tích hợp Hệ sinh thái IoT Smart Home / Autonomous AMR | Lập trình hệ thống IoT hoàn chỉnh kết hợp Cloud + Hardware | Hoàn thiện Mã nguồn C++ & Mạch nhúng |
| | Buổi 20 | Bảo vệ Dự án Capstone & Demo Day | Chạy xe Robot / Trình diễn Smart Home & Báo cáo kỹ thuật | Hoàn thiện Slide & Report |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Mạch ESP32 điều khiển LED Dimmer bằng xung PWM và nút nhấn ngắt GPIO.
- [ ] **Tuần 2**: Trạm đo môi trường đọc nhiệt độ/độ ẩm DHT22 và đo khoảng cách HC-SR04.
- [ ] **Tuần 3**: Mạch đo góc nghiêng MPU6050 hiển thị đồ thị dữ liệu thực trên màn hình OLED SSD1306.
- [ ] **Tuần 4**: Mạch điều khiển động cơ DC qua cầu H L298N và Servo SG90 quét góc 180 độ.
- [ ] **Tuần 5**: Ứng dụng điều khiển bật/tắt thiết bị qua Bluetooth BLE trên Smartphone.
- [ ] **Tuần 6**: Hệ thống IoT MQTT gửi/nhận dữ liệu hai chiều giữa ESP32 và MQTT Broker.
- [ ] **Tuần 7**: Dashboard Blynk 2.0 & ThingSpeak hiển thị biểu đồ nhiệt độ độ ẩm theo thời gian thực.
- [ ] **Tuần 8**: Xe Robot tự hành 2 bánh né vật cản tự động bằng cảm biến siêu âm.
- [ ] **Tuần 9**: Mô hình TinyML chạy trên ESP32 phát hiện cử chỉ hoặc nhận diện khuôn mặt ESP32-CAM.
- [ ] **Tuần 10**: Sản phẩm Capstone phần cứng hoàn chỉnh đẩy mã nguồn lên GitHub và bảo vệ Demo Day.
