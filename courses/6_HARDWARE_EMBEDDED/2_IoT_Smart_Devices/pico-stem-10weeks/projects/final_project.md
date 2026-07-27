# Hướng Dẫn Dự Án Tốt Nghiệp Capstone Pico STEM / Final Capstone Guide

Dự án tốt nghiệp chiếm **40% tổng số điểm** đánh giá toàn khóa. Học viên chọn 1 trong 3 đề tài (Tracks) dưới me.

---

## 🌾 Track A: Nông Nghiệp Thông Minh IoT Raspberry Pi Pico W (Smart Plant Irrigation Gateway)
Xây dựng trạm quản lý nông nghiệp thông minh:
- Đọc cảm biến độ ẩm đất, tự động kích hoạt máy bơm nước 5V khi đất khô.
- Đẩy dữ liệu lên Cloud Dashboard (Blynk 2.0 / ThingSpeak) qua Wi-Fi Pico W và tự động gửi tin nhắn Telegram Bot khi phát hiện hết nước.

## 🤖 Track B: Xe Robot Pico Tự Hành Né Vật Cản & Dò Đường (Pico Autonomous AMR Rover)
Xây dựng xe robot 2 bánh sử dụng Pico RP2040 + Mạch cầu H L298N + Cảm biến siêu âm HC-SR04:
- Chế độ bám vạch: Tự động chạy dò đường theo vạch đen trên sàn bằng mắt hồng ngoại.
- Chế độ tự hành: Tự động đo khoảng cách siêu âm 3 hướng và né vật cản thông minh.

## 🏠 Track C: Trạm Giám Sát An Ninh & Môi Trường Smart Home (Pico Smart Home Gateway)
Xây dựng trạm giám sát nhà thông minh:
- Đọc cảm biến nhiệt độ/độ ẩm DHT11, cảm biến ánh sáng LDR và hiển thị thông số lên màn hình OLED 0.96 inch.
- Phát hiện xâm nhập bất thường bằng siêu âm, tự động bật hiệu ứng dải LED Neopixel (dùng khối PIO) và phát còi hú cảnh báo.

---

## 🏆 Rubric Đánh Giá Capstone (100 Điểm)

| Tiêu Chí | Điểm | Chi Tiết Đánh Giá Mạch Nhúng Pico & Code MicroPython |
|---|---|---|
| **Mạch Phần Cứng (Hardware Model)** | 30 | Lắp mạch gọn gàng trên Breadboard, cách ly nguồn động cơ tốt, an toàn điện tuyệt đối. |
| **Chất Lượng Mã Nguồn MicroPython** | 30 | Cấu trúc code sạch, dùng Ngắt IRQ / Xung PWM, xử lý kết nối Wi-Fi/MQTT tự khôi phục, dùng khối PIO mượt. |
| **Tính Năng Thực Chạy (Demo & Execution)** | 20 | Demo ứng dụng chạy mượt mà, cảm biến phản hồi nhạy, robot né vật cản hoặc Cloud cập nhật mượt. |
| **Báo Cáo Kỹ Thuật (Technical Report)** | 20 | Báo cáo chi tiết sơ đồ nguyên lý mạch (Schematic), bảng đấu nối chân GPIO và thuyết trình bảo vệ tại Demo Day. |
