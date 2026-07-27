# 🚗 Khoá Học Xe Tự Hành DIY — 10 Tuần
# *DIY Autonomous Car: GPS Navigation & Obstacle Avoidance — 10-Week Course*

---

> **Cấp độ / Level:** Trung cấp – Nâng cao / Intermediate – Advanced  
> **Đối tượng / Audience:** Học sinh lớp 8–12, sinh viên kỹ thuật, đam mê robotics  
> **Thời lượng / Duration:** 10 tuần × 2 buổi/tuần × 90 phút = **30 giờ học**  
> **Ngôn ngữ / Language:** Song ngữ Việt – Anh / Bilingual Vietnamese – English  
> **Yêu cầu / Prerequisites:** Lập trình Arduino cơ bản, Python cơ bản, điện tử cơ bản

---

## 🎯 Mục Tiêu Khoá Học / Course Goals

Cuối khoá, học viên có thể:
- ✅ Tự chế tạo xe robot 4WD hoàn chỉnh từ linh kiện rời
- ✅ Lập trình điều khiển động cơ DC với PID
- ✅ Tích hợp GPS để xe tự chạy theo tuyến đường định sẵn
- ✅ Trang bị hệ thống cảm biến phát hiện và tránh vật cản
- ✅ Xây dựng phần mềm điều khiển tự động bằng Python
- ✅ Hiểu thuật toán A* lập kế hoạch đường đi cơ bản

---

## 🗺️ Tổng Quan Chương Trình / Course Map

```
PHẦN 1: PHẦN CỨNG (Tuần 1–5)            PHẦN 2: PHẦN MỀM (Tuần 6–10)
Hardware Section                          Software Section
──────────────────────────────────        ──────────────────────────────────
Tuần 1: Kiến trúc xe tự hành             Tuần 6: Python + Serial + State Machine
Tuần 2: Khung, Motor DC & L298N          Tuần 7: GPS Navigation & Waypoints
Tuần 3: Cảm biến khoảng cách & quét      Tuần 8: OpenCV Obstacle Detection
Tuần 4: GPS & Hệ toạ độ                  Tuần 9: Lập bản đồ & Thuật toán A*
Tuần 5: IMU, PID & Lắp ráp hoàn chỉnh   Tuần 10: Demo Day — Xe tự hành hoàn chỉnh
```

---

## 📐 Kiến Trúc Hệ Thống / System Architecture

```
┌─────────────────────────────────────────────┐
│              RASPBERRY PI 4                  │  ← High-level AI/Nav
│  ┌──────────┐ ┌──────────┐ ┌─────────────┐  │
│  │ GPS Nav  │ │ OpenCV   │ │ A* Planner  │  │
│  │ (Python) │ │ Obstacle │ │ Path Plan   │  │
│  └────┬─────┘ └────┬─────┘ └──────┬──────┘  │
│       └────────────┴──────────────┘          │
│              State Machine                   │
└─────────────────┬───────────────────────────┘
                  │ Serial (JSON commands)
┌─────────────────┴───────────────────────────┐
│           ARDUINO MEGA 2560                  │  ← Low-level Control
│  ┌──────────┐ ┌──────────┐ ┌─────────────┐  │
│  │  L298N   │ │ HC-SR04  │ │  MPU-6050   │  │
│  │  Motor   │ │ Ultrasic │ │    IMU      │  │
│  │  Driver  │ │  (×3)    │ │             │  │
│  └──────────┘ └──────────┘ └─────────────┘  │
└─────────────────────────────────────────────┘
        │               │              │
   ┌────┴────┐    ┌──────┴──┐   ┌──────┴──┐
   │ 4 DC    │    │ NEO-6M  │   │Pi Camera│
   │ Motors  │    │  GPS    │   │ (OpenCV)│
   └─────────┘    └─────────┘   └─────────┘
```

---

## 📦 Danh Mục Tài Liệu / Document Index

| File | Mô tả |
|------|-------|
| [INDEX.md](INDEX.md) | Trang chủ khoá học |
| [schedule.md](schedule.md) | Lịch học 10 tuần chi tiết |
| **lessons/** | Bài học theo tuần |
| [week01.md](lessons/week01.md) | Tuần 1: Kiến trúc xe tự hành |
| [week02.md](lessons/week02.md) | Tuần 2: Khung, Motor DC & L298N |
| [week03.md](lessons/week03.md) | Tuần 3: Cảm biến khoảng cách |
| [week04.md](lessons/week04.md) | Tuần 4: GPS Module & Toạ độ |
| [week05.md](lessons/week05.md) | Tuần 5: IMU, PID & Lắp ráp |
| [week06.md](lessons/week06.md) | Tuần 6: Python Motor Control |
| [week07.md](lessons/week07.md) | Tuần 7: GPS Waypoint Navigation |
| [week08.md](lessons/week08.md) | Tuần 8: OpenCV Obstacle Detection |
| [week09.md](lessons/week09.md) | Tuần 9: Mapping & A* Path Planning |
| [week10.md](lessons/week10.md) | Tuần 10: Capstone Demo Day |
| **references/** | Tài liệu tham khảo |
| [components.md](references/components.md) | Danh sách linh kiện |
| [wiring.md](references/wiring.md) | Sơ đồ đấu nối tổng thể |
| [safety.md](references/safety.md) | An toàn điện & cơ |
| **code/** | Code mẫu |
| [arduino/](code/arduino/) | Firmware Arduino |
| [python/](code/python/) | Scripts Python (Pi) |
| **projects/** | Dự án thực hành |
| [final_project.md](projects/final_project.md) | Dự án cuối khoá (3 tracks) |

---

## 🛒 Danh Sách Linh Kiện / Bill of Materials

### Gói Chuẩn / Standard Kit (~1.5–2.5 triệu đồng)

| # | Linh kiện | Thông số | SL | Giá |
|---|-----------|----------|-----|-----|
| 1 | **Khung xe robot 4WD** | Smart Car Chassis Kit | 1 | 150–250k |
| 2 | **Động cơ DC có encoder** | 6V Gear Motor 1:48 + Encoder | 4 | 80–150k/cái |
| 3 | **Motor Driver** | L298N Dual H-Bridge | 2 | 30–60k/cái |
| 4 | **Vi điều khiển** | Arduino Mega 2560 | 1 | 150–300k |
| 5 | **SBC (máy tính nhúng)** | Raspberry Pi 4 (2GB) | 1 | 800k–1.2M |
| 6 | **GPS Module** | NEO-6M / NEO-M8N | 1 | 100–250k |
| 7 | **Cảm biến siêu âm** | HC-SR04 | 3 | 20–35k/cái |
| 8 | **IMU** | MPU-6050 (gy-521) | 1 | 20–50k |
| 9 | **La bàn số** | HMC5883L / QMC5883L | 1 | 25–50k |
| 10 | **Servo motor** | SG90 (cho scanner) | 1 | 30–60k |
| 11 | **Camera** | Raspberry Pi Camera v2 | 1 | 200–400k |
| 12 | **Pin** | 7.4V LiPo 2200mAh hoặc 4× 18650 | 1 bộ | 150–300k |
| 13 | **Mạch hạ áp** | DC-DC Buck LM2596 | 2 | 20–40k/cái |
| 14 | **Nút dừng khẩn cấp** | E-Stop Button (NC) | 1 | 20–40k |
| 15 | **Dây nối** | Jumper wires M-M, M-F, F-F | 3 bộ | 30k/bộ |
| 16 | **Breadboard** | 400/830 điểm | 2 | 20–40k/cái |
| | **Tổng ước tính** | | | **~1.8–3M đồng** |

### Dụng Cụ / Tools

| Dụng cụ | Ghi chú |
|---------|---------|
| Mỏ hàn 60W | Có điều chỉnh nhiệt |
| Đồng hồ đo VOM | Đo điện áp, dòng điện |
| Tua vít + lục giác | Set 8-in-1 |
| Kìm cắt, bóc dây | Cho dây 20–26 AWG |
| Kính bảo hộ | **BẮT BUỘC** khi test |
| Cáp USB-A to USB-B | Kết nối Arduino |
| Thẻ MicroSD 32GB | Cho Raspberry Pi |
| Laptop/PC | Cài Arduino IDE, Python |

---

## 💻 Phần Mềm / Software Stack

```
TẦNG THẤP (Arduino)          TẦNG CAO (Raspberry Pi)
─────────────────────         ──────────────────────────────
Arduino IDE 2.x               Python 3.11+
TinyGPS++ library             dronekit / pynmea2 / gps3
MPU-6050 library              OpenCV 4.x
Servo library                 NumPy, SciPy, Matplotlib
Wire (I2C)                    Flask + Flask-SocketIO
SoftwareSerial                pyserial
                              folium (map visualization)
```

### Cài đặt Python một lần / One-time Setup
```bash
# Trên Raspberry Pi
sudo apt update && sudo apt install -y python3-pip gpsd gpsd-clients
pip3 install pyserial pynmea2 gps3 opencv-python \
             numpy scipy matplotlib folium \
             flask flask-socketio RPi.GPIO smbus2
```

---

## 📊 Phân Bổ Thời Gian / Time Split

| Hoạt động | % | Giờ |
|-----------|---|-----|
| Lý thuyết | 25% | 7.5h |
| Thực hành phần cứng | 30% | 9h |
| Lập trình | 35% | 10.5h |
| Demo & Đánh giá | 10% | 3h |

---

## 🏆 Đánh Giá / Assessment

| Hạng mục | % |
|---------|---|
| Bài tập thực hành hàng tuần | 30% |
| Quiz kỹ thuật (Tuần 3, 6, 9) | 15% |
| Kiểm tra tích hợp (Tuần 5) | 15% |
| Dự án cuối khoá (Tuần 10) | 40% |

---

*Cập nhật: 07/2026 · STEM Autonomous Vehicle Program*
