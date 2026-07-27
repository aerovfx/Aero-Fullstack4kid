# Hướng Dẫn Cài Đặt Phần Mềm Lập Trình IoT / Software Setup Guide

---

## 🛠️ Danh Sách Phần Mềm & Thư Viện

1. **Arduino IDE 2.3+**:
   - Tải từ https://www.arduino.cc/en/software
   - **Thêm ESP32 Board Manager**: Vào `Preferences` -> Thêm URL:
     `https://raw.githubusercontent.com/espressif/arduino-esp32/gh-pages/package_esp32_index.json`
   - Vào `Tools` -> `Board` -> `Board Manager` -> Tìm `esp32` và ấn `Install`.

2. **Cài Đặt USB Driver (CP2102 / CH340)**:
   - Nếu máy tính không nhận cổng COM của ESP32, tải và cài đặt driver:
     - Driver CP210x: Silicon Labs CP210x VCP Driver.
     - Driver CH340: WCH CH341SER Driver.

3. **Thư Viện Arduino Required**:
   - `Adafruit SSD1306` & `Adafruit GFX Library`
   - `Adafruit MPU6050` & `Adafruit Unified Sensor`
   - `DHT sensor library`
   - `PubSubClient` (Dùng cho MQTT)
   - `ArduinoJson`
   - `ESP32Servo`

4. **Giả Lập Wokwi Online (Dành Cho Mobile / Máy Yếu)**:
   - Truy cập https://wokwi.com/ để vẽ mạch và chạy giả lập ESP32 trực tiếp trên trình duyệt.
