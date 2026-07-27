# Hướng Dẫn Cài Đặt Phần Mềm Lập Trình Raspberry Pi Pico / Software Setup Guide

---

## 🛠️ Danh Sách Môi Trường Lập Trình & Thư Viện

1. **Phần Mềm Thonny IDE (Windows / macOS / Linux)**:
   - Tải và cài đặt Thonny IDE từ https://thonny.org/
   - Mở Thonny IDE -> `Tools` -> `Options` -> `Interpreter` -> Chọn `MicroPython (Raspberry Pi Pico)`.

2. **Nạp Firmware MicroPython UF2**:
   - Tải file firmware `.uf2` từ trang chủ https://micropython.org/download/RPI_PICO_W/
   - Nhấn giữ nút `BOOTSEL` trên Pico W, cắm cáp USB vào máy tính. Ổ đĩa `RPI-RP2` xuất hiện.
   - Kéo thả file `.uf2` vào ổ đĩa `RPI-RP2`. Bo mạch tự động khởi động lại và sẵn sàng chạy MicroPython.

3. **Cài Đặt Thư Viện MicroPython Cần Thiết**:
   - Thư viện `ssd1306.py` (Màn hình OLED I2C)
   - Thư viện `mpu6050.py` (Cảm biến gia tốc MPU6050)
   - Thư viện `umqtt.simple` (Giao thức MQTT)

4. **Giả Lập Online Wokwi**:
   - Truy cập https://wokwi.com/projects/new/pi-pico-w để giả lập Raspberry Pi Pico W và linh kiện trực tiếp trên trình duyệt Web.
