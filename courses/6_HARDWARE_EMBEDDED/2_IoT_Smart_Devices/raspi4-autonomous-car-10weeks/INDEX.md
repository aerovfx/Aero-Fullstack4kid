# Khoá Học: Raspberry Pi 4 & Xe Robot Tự Hành Nhúng AI (10 Tuần) / Course: Raspberry Pi 4 & AI Autonomous Vehicles (10 Weeks)

Chào mừng bạn đến với khoá học **Raspberry Pi 4 & Xe Robot Tự Hành Nhúng AI (10 Tuần)**. Chương trình đào tạo chuyên sâu chuẩn STEM K-12 kết hợp Thị giác máy tính (OpenCV), Trí tuệ nhân tạo (Edge AI / CNN), Hệ điều hành Robot (ROS 2) và Điều khiển tự động hóa trên bo mạch **Raspberry Pi 4 Model B**, giúp học viên chế tạo chiếc xe tự hành mô hình có khả năng tự bám làn đường, nhận diện biển báo giao thông và né vật cản thông minh.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 1: PHẦN CỨNG RASPBERRY PI 4 & ĐỘNG CƠ (W1-W3)    │
                                    │  PART 1: RASPBERRY PI 4, POWER & MOTOR CONTROLS        │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Kiến trúc Raspberry Pi 4, Linux Debian, GPIO & SSH/VNC
                                         Tuần 2: Mạch điều khiển động cơ L298N, Mạch PWM PCA9685 & Nguồn Pin
                                         Tuần 3: Kết nối Camera CSI, Cảm biến siêu âm & IMU MPU6050
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: THỊ GIÁC MÁY TÍNH & BÁM LÀN ĐƯỜNG (W4-W7)     │
                                    │  PART 2: COMPUTER VISION & LANE KEEPING SYSTEM         │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 4: Thị giác máy tính OpenCV (Xử lý ảnh, Canny Edge, ROI)
                                         Tuần 5: Thuật toán dò vạch làn đường (Hough Lines & PID Steering)
                                         Tuần 6: Nhận diện biển báo giao thông & Đèn tín hiệu (Color Mask)
                                         Tuần 7: Xe tự hành né vật cản thông minh & Phanh khẩn cấp
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 3: EDGE AI, ROS 2 & DỰ ÁN CAPSTONE (W8-W10)      │
                                    │  PART 3: EDGE AI, ROS 2 & CAPSTONE RACE DAY            │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 8: Nhập môn Edge AI & Mô hình Mạng Nơ-ron CNN (DonkeyCar)
                                         Tuần 9: Hệ điều hành Robot ROS 2 (Nodes, Topics, Teleop Keyboard)
                                         Tuần 10: Tích hợp Hệ thống Xe tự hành & Cuộc thi Capstone Race
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             CUỘC THI XE TỰ HÀNH / CAPSTONE DEMO DAY    │
                                    └──────────────────────────┬─────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/references/components.md) | Danh sách thiết bị Raspberry Pi 4 Kit & Khung xe tự hành với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/references/software.md) | Setup Raspberry Pi OS 64-bit, Python 3, OpenCV, ROS 2 Humble |
| [An Toàn Nguồn Điện & Mạch Điện / Safety Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/references/safety.md) | Quy tắc an toàn nguồn Pin LiPo 3S, UBEC 5V/3A và chống sụt nguồn |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |
| [Google Colab OpenCV & AI Notebooks](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/2_IoT_Smart_Devices/raspi4-autonomous-car-10weeks/notebooks/raspi4_av_colab.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/) Notebook thực hành xử lý ảnh OpenCV & Huấn luyện mô hình Xe tự hành trên Colab |

---

## 📦 Danh Mục Thiết Bị & Linh Kiện Phần Cứng (BOM) / Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| Raspberry Pi 4 Model B (4GB) | Broadcom BCM2711 Quad-Core 1.5GHz, 4GB LPDDR4, Wi-Fi 5GHz, BT 5.0 | 1 | 1,850,000 VNĐ | Raspberry Pi VN / Makerlab |
| Camera CSI Raspberry Pi V2 | Cam 8MP Sensor Sony IMX219, cáp dải 15cm cắm cổng CSI | 1 | 380,000 VNĐ | Nshop / Shopee |
| Khung xe Robot 4 bánh / Ackermann | Khung xe Mica/Kim loại + 4 Động cơ DC + Servo bẻ lái góc | 1 bộ | 450,000 VNĐ | Makerlab / Shopee |
| Mạch lái Servo PWM PCA9685 | Giao tiếp I2C, 16 kênh PWM 12-bit điều khiển Servo & Động cơ | 1 | 65,000 VNĐ | Nshop / Shopee |
| Mạch cầu H L298N / TB6612FNG | Dual Motor Driver 1.2A - 2A điều tốc động cơ DC | 1 | 45,000 VNĐ | Nshop / Shopee |
| Mạch ổn áp UBEC DC-DC 5V/3A | Hạ áp từ Pin 7.4V-12V xuống 5V/3A cấp nguồn sạch cho Raspberry Pi 4 | 1 | 65,000 VNĐ | Makerlab / Shopee |
| Đế Pin Li-ion 18650 3 Cell (11.1V) | 3 Pin Li-ion 18650 3.7V 2600mAh + Đế pin có công tắc | 1 bộ | 135,000 VNĐ | Shopee / Lazada |
| Thẻ nhớ MicroSD 32GB Class 10 | Tốc độ đọc 100MB/s đã nạp sẵn Raspberry Pi OS 64-bit | 1 | 120,000 VNĐ | Shopee / MemoryZone |

**Tổng chi phí phần cứng ước tính:** ~ 3,110,000 VNĐ / Bộ xe tự hành Raspberry Pi 4 cao cấp.

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Raspberry Pi OS 64-bit (Debian Bookworm) / Ubuntu 22.04 LTS.
- **Ngôn ngữ**: Python 3.10+, C++.
- **Thư viện Thị giác máy tính & AI**:
  - `opencv-python` (Canny, HoughLines, Color Mask, Contours).
  - `numpy`, `matplotlib`, `scipy`.
  - `tensorflow` / `tflite-runtime` / `torch` (Mạng Nơ-ron CNN bám làn đường).
- **Hệ điều hành Robot**: ROS 2 Humble Hawksbill (Nodes, Topics, rviz2).
- **Thư viện Điều khiển Phần cứng**: `pigpio`, `RPi.GPIO`, `adafruit-circuitpython-pca9685`.

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết Hệ thống Xe tự hành & OpenCV**: 30%
- **Thực hành Lắp ráp Phần cứng & Viết Code Python**: 40%
- **Giải đấu Xe Tự Hành Capstone Race**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập tuần & Nhật ký kỹ thuật Python**: 40%
- **Mã nguồn OpenCV / ROS 2 & Colab Notebook**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Xe tự hành bám làn mượt mà, dừng đúng biển báo, né vật cản và chạy Sa hình thực tế).
