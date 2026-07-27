# Tuần 7: Tự Động Hoá & Mission Planning / Week 7: Automation & Mission Planning

## Mục Tiêu / Learning Objectives

**Tiếng Việt:**
- Hiểu được các khái niệm cốt lõi về định vị bằng waypoint (điểm tọa độ), bao gồm tọa độ GPS, độ cao (altitude), và tốc độ (speed).
- Phân biệt và ứng dụng các loại nhiệm vụ bay khác nhau: bay khảo sát (survey grid), quỹ đạo (orbit), bám theo (follow-me), và bay xoắn ốc (spiral).
- Sử dụng phần mềm Mission Planner và QGroundControl (QGC) để thiết lập và vẽ đường bay trên bản đồ trực quan.
- Nắm vững quy trình tải (upload) và thực thi (execute) nhiệm vụ bay sử dụng thư viện DroneKit trong Python.
- Hiểu rõ các lệnh MAVLink liên quan đến nhiệm vụ bay: `NAV_WAYPOINT`, `NAV_TAKEOFF`, `NAV_LAND`, `NAV_RTL`.
- Biết cách thiết lập hàng rào điện tử (Geofence) bao gồm các vùng an toàn (inclusion zones) và vùng cấm bay (exclusion zones).
- Nắm rõ sự khác biệt giữa các hệ quy chiếu độ cao (altitude modes): độ cao tương đối (relative), tuyệt đối (absolute), và bay theo địa hình (terrain following).
- Lập trình đọc dữ liệu tọa độ từ tệp GeoJSON và tích hợp vào hệ thống điều khiển tự động.

**English:**
- Understand the core concepts of waypoint navigation, including GPS coordinates, altitude, and speed.
- Differentiate and apply various mission types: survey grid, orbit, follow-me, and spiral.
- Utilize Mission Planner and QGroundControl (QGC) software to visually design and plot flight paths on a map.
- Master the workflow of uploading and executing flight missions using the DroneKit library in Python.
- Comprehend MAVLink mission commands: `NAV_WAYPOINT`, `NAV_TAKEOFF`, `NAV_LAND`, `NAV_RTL`.
- Know how to configure Geofences, including safe flying zones (inclusion zones) and no-fly zones (exclusion zones).
- Understand the differences between altitude modes: relative, absolute, and terrain following.
- Programmatically read coordinate data from GeoJSON files and integrate them into the autonomous control system.

## Công Cụ & Phần Mềm / Tools & Software

| Công Cụ / Tool | Tiếng Việt | English |
|---|---|---|
| **Mission Planner** | Phần mềm trạm mặt đất phổ biến dành cho ArduPilot, hỗ trợ lập trình đường bay rất mạnh mẽ. | A popular Ground Control Station (GCS) for ArduPilot, offering powerful mission planning features. |
| **QGroundControl** | Trạm mặt đất thay thế (GCS), hỗ trợ tốt cả PX4 và ArduPilot với giao diện hiện đại và đa nền tảng. | An alternative GCS that excellently supports both PX4 and ArduPilot with a modern, cross-platform interface. |
| **DroneKit-Python** | Thư viện Python mạnh mẽ dùng để giao tiếp với drone qua giao thức MAVLink. | A powerful Python library used to communicate with drones via the MAVLink protocol. |
| **SITL Simulator** | Trình giả lập phần mềm cho phép bay thử nghiệm không cần phần cứng thực tế. | Software In The Loop simulator allowing flight testing without actual hardware. |
| **GeoJSON/JSON** | Định dạng dữ liệu tiêu chuẩn để lưu trữ và truyền tải thông tin địa lý (các tọa độ bay). | A standard data format for storing and transmitting geographical information (flight coordinates). |

## Lý Thuyết / Theory

### 1. Waypoint Navigation (Điều Hướng Bằng Tọa Độ)

**Tiếng Việt:**
Điều hướng bằng waypoint là cơ chế cơ bản nhất của các hệ thống tự lái. Mỗi waypoint là một điểm không gian 3 chiều được xác định bởi:
- **Vĩ độ (Latitude)** và **Kinh độ (Longitude)**: Xác định vị trí trên bề mặt Trái Đất theo hệ thống GPS (WGS84).
- **Độ cao (Altitude)**: Độ cao mục tiêu mà drone cần đạt được. Có nhiều hệ quy chiếu độ cao khác nhau.
- **Tốc độ (Speed)**: Tốc độ di chuyển giữa các điểm, có thể là tốc độ không khí (airspeed) hoặc tốc độ so với mặt đất (groundspeed).

⚠️ *CẢNH BÁO AN TOÀN (SAFETY WARNING):* Luôn kiểm tra kỹ độ cao của waypoint để tránh va chạm với cây cối hoặc các công trình nhân tạo. Đảm bảo khu vực bay không có vật cản.

**English:**
Waypoint navigation is the most fundamental mechanism of autopilot systems. Each waypoint is a 3D spatial point defined by:
- **Latitude** and **Longitude**: Determines the position on the Earth's surface using the GPS system (WGS84).
- **Altitude**: The target height the drone needs to achieve. There are multiple altitude reference frames.
- **Speed**: The travel speed between points, which can be airspeed or groundspeed.

⚠️ *SAFETY WARNING:* Always double-check the altitude of your waypoints to prevent collisions with trees or artificial structures. Ensure the flying area is obstacle-free.

### 2. Các Loại Nhiệm Vụ Bay (Mission Types)

**Tiếng Việt:**
- **Survey Grid (Lưới Khảo Sát)**: Drone bay theo các đường song song để chụp ảnh bản đồ hoặc đo đạc nông nghiệp. Mission Planner có công cụ tự động tạo lưới (Auto WP > Grid).
- **Orbit (Bay Quỹ Đạo)**: Bay vòng quanh một điểm tâm cố định (Point of Interest - POI), camera thường hướng vào tâm. Hữu ích khi quay phim hoặc quét mô hình 3D.
- **Follow-Me (Bay Bám Theo)**: Drone tự động di chuyển theo một tín hiệu GPS từ điện thoại hoặc trạm điều khiển di động.
- **Spiral (Bay Xoắn Ốc)**: Drone vừa bay vòng quanh một điểm, vừa từ từ thay đổi độ cao, dùng nhiều trong các chiến dịch tìm kiếm và cứu nạn.

**English:**
- **Survey Grid**: The drone flies in parallel lines to capture mapping photos or perform agricultural surveys. Mission Planner has an auto-grid tool (Auto WP > Grid).
- **Orbit**: Flying around a fixed center point (Point of Interest - POI), usually with the camera pointing towards the center. Useful for filming or 3D scanning.
- **Follow-Me**: The drone automatically follows a GPS signal from a mobile phone or mobile control station.
- **Spiral**: The drone circles a point while gradually changing altitude, widely used in search and rescue operations.

### 3. Mission Planner & QGroundControl

**Tiếng Việt:**
Mission Planner là công cụ truyền thống của ArduPilot. Trong thẻ "Plan", bạn có thể click trên bản đồ để thêm waypoint, cấu hình độ cao mặc định, và chọn lệnh (Takeoff, Waypoint, RTL).
QGroundControl (QGC) cung cấp giao diện trực quan và dễ sử dụng hơn trên điện thoại và máy tính bảng. Cả hai phần mềm đều xuất ra được file `.waypoints` hoặc có thể nạp thẳng xuống drone.

**English:**
Mission Planner is the traditional tool for ArduPilot. In the "Plan" tab, you can click on the map to add waypoints, configure default altitudes, and select commands (Takeoff, Waypoint, RTL).
QGroundControl (QGC) provides a more intuitive and user-friendly interface on phones and tablets. Both software can export `.waypoints` files or upload directly to the drone.

### 4. Các Lệnh MAVLink Phổ Biến (MAVLink Mission Commands)

**Tiếng Việt:**
DroneKit sử dụng thư viện `pymavlink` bên dưới. Các lệnh thường dùng:
- `MAV_CMD_NAV_TAKEOFF`: Lệnh cất cánh. Bạn chỉ định độ cao cất cánh.
- `MAV_CMD_NAV_WAYPOINT`: Lệnh bay đến một điểm cụ thể.
- `MAV_CMD_NAV_LAND`: Lệnh hạ cánh tại vị trí hiện tại hoặc vị trí chỉ định.
- `MAV_CMD_NAV_RETURN_TO_LAUNCH (RTL)`: Lệnh tự động bay về điểm xuất phát.

**English:**
DroneKit uses the underlying `pymavlink` library. Commonly used commands:
- `MAV_CMD_NAV_TAKEOFF`: Command to take off. You specify the target altitude.
- `MAV_CMD_NAV_WAYPOINT`: Command to fly to a specific point.
- `MAV_CMD_NAV_LAND`: Command to land at the current or specified location.
- `MAV_CMD_NAV_RETURN_TO_LAUNCH (RTL)`: Command to autonomously return to the launch point.

### 5. Quản Lý Tốc Độ & Độ Cao (Speed Control & Altitude Modes)

**Tiếng Việt:**
- **Tốc độ (Speed)**:
  - *Airspeed (Tốc độ không khí)*: Vận tốc tương đối với khối không khí xung quanh, quan trọng cho máy bay cánh bằng.
  - *Groundspeed (Tốc độ mặt đất)*: Vận tốc di chuyển thực tế trên mặt đất. DroneKit cho phép set `vehicle.airspeed` hoặc `vehicle.groundspeed`.
- **Độ cao (Altitude)**:
  - *Relative (Tương đối)*: Đo từ điểm cất cánh (HOME). Thường được dùng nhất vì an toàn. (MAV_FRAME_GLOBAL_RELATIVE_ALT)
  - *Absolute (Tuyệt đối - ASL)*: So với mực nước biển. (MAV_FRAME_GLOBAL)
  - *Terrain Following (Theo địa hình)*: Yêu cầu radar hoặc bản đồ địa hình (DEM) để giữ khoảng cách không đổi với mặt đất bên dưới.

**English:**
- **Speed**:
  - *Airspeed*: Velocity relative to the surrounding air mass, crucial for fixed-wing aircraft.
  - *Groundspeed*: Actual travel speed over the ground. DroneKit allows setting `vehicle.airspeed` or `vehicle.groundspeed`.
- **Altitude**:
  - *Relative*: Measured from the takeoff point (HOME). Most commonly used due to safety. (MAV_FRAME_GLOBAL_RELATIVE_ALT)
  - *Absolute (ASL)*: Relative to mean sea level. (MAV_FRAME_GLOBAL)
  - *Terrain Following*: Requires radar or a Digital Elevation Model (DEM) to maintain a constant distance from the ground below.

### 6. Hàng Rào Điện Tử (Geofence)

**Tiếng Việt:**
Geofence là ranh giới ảo được thiết lập nhằm ngăn drone bay ra khỏi một khu vực nhất định.
- *Inclusion Zone*: Vùng được phép bay. Nếu drone vượt ra khỏi đa giác này, hệ thống sẽ kích hoạt RTL hoặc Land.
- *Exclusion Zone*: Vùng cấm bay. Drone không thể xâm nhập vào vùng này.
Việc thiết lập Geofence là bắt buộc trong các cuộc thi UAV và để tuân thủ quy định hàng không.

**English:**
Geofence is a virtual boundary established to prevent the drone from flying out of a specified area.
- *Inclusion Zone*: The permitted flight area. If the drone breaches this polygon, the system triggers RTL or Land.
- *Exclusion Zone*: No-fly area. The drone cannot enter this region.
Setting up a Geofence is mandatory in UAV competitions and for complying with aviation regulations.

## Code Thực Hành / Practice Code

### Phần 1: Tạo Nhiệm Vụ Hình Vuông 4 Điểm (Square Mission)

```python
"""
Square Mission Execution with DroneKit-Python
Mã nguồn thực thi nhiệm vụ hình vuông với DroneKit-Python
"""
from dronekit import connect, VehicleMode, LocationGlobalRelative, Command
from pymavlink import mavutil
import time
import math

# ==========================================
# 1. Kết nối với phương tiện / Connect to vehicle
# ==========================================
connection_string = '127.0.0.1:14550' # SITL Address
print(f"Connecting to vehicle on: {connection_string}")
# Tiếng Việt: Đang kết nối tới SITL / English: Connecting to SITL
vehicle = connect(connection_string, wait_ready=True)

# ==========================================
# 2. Định nghĩa hàm tính toán Waypoint / Waypoint calculation function
# ==========================================
def get_location_metres(original_location, dNorth, dEast):
    """
    Tiếng Việt: Trả về một đối tượng LocationGlobalRelative mới cách điểm gốc một khoảng dNorth (Bắc) và dEast (Đông) tính bằng mét.
    English: Returns a LocationGlobalRelative object containing the latitude/longitude dNorth and dEast metres from the specified original_location.
    """
    earth_radius = 6378137.0 # Radius of "spherical" earth (m)
    
    # Coordinate offsets in radians
    # Chênh lệch tọa độ tính bằng radian
    dLat = dNorth/earth_radius
    dLon = dEast/(earth_radius*math.cos(math.pi*original_location.lat/180))

    # New position in decimal degrees
    # Vị trí mới tính bằng độ thập phân
    newlat = original_location.lat + (dLat * 180/math.pi)
    newlon = original_location.lon + (dLon * 180/math.pi)
    
    if type(original_location) is LocationGlobalRelative:
        targetlocation = LocationGlobalRelative(newlat, newlon, original_location.alt)
    else:
        raise Exception("Invalid Location object passed")
        
    return targetlocation

# ==========================================
# 3. Hàm cất cánh an toàn / Safe takeoff function
# ==========================================
def arm_and_takeoff(aTargetAltitude):
    """
    Tiếng Việt: Khởi động động cơ và cất cánh lên độ cao mục tiêu.
    English: Arms vehicle and flies to aTargetAltitude.
    """
    print("Basic pre-arm checks / Kiểm tra an toàn trước khi bay")
    while not vehicle.is_armable:
        print(" Waiting for vehicle to initialise... / Chờ hệ thống khởi tạo...")
        time.sleep(1)

    print("Arming motors / Khởi động động cơ")
    vehicle.mode = VehicleMode("GUIDED")
    vehicle.armed = True

    while not vehicle.armed:
        print(" Waiting for arming... / Chờ động cơ khởi động...")
        time.sleep(1)

    print(f"Taking off to {aTargetAltitude}m / Đang cất cánh lên {aTargetAltitude} mét")
    vehicle.simple_takeoff(aTargetAltitude)

    # Đợi cho đến khi đạt độ cao mong muốn / Wait until target altitude is reached
    while True:
        print(f" Altitude (Độ cao): {vehicle.location.global_relative_frame.alt}")
        # Stop checking if we are within 95% of target
        if vehicle.location.global_relative_frame.alt >= aTargetAltitude * 0.95:
            print("Reached target altitude / Đã đạt độ cao mục tiêu")
            break
        time.sleep(1)

# ==========================================
# 4. Xóa và Tải Nhiệm Vụ Mới / Clear and Load Mission
# ==========================================
def create_square_mission(size_meters, altitude):
    """
    Tiếng Việt: Tạo nhiệm vụ bay hình vuông từ vị trí hiện tại.
    English: Creates a square mission from current location.
    """
    cmds = vehicle.commands
    
    print("Clearing current mission / Xóa nhiệm vụ hiện tại")
    cmds.clear()
    
    # Get current location / Lấy vị trí hiện tại
    current_loc = vehicle.location.global_relative_frame
    
    print("Calculating waypoints / Tính toán các điểm đến")
    # Điểm 1: Cất cánh xong thì đi về phía Bắc (North)
    wp1 = get_location_metres(current_loc, size_meters, 0)
    # Điểm 2: Đi về phía Đông (East)
    wp2 = get_location_metres(wp1, 0, size_meters)
    # Điểm 3: Đi về phía Nam (South)
    wp3 = get_location_metres(wp2, -size_meters, 0)
    # Điểm 4: Đi về phía Tây (Về lại điểm ban đầu)
    wp4 = get_location_metres(wp3, 0, -size_meters)
    
    print("Adding commands / Thêm các lệnh MAVLink")
    # Command 0 (Dummy command needed for ArduPilot / Lệnh giả bắt buộc)
    cmds.add(Command( 0, 0, 0, mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT, 
                      mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, 0, altitude))
                      
    # Thêm 4 waypoint
    frame = mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT
    cmd = mavutil.mavlink.MAV_CMD_NAV_WAYPOINT
    cmds.add(Command(0, 0, 0, frame, cmd, 0, 0, 0, 0, 0, 0, wp1.lat, wp1.lon, altitude))
    cmds.add(Command(0, 0, 0, frame, cmd, 0, 0, 0, 0, 0, 0, wp2.lat, wp2.lon, altitude))
    cmds.add(Command(0, 0, 0, frame, cmd, 0, 0, 0, 0, 0, 0, wp3.lat, wp3.lon, altitude))
    cmds.add(Command(0, 0, 0, frame, cmd, 0, 0, 0, 0, 0, 0, wp4.lat, wp4.lon, altitude))
    
    # Lệnh trở về điểm xuất phát / RTL Command
    cmds.add(Command(0, 0, 0, frame, mavutil.mavlink.MAV_CMD_NAV_RETURN_TO_LAUNCH, 0, 0, 0, 0, 0, 0, 0, 0, 0))
    
    print("Uploading mission / Tải nhiệm vụ lên drone")
    cmds.upload()

# ==========================================
# 5. Thực Thi Kịch Bản / Execute Script
# ==========================================
# Cất cánh lên 10m / Takeoff to 10m
arm_and_takeoff(10)

# Chỉnh tốc độ / Set speed
print("Setting groundspeed to 3 m/s / Đặt tốc độ bay 3 m/s")
vehicle.groundspeed = 3

# Tạo nhiệm vụ hình vuông cạnh 20m / Create 20m square mission
create_square_mission(20, 10)

print("Starting mission (Auto Mode) / Bắt đầu bay tự động")
# Đặt chế độ AUTO để drone thực thi nhiệm vụ / Set AUTO mode to execute mission
vehicle.mode = VehicleMode("AUTO")

while True:
    nextwaypoint = vehicle.commands.next
    print(f"Distance to WP {nextwaypoint}: ... / Khoảng cách tới WP: ...")
    if nextwaypoint == 6: # Waypoint 6 is RTL command
        print("Mission completed. Returning to launch / Nhiệm vụ hoàn tất, đang quay về")
        break
    time.sleep(2)

# Đóng kết nối / Close connection
vehicle.close()
```

### Phần 2: Đọc Tọa Độ Từ File JSON (GeoJSON Integration)

```python
"""
Reading Waypoints from a JSON File / Đọc Waypoint từ file JSON
Tạo một file tên là 'waypoints.json' với cấu trúc:
[
  {"lat": 21.028511, "lon": 105.804817, "alt": 20},
  {"lat": 21.028611, "lon": 105.804917, "alt": 20}
]
"""
import json
from dronekit import Command
from pymavlink import mavutil

def load_mission_from_json(vehicle, json_filepath):
    # Tiếng Việt: Đọc file JSON và nạp nhiệm vụ
    # English: Read JSON file and load mission
    with open(json_filepath, 'r') as file:
        waypoints = json.load(file)
        
    cmds = vehicle.commands
    cmds.clear()
    
    frame = mavutil.mavlink.MAV_FRAME_GLOBAL_RELATIVE_ALT
    # Add fake home / Thêm Home giả
    cmds.add(Command(0, 0, 0, frame, mavutil.mavlink.MAV_CMD_NAV_TAKEOFF, 0, 0, 0, 0, 0, 0, 0, 0, 10))
    
    # Lặp qua danh sách JSON / Iterate JSON list
    for wp in waypoints:
        lat = wp['lat']
        lon = wp['lon']
        alt = wp['alt']
        print(f"Adding WP: Lat {lat}, Lon {lon}, Alt {alt}")
        cmds.add(Command(0, 0, 0, frame, mavutil.mavlink.MAV_CMD_NAV_WAYPOINT, 0, 0, 0, 0, 0, 0, lat, lon, alt))
        
    cmds.upload()
    print("Successfully uploaded JSON mission / Đã nạp thành công nhiệm vụ từ JSON")
```

## Bài Tập / Exercises

**Tiếng Việt:**
1. **Thay đổi Hình Học Đường Bay:** Chỉnh sửa script `create_square_mission` thành `create_triangle_mission` để bay theo hình tam giác đều cạnh 30m.
2. **Quản Lý Tốc Độ:** Trong quá trình bay hình vuông, hãy viết mã để cạnh thứ nhất bay với tốc độ 2m/s, cạnh thứ hai 5m/s. (Gợi ý: Dùng lệnh `MAV_CMD_DO_CHANGE_SPEED`).
3. **Mô phỏng Geofence:** Sử dụng Mission Planner, thiết lập một hàng rào hình tròn (Circular Fence) bán kính 50m quanh điểm cất cánh. Đưa drone ra khỏi vòng này trong SITL và quan sát phản ứng (RTL).
4. **Đọc Dữ Liệu Thực Tế:** Xuất file KML từ Google Earth Pro, chuyển đổi sang JSON, và nạp vào drone bằng script Python.

**English:**
1. **Change Flight Geometry:** Modify the `create_square_mission` script into `create_triangle_mission` to fly an equilateral triangle with 30m sides.
2. **Speed Management:** During the square mission, write code so the first edge is flown at 2m/s, and the second edge at 5m/s. (Hint: Use `MAV_CMD_DO_CHANGE_SPEED`).
3. **Geofence Simulation:** Using Mission Planner, set up a Circular Fence with a 50m radius around the launch point. Fly the drone outside this circle in SITL and observe the reaction (RTL).
4. **Real Data Ingestion:** Export a KML file from Google Earth Pro, convert it to JSON, and upload it to the drone using the Python script.

## Câu Hỏi Thảo Luận / Discussion Questions

1. **Tiếng Việt:** Tại sao chúng ta lại sử dụng `LocationGlobalRelative` thay vì `LocationGlobal` (Tuyệt đối) trong hầu hết các nhiệm vụ tự động?
   **English:** Why do we prefer `LocationGlobalRelative` over `LocationGlobal` (Absolute) for most autonomous missions?
   
2. **Tiếng Việt:** Lệnh `MAV_CMD_NAV_TAKEOFF` có thực sự cần thiết nếu chúng ta đã tự cất cánh bằng hàm `simple_takeoff()` không? Tại sao DroneKit lại yêu cầu "dummy command"?
   **English:** Is the `MAV_CMD_NAV_TAKEOFF` command strictly necessary if we manually take off using `simple_takeoff()`? Why does DroneKit require a dummy command?

3. **Tiếng Việt:** Làm thế nào drone xử lý tình huống mất tín hiệu GPS (GPS Glitch) giữa lúc đang thực hiện lệnh `NAV_WAYPOINT`?
   **English:** How does the drone handle a loss of GPS signal (GPS Glitch) while executing a `NAV_WAYPOINT` command?

4. **Tiếng Việt:** Khi thiết lập một nhiệm vụ "Survey Grid", việc đặt quá nhiều điểm WP gần nhau (ví dụ: cách nhau 1 mét) sẽ gây ra những vấn đề gì cho hệ thống điều khiển chuyến bay (Flight Controller)?
   **English:** When setting up a "Survey Grid" mission, what problems might arise for the Flight Controller if too many waypoints are placed very close to each other (e.g., 1 meter apart)?

5. **Tiếng Việt:** Sự khác nhau giữa lệnh `RTL` (Return To Launch) và `Smart RTL` là gì? Khi nào nên dùng Smart RTL?
   **English:** What is the difference between `RTL` (Return To Launch) and `Smart RTL`? When should you use Smart RTL?

## Bài Về Nhà / Homework

**Tiếng Việt:**
**Dự Án "Tuần Tra Cứu Hộ":**
Viết một script Python hoàn chỉnh:
1. Kết nối SITL. Cất cánh lên 15m.
2. Nạp file `patrol.json` chứa 6 tọa độ dọc theo một con sông (tự chọn trên Google Maps).
3. Tại mỗi waypoint, drone phải dừng lại (hover) trong 5 giây (sử dụng thuộc tính delay của `NAV_WAYPOINT`).
4. Trong quá trình bay qua điểm thứ 3, thay đổi độ cao của drone lên 25m.
5. Sau khi hoàn tất 6 điểm, drone bay vòng xoắn ốc (orbit) quay lại điểm HOME và hạ cánh nhẹ nhàng ở tốc độ 1 m/s.
Nộp lại file `.py` và video ghi màn hình quá trình chạy giả lập SITL.

**English:**
**"Rescue Patrol" Project:**
Write a complete Python script that:
1. Connects to SITL. Takes off to 15m.
2. Loads a `patrol.json` file containing 6 coordinates along a river (pick any on Google Maps).
3. At each waypoint, the drone must hover for 5 seconds (use the delay parameter of `NAV_WAYPOINT`).
4. While traversing to the 3rd waypoint, change the altitude to 25m.
5. After completing all 6 points, the drone performs an orbit return to HOME and lands gently at 1 m/s.
Submit the `.py` file and a screen recording video of the SITL simulation run.

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Yếu / Poor (0-4 pts) | Trung Bình / Fair (5-7 pts) | Tốt / Good (8-9 pts) | Xuất Sắc / Excellent (10 pts) |
|---|---|---|---|---|
| **Code Functionality (Chạy Code)** | Code lỗi cú pháp, không cất cánh được / Syntax errors, fails to take off. | Code chạy được nhưng không đúng hình dạng đường bay / Runs but wrong flight path geometry. | Bay đúng tọa độ, đáp ứng các yêu cầu cơ bản / Flies correct waypoints, meets basic requirements. | Code mượt mà, bay chính xác, có xử lý ngoại lệ (try-except) / Smooth execution, precise flight, handles exceptions. |
| **Logic & MAVLink** | Không sử dụng đúng lệnh MAVLink / Incorrect MAVLink commands. | Sử dụng được WP nhưng không biết cách chỉnh delay/speed / Uses WPs but misses delay/speed configs. | Tích hợp thành công Delay và Speed / Successfully integrates Delay and Speed commands. | Hiểu sâu sắc và tận dụng tốt các tham số phụ của MAVLink / Deep understanding and utilizes MAVLink sub-parameters. |
| **JSON Integration (Tích hợp File)** | Không đọc được file, hard-code / Cannot read file, hard-coded WPs. | Đọc được JSON nhưng định dạng lộn xộn / Reads JSON but messy formatting. | Tự động parse JSON trơn tru thành các đối tượng Command / Smoothly parses JSON into Command objects. | Hỗ trợ bắt lỗi nếu file JSON bị sai hoặc thiếu trường / Implements error handling for malformed/missing JSON fields. |
| **Báo Cáo & Video (Report & Video)** | Không nộp video, báo cáo sơ sài / No video, poor report. | Có video ngắn, chưa giải thích rõ quá trình bay / Short video, poor explanation of flight process. | Video rõ ràng màn hình console + bản đồ QGC / Clear video showing console + QGC map. | Trình bày video chuyên nghiệp, có voice-over hoặc chú thích rõ ràng / Professional video with voice-over or clear captions. |

---
**Tài Liệu Tham Khảo (References):**
- [DroneKit-Python Mission Planning Documentation](https://dronekit-python.readthedocs.io/en/latest/guide/auto_mode.html)
- [ArduPilot MAVLink Commands](https://ardupilot.org/dev/docs/copter-commands-in-guided-mode.html)
- [QGroundControl User Guide](https://docs.qgroundcontrol.com/master/en/)

---
## Phụ Lục & FAQ / Appendix & FAQ

**Câu hỏi 1 (Q1):** Làm thế nào để mô phỏng mất kết nối (Radio Failsafe) trong SITL?
*How to simulate a Radio Failsafe in SITL?*
**Trả lời (A1):**
- Trong Mission Planner, vào tab Data -> Hành động (Actions), chọn 'Failsafe' hoặc bạn có thể ngắt kết nối joystick.
- Trong mã Python, bạn không thể ngắt radio trực tiếp nhưng có thể thay đổi tham số `FS_THR_ENABLE` để kiểm tra cách hệ thống phản ứng.
*Answer: In Mission Planner, go to Data -> Actions, select 'Failsafe', or disconnect the joystick. In Python code, you can't disconnect radio directly but can change the `FS_THR_ENABLE` parameter to test system response.*

**Câu hỏi 2 (Q2):** Sự khác biệt giữa `simple_takeoff` và cất cánh bằng lệnh MAVLink waypoint là gì?
*What is the difference between `simple_takeoff` and taking off via MAVLink waypoint commands?*
**Trả lời (A2):**
- `simple_takeoff` là một lệnh trực tiếp yêu cầu drone cất cánh ngay lập tức ở chế độ GUIDED. Nó không phải là một phần của chuỗi nhiệm vụ.
- Cất cánh bằng MAVLink (`MAV_CMD_NAV_TAKEOFF`) được sử dụng trong chế độ AUTO, nằm trong kịch bản chuỗi nhiệm vụ đã lập trình. Nó yêu cầu drone phải hoàn thành lệnh cất cánh trước khi tiếp tục đến điểm Waypoint tiếp theo.
*Answer: `simple_takeoff` is a direct command that tells the drone to take off immediately in GUIDED mode. It is not part of a mission sequence. Taking off via MAVLink (`MAV_CMD_NAV_TAKEOFF`) is used in AUTO mode as part of a programmed mission script. It requires the drone to complete the takeoff command before proceeding to the next Waypoint.*

**Câu hỏi 3 (Q3):** Làm thế nào để hủy một nhiệm vụ đang bay?
*How to cancel an ongoing mission?*
**Trả lời (A3):**
- Đơn giản nhất là chuyển chế độ bay từ AUTO sang LOITER, GUIDED hoặc RTL bằng tay cầm hoặc trạm GCS (Mission Planner/QGC). Trong mã Python, sử dụng lệnh `vehicle.mode = VehicleMode("GUIDED")`.
*Answer: The simplest way is to change the flight mode from AUTO to LOITER, GUIDED, or RTL using the RC controller or GCS (Mission Planner/QGC). In Python code, use the command `vehicle.mode = VehicleMode("GUIDED")`.*

**Câu hỏi 4 (Q4):** DroneKit có thể xử lý việc né tránh vật cản tự động không?
*Can DroneKit handle automatic obstacle avoidance?*
**Trả lời (A4):**
- Bản thân DroneKit không tự xử lý né tránh vật cản. Nó phụ thuộc vào khả năng của Flight Controller (ví dụ ArduPilot có tính năng Object Avoidance). DroneKit chỉ dùng để gửi các điểm đến mới, nếu có cảm biến khoảng cách, dữ liệu phải được gửi qua MAVLink bằng tin nhắn `DISTANCE_SENSOR` hoặc `OBSTACLE_DISTANCE`.
*Answer: DroneKit itself does not handle obstacle avoidance. It relies on the capabilities of the Flight Controller (e.g., ArduPilot has Object Avoidance features). DroneKit is only used to send new setpoints; if proximity sensors exist, the data must be sent via MAVLink using `DISTANCE_SENSOR` or `OBSTACLE_DISTANCE` messages.*

**Câu hỏi 5 (Q5):** Định dạng GeoJSON có gì ưu việt hơn file CSV thông thường?
*Why is GeoJSON format superior to standard CSV files?*
**Trả lời (A5):**
- GeoJSON là chuẩn quốc tế, có thể mô tả các dạng không gian phức tạp (Point, LineString, Polygon) và dễ dàng hiển thị trên web (ví dụ: Google Maps, Mapbox) cũng như chứa các thuộc tính bổ sung cho mỗi điểm một cách lồng nhau.
*Answer: GeoJSON is an international standard that can describe complex spatial geometries (Point, LineString, Polygon), easily rendered on web mapping platforms (e.g., Google Maps, Mapbox), and natively supports nested metadata for each feature.*

**Câu hỏi 6 (Q6):** Làm sao để biết DroneKit đã tải xong hết nhiệm vụ?
*How to ensure DroneKit has fully uploaded a mission?*
**Trả lời (A6):**
- Sau khi gọi lệnh `cmds.upload()`, nên dùng thêm một đoạn chờ ngắn hoặc kiểm tra trạng thái lệnh. Khi gọi `cmds.download()` và `cmds.wait_ready()`, ta có thể chắc chắn nhiệm vụ mới đã được đồng bộ.
*Answer: After calling `cmds.upload()`, it's recommended to add a short sleep or check command status. By calling `cmds.download()` and `cmds.wait_ready()`, you can be certain the new mission is synchronized.*

**Ghi Chú Cuối Cùng / Final Notes:**
- Hãy luôn giữ an toàn bay là ưu tiên số một.
- Luôn kiểm tra pin và môi trường xung quanh trước khi cất cánh bằng chế độ tự động.
- Always make flight safety your number one priority.
- Always check the battery and surrounding environment before taking off in autonomous mode.
- Cập nhật firmware ArduPilot và thư viện DroneKit thường xuyên.
- Update ArduPilot firmware and DroneKit library regularly.

*End of Lesson 7 Document.*
*Tài liệu kết thúc tại đây.*
*Chúc các bạn học viên hoàn thành tốt bài tập tuần này!*
*Good luck to all students completing this week's assignments!*

