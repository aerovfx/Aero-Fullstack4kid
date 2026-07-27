# 📅 Lịch Học 10 Tuần — DIY Drone Building & Control Software
# *10-Week Schedule — DIY Drone Building & Control Software*

---

## 🗓️ Tổng Quan / Overview

| Tuần | Chủ đề VI | Topic EN | Buổi | Loại |
|------|-----------|----------|------|------|
| 1 | Nguyên Lý Bay & An Toàn | Flight Principles & Safety | 2 × 90' | 🧪 Lý thuyết + Lab |
| 2 | Khung & Động Cơ Brushless | Frame Design & Motors | 2 × 90' | 🔧 Phần cứng |
| 3 | ESC, Flight Controller & Nguồn | ESC, FC & Power System | 2 × 90' | 🔧 Phần cứng |
| 4 | Hệ Thống RC & Binding | RC System & Binding | 2 × 90' | 🎮 Điều khiển |
| 5 | Lắp Ráp & Bay Thử | Full Assembly & First Flight | 2 × 90' | ✈️ Bay thực |
| 6 | MAVLink & DroneKit Python | MAVLink & DroneKit Python | 2 × 90' | 💻 Lập trình |
| 7 | Tự Động Hoá & Mission | Automation & Mission Planning | 2 × 90' | 💻 Lập trình |
| 8 | Computer Vision (OpenCV) | Computer Vision (OpenCV) | 2 × 90' | 💻 AI/CV |
| 9 | Telemetry & Dashboard | Telemetry & Dashboard | 2 × 90' | 💻 Lập trình |
| 10 | Dự Án Cuối Khoá | Capstone Project | 2 × 90' | 🏆 Demo |

---

## 📆 Lịch Chi Tiết / Detailed Schedule

### 🔷 PHẦN 1: PHẦN CỨNG / HARDWARE SECTION (Tuần 1–5)

---

#### 📘 Tuần 1 — Nguyên Lý Bay & An Toàn / Flight Principles & Safety

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 1 | Lý thuyết bay: 4 lực, nguyên lý rotor | Lecture + Video | Cài Mission Planner |
| Buổi 2 | An toàn bay: Quy định CAAV, checklist | Quiz + Role-play safety drill | In checklist template |

**Đầu ra tuần 1 / Week 1 Deliverables:**
- [ ] Hoàn thành quiz 15 câu về nguyên lý bay
- [ ] Nộp sơ đồ lực tác dụng lên drone (tự vẽ tay)
- [ ] Ký cam kết an toàn bay

---

#### 📘 Tuần 2 — Khung & Động Cơ / Frame & Motors

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 3 | Phân loại khung, vật liệu, chọn size | So sánh mẫu vật thật | Mang 250mm frame |
| Buổi 4 | Động cơ brushless: KV, stator, gắn motor | Tháo lắp motor + đo điện trở cuộn dây | Multimeter |

**Đầu ra tuần 2:**
- [ ] Bảng tính chọn động cơ + cánh quạt cho drone 500g
- [ ] Gắn hoàn chỉnh 4 motor lên frame

---

#### 📘 Tuần 3 — ESC, FC & Nguồn / ESC, FC & Power

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 5 | ESC wiring, hàn PDB, kết nối LiPo | Thực hành hàn có hướng dẫn | Mỏ hàn, thiếc, nhựa thông |
| Buổi 6 | Kết nối FC, Betaflight Configurator | Config motor direction, ESC calibration | Laptop + USB |

**Đầu ra tuần 3:**
- [ ] Mạch điện hoàn chỉnh (ESC + PDB + FC)
- [ ] Screenshot Betaflight Motors tab — tất cả 4 motor chạy đúng chiều

> ⚠️ **CẢNH BÁO AN TOÀN**: Tuần này có hàn thiếc và nguồn LiPo. Tháo cánh quạt trước khi test!

---

#### 📘 Tuần 4 — Hệ Thống RC & Binding / RC System & Binding

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 7 | Lý thuyết RC, giao thức, channel mapping | Demo transmitter | FlySky FS-i6 |
| Buổi 8 | Binding, cấu hình Betaflight, fail-safe | Thực hành binding + test channels | Receiver FS-iA6B |

**Đầu ra tuần 4:**
- [ ] RC đã bind và hoạt động ổn định
- [ ] Screenshot Betaflight Receiver tab — 8 channel đúng range
- [ ] Fail-safe đã cấu hình và test

---

#### 📘 Tuần 5 — Lắp Ráp & Bay Thử / Assembly & First Flight

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 9 | Lắp ráp hoàn chỉnh, cable management, CoG | Assembly hoàn chỉnh | Zip ties, heat shrink |
| Buổi 10 | Pre-flight check, hover test có dây, bay tự do | **NGÀY BAY ĐẦU TIÊN** | Khu vực bay thoáng |

**Đầu ra tuần 5:**
- [ ] Drone đã lắp hoàn chỉnh và đạt pre-flight check
- [ ] Video bay hover ổn định 30 giây
- [ ] Nhật ký bay (flight log) buổi đầu tiên

> ⚠️ **NGÀY BAY THỰC**: Bay ngoài trời thoáng, không có người đứng trong vòng 10m!

---

### 🔷 PHẦN 2: PHẦN MỀM / SOFTWARE SECTION (Tuần 6–10)

---

#### 📘 Tuần 6 — MAVLink & DroneKit Python

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 11 | MAVLink protocol, cài SITL, MAVProxy | Cài đặt SITL ArduPilot | Ubuntu/VM/WSL |
| Buổi 12 | DroneKit: connect, arm, takeoff, land | Code thực hành với SITL | Python 3, DroneKit |

**Đầu ra tuần 6:**
- [ ] SITL chạy được, kết nối Mission Planner thành công
- [ ] Script Python: tự động takeoff 10m → hover 5s → land

---

#### 📘 Tuần 7 — Tự Động Hoá & Mission Planning

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 13 | Mission Planning trong Mission Planner | Thiết kế mission 4 waypoint | Mission Planner |
| Buổi 14 | Upload mission từ Python, giám sát execution | Code + SITL demo | DroneKit, MAVLink |

**Đầu ra tuần 7:**
- [ ] Mission bay hình vuông 50m × 50m trong SITL
- [ ] Script Python upload và giám sát mission tự động

---

#### 📘 Tuần 8 — Computer Vision với OpenCV

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 15 | OpenCV cơ bản, phát hiện màu sắc | Lab thực hành với webcam | Webcam, Python, OpenCV |
| Buổi 16 | Kết hợp CV + DroneKit: object following | Demo với SITL + webcam | Raspberry Pi (tùy chọn) |

**Đầu ra tuần 8:**
- [ ] Script phát hiện object màu đỏ và tính offset
- [ ] Demo: drone di chuyển theo vật thể (SITL)

---

#### 📘 Tuần 9 — Telemetry & Ground Control Dashboard

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 17 | Telemetry radio, xây dựng GCS cơ bản | Code Tkinter dashboard | Python, Matplotlib |
| Buổi 18 | Web dashboard với Flask + WebSocket | Live telemetry qua browser | Flask, Socket.IO |

**Đầu ra tuần 9:**
- [ ] Dashboard hiển thị: altitude, battery, heading, GPS realtime
- [ ] Xuất flight log ra CSV và vẽ biểu đồ altitude

---

#### 📘 Tuần 10 — Dự Án Cuối Khoá / Capstone Project

| Buổi | Nội dung | Activities | Chuẩn bị |
|------|---------|-----------|---------|
| Buổi 19 | Hoàn thiện dự án, SITL test | Nhóm làm việc + giáo viên hỗ trợ | Toàn bộ code dự án |
| Buổi 20 | **DEMO DAY** — Thuyết trình + Bay thực | Demo trực tiếp + Q&A | Slide + drone hoàn chỉnh |

**Đầu ra tuần 10:**
- [ ] Slide thuyết trình 10 trang
- [ ] Demo SITL thành công
- [ ] (Nếu có điều kiện) Demo bay thực ngoài trời
- [ ] Báo cáo kỹ thuật (system architecture + code)

---

## 📊 Thống Kê Khoá Học / Course Statistics

| Chỉ số | Số liệu |
|--------|---------|
| Tổng buổi học | 20 buổi |
| Tổng thời gian | 30 giờ |
| Buổi thực hành phần cứng | 10 buổi |
| Buổi lập trình | 8 buổi |
| Buổi demo/đánh giá | 2 buổi |
| Dự án thực hành | 5 mini + 1 capstone |

---

## 🏆 Tiêu Chí Tốt Nghiệp / Graduation Criteria

Để nhận chứng chỉ hoàn thành khoá học, học viên cần đạt:

- ✅ Tham dự ≥ 16/20 buổi học (≥ 80%)
- ✅ Nộp đầy đủ bài tập tuần (≥ 7/10 tuần)
- ✅ Drone bay ổn định ≥ 1 phút (Tuần 5)
- ✅ Script tự động hoàn thành mission trong SITL (Tuần 7)
- ✅ Trình bày dự án cuối khoá (Tuần 10)
- ✅ Điểm tổng kết ≥ 60/100

---

*📅 Lịch được cập nhật: 07/2026 · STEM Drone Program*
