# Hướng Dẫn Dự Án Tốt Nghiệp Capstone micro:bit STEM / Final Capstone Project Guide

Dự án tốt nghiệp chiếm **40% tổng số điểm** đánh giá toàn khóa. Học viên chọn 1 trong 3 đề tài (Tracks) dưới đây.

---

## 🌾 Track A: Hệ Thống Nông Nghiệp Thông Minh (Smart Automated Greenhouse)
Xây dựng mô hình trang trại thông minh tích hợp BBC micro:bit v2 + Crowtail Shield:
- Đọc cảm biến độ ẩm đất, tự động kích hoạt máy bơm nước 5V khi đất khô.
- Đọc cảm biến nhiệt độ & ánh sáng, mở mái che tự động bằng động cơ Servo SG90 khi trời quá nắng.
- Tự động ghi vết dữ liệu cảm biến vào bộ nhớ Flash (`datalogger`) và phát chuông cảnh báo khi thiếu nước.

## 🤖 Track B: Xe Robot micro:bit Tự Hành & Điều Khiển Không Dây qua Radio (Autonomous AMR & Radio Remote Control)
Xây dựng xe robot 2 bánh sử dụng micro:bit + Mạch cầu H động cơ DC + Cảm biến siêu âm Crowtail:
- Chế độ tự hành: Tự động di chuyển bám vạch đen (Line Following) và né vật cản thông minh.
- Chế độ từ xa: Sử dụng 1 board micro:bit thứ 2 làm tay cầm điều khiển không dây truyền tín hiệu Radio P2P để di chuyển xe 4 hướng.

## 🏠 Track C: Hệ Thống An Ninh Nhà Thông Minh & Định Danh RFID/Radio (Smart Home Security & Radio Lock)
Xây dựng mô hình nhà thông minh chống trộm:
- Phát hiện chuyển động bằng cảm biến siêu âm / gia tốc xóc.
- Phát chuông báo động còi hú và bật hiệu ứng đèn LED RGB Neopixel đỏ/xanh.
- Truyền tín hiệu cảnh báo không dây qua sóng Radio tới micro:bit của chủ nhà. Mở khóa cửa tự động bằng Servo khi nhận đúng mã PIN Radio.

---

## 🏆 Rubric Đánh Giá Capstone (100 Điểm)

| Tiêu Chí | Điểm | Chi Tiết Đánh Giá Mạch micro:bit & Mã Nguồn |
|---|---|---|
| **Chế Tạo Mô Hình Phần Cứng (Hardware Model)** | 30 | Mô hình STEM hoàn chỉnh, kết nối Crowtail gọn gàng, cách ly nguồn bơm/động cơ an toàn. |
| **Chất Lượng Mã Nguồn MakeCode / Python** | 30 | Cấu trúc code sạch, sử dụng Hàm (Functions), Sự kiện ngắt (Events), Radio P2P & Data Logging chuẩn xác. |
| **Tính Năng Thực Chạy (Demo & Execution)** | 20 | Demo ứng dụng chạy mượt mà, cảm biến phản hồi nhạy, robot né vật cản hoặc tự động tưới nước mượt. |
| **Báo Cáo Kỹ Thuật (Technical Report)** | 20 | Báo cáo chi tiết sơ đồ khối thuật toán (Flowchart), nhật ký kỹ thuật và kỹ năng thuyết trình bảo vệ sản phẩm. |
