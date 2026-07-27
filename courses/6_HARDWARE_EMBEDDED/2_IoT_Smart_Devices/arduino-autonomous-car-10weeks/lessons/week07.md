# Tuần 7: Điều Hướng GPS & Bám Theo Waypoint / Week 7: GPS Navigation & Waypoint Following

## Mục Tiêu / Objectives

- **Tiếng Việt:**
  - Hiểu nguyên lý hoạt động của hệ thống định vị toàn cầu (GPS) và cách trích xuất dữ liệu từ module GPS bằng Python.
  - Nắm vững các khái niệm về hệ tọa độ địa lý (Vĩ độ, Kinh độ) và công thức Haversine để tính khoảng cách trên bề mặt hình cầu.
  - Cài đặt và sử dụng các thư viện Python (như `gpsd`, `gps3`, `pynmea2`) để đọc dữ liệu từ cảm biến GPS.
  - Tích hợp bộ điều khiển PID (Proportional-Integral-Derivative) để duy trì hướng đi chính xác về phía waypoint mục tiêu.
  - Xây dựng một class điều hướng waypoint bằng Python, kết hợp dữ liệu từ la bàn điện tử HMC5883L khi di chuyển ở tốc độ thấp.
  - Lập trình một cỗ máy trạng thái (state machine) đơn giản để thực hiện các nhiệm vụ di chuyển tuần tự qua nhiều waypoint.
  
- **English:**
  - Understand the operating principles of the Global Positioning System (GPS) and how to extract data using Python.
  - Master the concepts of geographic coordinate systems (Latitude, Longitude) and the Haversine formula for calculating distance on a sphere.
  - Install and use Python libraries (such as `gpsd`, `gps3`, `pynmea2`) to read data from a GPS sensor.
  - Integrate a PID (Proportional-Integral-Derivative) controller to maintain accurate heading towards target waypoints.
  - Build a waypoint navigation class in Python, integrating data from the HMC5883L electronic compass when moving at low speeds.
  - Program a simple state machine to execute sequential navigation missions through multiple waypoints.

## Công Cụ & Phần Mềm / Tools & Software

- **Phần Cứng / Hardware:**
  - Xe tự hành đã lắp ráp (từ các tuần trước) / Fully assembled autonomous car (from previous weeks).
  - Module GPS (ví dụ: Ublox NEO-6M, NEO-M8N) kết nối qua UART/USB. / GPS Module (e.g., Ublox NEO-6M, NEO-M8N) connected via UART/USB.
  - La bàn điện tử / Electronic Compass (HMC5883L) kết nối qua I2C. / I2C Electronic Compass.
  - Raspberry Pi 4 (hoặc tương đương) làm máy tính trung tâm. / Raspberry Pi 4 (or equivalent) as the main computer.
  
- **Phần Mềm / Software:**
  - Hệ điều hành Linux / Linux Operating System (Raspberry Pi OS / Ubuntu).
  - Python 3.
  - Daemon GPS: `gpsd`.
  - Thư viện Python / Python libraries: `gps3`, `pynmea2`, `pyserial`, `smbus2`, `math`, `json`.
  - Phần mềm mô phỏng (tuỳ chọn) / Simulation software (optional): SITL (Software In The Loop) with GPS simulator.

## Lý Thuyết / Theory

### 1. Tổng Quan về Hệ Thống Định Vị Toàn Cầu (GPS) / Overview of Global Positioning System (GPS)

**GPS (Global Positioning System)** là một hệ thống định vị dựa trên vệ tinh, cung cấp thông tin về vị trí và thời gian trong mọi điều kiện thời tiết. / **GPS** is a satellite-based navigation system that provides location and time information in all weather conditions.

- **Nguyên lý hoạt động / How it works:** GPS hoạt động dựa trên nguyên lý giao hội không gian (trilateration). Một máy thu GPS cần ít nhất 4 vệ tinh để xác định vị trí 3D (vĩ độ, kinh độ, độ cao) và thời gian chính xác. 
- **Độ chính xác / Accuracy:** Độ chính xác phụ thuộc vào số lượng vệ tinh có thể "nhìn thấy" (satellites in view) và hệ số HDOP (Horizontal Dilution of Precision). HDOP < 2.0 thường được coi là tốt để điều hướng.

### 2. Giao thức NMEA và Daemons / NMEA Protocol and Daemons

Module GPS thường xuất dữ liệu dưới dạng các chuỗi ký tự theo chuẩn NMEA 0183 (ví dụ: `$GPGGA`, `$GPRMC`). / GPS modules typically output data as character strings in the NMEA 0183 standard.

- **$GPGGA:** Cung cấp thông tin vĩ độ, kinh độ, độ cao và chất lượng tín hiệu. / Provides latitude, longitude, altitude, and signal quality.
- **$GPRMC:** Cung cấp thông tin vĩ độ, kinh độ, tốc độ trên mặt đất, và hướng di chuyển. / Provides latitude, longitude, speed over ground, and course over ground.

Để quản lý việc đọc dữ liệu này một cách ổn định trên Linux, chúng ta sử dụng `gpsd`, một daemon chạy ngầm. / To manage reading this data stably on Linux, we use `gpsd`, a background daemon.
- `gpsd` đọc dữ liệu từ cổng serial (ví dụ `/dev/ttyUSB0` hoặc `/dev/ttyS0`) và cung cấp qua cổng TCP 2947.

### 3. Hệ Tọa Độ Địa Lý và Công Thức Haversine / Geographic Coordinate System and Haversine Formula

Trái Đất có dạng gần giống hình cầu. Vị trí trên bề mặt được xác định bởi:
- **Vĩ độ (Latitude):** Góc từ xích đạo đến cực (từ -90° đến +90°).
- **Kinh độ (Longitude):** Góc từ kinh tuyến gốc (Greenwich) sang Đông hoặc Tây (từ -180° đến +180°).

Để tính khoảng cách tuyến tính giữa 2 điểm (vĩ độ, kinh độ) trên bề mặt Trái Đất, ta dùng công thức Haversine:
/ To calculate the great-circle distance between two points on a sphere given their longitudes and latitudes, we use the Haversine formula:

$$ a = \sin^2(\frac{\Delta \phi}{2}) + \cos \phi_1 \cdot \cos \phi_2 \cdot \sin^2(\frac{\Delta \lambda}{2}) $$
$$ c = 2 \cdot \text{atan2}(\sqrt{a}, \sqrt{1-a}) $$
$$ d = R \cdot c $$

Trong đó:
- $\phi$ là vĩ độ (radian).
- $\lambda$ là kinh độ (radian).
- $R$ là bán kính Trái Đất (trung bình 6371 km hoặc 6371000 mét).

### 4. Tính Toán Hướng Đi (Bearing) và Lỗi Hướng (Heading Error) / Calculating Bearing and Heading Error

Để xe tự hành biết cần xoay góc bao nhiêu để đi tới waypoint tiếp theo, ta cần tính **Bearing** (Góc phương vị) từ điểm hiện tại tới điểm đích.

$$ \theta = \text{atan2}(\sin \Delta\lambda \cdot \cos \phi_2, \cos \phi_1 \cdot \sin \phi_2 - \sin \phi_1 \cdot \cos \phi_2 \cdot \cos \Delta\lambda) $$

**Lỗi hướng (Heading Error):**
Lỗi hướng là độ chênh lệch giữa góc phương vị mục tiêu (Target Bearing) và hướng hiện tại của xe (Current Heading).
`Error = Target Bearing - Current Heading`
(Lưu ý: Cần chuẩn hóa lỗi này nằm trong khoảng [-180, 180] độ).

### 5. Kết hợp La Bàn và GPS (Sensor Fusion: Compass & GPS)

GPS cung cấp hướng di chuyển (Course over ground - COG) rất chính xác khi xe di chuyển nhanh. Tuy nhiên, khi xe đứng yên hoặc di chuyển rất chậm (< 0.5 m/s), COG từ GPS sẽ nhảy loạn xạ.
Vì vậy, ta cần kết hợp la bàn điện tử (HMC5883L):
- Tốc độ < 0.5 m/s: Dùng la bàn HMC5883L làm Current Heading.
- Tốc độ >= 0.5 m/s: Dùng Course từ GPS làm Current Heading (vì la bàn dễ bị nhiễu từ trường bởi động cơ).

### 6. Cỗ Máy Trạng Thái Điều Hướng (Navigation State Machine)

Quá trình di chuyển qua danh sách các waypoints được quản lý bằng State Machine:
- **IDLE:** Đợi lệnh bắt đầu. / Waiting for start command.
- **INIT_WAYPOINT:** Đọc waypoint tiếp theo, tính khoảng cách, góc. / Load next waypoint, compute distance and bearing.
- **STEERING:** Tính toán PID, điều khiển góc lái, di chuyển tới waypoint. / Calculate PID, steer, move towards waypoint.
- **CHECK_ARRIVAL:** Nếu khoảng cách tới đích < bán kính cho phép (ví dụ 1.5 mét) -> Đã đến (Arrived). / If distance < tolerance -> Arrived.
- **FINISH:** Đã đi hết tất cả các waypoint, dừng xe. / Completed all waypoints, stop car.

## Code Python / Python Code

Dưới đây là một hệ thống điều hướng toàn diện bằng Python, được cấu trúc thành các module rõ ràng. / Below is a comprehensive Python navigation system, structured into clear modules.

### 1. Công Cụ Toán Học GPS / GPS Math Utilities (gps_math.py)

```python
import math

class GPSMath:
    """
    Lớp chứa các hàm tĩnh (static methods) để tính toán liên quan đến tọa độ địa lý.
    / Class containing static methods for geographic coordinate calculations.
    """
    EARTH_RADIUS_METERS = 6371000.0 # Bán kính Trái Đất tính bằng mét

    @staticmethod
    def haversine_distance(lat1, lon1, lat2, lon2):
        """
        Tính khoảng cách bằng mét giữa 2 điểm GPS.
        / Calculates the distance in meters between 2 GPS points.
        """
        # Chuyển đổi từ độ sang radian / Convert degrees to radians
        lat1_rad = math.radians(lat1)
        lon1_rad = math.radians(lon1)
        lat2_rad = math.radians(lat2)
        lon2_rad = math.radians(lon2)

        # Tính độ lệch / Calculate differences
        delta_lat = lat2_rad - lat1_rad
        delta_lon = lon2_rad - lon1_rad

        # Công thức Haversine / Haversine formula
        a = math.sin(delta_lat / 2.0)**2 + \
            math.cos(lat1_rad) * math.cos(lat2_rad) * \
            math.sin(delta_lon / 2.0)**2
        
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
        distance = GPSMath.EARTH_RADIUS_METERS * c
        return distance

    @staticmethod
    def calculate_bearing(lat1, lon1, lat2, lon2):
        """
        Tính góc phương vị (bearing) từ điểm 1 tới điểm 2, tính bằng độ từ 0-360.
        / Calculates bearing from point 1 to point 2, in degrees from 0-360.
        """
        lat1_rad = math.radians(lat1)
        lon1_rad = math.radians(lon1)
        lat2_rad = math.radians(lat2)
        lon2_rad = math.radians(lon2)

        delta_lon = lon2_rad - lon1_rad

        x = math.sin(delta_lon) * math.cos(lat2_rad)
        y = math.cos(lat1_rad) * math.sin(lat2_rad) - \
            (math.sin(lat1_rad) * math.cos(lat2_rad) * math.cos(delta_lon))

        initial_bearing_rad = math.atan2(x, y)
        initial_bearing_deg = math.degrees(initial_bearing_rad)
        
        # Chuẩn hóa về [0, 360] / Normalize to [0, 360]
        bearing = (initial_bearing_deg + 360) % 360
        return bearing

    @staticmethod
    def normalize_angle(angle):
        """
        Chuẩn hóa góc về khoảng [-180, 180] độ. Rất quan trọng cho PID.
        / Normalize angle to [-180, 180] range. Crucial for PID.
        """
        angle = angle % 360
        if angle > 180:
            angle -= 360
        elif angle < -180:
            angle += 360
        return angle
```

### 2. Giao Tiếp Cảm Biến / Sensor Interface (sensors.py)

Đoạn code này sử dụng thư viện `gps3` để kết nối với `gpsd` và đọc thông tin từ la bàn.
/ This code uses `gps3` to connect to `gpsd` and reads compass info.

```python
from gps3 import gps3
import time
import math
import smbus2

class GPSSensor:
    def __init__(self):
        self.gps_socket = gps3.GPSDSocket()
        self.data_stream = gps3.DataStream()
        try:
            self.gps_socket.connect()
            self.gps_socket.watch()
            print("GPS connected to gpsd.")
        except Exception as e:
            print(f"Error connecting to GPSD: {e}")

        # State variables
        self.lat = 0.0
        self.lon = 0.0
        self.speed = 0.0
        self.track = 0.0 # Course over ground
        self.hdop = 99.9
        self.satellites = 0

    def update(self):
        """
        Đọc một gói dữ liệu mới từ gpsd (không block).
        / Read a new data packet from gpsd (non-blocking).
        """
        for new_data in self.gps_socket:
            if new_data:
                self.data_stream.unpack(new_data)
                
                # Cập nhật thông số nếu có giá trị / Update if value exists
                if self.data_stream.TPV['lat'] != 'n/a':
                    self.lat = float(self.data_stream.TPV['lat'])
                if self.data_stream.TPV['lon'] != 'n/a':
                    self.lon = float(self.data_stream.TPV['lon'])
                if self.data_stream.TPV['speed'] != 'n/a':
                    self.speed = float(self.data_stream.TPV['speed'])
                if self.data_stream.TPV['track'] != 'n/a':
                    self.track = float(self.data_stream.TPV['track'])
                
                # Chất lượng tín hiệu / Signal quality
                if hasattr(self.data_stream, 'SKY'):
                    if 'hdop' in self.data_stream.SKY and self.data_stream.SKY['hdop'] != 'n/a':
                        self.hdop = float(self.data_stream.SKY['hdop'])
                    if 'satellites' in self.data_stream.SKY and self.data_stream.SKY['satellites'] != 'n/a':
                        sat_list = self.data_stream.SKY['satellites']
                        if isinstance(sat_list, list):
                            self.satellites = len(sat_list)
                break # Just read one valid packet per update call

    def has_good_fix(self):
        """
        Chỉ cho phép chạy tự động khi tín hiệu GPS đủ tốt.
        / Only allow autonomous driving when GPS signal is good enough.
        """
        # Yêu cầu HDOP < 2.0 và ít nhất 6 vệ tinh
        # Require HDOP < 2.0 and at least 6 satellites
        return self.hdop < 2.0 and self.satellites >= 6

class CompassHMC5883L:
    def __init__(self, bus_num=1, address=0x1E):
        self.bus = smbus2.SMBus(bus_num)
        self.address = address
        self.declination = -1.2 # Độ lệch từ trường địa phương (tìm trên Google cho khu vực của bạn)
                                # Local magnetic declination (Google it for your area)
        try:
            # Khởi tạo la bàn / Initialize compass
            self.bus.write_byte_data(self.address, 0x00, 0x70) # Configuration Register A
            self.bus.write_byte_data(self.address, 0x01, 0xA0) # Configuration Register B
            self.bus.write_byte_data(self.address, 0x02, 0x00) # Mode Register (Continuous)
        except Exception as e:
            print(f"Compass init error: {e}")

    def read_word_2c(self, reg):
        high = self.bus.read_byte_data(self.address, reg)
        low = self.bus.read_byte_data(self.address, reg+1)
        val = (high << 8) + low
        if val >= 0x8000:
            return -((65535 - val) + 1)
        else:
            return val

    def get_heading(self):
        try:
            x = self.read_word_2c(0x03)
            y = self.read_word_2c(0x07) # Z is 0x05, Y is 0x07
            
            heading_rad = math.atan2(y, x)
            heading_rad += math.radians(self.declination)
            
            # Đảm bảo góc 0-2PI / Ensure 0-2PI
            if heading_rad < 0:
                heading_rad += 2 * math.pi
            elif heading_rad > 2 * math.pi:
                heading_rad -= 2 * math.pi
                
            return math.degrees(heading_rad)
        except Exception:
            return 0.0

```

### 3. Controller PID Lái (Steering PID Controller)

```python
import time

class PIDController:
    def __init__(self, kp, ki, kd, max_output):
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.max_output = max_output
        
        self.prev_error = 0.0
        self.integral = 0.0
        self.last_time = time.time()

    def compute(self, error):
        current_time = time.time()
        dt = current_time - self.last_time
        if dt <= 0.0:
            dt = 0.01

        # Proportional term
        p_term = self.kp * error

        # Integral term
        self.integral += error * dt
        # Chống tích lũy quá mức (Anti-windup)
        # Anti-windup
        i_term = self.ki * self.integral
        if i_term > self.max_output: i_term = self.max_output
        elif i_term < -self.max_output: i_term = -self.max_output

        # Derivative term
        d_term = self.kd * (error - self.prev_error) / dt

        output = p_term + i_term + d_term
        
        # Kẹp giá trị (Clamp output)
        if output > self.max_output: output = self.max_output
        elif output < -self.max_output: output = -self.max_output

        self.prev_error = error
        self.last_time = current_time

        return output
        
    def reset(self):
        self.integral = 0.0
        self.prev_error = 0.0
        self.last_time = time.time()
```

### 4. Quản Lý Waypoint Bằng JSON / Waypoint Manager via JSON (waypoint_manager.py)

Lưu file cấu hình waypoint dưới dạng JSON `mission.json`:
/ Save waypoint configuration file as JSON `mission.json`:
```json
{
    "mission_name": "School Yard Loop",
    "waypoints": [
        {"id": 1, "lat": 21.028511, "lon": 105.804817},
        {"id": 2, "lat": 21.028600, "lon": 105.805000},
        {"id": 3, "lat": 21.028700, "lon": 105.804900},
        {"id": 4, "lat": 21.028511, "lon": 105.804817}
    ]
}
```

Code quản lý:
```python
import json

class WaypointManager:
    def __init__(self, filename):
        self.waypoints = []
        self.current_wp_index = 0
        self.load_waypoints(filename)

    def load_waypoints(self, filename):
        """
        Đọc danh sách waypoint từ file JSON.
        / Read waypoint list from JSON file.
        """
        try:
            with open(filename, 'r') as f:
                data = json.load(f)
                self.waypoints = data.get("waypoints", [])
                print(f"Loaded {len(self.waypoints)} waypoints.")
        except Exception as e:
            print(f"Error loading waypoints: {e}")

    def get_current_waypoint(self):
        if self.current_wp_index < len(self.waypoints):
            return self.waypoints[self.current_wp_index]
        return None

    def next_waypoint(self):
        """Chuyển sang waypoint tiếp theo / Move to next waypoint."""
        self.current_wp_index += 1

    def is_finished(self):
        return self.current_wp_index >= len(self.waypoints)
```

### 5. Main Loop & State Machine (main.py)

Đây là chương trình chính kết hợp tất cả mọi thứ lại.
/ This is the main program combining everything together.

```python
import time
from gps_math import GPSMath
from sensors import GPSSensor, CompassHMC5883L
from waypoint_manager import WaypointManager
from pid_controller import PIDController

# Giả sử chúng ta có một module điều khiển động cơ từ tuần trước
# Assuming we have a motor control module from previous weeks
# from motor_driver import MotorController
class DummyMotorController:
    def set_steering(self, angle):
        pass # -45 to 45 degrees
    def set_throttle(self, speed):
        pass # 0 to 100%
    def stop(self):
        pass

def main():
    print("Starting Autonomous Navigation System...")
    
    gps = GPSSensor()
    compass = CompassHMC5883L()
    wp_manager = WaypointManager("mission.json")
    motors = DummyMotorController()
    
    # PID cho góc lái (Steering PID). Output max là 45 độ.
    # PID for steering. Max output is 45 degrees.
    steering_pid = PIDController(kp=1.5, ki=0.01, kd=0.5, max_output=45.0)
    
    ARRIVAL_TOLERANCE_METERS = 2.0
    BASE_SPEED = 30 # Tốc độ cơ bản 30% / Base speed 30%
    
    state = "INIT"
    
    try:
        while True:
            # Cập nhật sensor / Update sensors
            gps.update()
            
            # Máy trạng thái / State Machine
            if state == "INIT":
                if gps.has_good_fix():
                    print("GPS Fix Acquired! Ready to start.")
                    state = "NAVIGATE"
                else:
                    print(f"Waiting for GPS... HDOP:{gps.hdop} Sats:{gps.satellites}")
                    motors.stop()
                    time.sleep(1)
                    
            elif state == "NAVIGATE":
                if wp_manager.is_finished():
                    print("Mission Accomplished!")
                    state = "FINISH"
                    continue
                
                target_wp = wp_manager.get_current_waypoint()
                
                # 1. Tính toán khoảng cách và góc phương vị
                # 1. Calculate distance and bearing
                dist_to_wp = GPSMath.haversine_distance(gps.lat, gps.lon, 
                                                        target_wp['lat'], target_wp['lon'])
                target_bearing = GPSMath.calculate_bearing(gps.lat, gps.lon, 
                                                           target_wp['lat'], target_wp['lon'])
                
                # 2. Sensor Fusion cho Current Heading
                # Nếu đi chậm, dùng la bàn. Nếu đi nhanh, dùng COG của GPS
                # If slow, use compass. If fast, use GPS COG
                if gps.speed < 0.5:
                    current_heading = compass.get_heading()
                    heading_source = "Compass"
                else:
                    current_heading = gps.track
                    heading_source = "GPS_COG"
                
                # 3. Tính Lỗi và PID
                # 3. Calculate Error and PID
                heading_error = GPSMath.normalize_angle(target_bearing - current_heading)
                steering_cmd = steering_pid.compute(heading_error)
                
                # 4. Điều khiển xe
                # 4. Control the car
                motors.set_steering(steering_cmd)
                motors.set_throttle(BASE_SPEED)
                
                print(f"WP:{target_wp['id']} Dist:{dist_to_wp:.1f}m Err:{heading_error:.1f} deg "
                      f"Str:{steering_cmd:.1f} ({heading_source})")
                
                # 5. Kiểm tra đến đích
                # 5. Check arrival
                if dist_to_wp < ARRIVAL_TOLERANCE_METERS:
                    print(f"Reached Waypoint {target_wp['id']}!")
                    wp_manager.next_waypoint()
                    steering_pid.reset()
                    
            elif state == "FINISH":
                motors.stop()
                print("Vehicle Stopped.")
                break
                
            time.sleep(0.1) # Loop ở 10Hz / Loop at 10Hz
            
    except KeyboardInterrupt:
        print("Interrupted by User")
        motors.stop()

if __name__ == "__main__":
    main()
```

## Bài Tập / Exercises

1. **Hiệu chỉnh La bàn (Compass Calibration):**
   La bàn bị ảnh hưởng mạnh bởi kim loại trên xe (Hard Iron / Soft Iron interference). Viết một script để xoay xe 360 độ và ghi lại các giá trị min/max của trục X và Y từ `HMC5883L`. Từ đó áp dụng công thức bù trừ tĩnh điện (offset).
   / The compass is strongly affected by metal on the car. Write a script to rotate the car 360 degrees and record min/max values for X and Y axes. Apply offset compensation.

2. **Chống nhiễu GPS tạm thời (GPS Loss Fallback):**
   Nếu xe chạy dưới gầm cầu hoặc tán cây và mất GPS (`satellites < 4`), hãy sửa State Machine để xe giữ nguyên góc lái và tốc độ trong tối đa 3 giây. Nếu sau 3 giây không có lại GPS, xe phải tự động dừng khẩn cấp.
   / If the car loses GPS under trees (`satellites < 4`), modify the State Machine so it holds the last steering angle and speed for up to 3 seconds. If GPS doesn't recover, trigger an emergency stop.

3. **Điều khiển tốc độ động theo khoảng cách (Dynamic Speed Control):**
   Sửa đoạn code thay vì dùng `BASE_SPEED = 30` cố định, hãy dùng logic:
   - Nếu `dist_to_wp > 10m`: Tốc độ 50%.
   - Nếu `dist_to_wp <= 10m`: Tốc độ giảm dần tuyến tính từ 50% xuống 20%.
   / Instead of fixed `BASE_SPEED`, scale throttle down as the car approaches the waypoint.

## Câu Hỏi Thảo Luận / Discussion (5)

1. Tại sao không nên dùng dữ liệu Course (COG) của GPS khi xe đang đứng yên hoặc chuyển động quá chậm? Điều này ảnh hưởng thế nào đến việc khởi hành từ trạng thái dừng?
   / Why shouldn't we use GPS Course Over Ground (COG) when the vehicle is stationary or moving very slowly? How does this affect starting from a stopped position?
2. Giả sử waypoint tiếp theo bị lệch 170 độ về phía sau, chiếc xe nên lùi lại hay quay đầu một vòng cung? Code hiện tại xử lý tình huống này thế nào?
   / Suppose the next waypoint is 170 degrees behind the car. Should the car reverse or make a U-turn? How does the current code handle this?
3. `GPSMath.normalize_angle` là hàm cực kỳ quan trọng trong vòng lặp PID. Chuyện gì sẽ xảy ra nếu góc `target_bearing = 359` độ, và `current_heading = 1` độ, và chúng ta KHÔNG chuẩn hóa góc bằng hàm này?
   / What happens if target_bearing = 359 deg, current_heading = 1 deg, and we DO NOT normalize the angle error for PID?
4. Đâu là giới hạn của sai số GPS (ví dụ module NEO-6M có sai số 2-3 mét)? Làm sao để chiếc xe đi sát lề đường (chỉ rộng 1 mét) chỉ bằng GPS? (Gợi ý: Liệu có thể không?)
   / What is the limitation of standard GPS error? How can a car drive exactly on a 1-meter wide lane using ONLY GPS? (Hint: Is it even possible?)
5. Tại sao cần kiểm tra điều kiện HDOP < 2.0? Chỉ số HDOP (Horizontal Dilution of Precision) nói lên điều gì về cấu hình vệ tinh trên bầu trời?
   / Why do we check HDOP < 2.0? What does HDOP tell us about the satellite constellation geometry?

## Bài Về Nhà / Homework

- **Nhiệm vụ Thực Hành (Practical Mission):**
  1. Mang xe ra sân trường hoặc bãi đất trống, rộng (tránh xa tòa nhà cao tầng để GPS bắt sóng tốt).
  2. Viết một đoạn code nhỏ để in ra màn hình vị trí GPS hiện tại (Lat/Lon) mỗi khi bạn nhấn nút trên bàn phím.
  3. Cầm xe đi bộ dọc theo một đường hình vuông có cạnh dài khoảng 10 mét. Tại mỗi góc hình vuông, nhấn nút để lưu tọa độ.
  4. Lấy 4 tọa độ này, điền vào file `mission.json`.
  5. Đặt xe ở điểm xuất phát, chạy chương trình `main.py` để xe tự động chạy theo đường vuông vừa vạch ra.
  6. **Ghi hình quá trình (Video Record):** Quay lại video xe tự chạy. Quan sát hành vi ở các góc cua. Xe bám sát hay rẽ góc rộng? Hãy thử tinh chỉnh tham số P và D trong PID để xe rẽ sắc nét hơn.
  
- **Practical Mission English:**
  1. Take the car to an open field (away from tall buildings).
  2. Write a script to log current GPS lat/lon upon keypress.
  3. Walk the car in a 10x10 meter square. At each corner, log the waypoint.
  4. Create `mission.json` with these 4 points.
  5. Place car at start, run `main.py` and watch it navigate the square.
  6. Record a video. Tune PID parameters for sharper cornering.

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Đạt / Pass (3 Điểm) | Khá / Good (4 Điểm) | Xuất Sắc / Excellent (5 Điểm) |
| --- | --- | --- | --- |
| **Code Completion** | Chạy được chương trình đọc GPS & La bàn. | Hoàn thiện State Machine, hiểu rõ luồng code. | Thêm được module giảm tốc khi tới gần waypoint. |
| **Field Testing** | Xe chạy được qua ít nhất 2 waypoints. | Xe hoàn thành toàn bộ hình vuông (4 waypoints). | Xe di chuyển cực kỳ trơn tru, không đi zigzag, PID chỉnh chuẩn. |
| **Understanding** | Trả lời được 3/5 câu hỏi thảo luận. | Trả lời được 5/5 câu hỏi thảo luận đầy đủ. | Giải thích sâu về Sensor Fusion và hạn chế của GPS dân sự. |
| **Homework Video** | Có nộp video xe chạy ngoài trời. | Video rõ nét, hiển thị terminal log cùng lúc. | Video có phân tích lỗi (nếu xe chạy chệch quỹ đạo) và cách sửa. |
