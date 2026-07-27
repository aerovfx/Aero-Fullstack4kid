# 🏆 Dự Án Cuối Khoá — DIY Drone Capstone Project
# *Final Capstone Project Guide*

---

## 📋 Tổng Quan / Overview

Dự án cuối khoá là cơ hội để học viên tổng hợp toàn bộ kiến thức phần cứng (Tuần 1–5) và phần mềm (Tuần 6–9) vào một sản phẩm drone hoàn chỉnh, có khả năng thực hiện một nhiệm vụ tự động cụ thể.

*The capstone project is an opportunity for students to synthesize all hardware knowledge (Weeks 1–5) and software knowledge (Weeks 6–9) into a complete drone product capable of performing a specific autonomous task.*

---

## 🎯 3 Track Lựa Chọn / 3 Project Tracks

### Track A: 🗺️ Aerial Survey Drone
**Nhiệm vụ**: Bay lưới (grid pattern) để chụp ảnh khảo sát một khu vực

**Yêu cầu tối thiểu / Minimum Requirements:**
- Bay theo waypoints hình lưới (≥ 9 waypoints)
- Altitude ổn định ± 2m
- Return to Launch tự động sau khi hoàn thành
- Log tọa độ GPS và ảnh chụp ra file

**Tech stack:**
```python
# ArduPilot SITL + DroneKit + Mission Planner
# Camera: simulated hoặc Raspberry Pi Camera
# Output: CSV log + ảnh aerial (nếu có camera)
```

**Đánh giá thêm / Bonus:**
- Stitch ảnh thành orthophoto dùng OpenDroneMap
- Hiển thị flight path trên bản đồ (Folium/Google Maps)

---

### Track B: 👁️ Object Following Drone
**Nhiệm vụ**: Dùng Computer Vision để theo dõi và bám theo một vật thể màu sắc xác định

**Yêu cầu tối thiểu:**
- Phát hiện object màu (OpenCV HSV)
- Tính offset từ tâm khung hình
- Gửi velocity command để drone di chuyển theo target
- Dừng khi mất target > 3 giây

**Tech stack:**
```python
# OpenCV + DroneKit SITL
# Camera: webcam hoặc Raspberry Pi Camera
# Control: MAVLink velocity commands

import cv2
from dronekit import connect, VehicleMode
import numpy as np

def compute_velocity_from_offset(cx, cy, frame_w, frame_h, scale=0.002):
    """
    Tính velocity từ offset của object so với tâm frame
    cx, cy: tọa độ tâm object
    Trả về: (vx, vy) velocity command
    """
    offset_x = cx - frame_w // 2   # Dương = object bên phải
    offset_y = cy - frame_h // 2   # Dương = object phía dưới
    
    vx = -offset_y * scale   # Pitch: tiến/lùi
    vy = offset_x * scale    # Roll: trái/phải
    return vx, vy
```

**Đánh giá thêm:**
- Multi-color tracking (phân loại nhiều target)
- Depth estimation dùng stereo camera

---

### Track C: 📦 Delivery Mission Drone  
**Nhiệm vụ**: Bay từ điểm xuất phát đến tọa độ GPS giao hàng, hover, rồi Return to Launch

**Yêu cầu tối thiểu:**
- Nhập tọa độ GPS điểm giao hàng từ file JSON
- Bay đến điểm, hover 5 giây (mô phỏng thả hàng)
- Tự động RTL về điểm xuất phát
- Gửi thông báo hoàn thành qua Terminal/Web dashboard

**Tech stack:**
```python
# DroneKit + JSON mission file
import json
from dronekit import connect, VehicleMode, LocationGlobalRelative
import time

def load_delivery_point(json_file):
    with open(json_file) as f:
        data = json.load(f)
    return LocationGlobalRelative(
        data['lat'], data['lng'], data['alt']
    )

def delivery_mission(vehicle, delivery_point):
    print("🚁 Starting delivery mission...")
    vehicle.simple_goto(delivery_point)
    
    # Chờ đến nơi
    while True:
        remaining = vehicle.location.global_relative_frame
        dist = distance_between(remaining, delivery_point)
        if dist < 1.0:
            break
        time.sleep(1)
    
    print("📦 Arrived! Hovering 5 seconds...")
    time.sleep(5)
    
    print("🏠 Returning to launch...")
    vehicle.mode = VehicleMode("RTL")
```

**delivery_point.json:**
```json
{
  "lat": 21.028511,
  "lng": 105.804817,
  "alt": 10,
  "location_name": "Hồ Hoàn Kiếm, Hà Nội"
}
```

---

## 📁 Cấu Trúc Dự Án / Project Structure

```
my_drone_project/
├── README.md               ← Mô tả dự án
├── requirements.txt         ← pip packages
├── hardware/
│   ├── wiring_diagram.png   ← Sơ đồ mạch điện
│   ├── assembly_notes.md    ← Ghi chú lắp ráp
│   └── photos/              ← Ảnh drone thực
├── software/
│   ├── main.py              ← Script chính
│   ├── config.py            ← Cấu hình (connection string, etc.)
│   ├── utils.py             ← Hàm tiện ích
│   └── tests/
│       └── test_sitl.py     ← Test với SITL
├── mission/
│   └── waypoints.json       ← Mission file
├── logs/                    ← Flight logs (.bin, .csv)
└── presentation/
    └── slides.pdf           ← Slide thuyết trình
```

---

## 📊 Rubric Đánh Giá / Assessment Rubric

### Điểm Tổng: 100 điểm

#### 1. Phần Cứng (25 điểm) / Hardware (25 points)

| Tiêu chí | Điểm tối đa | Mô tả |
|---------|-----------|-------|
| Lắp ráp hoàn chỉnh, gọn gàng | 10 | Dây gọn, kết nối chắc, frame nguyên vẹn |
| Motor hoạt động đúng chiều | 5 | Test qua Betaflight Motors tab |
| Drone có thể hover ổn định | 10 | Hover ±30cm trong 30 giây |

#### 2. Phần Mềm (35 điểm) / Software (35 points)

| Tiêu chí | Điểm tối đa | Mô tả |
|---------|-----------|-------|
| Code sạch, có comment | 10 | Đặt tên biến rõ ràng, có docstring |
| Kết nối SITL thành công | 5 | `vehicle.armed` = True |
| Mission hoàn thành trong SITL | 15 | Đúng track A/B/C |
| Error handling | 5 | Try/except, timeout, fallback |

#### 3. Demo (25 điểm) / Live Demo (25 points)

| Tiêu chí | Điểm tối đa | Mô tả |
|---------|-----------|-------|
| Demo SITL mượt mà | 15 | Không crash, không phải restart |
| Demo bay thực (nếu có) | +10 bonus | Bonus điểm |
| Trả lời câu hỏi giám khảo | 10 | Hiểu được code và hardware |

#### 4. Thuyết Trình (15 điểm) / Presentation (15 points)

| Tiêu chí | Điểm tối đa | Mô tả |
|---------|-----------|-------|
| Slide rõ ràng, đẹp | 5 | Có hình ảnh, sơ đồ |
| Trình bày tự tin | 5 | Không đọc slide |
| Kết cấu logic (Problem → Solution → Result) | 5 | Có flow rõ ràng |

---

## 📅 Timeline Dự Án / Project Timeline

| Tuần | Giai đoạn | Deliverable |
|------|---------|-----------|
| Tuần 8 | Chọn track + viết proposal | `proposal.md` 1 trang |
| Tuần 9 | Coding + SITL testing | Script hoạt động trong SITL |
| Tuần 10 Buổi 1 | Debug + hoàn thiện | Final code + README |
| Tuần 10 Buổi 2 | **Demo Day** | Slide + Live demo |

---

## 📝 Mẫu Slide Thuyết Trình / Presentation Template

```
Slide 1: Tên dự án + Tên nhóm + Track (A/B/C)
Slide 2: Vấn đề / Problem Statement
Slide 3: Giải pháp / Solution Overview
Slide 4: Kiến trúc hệ thống / System Architecture (diagram)
Slide 5: Phần cứng / Hardware (ảnh drone + wiring diagram)
Slide 6: Phần mềm / Software (flowchart + code snippet)
Slide 7: Kết quả thử nghiệm / Test Results (SITL screenshots)
Slide 8: Demo (GIF hoặc video clip 30s)
Slide 9: Bài học rút ra / Lessons Learned
Slide 10: Bước tiếp theo / Next Steps + Q&A
```

---

## 🚀 Hướng Phát Triển Sau Khoá / Post-Course Development

- 🏁 **FPV Racing**: Tham gia giải đua FPV địa phương
- 📡 **Long Range**: Xây dựng drone long-range (ELRS, 4G LTE)
- 🤖 **AI Drone**: Tích hợp YOLO object detection
- 🌐 **Swarm**: Điều phối nhiều drone cùng lúc (ROS)
- 🎓 **Chứng chỉ**: FAA Part 107 (Mỹ), CAAV Pilot License (VN)
- 💼 **Career**: UAV Engineer, Drone Surveyor, FPV Content Creator

---

*🏆 Chúc mừng hoàn thành khoá học DIY Drone! · STEM Edu Program · 07/2026*
