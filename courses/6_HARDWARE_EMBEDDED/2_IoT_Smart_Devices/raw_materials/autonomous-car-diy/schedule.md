# 📅 Lịch Học 10 Tuần — Xe Tự Hành DIY
# *10-Week Schedule — DIY Autonomous Car*

---

## 🔷 PHẦN 1: PHẦN CỨNG / HARDWARE (Tuần 1–5)

---

### Tuần 1 — Kiến Trúc Xe Tự Hành / Autonomous Vehicle Architecture

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **1** | SAE Levels 0–5, Sense-Plan-Act loop, kiến trúc hệ thống | Lecture + nhận biết linh kiện | Bộ linh kiện mẫu |
| **2** | Tổng quan cảm biến, vi điều khiển vs SBC, sơ đồ hệ thống | Vẽ sơ đồ kiến trúc + quiz | Arduino Mega + Pi 4 |

**✅ Deliverables:**
- Sơ đồ kiến trúc hệ thống tự vẽ (Sense/Plan/Act layers)
- Quiz 15 câu: match sensor to function (≥ 80%)

---

### Tuần 2 — Khung, Motor DC & Điều Khiển / Chassis, DC Motors & Control

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **3** | Khung 4WD, differential drive, L298N H-bridge, PWM | Gắn motor vào khung, test thủ công | Khung 4WD, L298N |
| **4** | Arduino motor control code, hàm forward/back/turn, odometry | Code + test xe chạy hình vuông | Arduino IDE |

**✅ Deliverables:**
- Xe chạy được tất cả 4 hướng qua Serial command
- Video xe chạy hình vuông 30cm × 30cm

---

### Tuần 3 — Cảm Biến Khoảng Cách / Distance Sensors

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **5** | HC-SR04 nguyên lý, công thức, wiring, rolling average | Lab: 3-sensor array (front/left/right) | 3× HC-SR04, SG90 |
| **6** | Servo scanner, occupancy grid từ quét 180°, fusion IR+siêu âm | Code scanner + visualize trên Serial Plotter | Servo SG90 |

**✅ Deliverables:**
- Code 3-sensor array với rolling average filter
- Screenshot Serial Plotter: occupancy data khi có/không vật cản

---

### Tuần 4 — GPS Module & Hệ Toạ Độ / GPS & Coordinates

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **7** | NEO-6M wiring, NMEA sentences, TinyGPS++ | Lab: đọc GPS qua Serial Monitor | NEO-6M, TinyGPS++ |
| **8** | Haversine formula, bearing/heading, waypoint structure, HDOP filter | Code tính distance + bearing đến waypoint | Laptop + GPS ngoài trời |

**✅ Deliverables:**
- GPS đọc ổn định ≥ 6 satellites ngoài trời
- Script Arduino tính distance và bearing đến 1 tọa độ mẫu

> 📍 **Buổi 8 học ngoài trời** để GPS có tín hiệu tốt

---

### Tuần 5 — IMU, PID & Lắp Ráp Hoàn Chỉnh / IMU, PID & Full Assembly

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **9** | MPU-6050 I2C, complementary filter, heading PID theory | Code PID controller class, test heading hold | MPU-6050, HMC5883L |
| **10** | **INTEGRATION DAY**: Lắp ráp toàn bộ, test hệ thống, pre-run checklist | Lắp ráp hoàn chỉnh + test tất cả sensors | Toàn bộ linh kiện |

**✅ Deliverables:**
- Xe lắp ráp hoàn chỉnh, tất cả sensors đọc được
- Heading PID giữ xe đi thẳng trong 2m
- Ảnh xe hoàn chỉnh

> ⚠️ **INTEGRATION DAY**: Kiểm tra từng module trước khi kết nối toàn hệ thống!

---

## 🔷 PHẦN 2: PHẦN MỀM / SOFTWARE (Tuần 6–10)

---

### Tuần 6 — Phần Mềm Python & State Machine / Python Software & State Machine

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **11** | Raspberry Pi setup, pyserial, JSON command protocol | Setup Pi, test serial communication với Arduino | Pi 4, MicroSD, SSH |
| **12** | State machine (IDLE→NAV→AVOID→ARRIVED), threading, web remote | Code state machine + Flask web remote control | Python env setup |

**✅ Deliverables:**
- Điều khiển xe từ browser web (Flask)
- State machine chuyển trạng thái đúng khi nhận lệnh

---

### Tuần 7 — Điều Hướng GPS / GPS Navigation

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **13** | gpsd/pynmea2, Haversine Python, bearing + PID steering | Code GPS reader + heading PID Python | GPS cắm vào Pi |
| **14** | Waypoint JSON, NavigationController class, HDOP filter, arrival detection | **Test ngoài trời**: xe tự chạy đến 3 waypoints | Khu vực sân rộng |

**✅ Deliverables:**
- Script Python chạy 3-waypoint mission thành công
- GPS track được log ra file JSON
- Video xe tự chạy đến waypoint

---

### Tuần 8 — Phát Hiện Vật Cản với OpenCV / Obstacle Detection

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **15** | OpenCV color detection, contour, distance estimate từ kích thước | Lab: phát hiện vật màu đỏ/vàng trong video | Camera Pi |
| **16** | Bug algorithm, avoidance state machine, fusion camera + ultrasonic | Code complete avoidance + test hành lang | Vật cản mẫu (cone) |

**✅ Deliverables:**
- ObstacleDetector detect được vật cản trong hành lang
- Xe tự tránh vật cản và tiếp tục hướng đích

---

### Tuần 9 — Lập Bản Đồ & A* / Mapping & A* Path Planning

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **17** | Occupancy grid, GPS→grid coordinates, A* algorithm step-by-step | Code A* visualizer (matplotlib) | Python + matplotlib |
| **18** | Integrate A* với GPS nav, re-planning khi gặp obstacle mới | Simulation test: xe re-plan khi gặp vật cản | Full system |

**✅ Deliverables:**
- A* visualizer chạy và vẽ path đúng
- Xe re-plan thành công khi gặp obstacle mới trong SITL

---

### Tuần 10 — Demo Day / Capstone Project

| Buổi | Nội dung | Hoạt động | Chuẩn bị |
|------|---------|-----------|---------|
| **19** | Hoàn thiện, debug, pre-demo test | Team hoàn thiện code + hardware | Full system ready |
| **20** | **DEMO DAY** 🏆 | Thuyết trình 5' + Demo 5' + Q&A | Slide + xe chạy |

**✅ Deliverables:**
- Demo xe tự chạy theo GPS và tránh vật cản thành công
- Slide thuyết trình 10 trang
- Báo cáo kỹ thuật (code + kiến trúc hệ thống)

---

## 📊 Thống Kê / Stats

| Chỉ số | Số liệu |
|--------|---------|
| Tổng buổi | 20 buổi |
| Tổng thời gian | 30 giờ |
| Buổi phần cứng | 10 |
| Buổi phần mềm | 8 |
| Buổi demo/test thực tế | 2 |
| Buổi ngoài trời | 3 (Buổi 8, 14, 20) |

---

## 🏆 Tiêu Chí Tốt Nghiệp

- ✅ Tham dự ≥ 16/20 buổi
- ✅ Nộp bài tập ≥ 7/10 tuần
- ✅ Xe chạy được theo GPS ≥ 2 waypoints (Tuần 7)
- ✅ Xe tránh được vật cản (Tuần 8)
- ✅ Demo cuối khoá (Tuần 10)
- ✅ Điểm tổng kết ≥ 60/100

---

*📅 STEM Autonomous Vehicle Program · 07/2026*
