# Hướng Dẫn Dự Án Tốt Nghiệp Capstone IoT & Robotics / Final Capstone Project Guide

Dự án tốt nghiệp chiếm **40% tổng số điểm** đánh giá toàn khóa. Học viên chọn 1 trong 3 đề tài (Tracks) dưới đây.

---

## 🧭 Track A: Xe Robot Tự Hành Tránh Vật Cản & Điều Khiển Bằng Smartphone (Autonomous AMR & Bluetooth/Wi-Fi Car)
Xây dựng xe robot 2 bánh sử dụng ESP32 + Mạch cầu H L298N + Cảm biến siêu âm HC-SR04 trên tháp quay Servo SG90. Xe có 2 chế độ:
1. **Tự hành (Autonomous):** Tự động né vật cản thông minh bằng thuật toán đo khoảng cách 3 hướng (Trái, Giữa, Phải).
2. **Điều khiển từ xa (Remote Control):** Kết nối Bluetooth BLE hoặc Web Dashboard Wi-Fi trên Smartphone để lái xe thủ công.

## 🏠 Track B: Hệ Thống Nhà Thông Minh IoT Tự Động & Đẩy Dữ Liệu Cloud (Smart Home IoT Gateway)
Xây dựng trạm điều khiển nhà thông minh ESP32 tích hợp:
- Đọc nhiệt độ/độ ẩm DHT22, tự động bật quạt (Động cơ DC) khi nhiệt độ $> 30^\circ\text{C}$.
- Đọc cảm biến ánh sáng LDR, tự động bật đèn phòng (LED PWM Dimmer) khi trời tối.
- Đẩy dữ liệu lên Cloud Dashboard (Blynk 2.0 / Adafruit IO) và cảnh báo qua Telegram Bot khi phát hiện cháy/rò rỉ khí gas.

## 🤖 Track C: Thiết Bị Giám Sát Sức Khỏe & Nhận Diện Cử Chỉ Edge AI (TinyML Smart Wearable)
Xây dựng thiết bị nhúng đeo tay ESP32 tích hợp cảm biến MPU6050:
- Thu thập dữ liệu gia tốc 3 trục, huấn luyện mô hình TinyML trên Edge Impulse để nhận diện 3 hành vi (Đi bộ, Chạy bộ, Ngã/Té).
- Hiển thị số bước chân và cảnh báo té ngã lên màn hình OLED SSD1306 và phát còi Buzzer.

---

## 🏆 Rubric Đánh Giá Capstone (100 Điểm)

| Tiêu Chí | Điểm | Chi Tiết Đánh Giá Mạch Nhúng & Code C++ |
|---|---|---|
| **Mạch Phần Cứng (Hardware Quality)** | 30 | Lắp mạch gọn gàng, cách ly nguồn động cơ tốt, dây nối chắc chắn, an toàn điện. |
| **Chất Lượng Mã Nguồn C++ (Code Quality)** | 30 | Cấu trúc code sạch, sử dụng Ngắt GPIO / Non-blocking `millis()`, xử lý kết nối Wi-Fi/MQTT tự khôi phục. |
| **Tính Năng Thực Chạy (Demo & Execution)** | 20 | Demo ứng dụng chạy mượt mà, cảm biến phản hồi nhạy, robot né vật cản hoặc Cloud cập nhật mượt. |
| **Báo Cáo Kỹ Thuật (Technical Report)** | 20 | Báo cáo chi tiết sơ đồ nguyên lý mạch (Schematic), bảng đấu nối chân GPIO và tài liệu hướng dẫn sử dụng. |
