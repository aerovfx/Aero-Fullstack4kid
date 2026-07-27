# 🏆 Dự Án Cuối Khoá — Xe Tự Hành DIY Capstone
# *Autonomous Car Capstone Project Guide*

---

## 🎯 Tổng Quan / Overview

Dự án cuối khoá yêu cầu học viên xây dựng một **xe robot tự hành hoàn chỉnh** có khả năng:
1. Điều hướng theo GPS đến các waypoints định trước
2. Phát hiện và tránh vật cản tự động
3. Trả về điểm xuất phát sau khi hoàn thành nhiệm vụ

*Students build a complete autonomous robot vehicle capable of GPS navigation, obstacle avoidance, and autonomous return-to-home.*

---

## 🚗 3 Track Dự Án / 3 Project Tracks

### Track A — 🗺️ Sân Vườn Thám Hiểm / Garden Explorer
**Nhiệm vụ**: Xe tự chạy theo tuyến đường GPS qua khu vườn/sân trường, tạo bản đồ vật cản gặp phải

**Yêu cầu:**
- Bay ≥ 5 waypoints GPS thành công
- Ghi lại tất cả vật cản vào occupancy grid
- Xuất bản đồ occupancy (matplotlib hoặc web)
- Return to home tự động
- Log toàn bộ hành trình ra CSV

**Tech:** DroneKit → Python GPS + A* planner + occupancy grid

```python
# Ví dụ xuất bản đồ / Map export example
import folium

def export_mission_map(log_file, waypoints_file):
    import pandas as pd, json
    df = pd.read_csv(log_file)
    with open(waypoints_file) as f:
        wps = json.load(f)['waypoints']
    
    center_lat = df['lat'].mean()
    center_lon = df['lon'].mean()
    m = folium.Map(location=[center_lat, center_lon], zoom_start=18)
    
    # Vẽ đường đi thực tế / Draw actual path
    path = list(zip(df['lat'], df['lon']))
    folium.PolyLine(path, color='blue', weight=3, opacity=0.8).add_to(m)
    
    # Đánh dấu waypoints / Mark waypoints
    for wp in wps:
        folium.Marker([wp['lat'], wp['lon']],
            popup=wp['label'],
            icon=folium.Icon(color='green', icon='flag')).add_to(m)
    
    m.save('mission_result.html')
    print("✅ Map saved to mission_result.html")
```

---

### Track B — 🚧 Giao Hàng Tự Động / Autonomous Delivery
**Nhiệm vụ**: Xe xuất phát từ "kho hàng", tránh vật cản, đến "địa điểm giao hàng" GPS, dừng 5 giây (mô phỏng thả hàng), RTH

**Yêu cầu:**
- 2 waypoints: Pickup → Delivery → RTH
- Tránh ≥ 3 vật cản trên đường
- Gửi thông báo qua web dashboard khi giao hàng thành công
- Buzzer kêu khi đến nơi
- Thời gian hoàn thành < 3 phút

**Tech:** Python state machine + Flask webhook notification

```python
class DeliveryMission:
    STATES = ['GOING_TO_PICKUP', 'LOADED', 'GOING_TO_DELIVERY', 'DELIVERED', 'RETURNING']
    
    def on_waypoint_reached(self, wp_label):
        if 'pickup' in wp_label.lower():
            self.state = 'LOADED'
            self.buzz(2)  # 2 beeps = loaded
            self.notify_dashboard({'event': 'PICKUP_COMPLETE'})
        elif 'delivery' in wp_label.lower():
            self.state = 'DELIVERED'
            self.buzz(3)  # 3 beeps = delivered
            self.notify_dashboard({'event': 'DELIVERY_COMPLETE', 
                                   'time': time.strftime('%H:%M:%S')})
            time.sleep(5)  # Simulate drop-off
    
    def notify_dashboard(self, data):
        import requests
        requests.post('http://localhost:5000/webhook', json=data, timeout=2)
```

---

### Track C — 🧹 Vệ Sinh Khu Vực / Area Cleaner (Roomba-style)
**Nhiệm vụ**: Xe tự động bao phủ tối đa diện tích một khu vực giới hạn theo mô hình Roomba, tránh vật cản, dừng khi hết pin hoặc hoàn thành

**Yêu cầu:**
- Implement boustrophedon (lawnmower pattern) hoặc spiral coverage
- Coverage ≥ 70% diện tích trong 5 phút
- Phát hiện và tránh vật cản động
- Hiển thị % diện tích đã quét real-time
- Tự về dock (GPS home point) khi pin thấp

**Tech:** Occupancy grid + coverage algorithm + GPS boundary

```python
class CoverageController:
    def __init__(self, boundary_gps, grid_resolution=0.3):
        """
        boundary_gps: List[(lat,lon)] defining the area corners
        grid_resolution: meters per cell
        """
        self.boundary = boundary_gps
        self.res = grid_resolution
        self._build_grid()
    
    def boustrophedon_path(self):
        """
        Zigzag path / Đường đi zíc-zắc kiểu cắt cỏ
        Returns list of (row, col) cells in order
        """
        rows, cols = self.grid.shape
        path = []
        for r in range(rows):
            col_range = range(cols) if r % 2 == 0 else range(cols-1, -1, -1)
            for c in col_range:
                if self.grid[r, c] == 0:  # Free cell
                    path.append((r, c))
        return path
    
    def coverage_percent(self):
        visited = np.sum(self.visited_grid)
        total   = np.sum(self.grid == 0)
        return visited / max(total, 1) * 100
```

---

## 📊 Rubric Đánh Giá / Assessment Rubric

### Tổng: 100 điểm

#### 1. Phần Cứng (20 điểm)
| Tiêu chí | Điểm | Mô tả |
|---------|------|-------|
| Lắp ráp chắc chắn, gọn gàng | 8 | Không dây thòng, kết nối ổn |
| Tất cả sensors hoạt động | 7 | GPS, HC-SR04, IMU đọc được |
| E-Stop hoạt động | 5 | Dừng ngay khi nhấn |

#### 2. Phần Mềm (35 điểm)
| Tiêu chí | Điểm | Mô tả |
|---------|------|-------|
| Code sạch, có comment | 10 | PEP8, docstrings, bilingual |
| State machine đúng | 10 | Chuyển state đúng tình huống |
| PID tuned tốt | 8 | Xe đi thẳng, không zigzag |
| Error handling | 7 | Xử lý GPS mất tín hiệu, serial lỗi |

#### 3. Demo Tự Động (30 điểm)
| Tiêu chí | Điểm | Mô tả |
|---------|------|-------|
| Xe chạy đến ≥ 2 waypoints | 15 | GPS navigation thành công |
| Tránh được ≥ 2 vật cản | 10 | Không đâm vào vật cản |
| Return to home | 5 | Về điểm xuất phát |

#### 4. Thuyết Trình (15 điểm)
| Tiêu chí | Điểm | Mô tả |
|---------|------|-------|
| Slide 10 trang, rõ ràng | 5 | Có sơ đồ kiến trúc, ảnh xe |
| Trình bày tự tin | 5 | Hiểu nội dung mình nói |
| Q&A trả lời được | 5 | Giải thích được code + hardware |

---

## 📅 Timeline / Lịch

| Tuần | Việc cần làm |
|------|------------|
| Tuần 8 | Chọn track, viết proposal 1 trang |
| Tuần 9 | Code + simulation test |
| Tuần 10 Buổi 19 | Hoàn thiện + pre-demo |
| Tuần 10 Buổi 20 | **DEMO DAY** 🏆 |

---

## 🚀 Định Hướng Sau Khoá / Next Steps

| Hướng | Công nghệ |
|-------|----------|
| **ROS2** | Robot Operating System 2 - framework robotics chuyên nghiệp |
| **SLAM** | Simultaneous Localization and Mapping với LiDAR |
| **Deep Learning** | YOLO trên Jetson Nano cho nhận diện đường |
| **V2X** | Vehicle-to-Everything communication |
| **Cuộc thi** | VEX Robotics, ABU Robocon, Maker Faire |
| **Career** | Robotics Engineer, Autonomous Systems Dev, ROS Developer |

---

*🏆 STEM Autonomous Vehicle Program · 07/2026*
