# Lịch Trình Chi Tiết 10 Tuần (Raspberry Pi 4 & Xe Robot Tự Hành Nhúng AI)

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ).

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Khám phá phần cứng Raspberry Pi 4 Model B, Linux OS | Cài đặt Raspberry Pi OS 64-bit & Cấu hình SSH / VNC | Thẻ nhớ 32GB & Raspberry Pi Imager |
| | Buổi 2 | Sơ đồ chân GPIO Raspberry Pi 4 & Thư viện `pigpio` | Lập trình Chớp tắt LED, Đọc phím bấm & PWM phần mềm | Đọc sơ đồ 40-Pin GPIO Header |
| **Tuần 2** | Buổi 3 | Nguồn điện Xe tự hành & Mạch ổn áp UBEC 5V/3A | Đấu nối Pin Li-ion 18650 3S, UBEC & Mạch cầu H L298N | Đọc an toàn nguồn Pin Li-ion |
| | Buổi 4 | Mạch điều khiển PWM I2C PCA9685 & Servo bẻ lái | Lập trình điều khiển tốc độ 4 động cơ DC & Góc quay Servo | Cài đặt `adafruit-circuitpython-pca9685` |
| **Tuần 3** | Buổi 5 | Cấu hình Camera CSI V2 & Thư viện `picamera` / OpenCV | Lập trình thu phát Video Stream thời gian thực qua Web | Cắm cáp dải Camera CSI |
| | Buổi 6 | Cảm biến siêu âm HC-SR04 & IMU 6 trục MPU6050 | Lập trình đo khoảng cách & Cân bằng góc nghiêng | Kết nối Bus I2C (SDA=GPIO2, SCL=GPIO3) |
| **Tuần 4** | Buổi 7 | Nhập môn Thị giác máy tính OpenCV (Computer Vision) | Xử lý ảnh cơ bản: Chuyển xám (Grayscale), Lọc nhiễu Gaussian | Cài đặt `opencv-python` |
| | Buổi 8 | Cắt vùng quan tâm (ROI) & Tách biên Canny Edge | Lập trình lọc khung hình đường đi & Phát hiện đường viền | Học toán tử Canny Edge Detector |
| **Tuần 5** | Buổi 9 | Biến đổi Hough Lines (Hough Line Transform) | Lập trình phát hiện 2 vạch kẻ đường (Trái/Phải) trong Video | Đọc thuật toán Hough Transform |
| | Buổi 10 | Thuật toán bám làn đường & Bộ điều khiển góc lái PID | Lập trình tính độ lệch tâm (Center Offset Error) & Bẻ lái | Học bộ điều khiển Proportional (P) |
| **Tuần 6** | Buổi 11 | Không gian màu HSV & Mặt nạ lọc màu (Color Masking) | Lập trình nhận diện Đèn giao thông (Đỏ, Vàng, Xanh) | Học chuyển đổi không gian BGR $\to$ HSV |
| | Buổi 12 | Nhận diện Biển báo giao thông (Stop Sign Detection) | Lập trình nhận diện biển Dừng (STOP) & Biển giới hạn tốc độ | Đọc thuật toán Haar Cascade / Contours |
| **Tuần 7** | Buổi 13 | Động học Xe 4 Bánh & Thuật toán Tránh vật cản | Lập trình kết hợp Camera + Cảm biến siêu âm né vật cản | Lắp cụm siêu âm HC-SR04 đầu xe |
| | Buổi 14 | Hệ thống Phanh Khẩn Cấp (Emergency Braking Engine) | Lập trình tự động dừng xe khẩn cấp khi có chướng ngại vật | Kiểm thử phanh tức thời |
| **Tuần 8** | Buổi 15 | Nhập môn Trí tuệ Nhân tạo Edge AI & Mạng Nơ-ron CNN | Huấn luyện mô hình CNN tự bám làn đường (Behavioral Cloning) | Tạo tài khoản Google Colab |
| | Buổi 16 | Đóng gói mô hình TensorFlow Lite / TFLite nhúng | Triển khai mô hình AI chạy suy luận trực tiếp trên Pi 4 | Cài đặt `tflite-runtime` |
| **Tuần 9** | Buổi 17 | Nhập môn Hệ điều hành Robot ROS 2 (ROS 2 Humble) | Tạo ROS 2 Workspace, Nodes, Publisher/Subscriber Python | Cài đặt ROS 2 Humble |
| | Buổi 18 | Điều khiển từ xa bàn phím Teleop Keyboard qua ROS 2 | Lập trình truyền nhận Topic tốc độ `/cmd_vel` bẻ lái xe | Đọc tài liệu ROS 2 Twist Message |
| **Tuần 10**| Buổi 19 | Tích hợp Hệ thống Xe Tự Hành Raspberry Pi 4 | Hoàn thiện mã nguồn Python, tối ưu FPS & Chạy thử Sa hình | Cấu hình Sa hình chạy xe tự hành |
| | Buổi 20 | Giải Đấu Xe Tự Hành Capstone Race & Demo Day | Thuyết trình nguyên mẫu xe, Đua xe bám làn tự động & Bảo vệ | Hoàn thiện Slide & Report |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Hệ thống Raspberry Pi OS 64-bit khởi động mượt mà, điều khiển GPIO qua SSH và VNC Desktop.
- [ ] **Tuần 2**: Mạch điều khiển động cơ DC & Servo bẻ lái góc quay mượt qua chip PCA9685 PWM.
- [ ] **Tuần 3**: Video Stream thời gian thực từ Camera CSI hiển thị lên Web Dashboard.
- [ ] **Tuần 4**: Script OpenCV xử lý ảnh khung hình, lọc nhiễu Gaussian Blur và phát hiện biên Canny.
- [ ] **Tuần 5**: Thuật toán bám làn đường Hough Lines tự động tính góc bẻ lái Servo theo đường cong.
- [ ] **Tuần 6**: Xe tự động nhận diện Đèn giao thông đỏ/xanh và biển báo Dừng (STOP Sign).
- [ ] **Tuần 7**: Hệ thống phanh khẩn cấp dừng xe tức thời khi phát hiện chướng ngại vật $< 20\,\text{cm}$.
- [ ] **Tuần 8**: Mô hình Mạng Nơ-ron CNN TensorFlow Lite chạy suy luận tốc độ $> 25\,\text{FPS}$ trên Pi 4.
- [ ] **Tuần 9**: Hệ thống ROS 2 Node điều khiển xe nhận lệnh Topic `/cmd_vel` từ bàn phím.
- [ ] **Tuần 10**: Xe tự hành hoàn thành toàn bộ Sa hình đua Capstone Race không lấn làn và bảo vệ sản phẩm.
