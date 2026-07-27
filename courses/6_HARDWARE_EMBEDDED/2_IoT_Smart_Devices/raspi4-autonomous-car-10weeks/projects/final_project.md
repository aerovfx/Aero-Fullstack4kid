# Hướng Dẫn Dự Án Tốt Nghiệp Capstone Xe Tự Hành Raspberry Pi 4 / Final Capstone Guide

Dự án tốt nghiệp chiếm **40% tổng số điểm** đánh giá toàn khóa. Học viên chọn 1 trong 3 đề tài (Tracks) dưới đây để tham gia cuộc thi **Capstone AV Race Day**.

---

## 🏎️ Track A: Xe Tự Hành Bám Làn Đường & Nhận Diện Biển Báo Giao Thông (Lane Keeping & Traffic Sign AV)
Xây dựng xe tự hành Raspberry Pi 4 hoàn chỉnh chạy Sa hình đua:
- Sử dụng OpenCV để phát hiện 2 vạch kẻ đường, tự động tính độ lệch tâm và bẻ lái Servo góc quay PID mượt mà.
- Nhận diện biển báo Dừng (STOP Sign) và Đèn giao thông màu Đỏ: Xe tự động dừng 3 giây trước vạch khi có biển báo STOP hoặc đèn đỏ, sau đó tự động đi tiếp khi đèn xanh.

## 🤖 Track B: Xe Tự Hành Nhúng Mạng Nơ-ron CNN Edge AI (Deep Learning Self-Driving Rover)
Xây dựng xe tự hành học theo hành vi lái của con người (Behavioral Cloning):
- Thu thập dữ liệu hình ảnh Camera CSI và góc bẻ lái Joystick ($10,000+$ mẫu ảnh).
- Huấn luyện mô hình Mạng Nơ-ron Cuộn CNN (MobileNet / DonkeyCar CNN) trên Google Colab.
- Đóng gói mô hình `model.tflite` và chạy suy luận thời gian thực trực tiếp trên Raspberry Pi 4 để lái xe tự động qua Sa hình phức tạp.

## 🌐 Track C: Hệ Thống Xe Tự Hành Điểu Khiển Qua ROS 2 & Bản Đồ Mapping (ROS 2 Autonomous Transport Robot)
Xây dựng robot vận chuyển tự hành tích hợp ROS 2:
- Triển khai kiến trúc ROS 2 Nodes: Node Đọc Camera OpenCV $\to$ Node Xử Lý Điều Hướng $\to$ Node Lái Động Cơ Motor Controller.
- Sử dụng tin nhắn chuẩn `/cmd_vel` (Twist) để điều khiển xe từ xa qua mạng Wi-Fi và phát truyền video màu real-time về máy chủ trung tâm.

---

## 🏆 Rubric Đánh Giá Capstone & Capstone Race (100 Điểm)

| Tiêu Chí | Điểm | Chi Tiết Đánh Giá Mạch Xe & Thuật Toán AI |
|---|---|---|
| **Chế Tạo Khung Xe Phần Cứng (Hardware Quality)** | 30 | Khung xe chắc chắn, đi dây gọn gàng, cách ly nguồn UBEC 5V an toàn, an toàn điện tuyệt đối. |
| **Chất Lượng Mã Nguồn Python / OpenCV / ROS 2** | 30 | Cấu trúc code sạch, xử lý ảnh tốc độ cao ($> 20\text{ FPS}$), thuật toán PID bẻ lái mượt mà không đảo lắc. |
| **Thực Chạy Sa Hình (Capstone Race Performance)** | 20 | Xe hoàn thành 3 vòng Sa hình đua: Bám làn mượt, nhận diện biển báo chính xác, né chướng ngại vật mượt. |
| **Báo Cáo Kỹ Thuật (Technical Report)** | 20 | Báo cáo sơ đồ khối thuật toán (Flowchart), bảng tham số PID/Mạng Nơ-ron và thuyết trình bảo vệ tại Demo Day. |
