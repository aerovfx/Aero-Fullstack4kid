# Lịch Trình Chi Tiết 10 Tuần (Raspberry Pi Pico RP2040 & MicroPython STEM)

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ).

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Khám phá vi điều khiển RP2040, Nạp UF2 MicroPython | Lập trình Chớp tắt LED onboard (`Pin("LED", Pin.OUT)`) | Cài đặt Thonny IDE & Cable USB |
| | Buổi 2 | Sơ đồ chân GPIO Pico, Điện áp 3.3V & Nút nhấn | Lập trình điều khiển LED bằng nút nhấn (Input/Output) | Đọc sơ đồ Pinout Pico RP2040 |
| **Tuần 2** | Buổi 3 | Chuyển đổi Tương tự - Số ADC 12-bit (`machine.ADC`) | Lập trình đọc Biến trở & Quang trở LDR (Mạch phân áp) | Học độ phân giải ADC 16-bit |
| | Buổi 4 | Xung PWM (`machine.PWM`) & Ngắt phần cứng IRQ | Lập trình LED Dimmer & Chống dội nút bấm bằng Ngắt IRQ | Đọc tần số PWM $1\text{kHz}$ |
| **Tuần 3** | Buổi 5 | Giao thức I2C (`machine.I2C`) & Màn hình OLED SSD1306 | Lập trình hiển thị thông số cảm biến lên OLED 128x64 | Đọc địa chỉ I2C `0x3C` |
| | Buổi 6 | Cảm biến Gia tốc MPU6050 & Cảm biến DHT11 | Lập trình đo nhiệt độ độ ẩm & Tính góc nghiêng Pitch/Roll | Đọc thư viện `mpu6050.py` |
| **Tuần 4** | Buổi 7 | Mạch cầu H L298N & Động cơ DC | Lập trình điều tốc & Đổi chiều động cơ DC qua xung PWM | Lắp mạch cầu H L298N |
| | Buổi 8 | Động cơ Servo SG90 & Còi báo động Buzzer | Lập trình quay Servo $0^\circ - 180^\circ$ & Phát nhạc còi | Cài đặt xung PWM $50\text{Hz}$ |
| **Tuần 5** | Buổi 9 | Kết nối Wi-Fi trên Raspberry Pi Pico W (`network`) | Lập trình kết nối Router Wi-Fi & Đọc IP tĩnh | Chuẩn bị Board Pico W |
| | Buổi 10 | HTTP AsyncWebServer & Web API trên Pico W | Tạo Web Dashboard điều khiển bật/tắt thiết bị qua trình duyệt | Học giao thức HTTP GET/POST |
| **Tuần 6** | Buổi 11 | Giao thức MQTT Telemetry (`umqtt.simple`) | Lập trình gửi dữ liệu cảm biến lên MQTT Broker Mosquitto | Cài thư viện `umqtt.simple` |
| | Buổi 12 | Nền tảng Cloud IoT Blynk 2.0 & ThingSpeak | Kết nối Pico W lên Dashboard Blynk di động & ThingSpeak | Tạo tài khoản Blynk.cloud |
| **Tuần 7** | Buổi 13 | Hệ thống Nông nghiệp thông minh Pico W | Lập trình tự động tưới cây khi đất khô & Cảnh báo Telegram | Lắp Cảm biến độ ẩm đất + Bơm 5V |
| | Buổi 14 | Hệ thống Báo động Chống trộm Smart Home | Lập trình phát hiện chuyển động bằng Siêu âm HC-SR04 | Lắp Còi Buzzer + Relay |
| **Tuần 8** | Buổi 15 | Xe Robot Pico Tự Hành 2 Bánh | Lắp ráp Khung xe & Lập trình di chuyển 4 hướng | Lắp Khung xe Robot Pico |
| | Buổi 16 | Xe Robot Né Vật Cản & Dò Đường Vạch Đen | Lập trình thuật toán né vật cản siêu âm & Dò đường IR | Dán băng dính đen trên sàn |
| **Tuần 9** | Buổi 17 | Khối máy trạng thái PIO (Programmable I/O) | Lập trình điều khiển dải đèn LED RGB Neopixel bằng PIO | Đọc kiến trúc RP2040 PIO |
| | Buổi 18 | Tối ưu bộ nhớ RAM MicroPython & Thuật toán FSM | Quản lý bộ nhớ `gc.collect()` & Lập trình Máy trạng thái | Đọc tài liệu MicroPython Mem |
| **Tuần 10**| Buổi 19 | Tích hợp Hệ thống Capstone Pico STEM | Hoàn thiện mã nguồn MicroPython, lắp mạch phần cứng | Hoàn thiện Mô hình Kỹ thuật |
| | Buổi 20 | Bảo vệ Dự án Capstone & Demo Day | Thuyết trình nguyên mẫu, kiểm thử thực tế & Bảo vệ trước lớp | Hoàn thiện Slide & Report |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Mạch Pico chớp tắt LED onboard và điều khiển LED ngoài bằng nút nhấn.
- [ ] **Tuần 2**: Mạch LED Dimmer thay đổi độ sáng theo biến trở ADC và ngắt phím bấm IRQ.
- [ ] **Tuần 3**: Màn hình OLED SSD1306 hiển thị thông số nhiệt độ DHT11 và góc nghiêng MPU6050.
- [ ] **Tuần 4**: Mạch điều khiển động cơ DC qua L298N và Servo SG90 quét góc $180^\circ$.
- [ ] **Tuần 5**: Web Server nhúng trên Pico W kết nối Wi-Fi cho phép bật/tắt thiết bị qua Web.
- [ ] **Tuần 6**: Dashboard Blynk 2.0 hiển thị biểu đồ nhiệt độ độ ẩm từ Pico W theo thời gian thực.
- [ ] **Tuần 7**: Hệ thống tưới cây tự động Pico W kích hoạt bơm 5V và gửi cảnh báo Telegram.
- [ ] **Tuần 8**: Xe Robot Pico tự hành né vật cản siêu âm và bám vạch đen.
- [ ] **Tuần 9**: Script MicroPython PIO điều khiển dải đèn LED RGB Neopixel đổi màu cầu vồng.
- [ ] **Tuần 10**: Mô hình Capstone hoàn chỉnh đẩy mã nguồn lên GitHub và bảo vệ tại Demo Day.
