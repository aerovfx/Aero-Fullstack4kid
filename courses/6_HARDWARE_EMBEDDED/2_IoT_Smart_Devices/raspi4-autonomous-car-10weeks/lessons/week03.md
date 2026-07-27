# Tuần 3: Cảm Biến Hợp Nhất, Camera CSI V2 & Đọc Gia Tốc MPU6050 (Sensor Fusion & CSI Camera)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững quy trình kết nối và cấu hình **Camera CSI Module V2 (Sony IMX219 8MP)** trên Raspberry Pi 4 qua thư viện `picamera2` / OpenCV.
- Thu phát luồng Video Stream thời gian thực tốc độ cao ($30 - 60\,\text{FPS}$) qua giao thức HTTP Web Dashboard.
- Lập trình đọc cảm biến khoảng cách **Siêu âm HC-SR04** kết hợp cảm biến gia tốc/con quay hồi chuyển 6 trục **MPU6050** qua Bus I2C.
- Xây dựng lớp xử lý hợp nhất dữ liệu cảm biến (Sensor Fusion Baseline) chuẩn bị cho hệ thống tự hành.

### English
- Master interfacing the **CSI Camera Module V2 (8MP Sony IMX219)** on Raspberry Pi 4 using `picamera2` and OpenCV.
- Stream high-speed real-time video feeds ($30 - 60\,\text{FPS}$) over an embedded HTTP Web Dashboard.
- Program an **HC-SR04 Ultrasonic Rangefinder array** and an **MPU6050 6-DOF IMU** over the I2C Bus.
- Build a Sensor Fusion Baseline abstraction layer for autonomous navigation.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Cổng Kết Nối Camera CSI (Camera Serial Interface)

#### Tiếng Việt
Cổng CSI trên Raspberry Pi 4 kết nối trực tiếp với bộ xử lý tín hiệu hình ảnh (ISP) trong chip Broadcom BCM2711 qua chuẩn bus MIPI CSI-2 2-lane. Cho phép truyền dữ liệu hình ảnh trực tiếp vào RAM với độ trễ siêu thấp mà không tốn tài nguyên CPU như webcam USB thông thường.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - Real-time CSI Camera Streamer & Sensor Fusion Pipeline
```python
"""
Lesson 3: CSI Camera Video Streamer & Ultrasonic Rangefinder Integration
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import time
import RPi.GPIO as GPIO

TRIG_PIN = 23
ECHO_PIN = 24

def setup_ultrasonic():
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(TRIG_PIN, GPIO.OUT, initial=GPIO.LOW)
    GPIO.setup(ECHO_PIN, GPIO.IN)

def read_distance_cm():
    GPIO.output(TRIG_PIN, GPIO.HIGH)
    time.sleep(0.00001) # 10us pulse
    GPIO.output(TRIG_PIN, GPIO.LOW)

    pulse_start = time.time()
    pulse_end = time.time()

    timeout_start = time.time()
    while GPIO.input(ECHO_PIN) == 0:
        pulse_start = time.time()
        if pulse_start - timeout_start > 0.03: return 400.0 # Timeout

    while GPIO.input(ECHO_PIN) == 1:
        pulse_end = time.time()
        if pulse_end - pulse_start > 0.03: return 400.0

    duration = pulse_end - pulse_start
    distance = (duration * 34300) / 2.0
    return round(distance, 1)

def main():
    setup_ultrasonic()
    # Initialize CSI Camera via OpenCV GStreamer or V4L2 backend
    cap = cv2.VideoCapture(0)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)
    cap.set(cv2.CAP_PROP_FPS, 30)

    print("[+] CSI Camera & Ultrasonic Sensor Fusion Online!")

    try:
        while cap.isOpened():
            ret, frame = cap.read()
            if not ret: break

            # Read Front Distance Sensor
            dist = read_distance_cm()

            # Overlay Distance Data on Camera Video Frame
            color = (0, 255, 0) if dist > 30.0 else (0, 0, 255)
            cv2.putText(frame, f"Front Dist: {dist} cm", (20, 40),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, color, 2)

            if dist < 20.0:
                cv2.putText(frame, "WARNING: OBSTACLE CLOSE!", (20, 80),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)

            # Display Camera Frame
            cv2.imshow("RasPi 4 AV Sensor Fusion Feed", frame)

            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

    finally:
        cap.release()
        cv2.destroyAllWindows()
        GPIO.cleanup()

if __name__ == "__main__":
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 3.1: Đo Tốc Độ Khung Hình FPS Camera CSI (FPS Benchmark)
Viết script Python tính toán tốc độ xử lý khung hình trung bình (FPS) của Camera CSI ở các độ phân giải $1920 \times 1080$, $1280 \times 720$, $640 \times 480$.

#### Bài 3.2: Đọc Cảm Biến MPU6050 Qua Bus I2C
Viết script Python đọc góc nghiêng Pitch/Roll từ MPU6050 và in ra Terminal dạng JSON: `{"roll": 2.5, "pitch": -1.2}`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 3.3: Web Video Streaming Server Với HTTP Flask
Lập trình Web Server Python Flask phát trực tiếp hình ảnh Video từ CSI Camera lên trình duyệt web điện thoại/máy tính thời gian thực.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập OpenCV (Hands-on Colab Lab)

#### Bài 3.4: Chèn Thông Số Telemetry Lên Video Trên Google Colab
Mở Google Colab, viết script OpenCV nạp 1 video xe chạy thực tế và chèn thông số vận tốc, tốc độ góc và cảnh báo chướng ngại vật lên video.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# OpenCV Video Overlay Reference Solution on Colab
import cv2
import numpy as np

# Create synthetic video frame
frame = np.zeros((480, 640, 3), dtype=np.uint8)

# Overlay telemetry HUD
cv2.putText(frame, "AV TELEMETRY HUD", (200, 30), cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 255, 255), 2)
cv2.putText(frame, "SPEED: 1.2 m/s", (50, 100), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)
cv2.putText(frame, "STEER ANGLE: +4.5 deg", (50, 130), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

print("[+] Video Frame Overlay Generated!")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Cảm Biến & Camera** | Giải thích sâu sắc giao tiếp CSI MIPI-2, ISP phần cứng, đo khoảng cách siêu âm và đọc IMU MPU6050. | Hiểu cách sử dụng OpenCV với Camera CSI và cảm biến siêu âm. | Nắm được định nghĩa Camera nhưng chưa đọc được khung hình. | Làm hỏng cáp dải Camera. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (FPS Benchmark, MPU6050 JSON, Flask Video Server & Colab HUD Lab). | Hoàn thành Bài 3.1 và Bài 3.2 đúng yêu cầu. | Code có lỗi trễ giật khung hình hoặc siêu âm bị timeout. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
