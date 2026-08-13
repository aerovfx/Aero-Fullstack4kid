# Tuần 10: Tích Hợp Hệ Thống Xe Tự Hành Raspberry Pi 4 & Giải Đấu Capstone Race (Capstone AV System & Race Day)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tóm tắt và kết nối toàn bộ 10 tuần kiến thức: Raspberry Pi 4 BCM2711, Mạch PWM PCA9685, Cầu H L298N, Camera CSI, Thị giác máy tính OpenCV, Thuật toán bám làn Hough Lines, Nhận diện biển báo, Phanh khẩn cấp EBS, Edge AI TFLite và ROS 2 thành một **Hệ Thống Xe Tự Hành Thực Chiến Hoàn Chỉnh**.
- Thấu hiểu quy trình thiết kế xe tự hành thương mại: Xử lý ngoại lệ rớt khung hình, Quản lý tài nguyên CPU/RAM và Tự động khôi phục sự cố trên Sa hình.
- Đóng gói mã nguồn Python đạt chuẩn công nghiệp, viết tài liệu sơ đồ mạch điện và đăng tải sản phẩm lên GitHub.
- Tham gia Giải đấu Xe Tự Hành **Capstone AV Race Day** (Chạy sa hình bám làn mượt mà, dừng đúng biển báo, né chướng ngại vật) và bảo vệ sản phẩm trước hội đồng.

### English
- Synthesize all 10-week autonomous vehicle modules: Raspberry Pi 4 BCM2711, PCA9685 PWM, L298N H-Bridge, CSI Camera, OpenCV vision, Hough Lines steering, Sign recognition, EBS, TFLite Edge AI, and ROS 2 into an **Integrated Autonomous Scale Vehicle System**.
- Master commercial AV system design patterns: Frame drop exception handling, CPU/RAM resource budgeting, and automatic course recovery handlers.
- Package production-grade Python code, document schematic wiring diagrams, and publish source code to GitHub.
- Compete in the **Capstone AV Race Day** (Smooth lane keeping, sign compliance, obstacle bypass) and defend the project.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Tích Hợp Hệ Thống Xe Tự Hành Raspberry Pi 4

```text
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              HARDWARE SENSOR & ACTUATOR LAYER                          │
 │                                                                                        │
 │  [CSI Camera 8MP] ────► [Raspberry Pi 4 BCM2711] ────► [PCA9685 PWM] ──► [Servo SG90]  │
 │  [HC-SR04 / IMU] ───┘   (4GB RAM / Linux OS)   └───► [L298N H-Bridge] ──► [4 DC Motors]│
 └──────────────────────────────────────────┬─────────────────────────────────────────────┘
                                            │
                                            ▼
 ┌────────────────────────────────────────────────────────────────────────────────────────┐
 │                              SOFTWARE & INTELLIGENCE LAYER                             │
 │                                                                                        │
 │  [OpenCV Pipeline] ───► [Hough Lines / CNN] ───► [PID Controller] ───► [EBS Safety]    │
 └────────────────────────────────────────────────────────────────────────────────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Complete Integrated Autonomous Vehicle Baseline Architecture
```python
"""
Lesson 10: Capstone Integrated Autonomous Vehicle Master Engine
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import time
import numpy as np

class AutonomousVehicleMaster:
    def __init__(self):
        print("[+] Initializing Autonomous Vehicle Master Engine...")
        self.camera_width = 640
        self.camera_height = 480
        self.kp = 0.18
        self.steering_center = 90
        self.is_running = True

    def process_vision(self, frame):
        """Processes vision pipeline: Lane Detection & Center Offset"""
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        blurred = cv2.GaussianBlur(gray, (5, 5), 0)
        edges = cv2.Canny(blurred, 50, 150)

        # ROI Crop lower 40%
        h, w = frame.shape[:2]
        mask = np.zeros_like(edges)
        cv2.rectangle(mask, (0, int(h * 0.6)), (w, h), 255, -1)
        roi_edges = cv2.bitwise_and(edges, mask)

        # Hough Lines Detection
        lines = cv2.HoughLinesP(roi_edges, 1, np.pi/180, 20, minLineLength=20, maxLineGap=50)
        
        lane_center = w // 2
        if lines is not None:
            x_coords = [line[0][0] for line in lines] + [line[0][2] for line in lines]
            if x_coords:
                lane_center = int(np.mean(x_coords))

        error = lane_center - (w // 2)
        steering_angle = max(45, min(135, self.steering_center + (self.kp * error)))
        return steering_angle, roi_edges

    def run(self):
        cap = cv2.VideoCapture(0)
        cap.set(cv2.CAP_PROP_FRAME_WIDTH, self.camera_width)
        cap.set(cv2.CAP_PROP_FRAME_HEIGHT, self.camera_height)

        print("=== CAPSTONE AV MASTER ENGINE RUNNING ===")

        try:
            while cap.isOpened() and self.is_running:
                ret, frame = cap.read()
                if not ret: break

                steer_angle, processed_edges = self.process_vision(frame)

                # Send steer_angle to PCA9685 Servo Driver hardware...
                
                # Render HUD
                cv2.putText(frame, f"CAPSTONE AV - Steer Angle: {steer_angle:.1f} deg",
                            (20, 40), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

                cv2.imshow("Capstone AV Master Drive HUD", frame)
                if cv2.waitKey(1) & 0xFF == ord('q'): break

        finally:
            cap.release()
            cv2.destroyAllWindows()
            print("=== CAPSTONE AV ENGINE SHUTDOWN CLEANLY ===")

if __name__ == "__main__":
    av = AutonomousVehicleMaster()
    av.run()
```

---

## Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix

| Tuần | Chủ Đề Chính | Kỹ Thuật & Sản Phẩm Đạt Được |
| :--- | :--- | :--- |
| **Week 1** | Raspberry Pi 4 & Linux OS | BCM2711 Quad-Core, Linux Debian, 40-Pin GPIO Header, SSH & VNC Viewer remote desktop. |
| **Week 2** | Nguồn Điện & PCA9685 PWM | Pin Li-ion 18650 3S, UBEC 5V/3A cách ly nguồn, PCA9685 I2C 16-Ch PWM & Mạch cầu H L298N. |
| **Week 3** | Cảm Biến Hợp Nhất & Camera CSI | Camera CSI 8MP Sony IMX219, GStreamer, Siêu âm HC-SR04 & IMU MPU6050 6-DOF. |
| **Week 4** | Thị Giác Máy Tính OpenCV | Ma trận điểm ảnh, Không gian BGR/HSV, Gaussian Blur, Canny Edge Detector & Cắt vùng ROI. |
| **Week 5** | Dò Vạch Làn Đường & PID | Biến đổi Hough Lines, Phân loại Slope $m$, Tính độ lệch tâm Centerline & Bộ điều khiển bẻ lái PID. |
| **Week 6** | Biển Báo & Đèn Tín Hiệu | Color Masking HSV Đèn giao thông (Đỏ/Xanh), OpenCV Contours & Nhận diện biển STOP Sign. |
| **Week 7** | Phanh Khẩn Cấp EBS & Né Vật Cản | Hợp nhất đa cảm biến, Hệ thống Phanh Khẩn Cấp EBS, Điều tốc động khi vào cua & Chuyển làn. |
| **Week 8** | Trí Tuệ Nhân Tạo Edge AI | Mạng Nơ-ron Cuộn CNN (Behavioral Cloning), Thu thập dữ liệu $10,000+$ ảnh & TensorFlow Lite. |
| **Week 9** | Hệ Điều Hành Robot ROS 2 | ROS 2 Humble Framework, Nodes, Topics, Messages `geometry_msgs/Twist` & Teleop Keyboard. |
| **Week 10** | Tích Hợp Hệ Thống & Capstone | Tích hợp Xe Tự Hành Raspberry Pi 4 hoàn chỉnh, Slide thuyết trình, Code GitHub & Capstone Race. |

---

## Đánh Giá Capstone & Capstone Race Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Chế Tạo Khung Xe (Hardware Model)** | Khung xe chắc chắn, đi dây gọn gàng, nguồn UBEC 5V cách ly an toàn tuyệt đối, thiết kế cơ khí đẹp mắt. | Khung xe chạy được nhưng đi dây chưa gọn. | Xe chạy được nhưng thỉnh thoảng sụt nguồn. | Khung xe bị gãy hoặc lỏng dây. |
| **Hoàn Thành Bài Tập & Capstone** | Hoàn thành xuất sắc cả 4 bài, xe chạy hoàn chỉnh Sa hình đua, bám làn mượt, dừng đúng biển báo và bảo vệ ấn tượng. | Hoàn thành Bài 10.1 và Bài 10.2 chạy đúng không lỗi. | Code có lỗi trễ giật khung hình hoặc lấn làn nhẹ. | Không nộp dự án Capstone. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
