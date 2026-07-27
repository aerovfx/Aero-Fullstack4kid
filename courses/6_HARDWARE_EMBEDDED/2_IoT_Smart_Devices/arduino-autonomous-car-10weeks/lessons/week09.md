# Tuần 9: Lập Bản Đồ & Lập Kế Hoạch Đường Đi / Week 9: Mapping & Path Planning

## Mục Tiêu / Objectives

Trong tuần này, học viên sẽ học cách xe tự hành hiểu và biểu diễn môi trường xung quanh, đồng thời lên kế hoạch để di chuyển từ điểm A đến điểm B một cách an toàn và tối ưu nhất. 
/ In this week, students will learn how an autonomous car understands and represents its surrounding environment, and how it plans to move from point A to point B safely and optimally.

Mục tiêu cụ thể (Specific objectives):
1. **Hiểu về Lưới Không Gian (Occupancy Grid Map):** Tìm hiểu cách chia nhỏ không gian vật lý thành các ô lưới (grid cells) và gán trạng thái (states) cho chúng. / **Understand Occupancy Grid Map:** Learn how to discretize physical space into grid cells and assign states to them.
2. **Xây Dựng Bản Đồ Khi Đang Di Chuyển (Simultaneous Mapping):** Áp dụng các cảm biến để cập nhật bản đồ theo thời gian thực (real-time). / **Build Map While Driving:** Apply sensors to update the map in real-time.
3. **Chuyển Đổi Tọa Độ (Coordinate Transformation):** Cách chuyển đổi từ tọa độ GPS toàn cầu (Latitude/Longitude) sang tọa độ XY cục bộ của lưới bản đồ. / **Coordinate Transformation:** How to convert global GPS coordinates to local XY grid coordinates.
4. **Thuật Toán Tìm Đường A* (A* Pathfinding Algorithm):** Đi sâu vào lý thuyết và thực hành thuật toán A* phổ biến. Hiểu về các khái niệm Node, Heuristic. / **A* Pathfinding Algorithm:** Deep dive into the theory and practice of the popular A* algorithm. Understand Nodes and Heuristics.
5. **Định Tuyến Bao Phủ (Coverage Routing):** Học các thuật toán quét sạch diện tích giống như robot hút bụi Roomba (Boustrophedon, Spiral). / **Coverage Routing:** Learn area coverage algorithms like a Roomba vacuum.
6. **Lập Kế Hoạch Lại (Re-planning):** Phản ứng thông minh với các vật cản bất ngờ. / **Re-planning:** React intelligently to unexpected obstacles.

## Công Cụ & Phần Mềm / Tools & Software

- **Phần Cứng (Hardware):** 
  - Khung xe tự hành DIY (DIY Autonomous Car Chassis).
  - Vi điều khiển (Microcontrollers): ESP32 hoặc Arduino Mega.
  - Cảm biến (Sensors): Cảm biến siêu âm (Ultrasonic HC-SR04), Lidar 2D (ví dụ: RPLidar A1), Module GPS (NEO-6M), La bàn (HMC5883L / MPU6050).
- **Phần Mềm (Software):** 
  - Python 3.x (cùng các thư viện: NumPy, Matplotlib, Math).
  - Arduino IDE để nạp code xuống vi điều khiển.
- **Môi Trường Mô Phỏng (Simulation Environment):** 
  - Máy tính cá nhân (PC/Laptop) để chạy mô phỏng thuật toán trên màn hình máy tính trước khi đưa lên xe thật. 
  - Personal computer to run algorithm simulation visually before deploying to the real hardware.

---

## Lý Thuyết / Theory

### 1. Bản Đồ Lưới Trạng Thái (Occupancy Grid Map)

Bản đồ lưới trạng thái (Occupancy Grid Map) là một trong những phương pháp phổ biến và kinh điển nhất để biểu diễn môi trường trong lĩnh vực robotics. Thay vì lưu trữ tọa độ chính xác (vector) của mọi vật thể phức tạp, chúng ta chia không gian thực tế thành một lưới 2D (hoặc 3D). Mỗi ô trong lưới (cell) sẽ lưu trữ xác suất hoặc trạng thái chiếm dụng của không gian đó.
/ An occupancy grid map is one of the most common and classic methods for environment representation in robotics. Instead of storing the exact coordinates (vector) of every complex object, we divide the physical space into a 2D (or 3D) grid. Each cell in the grid stores the probability or state of occupancy for that space.

**Trạng thái của mỗi ô (Cell States):**
- **FREE (Trống):** Xe có thể di chuyển qua ô này một cách an toàn. Thường được biểu diễn bằng số `0` hoặc màu trắng (white). 
  / The car can traverse this cell safely. Usually represented by `0` or white color.
- **OCCUPIED (Có vật cản):** Có chướng ngại vật tại vị trí này (tường, đồ vật, hố sâu). Xe không thể đi qua. Biểu diễn bằng số `1` hoặc màu đen (black).
  / There is an obstacle at this position (wall, object, hole). The car cannot pass. Represented by `1` or black color.
- **UNKNOWN (Chưa rõ/Chưa khám phá):** Cảm biến chưa quét tới khu vực này (điểm mù hoặc nằm ngoài tầm với). Thường được biểu diễn bằng giá trị `-1` hoặc màu xám (gray).
  / Sensors have not scanned this area yet (blind spot or out of range). Usually represented by `-1` or gray color.

**Lưu ý quan trọng (Important Note):** 
Việc chọn kích thước ô lưới (resolution) rất quan trọng. Ô lưới quá lớn (ví dụ: 2m x 2m) dẫn đến mất chi tiết (môi trường trở nên quá thô kệch, không thể đi lọt qua các khe hẹp). Nhưng ô lưới quá nhỏ (ví dụ: 1cm x 1cm) sẽ làm tiêu tốn bộ nhớ RAM khổng lồ và làm thuật toán chạy cực kỳ chậm. Đối với xe nhỏ trong nhà, resolution `0.1m - 0.2m` là hợp lý.
/ Choosing the grid cell size (resolution) is critical. Too large cells (e.g., 2mx2m) lead to loss of details (the environment becomes too coarse, cannot pass through narrow gaps). But too small cells (e.g., 1cmx1cm) will consume immense RAM memory and slow down algorithms drastically. For a small indoor car, a resolution of `0.1m - 0.2m` is reasonable.

### 2. Xây Dựng Bản Đồ Khi Đang Di Chuyển (Simultaneous Mapping)

Xe tự hành hiếm khi được cung cấp sẵn một bản đồ hoàn hảo từ trước. Thông thường, nó phải vừa di chuyển vừa khám phá môi trường xung quanh (mapping while driving). Quá trình cơ bản diễn ra như sau:
/ An autonomous car is rarely provided with a perfect map in advance. Usually, it must explore the environment while driving (mapping while driving). The basic process happens as follows:

1. **Khởi tạo bản đồ (Initialize map):** Tạo một ma trận 2D với tất cả các giá trị mặc định là UNKNOWN (-1). / Create a 2D matrix with all default values as UNKNOWN (-1).
2. **Thu thập dữ liệu (Collect sensor data):** Quét một vòng bằng Lidar hoặc lấy dữ liệu từ cảm biến siêu âm. / Sweep with Lidar or get data from ultrasonic sensors.
3. **Xác định vị trí (Localization):** Ước lượng vị trí hiện tại của xe trên lưới (X, Y) và góc quay (Theta). / Estimate the car's current position on the grid (X, Y) and heading (Theta).
4. **Cập nhật tia Laser (Ray-casting map update):** 
   - Vẽ một tia (ray) ảo từ vị trí xe đến điểm vật cản đo được. / Draw a virtual ray from the car's position to the measured obstacle point.
   - Những ô lưới nằm **dọc theo tia (along the ray)** nhưng chưa chạm vật cản sẽ được cập nhật trạng thái là FREE (0). / Grid cells along the ray but before hitting the obstacle are updated to FREE (0).
   - Điểm **kết thúc của tia (end point of the ray)** (nơi tia sáng va đập và dội lại) sẽ được đánh dấu là OCCUPIED (1). / The end point of the ray (where light hits and reflects) is marked as OCCUPIED (1).

### 3. Chuyển Đổi Tọa Độ GPS Sang Lưới Cục Bộ (GPS to Local XY Transformation)

Khi hoạt động ngoài trời, chúng ta định vị bằng module GPS. Tuy nhiên, dữ liệu GPS trả về là tọa độ cầu (Spherical coordinates): Vĩ độ (Latitude) và Kinh độ (Longitude). Thuật toán tìm đường trên lưới lại yêu cầu hệ tọa độ Descartes phẳng (Cartesian XY). Chúng ta cần phải chiếu tọa độ toàn cầu xuống một mặt phẳng cục bộ.
/ When operating outdoors, we navigate using a GPS module. However, GPS returns spherical coordinates: Latitude and Longitude. Grid pathfinding algorithms require a flat Cartesian coordinate system (XY). We need to project global coordinates onto a local flat plane.

Sử dụng công thức xấp xỉ phẳng (Equirectangular approximation) cho khoảng cách ngắn (dưới 5-10 km):
/ Using Equirectangular approximation for short distances (under 5-10 km):

```python
R = 6371000 # Bán kính Trái Đất (mét) / Earth radius in meters
# Chọn một điểm làm Gốc Tọa Độ (0,0) / Choose a point as the Origin (0,0)
lat_origin = 10.762622
lon_origin = 106.660172 

def convert_gps_to_xy(lat, lon):
    """
    Hàm này đổi tọa độ (Lat, Lon) của xe sang (X, Y) theo mét so với gốc.
    This function converts (Lat, Lon) to (X, Y) in meters relative to origin.
    """
    # Đổi sang radian / Convert to radians
    lat_rad = math.radians(lat)
    lon_rad = math.radians(lon)
    lat_origin_rad = math.radians(lat_origin)
    lon_origin_rad = math.radians(lon_origin)
    
    # Tính X và Y / Calculate X and Y
    x = R * (lon_rad - lon_origin_rad) * math.cos(lat_origin_rad)
    y = R * (lat_rad - lat_origin_rad)
    
    return x, y
```
Sau khi có giá trị `X` và `Y` (tính bằng mét), ta chia cho `resolution` để tìm ra chỉ số mảng (grid index) tương ứng: `map[int(y/resolution)][int(x/resolution)]`.
/ After getting `X` and `Y` in meters, we divide by `resolution` to find the corresponding array index.

### 4. Thuật Toán Tìm Đường A* (A* Pathfinding Algorithm)

A* (phát âm: A-Star) là một trong những thuật toán tìm đường phổ biến và hiệu quả nhất trong khoa học máy tính. Nó là sự lai tạo (hybrid) giữa:
/ A* (pronounced: A-Star) is one of the most popular and efficient pathfinding algorithms in computer science. It is a hybrid of:
- **Thuật toán Dijkstra:** Luôn mở rộng mọi hướng để đảm bảo tìm được đường đi ngắn nhất (rất chậm). / Expands in all directions to guarantee finding the shortest path (very slow).
- **Greedy Best-First-Search:** Chỉ đâm thẳng về phía đích bằng trực giác (rất nhanh, nhưng có thể bị mắc kẹt vào ngõ cụt). / Only heads straight toward the goal via intuition (very fast, but can get stuck in dead ends).

**Các Khái Niệm Cốt Lõi (Core Concepts of A*):**
Mỗi ô trên lưới được gọi là một **Node**. Khi thuật toán xem xét một Node, nó sẽ đánh giá 3 giá trị:
/ Each cell on the grid is called a **Node**. When the algorithm evaluates a Node, it looks at 3 values:
- **g(n):** Chi phí thực tế (Cost) để đi từ điểm bắt đầu (Start) đến Node hiện tại `n`. / Actual cost to move from Start to current Node `n`.
- **h(n):** Chi phí Heuristic (Chi phí ước lượng). Đây là khoảng cách "đoán mò" từ Node `n` đến Đích (Goal). / Heuristic cost. This is a "guessed" distance from Node `n` to the Goal.
- **f(n):** Tổng chi phí (Total cost). `f(n) = g(n) + h(n)`. A* sẽ luôn luôn chọn mở rộng Node có `f(n)` NHỎ NHẤT trong danh sách chờ. / A* always chooses to expand the Node with the LOWEST `f(n)` in the waiting list.

**Các loại Heuristic Phổ Biến (Common Heuristics):**
1. **Khoảng Cách Manhattan (Manhattan Distance):** Thích hợp khi xe chỉ được phép đi 4 hướng thẳng (lên, xuống, trái, phải).
   / Suitable when the car is only allowed 4 straight movements (up, down, left, right).
   `h(n) = abs(current.x - goal.x) + abs(current.y - goal.y)`
2. **Khoảng Cách Euclidean (Euclidean Distance):** Đường chim bay. Thích hợp khi xe có thể đi mọi hướng hoặc đi chéo (8 hướng).
   / Straight line distance. Suitable when car can move in any direction or diagonally (8 directions).
   `h(n) = math.sqrt((current.x - goal.x)**2 + (current.y - goal.y)**2)`

### Phân Tích Từng Bước Thuật Toán A* Kèm Ví Dụ Trực Quan / Step-by-Step A* Walkthrough with Visual Grid Example

Để thực sự hiểu cách A* hoạt động, chúng ta hãy xem xét một lưới kích thước 5x5 đơn giản.
/ To truly understand how A* works, let's examine a simple 5x5 grid.

**Quy ước bản đồ (Map Convention):**
- `S`: Điểm bắt đầu (Start) tại tọa độ (0,0)
- `E`: Điểm kết thúc (End/Goal) tại tọa độ (4,4)
- `X`: Vật cản (Obstacle) là bức tường chắn ngang đường.
- `.`: Ô trống (Free cell)

Sơ đồ ban đầu (Initial Map Matrix):
```text
Y/X  0 1 2 3 4
0    S . . X . 
1    . . . X . 
2    . X X X . 
3    . . . . . 
4    . . . . E 
```
**Danh sách lưu trữ (Storage Lists):**
- **Open List:** Chứa các Node đã được "thấy" nhưng chưa được "thăm" chính thức. (Đợi để mở rộng). / Contains nodes that are "seen" but not officially "visited". (Waiting queue).
- **Closed List:** Chứa các Node đã được "thăm" và không cần quay lại kiểm tra nữa. / Contains fully "visited" nodes that don't need re-checking.

**Bước 1 (Step 1): Khởi tạo (Initialization)**
- Đặt điểm xuất phát `S (0,0)`. Tính chi phí thực tế: `g(S) = 0`.
- Tính Heuristic (Giả sử dùng Manhattan): `h(S) = |4 - 0| + |4 - 0| = 8`.
- Vậy tổng chi phí `f(S) = g + h = 0 + 8 = 8`.
- Đưa `S` vào `Open List`.

**Bước 2 (Step 2): Vòng lặp đầu tiên (First Iteration)**
- Rút Node có `f` nhỏ nhất từ `Open List`. Lúc này chỉ có `S`, nên lấy `S` ra và bỏ vào `Closed List`.
- Kiểm tra các ô xung quanh (Neighbors) của `S`: có (1,0) - bên phải, và (0,1) - bên dưới.
- Xét (1,0): `g = g(S) + 1 = 1`. `h = |4-1| + |4-0| = 7`. `f = 1 + 7 = 8`. Thêm vào Open List, lưu thông tin "Node cha" là `S`.
- Xét (0,1): `g = g(S) + 1 = 1`. `h = |4-0| + |4-1| = 7`. `f = 1 + 7 = 8`. Thêm vào Open List, lưu "Node cha" là `S`.
- Hiện tại Open List có hai node với giá trị f=8.

**Bước 3 (Step 3): Tiến sâu hơn (Going deeper)**
- Thuật toán chọn ngẫu nhiên một trong hai node có f=8, giả sử chọn (1,0). Bỏ nó vào Closed List.
- Mở rộng (1,0), ta thấy các ô kề là (2,0) và (1,1). (Bỏ qua ô (0,0) vì đã ở trong Closed List).
- Tính `f` cho (2,0) và (1,1), cả hai đều bằng 8. Đưa chúng vào Open List.
- Trọng tâm của A* là heuristic `h` có xu hướng kéo hướng đi về phía đông nam (về chữ `E`). Nhưng khi lan tới hàng rào bức tường `X` tại cột 3, các ô vật cản sẽ bị bỏ qua (không bao giờ đưa vào Open List).
- Điều này buộc A* phải lôi các lựa chọn "kém hấp dẫn hơn" từ Open List (ví dụ: các ô ở tọa độ (0,2), (0,3) phải đi vòng xuống dưới) để đi qua đáy của bức tường.
- Cuối cùng, khi ô `E` được đưa vào Open List và được rút ra. Vòng lặp kết thúc. Thuật toán dùng liên kết "Node cha" (Parent linking) đi lùi từ `E` ngược về `S` để in ra đường dẫn hoàn chỉnh.

### 5. Định Tuyến Bao Phủ Boustrophedon (Roomba Style / Coverage Routing)

Đôi khi mục tiêu của robot không phải là đi từ điểm A đến điểm B nhanh nhất, mà là **đi qua (quét/lau/hút) tất cả các điểm** trong một khu vực (ví dụ: robot hút bụi, xe cắt cỏ tự động, máy cày ruộng).
/ Sometimes the robot's goal is not moving from A to B fastest, but **covering (sweeping/cleaning)** all points in an area (e.g., vacuum robot, lawnmower, smart tractor).

Các kiểu di chuyển cơ bản (Basic coverage patterns):
- **Boustrophedon (Lawnmower - Đường dích dắc cắt cỏ):** Xe đi thẳng theo một chiều dài của căn phòng. Khi đụng tường, xe quay 180 độ (bằng cách rẽ phải 90 độ, nhích lên một chút, rồi rẽ phải 90 độ tiếp) và đi ngược lại sát bên cạnh đường cũ. Rất hiệu quả cho các khu vực hình chữ nhật không có vật cản. / Go straight, turn 180 degrees, go straight back, creating a zigzag. Very efficient for rectangular obstacle-free areas.
- **Spiral (Xoắn ốc):** Bắt đầu từ vị trí xuất phát, xe mở rộng bán kính chạy vòng tròn dần ra ngoài. Tốt cho các không gian mở rộng lớn, hoặc khi dọn dẹp tại chỗ (spot cleaning). / Start from the origin and expand spiral arcs outwards.
- **Random Bounce (Nảy ngẫu nhiên):** Xe cứ đi thẳng cho đến khi đụng tường (cảm biến phát hiện hoặc chạm cản vật lý), sau đó lùi lại một chút và quay một góc ngẫu nhiên (ví dụ 123 độ). Phương pháp này cực kỳ đơn giản để lập trình, không cần bản đồ (map-less), nhưng tốn rất nhiều thời gian (inefficient) để phủ hết 100% diện tích phòng.

### 6. Lập Kế Hoạch Lại (Re-planning) Khi Gặp Vật Cản Mới

Trong thực tế, môi trường luôn thay đổi động (dynamic environment). Một con người có thể đi ngang qua hành lang, hoặc có ai đó vô tình đặt một chiếc thùng chắn ngang quỹ đạo (trajectory) mà A* đã tính toán ban đầu dựa trên bản đồ cũ.
/ In reality, the environment is constantly changing dynamically. A person might walk across the hallway, or a box is placed blocking the initially calculated A* trajectory based on the old map.

Hệ thống xử lý như sau (Handling mechanism):
1. **Local Costmap (Bản đồ chi phí cục bộ):** Bên cạnh bản đồ tĩnh toàn cầu, xe duy trì một lưới kích thước nhỏ (ví dụ 3x3 mét xung quanh xe), được cập nhật cực nhanh từ Lidar hoặc Ultrasonic sensor (10-20 lần/giây). / The car maintains a small local grid around itself updated extremely fast.
2. **Xác minh đường đi (Path Verification):** Xe đối chiếu những tọa độ nó chuẩn bị đi qua với Local Costmap. / The car checks its upcoming coordinates against the Local Costmap.
3. **Kích hoạt Re-plan (Trigger Re-planning):** Nếu một ô lưới trên đường đi đột ngột chuyển sang trạng thái OCCUPIED, xe lập tức kích hoạt phanh (Emergency Brake). Thuật toán A* được gọi CHẠY LẠI MỘT LẦN NỮA từ vị trí hiện tại của xe đến đích. Đường màu đỏ sẽ được cập nhật lại để đi vòng qua chiếc thùng. / If a cell on the path becomes OCCUPIED, the car brakes immediately. A* is called AGAIN from the car's current position to the goal to bypass the box.

---

## Code Python / Python Code

Dưới đây là một hệ thống code Python hoàn chỉnh để mô phỏng bản đồ lưới (grid map), định nghĩa các hàm tính toán, thực thi thuật toán A* và hiển thị kết quả hoạt họa lên đồ thị Matplotlib.
/ Below is a complete Python system to simulate a grid map, execute the A* algorithm, and display the animated result on a Matplotlib graph.

**Lưu ý:** Đoạn mã này có thể chạy trên laptop hoặc nhúng vào Raspberry Pi trên xe tự hành.
/ **Note:** This code can run on a laptop or be embedded in a Raspberry Pi on the car.

```python
import numpy as np
import matplotlib.pyplot as plt
import math
import heapq

# ==========================================
# 1. Định nghĩa Lớp Node (Node Class Definition)
# ==========================================
class Node:
    """
    Đại diện cho một ô lưới trong thuật toán tìm đường A*.
    Represents a single grid cell in the A* pathfinding algorithm.
    """
    def __init__(self, x, y, cost, parent_index=None):
        self.x = x             # Tọa độ X (Index trên lưới) / Grid X index
        self.y = y             # Tọa độ Y (Index trên lưới) / Grid Y index
        self.cost = cost       # cost chính là giá trị g(n) / Actual cost g(n)
        self.parent = parent_index # Chỉ số của Node cha (dùng để truy ngược đường đi)
        self.f = 0.0           # Tổng chi phí f(n) = g(n) + h(n)

    def __lt__(self, other):
        # Nạp chồng toán tử Nhỏ hơn (<) để cấu trúc dữ liệu Priority Queue (Heapq)
        # có thể tự động sắp xếp và lấy ra Node có f(n) nhỏ nhất một cách nhanh chóng.
        # Overload Less-than operator for Priority Queue sorting based on f(n).
        return self.f < other.f

# ==========================================
# 2. Lớp Thuật Toán Lập Kế Hoạch A* (AStarPlanner Class)
# ==========================================
class AStarPlanner:
    def __init__(self, resolution, robot_radius):
        """
        Khởi tạo hệ thống lập kế hoạch.
        resolution: Kích thước của mỗi ô lưới tính bằng mét (vd: 1.0 = 1 mét). 
        robot_radius: Bán kính an toàn của xe để làm phồng (inflate) vật cản, tránh va quẹt.
        """
        self.resolution = resolution
        self.robot_radius = robot_radius
        
        # Danh sách các hướng di chuyển có thể (Motion model)
        # [dx, dy, cost]
        # Hỗ trợ 8 hướng: 4 hướng thẳng (chi phí 1) và 4 hướng chéo (chi phí căn bậc hai của 2)
        self.motion = [
            [1, 0, 1.0],               # Sang phải (Right)
            [0, 1, 1.0],               # Lên trên (Up)
            [-1, 0, 1.0],              # Sang trái (Left)
            [0, -1, 1.0],              # Xuống dưới (Down)
            [-1, -1, math.sqrt(2.0)],  # Chéo trái xuống (Bottom-Left)
            [-1, 1, math.sqrt(2.0)],   # Chéo trái lên (Top-Left)
            [1, -1, math.sqrt(2.0)],   # Chéo phải xuống (Bottom-Right)
            [1, 1, math.sqrt(2.0)]     # Chéo phải lên (Top-Right)
        ]

    def calc_heuristic(self, node, goal):
        """ 
        Tính toán Heuristic bằng khoảng cách Euclidean (Đường chim bay). 
        Calculate Heuristic using Euclidean distance. 
        """
        w = 1.0 # Trọng số heuristic (Heuristic weight) - Tăng lên để A* chạy nhanh hơn nhưng có thể không tối ưu nhất.
        distance = w * math.hypot(node.x - goal.x, node.y - goal.y)
        return distance

    def planning(self, start_x, start_y, goal_x, goal_y, obs_x, obs_y):
        """
        Hàm chính chạy thuật toán A* / Main function running A* algorithm.
        start_x, start_y: Tọa độ bắt đầu tính bằng mét / Start coordinates in meters
        goal_x, goal_y: Tọa độ đích tính bằng mét / Goal coordinates in meters
        obs_x, obs_y: Danh sách tọa độ vật cản / List of obstacle coordinates
        """
        # 1. Khởi tạo bản đồ vật cản lưới / Initialize grid obstacle map
        self.calc_obstacle_map(obs_x, obs_y)

        # 2. Chuyển đổi tọa độ hệ mét thành tọa độ chỉ số của ma trận (Grid Index)
        start_node = Node(self.calc_xy_index(start_x, self.min_x),
                          self.calc_xy_index(start_y, self.min_y), 0.0, -1)
        goal_node = Node(self.calc_xy_index(goal_x, self.min_x),
                         self.calc_xy_index(goal_y, self.min_y), 0.0, -1)

        # Từ điển Open Set chứa các Node chờ xử lý, Closed Set chứa các Node đã xử lý
        open_set, closed_set = dict(), dict()
        
        # Hàng đợi ưu tiên (Priority Queue) tối ưu hóa việc tìm Node rẻ nhất
        open_set[self.calc_grid_index(start_node)] = start_node
        pq = []
        heapq.heappush(pq, (start_node.f, self.calc_grid_index(start_node)))

        print("Đang tìm đường bằng A*... / Searching path with A*...")
        
        # 3. Vòng lặp chính của thuật toán / Main algorithm loop
        while True:
            if not pq:
                print("LỖI: Không thể tìm thấy đường đi! (Vật cản chặn kín hoặc đích nằm ngoài lưới) / ERROR: Cannot find path!")
                break
            
            # Lấy Node có giá trị f nhỏ nhất từ Priority Queue
            _, current_id = heapq.heappop(pq)
            
            # Nếu node đã nằm trong closed_set (đã duyệt qua), chúng ta bỏ qua
            if current_id in closed_set:
                continue
                
            current_node = open_set[current_id]
            
            # Chuyển Node hiện tại vào Closed Set
            closed_set[current_id] = current_node

            # Nếu Node hiện tại trùng với Đích -> Thành công!
            if current_node.x == goal_node.x and current_node.y == goal_node.y:
                print("THÀNH CÔNG: Đã tìm thấy đường! / SUCCESS: Path found!")
                goal_node.parent = current_node.parent
                goal_node.cost = current_node.cost
                break

            # 4. Mở rộng các ô xung quanh (Expand neighbors)
            for i, _ in enumerate(self.motion):
                # Tạo Node con theo từng hướng di chuyển
                child_node = Node(current_node.x + self.motion[i][0],
                                  current_node.y + self.motion[i][1],
                                  current_node.cost + self.motion[i][2], 
                                  current_id) # Set node cha là current_id
                
                n_id = self.calc_grid_index(child_node)

                # Kiểm tra hợp lệ: Không đi ra ngoài ranh giới và không đâm vào vật cản
                if not self.verify_node(child_node):
                    continue

                # Nếu node con đã được duyệt kỹ, bỏ qua
                if n_id in closed_set:
                    continue

                # Tính toán tổng chi phí f(n) cho Node con
                child_node.f = child_node.cost + self.calc_heuristic(child_node, goal_node)

                # Thuật toán chính: Nếu Node con chưa từng được thấy, thêm vào Open Set
                # Nếu đã từng thấy nhưng đường đi này có cost nhỏ hơn (rẻ hơn), cập nhật lại
                if n_id not in open_set:
                    open_set[n_id] = child_node
                    heapq.heappush(pq, (child_node.f, n_id))
                else:
                    if open_set[n_id].cost > child_node.cost:
                        open_set[n_id] = child_node
                        heapq.heappush(pq, (child_node.f, n_id))

        # 5. Truy ngược lại từ đích để vẽ đường dẫn / Trace back from goal to get the full path
        path_x, path_y = self.calc_final_path(goal_node, closed_set)
        return path_x, path_y

    def calc_final_path(self, goal_node, closed_set):
        """ Truy ngược (backtrack) sử dụng thuộc tính 'parent' của Node. """
        rx, ry = [self.calc_grid_position(goal_node.x, self.min_x)], [
            self.calc_grid_position(goal_node.y, self.min_y)]
        parent_index = goal_node.parent
        while parent_index != -1: # Root node có parent = -1
            n = closed_set[parent_index]
            rx.append(self.calc_grid_position(n.x, self.min_x))
            ry.append(self.calc_grid_position(n.y, self.min_y))
            parent_index = n.parent
        return rx, ry

    def calc_grid_position(self, index, min_position):
        """ Đổi từ tọa độ mảng ngược trở lại đơn vị Mét. / Convert Grid Index back to Meters. """
        return index * self.resolution + min_position

    def calc_xy_index(self, position, min_pos):
        """ Đổi từ Mét sang Tọa độ Mảng (chỉ số int). / Convert Meters to Grid Index (int). """
        return round((position - min_pos) / self.resolution)

    def calc_grid_index(self, node):
        """ Tạo một ID duy nhất cho mỗi ô lưới dựa trên chiều rộng bản đồ. """
        return (node.y - self.min_y) * self.x_width + (node.x - self.min_x)

    def verify_node(self, node):
        """ Hàm kiểm tra sự an toàn của Node. """
        px = self.calc_grid_position(node.x, self.min_x)
        py = self.calc_grid_position(node.y, self.min_y)

        # Tránh ra ngoài phạm vi bản đồ / Out of bounds check
        if px < self.min_x or py < self.min_y or px >= self.max_x or py >= self.max_y:
            return False

        # Kiểm tra đâm vật cản / Obstacle collision check
        if self.obstacle_map[node.x][node.y]:
            return False

        return True

    def calc_obstacle_map(self, ox, oy):
        """ 
        Khởi tạo ma trận Boolean 2D để lưu vật cản. Tính toán lề an toàn (robot_radius).
        Initialize 2D Boolean matrix for obstacles. Inflate obstacles using robot_radius.
        """
        self.min_x = round(min(ox))
        self.min_y = round(min(oy))
        self.max_x = round(max(ox))
        self.max_y = round(max(oy))

        self.x_width = round((self.max_x - self.min_x) / self.resolution)
        self.y_width = round((self.max_y - self.min_y) / self.resolution)

        # Mặc định tất cả ô đều an toàn (False)
        self.obstacle_map = [[False for _ in range(self.y_width)] for _ in range(self.x_width)]
        
        # Mở rộng (Inflate) vật cản: Bất kỳ ô nào nằm trong bán kính xe so với điểm vật cản
        # đều bị đánh dấu là không an toàn (True).
        for ix in range(self.x_width):
            x = self.calc_grid_position(ix, self.min_x)
            for iy in range(self.y_width):
                y = self.calc_grid_position(iy, self.min_y)
                for iox, ioy in zip(ox, oy):
                    distance = math.hypot(iox - x, ioy - y)
                    if distance <= self.robot_radius:
                        self.obstacle_map[ix][iy] = True
                        break # Ô này đã chết, không cần kiểm tra các điểm vật cản khác

# ==========================================
# 3. Hàm Main: Chạy Mô Phỏng Giao Diện Đồ Họa (Run GUI Simulation)
# ==========================================
def main():
    print(__file__ + " Bắt đầu mô phỏng A* / Start A* Simulation")

    # Tọa độ Xuất phát và Đích / Start and Goal positions
    start_x = 10.0
    start_y = 10.0
    goal_x = 50.0
    goal_y = 50.0
    
    # Kích thước lưới và Xe / Grid and Car configurations
    grid_size = 2.0      # Mỗi ô là 2 mét vuông
    robot_radius = 1.0   # Bán kính xe là 1 mét

    # Tạo môi trường giả lập (Bản đồ) / Generate Mock Environment (Map)
    obs_x, obs_y = [], []
    
    # Vẽ Tường bao quanh căn phòng (Outer borders)
    for i in range(-10, 60):
        obs_x.append(i); obs_y.append(-10.0) # Tường dưới
        obs_x.append(60.0); obs_y.append(i)  # Tường phải
        obs_x.append(i); obs_y.append(60.0)  # Tường trên
        obs_x.append(-10.0); obs_y.append(i) # Tường trái

    # Vẽ vách ngăn (Chướng ngại vật bên trong phòng) / Inner obstacles
    for i in range(-10, 40):
        obs_x.append(20.0); obs_y.append(i)
    for i in range(0, 40):
        obs_x.append(40.0); obs_y.append(60.0 - i)

    # Khởi tạo đồ thị
    plt.plot(obs_x, obs_y, ".k") # Vẽ vật cản màu đen / Plot black obstacles
    plt.plot(start_x, start_y, "og", markersize=10) # Vẽ điểm bắt đầu màu xanh lá / Plot green start
    plt.plot(goal_x, goal_y, "xb", markersize=10)   # Vẽ đích màu xanh dương / Plot blue goal
    plt.grid(True)
    plt.axis("equal")

    # Kích hoạt thuật toán
    a_star = AStarPlanner(grid_size, robot_radius)
    path_x, path_y = a_star.planning(start_x, start_y, goal_x, goal_y, obs_x, obs_y)

    # Vẽ quỹ đạo kết quả bằng nét liền màu đỏ (Red solid line)
    plt.plot(path_x, path_y, "-r", linewidth=2) 
    plt.pause(0.001)
    plt.show()

if __name__ == '__main__':
    main()
```

---

## Code Arduino / Arduino Code

Thuật toán A* toàn diện với ma trận bộ nhớ lớn không thể chạy trên các bo mạch Arduino Uno/Nano vì hạn chế cực hạn về RAM (chỉ có 2KB RAM). Tuy nhiên, các vi điều khiển mạnh hơn như **ESP32** (có 520KB RAM) hoàn toàn đủ khả năng. 

Trong khuôn khổ thực hành với khung gầm xe Arduino ở cấp độ cơ bản, chúng ta sẽ không đưa toàn bộ bản đồ vào xe. Thay vào đó, chúng ta sẽ thực thi **Định Tuyến Cắt Cỏ Boustrophedon (Lawnmower Coverage Pattern)** một cách "mù" (tức là không cần lưu bản đồ lớn, xử lý bằng máy trạng thái - State Machine logic từ cảm biến siêu âm). Hệ thống này mô phỏng cách các robot Roomba đời đầu dọn dẹp căn phòng.

/ A comprehensive A* algorithm with a large memory matrix cannot run on Arduino Uno/Nano boards due to severe RAM limitations (only 2KB RAM). However, powerful microcontrollers like ESP32 (with 520KB RAM) are fully capable.
In the scope of practice with basic Arduino chassis, we will execute a blind **Boustrophedon Lawnmower Coverage Pattern** using State Machine logic and an ultrasonic sensor. This mimics how early Roomba robots cleaned a room without saving large maps.

```cpp
// Hệ thống Định tuyến Bao Phủ Boustrophedon Đơn Giản cho Xe Tự Hành
// Simple Boustrophedon Coverage System for Autonomous Car

#include <NewPing.h>

// Định nghĩa chân cảm biến siêu âm (Ultrasonic Pins)
#define TRIGGER_PIN  12
#define ECHO_PIN     14
#define MAX_DISTANCE 200 // Chiều dài quét tối đa của cảm biến (cm) / Max scanning length

// Định nghĩa chân điều khiển Motor L298N (Motor control pins)
#define MOTOR_LEFT_F 27   // Bánh trái tiến / Left forward
#define MOTOR_LEFT_B 26   // Bánh trái lùi / Left backward
#define MOTOR_RIGHT_F 25  // Bánh phải tiến / Right forward
#define MOTOR_RIGHT_B 33  // Bánh phải lùi / Right backward

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);

// Định nghĩa các trạng thái (State machine) của xe / Define car states
enum CarState {
  MOVE_FORWARD,
  TURN_RIGHT,
  TURN_RIGHT_AGAIN,
  TURN_LEFT,
  TURN_LEFT_AGAIN
};

CarState currentState = MOVE_FORWARD;
bool turnRightNext = true; // Cờ hiệu để kiểm tra hướng quay ở cuối đường (Flag for turning direction)

void setup() {
  Serial.begin(115200);
  
  // Thiết lập các chân xuất tín hiệu cho động cơ
  pinMode(MOTOR_LEFT_F, OUTPUT);
  pinMode(MOTOR_LEFT_B, OUTPUT);
  pinMode(MOTOR_RIGHT_F, OUTPUT);
  pinMode(MOTOR_RIGHT_B, OUTPUT);
  
  Serial.println("Khoi dong he thong Roomba Boustrophedon...");
}

// Hàm tắt toàn bộ động cơ / Stop all motors
void stopMotors() {
  digitalWrite(MOTOR_LEFT_F, LOW);
  digitalWrite(MOTOR_LEFT_B, LOW);
  digitalWrite(MOTOR_RIGHT_F, LOW);
  digitalWrite(MOTOR_RIGHT_B, LOW);
}

// Hàm điều khiển xe đi thẳng / Move forward function
void moveForward() {
  digitalWrite(MOTOR_LEFT_F, HIGH);
  digitalWrite(MOTOR_LEFT_B, LOW);
  digitalWrite(MOTOR_RIGHT_F, HIGH);
  digitalWrite(MOTOR_RIGHT_B, LOW);
}

// Hàm rẽ phải tại chỗ khoảng 90 độ (Xoay 2 bánh ngược chiều nhau)
void turnRight90() {
  digitalWrite(MOTOR_LEFT_F, HIGH); // Trái tiến
  digitalWrite(MOTOR_LEFT_B, LOW);
  digitalWrite(MOTOR_RIGHT_F, LOW); 
  digitalWrite(MOTOR_RIGHT_B, HIGH); // Phải lùi
  
  // LƯU Ý KỸ THUẬT: Delay 500ms là con số ước lượng. 
  // Trong thực tế cần dùng La bàn (Compass) MPU6050 để dừng chính xác 90 độ.
  delay(500); 
  stopMotors();
}

// Hàm rẽ trái tại chỗ khoảng 90 độ
void turnLeft90() {
  digitalWrite(MOTOR_LEFT_F, LOW); 
  digitalWrite(MOTOR_LEFT_B, HIGH); // Trái lùi
  digitalWrite(MOTOR_RIGHT_F, HIGH); // Phải tiến
  digitalWrite(MOTOR_RIGHT_B, LOW);
  
  delay(500); 
  stopMotors();
}

void loop() {
  unsigned int distance = sonar.ping_cm();
  
  // Xử lý logic máy trạng thái (State machine logic processing)
  switch(currentState) {
    case MOVE_FORWARD:
      // Nếu cảm biến phát hiện chướng ngại vật ở khoảng cách 1 - 20 cm
      if (distance > 0 && distance < 20) {
        // Gặp tường cuối phòng, dừng lại và bắt đầu quy trình quay
        stopMotors();
        delay(300); // Tạm nghỉ để ổn định động lượng (Stop inertia)
        
        if (turnRightNext) {
          currentState = TURN_RIGHT;
        } else {
          currentState = TURN_LEFT;
        }
      } else {
        moveForward(); // Nếu đường trống, cứ đi thẳng dọn dẹp
      }
      break;

    case TURN_RIGHT:
      Serial.println("Re Phai Lan 1");
      turnRight90();      // Xoay 90 độ sang phải
      moveForward();      // Đi nhích lên song song với vệt cũ một đoạn
      delay(400);         // Quãng đường tương đương bề ngang xe (car width)
      stopMotors();
      currentState = TURN_RIGHT_AGAIN;
      break;
      
    case TURN_RIGHT_AGAIN:
      Serial.println("Re Phai Lan 2 - Quay dau thanh cong");
      turnRight90();      // Xoay thêm 90 độ nữa (tổng cộng quay đầu 180 độ)
      turnRightNext = false; // Ở đầu phòng bên kia, xe sẽ phải rẽ hướng trái
      currentState = MOVE_FORWARD;
      break;

    case TURN_LEFT:
      Serial.println("Re Trai Lan 1");
      turnLeft90();
      moveForward();
      delay(400); 
      stopMotors();
      currentState = TURN_LEFT_AGAIN;
      break;

    case TURN_LEFT_AGAIN:
      Serial.println("Re Trai Lan 2 - Quay dau thanh cong");
      turnLeft90();
      turnRightNext = true; // Trả cờ lại để lần đụng tường tiếp rẽ phải
      currentState = MOVE_FORWARD;
      break;
  }
  
  // Đợi một khoảng ngắn để phần cứng cảm biến siêu âm hồi phục (Pulse delay)
  delay(50); 
}
```

---

## Bài Tập Thực Hành (Exercises)

1. **Khởi Chạy A* Python Cơ Bản:** 
   - Tải file Python về máy tính cá nhân. 
   - Mở Terminal/Command Prompt, cài đặt thư viện cần thiết bằng lệnh: `pip install numpy matplotlib`.
   - Chạy thử chương trình (`python a_star.py`). Chụp ảnh màn hình đồ thị đường đi màu đỏ thu được.
   - Chỉnh sửa dòng code: Thay đổi biến `start_x, start_y` thành `(10.0, 50.0)`. Quan sát sự thay đổi quỹ đạo.
   /
   - Download the Python file.
   - Open Terminal, install libraries: `pip install numpy matplotlib`.
   - Run the program. Take a screenshot of the resulting red path.
   - Change variables `start_x, start_y` to `(10.0, 50.0)`. Observe the trajectory change.

2. **Thay Đổi Hàm Đánh Giá Heuristic (Tùy Chọn Khó):**
   - Trong hàm `calc_heuristic`, thay vì sử dụng hàm `math.hypot` (Euclidean distance), hãy viết công thức toán học tính khoảng cách Manhattan Distance (như trong phần lý thuyết).
   - Quan sát xem quỹ đạo đường vẽ ra có bị vuông vức (nhiều góc cua vuông) hơn so với đường chéo mượt mà lúc ban đầu hay không. Tại sao?
   /
   - In the `calc_heuristic` function, write code for Manhattan Distance instead of Euclidean.
   - Observe if the resulting path becomes more "blocky" with right angles compared to the smooth diagonals. Why?

3. **Cập Nhật Vật Cản Thời Gian Thực (Mô phỏng Re-planning):**
   - Viết thêm một đoạn mã nhỏ trong hàm `main()`: Sau khi gọi hàm `planning()` lần đầu, giả sử xuất hiện một bức tường chắn ngay chính giữa quỹ đạo màu đỏ vừa tìm được. (Cập nhật ma trận `obs_x, obs_y`).
   - Gọi lại hàm `planning()` một lần nữa và vẽ một đường màu xanh lục (Green path `-g`) đè lên. Chụp hình minh họa xe né thành công chướng ngại vật mới.

---

## Câu Hỏi Thảo Luận / Discussion (5)

1. **Hiệu năng hệ thống (System Performance):** Nếu độ phân giải (resolution) của bản đồ lưới là `0.01m` (1cm vuông/ô) thay vì `1.0m`, thuật toán A* sẽ bị ảnh hưởng như thế nào về dung lượng bộ nhớ RAM và thời gian vi xử lý cần để tính toán một lộ trình 10 mét? / How would RAM and computation time be affected if resolution is changed to 0.01m?
2. **Bản chất của A* (Nature of A*):** Sự khác biệt cốt lõi giữa `g(n)` và `h(n)` là gì? Nếu chúng ta cố ý chỉnh code để `h(n) = 0` (bỏ qua heuristic) cho mọi Node, thì A* sẽ tự động biến thành thuật toán tìm kiếm kinh điển nào? / What happens to A* if we set h(n) = 0 for all nodes?
3. **An toàn phần cứng (Hardware Safety):** Trong lập kế hoạch đường đi thực tế trên xe thật, tại sao chúng ta bắt buộc phải sử dụng biến `robot_radius` (bán kính phồng)? Nếu bỏ qua bước này (để radius = 0), điều nguy hiểm gì sẽ xảy ra tại các góc cua của hành lang hẹp? / Why is `robot_radius` mandatory? What happens at narrow corners if it's 0?
4. **Vấn đề của Boustrophedon (Boustrophedon limitation):** Định tuyến Lawnmower bằng máy trạng thái (State machine) của chúng ta rất tốt cho phòng trống hoàn toàn. Nhưng điều gì sẽ xảy ra nếu ở ngay giữa phòng có một cái chân bàn lớn? Làm thế nào để robot "mù" biết cách lách qua cái chân bàn và tiếp tục đường dích dắc của mình mà không bị mắc kẹt vĩnh viễn? / How does a blind Boustrophedon robot handle an unexpected table leg in the middle of the room?
5. **Sai số Trái Đất (Earth curvature error):** Công thức chuyển đổi từ GPS (Lat/Lon) sang lưới cục bộ (XY) sử dụng `Equirectangular approximation` coi bề mặt trái đất là một mặt phẳng. Công thức này có còn chính xác nếu chiếc xe tự hành của bạn đi phượt xuyên Việt Nam dọc theo 2000 km đường dài không? Chúng ta phải dùng hệ quy chiếu phức tạp nào khác? / Is the flat Earth approximation GPS-to-XY conversion formula accurate for long distance (2000 km) trips?

---

## Bài Tập Về Nhà / Homework

- **Nhiệm Vụ 1 (Phần cứng):** Tích hợp module La bàn điện tử (Compass HMC5883L hoặc MPU6050) vào hệ thống định tuyến Lawnmower trên ESP32/Arduino. Việc sử dụng thời gian cứng `delay(500)` để ép xe quay 90 độ là KHÔNG HỀ CHÍNH XÁC do ma sát của bánh xe với thảm, độ trượt, và sự sụt giảm điện áp của pin. Hãy viết một bộ điều khiển PID hoặc vòng lặp `while()` đơn giản liên tục đọc góc La bàn. Chỉ ra lệnh ngắt động cơ khi góc xe (Heading yaw) thay đổi ĐÚNG 90 độ.
- **Nhiệm Vụ 2 (Thử nghiệm thực địa):** Thả xe của bạn chạy trong một căn phòng trống. Gắn điện thoại và quay một đoạn video từ trên cao xuống quay lại quỹ đạo hình học Boustrophedon của nó. Phân tích hiện tượng "Odometry Drift" (Sự sai số vị trí tịnh tiến tích lũy sau nhiều vòng cua).

- **Task 1 (Hardware):** Integrate a Compass module into the Lawnmower system. Relying on `delay(500)` is highly inaccurate. Write a control loop that continuously reads the compass angle and stops the motors ONLY when the car's heading changes exactly by 90 degrees.
- **Task 2 (Field Testing):** Run the car in an empty room, record an overhead video of its trajectory. Write a short paragraph analyzing "Odometry drift".

---

## Đánh Giá Kết Quả / Assessment Rubric

Giáo viên và học sinh dùng bảng sau để đánh giá chất lượng hoàn thành của tuần học.

| Tiêu Chí / Criteria | Yếu / Poor (0-4 đ) | Khá / Good (5-7 đ) | Xuất Sắc / Excellent (8-10 đ) |
|---------------------|--------------------|--------------------|-------------------------------|
| **Hiểu Thuật Toán (Algorithm Understanding)** | Không phân biệt được khái niệm `g(n)` và `h(n)`. Không hiểu vì sao A* lại hoạt động hiệu quả. / Cannot explain g(n) and h(n). | Nắm vững được nguyên lý A* cơ bản, có khả năng giải thích sơ bộ trên bảng trắng nhưng chưa biết tinh chỉnh. / Grasps basic A* principles. | Tự sửa đổi Heuristic nâng cao, giải thích sâu sắc vai trò của việc mở rộng lề vật cản (`robot_radius`). / Deep understanding of heuristics and inflation. |
| **Lập Trình Python (Python Programming)** | Copy paste code bị lỗi thụt lề (syntax). Không hiện được giao diện Matplotlib đồ họa. / Syntax errors, fails to plot GUI. | Chạy thành công file mã nguồn. Biết cách thay đổi tọa độ và quan sát quỹ đạo thay đổi. / Successfully runs and tweaks coordinates. | Tự thiết kế các chướng ngại vật mới khó hơn. Lập trình thành công tính năng Re-planning chặn đường xe. / Designs custom maze maps and successful Re-planning. |
| **Lập Trình Arduino (Hardware Implementation)** | Xe không theo tuân thủ State Machine, chạy loạn vòng tròn hoặc đâm đầu vào tường không lùi. / Car spins aimlessly or crashes. | Xe vẽ được đường dích dắc sơ bộ. Tuy nhiên rẽ các góc thiếu chính xác làm hỏng toàn bộ lưới chạy. / Car runs rough zigzags but angles drift. | Tích hợp thành công la bàn (Compass IMU). Đọc được yaw/pitch/roll. Xe chạy dích dắc vuông vức hoàn hảo (sai số góc < 2 độ). / Perfect 90-degree turns using IMU. |
| **Thảo Luận Kỹ Thuật (Technical Discussion)** | Trả lời cho có lệ, không sử dụng thuật ngữ robotics chuyên ngành. / Vague answers without robotics terms. | Trả lời đầy đủ nhưng còn mang tính lý thuyết sách giáo khoa. / Answers fully but mostly textbook theory. | Đưa ra ví dụ thực tế sắc bén. Phân tích rõ ràng hạn chế phần cứng liên quan tới vi điều khiển cấp thấp. / Provides sharp real-world examples and hardware limitation analysis. |
