# Tuần 6: Lập Trình Drone với MAVLink & DroneKit / Week 6: Drone Programming with MAVLink & DroneKit

## Mục Tiêu / Learning Objectives

### [Vietnamese]
- Hiểu được giao thức MAVLink là gì và cách nó hoạt động trong hệ thống drone.
- Phân tích cấu trúc bản tin MAVLink, tầm quan trọng của heartbeat (nhịp tim) và system ID.
- Cài đặt và sử dụng phần mềm MAVProxy để kết nối với drone qua cổng USB hoặc thiết bị Telemetry.
- Cài đặt và cấu hình môi trường lập trình với thư viện DroneKit-Python.
- Hiểu cách thức hoạt động của đối tượng `Vehicle` (phương tiện) và các thuộc tính của nó như vị trí (location), góc nghiêng (attitude), và trạng thái pin (battery).
- Viết mã Python để đọc dữ liệu từ xa (telemetry) liên tục: độ cao (altitude), hướng (heading), tốc độ mặt đất (groundspeed), tốc độ không khí (airspeed).
- Gửi lệnh điều khiển trực tiếp đến drone: chuyển đổi chế độ bay (vehicle.mode), khởi động động cơ (vehicle.armed).
- Chạy hệ thống mô phỏng SITL (Software In The Loop) của ArduPilot để thử nghiệm an toàn mà không cần drone thật.
- Nắm vững cách xử lý lỗi (Error handling) khi mất kết nối, lỗi không thể arm động cơ, và giới hạn không gian bay (geofence).

### [English]
- Understand the MAVLink protocol and its role in drone communication systems.
- Analyze MAVLink message structures, the importance of heartbeat messages, and system IDs.
- Install and use MAVProxy to connect to a drone via USB or Telemetry radios.
- Install and configure the development environment using the DroneKit-Python library.
- Understand the `Vehicle` object and its key attributes such as location, attitude, and battery status.
- Write Python scripts to constantly read telemetry data: altitude, heading, groundspeed, and airspeed.
- Send direct control commands to the drone: changing flight modes (`vehicle.mode`) and arming motors (`vehicle.armed`).
- Run the ArduPilot SITL (Software In The Loop) simulation for safe testing without requiring physical hardware.
- Master error handling for disconnections, arming failures, and geofence breaches.

---

## Công Cụ & Phần Mềm / Tools & Software

| Công Cụ / Tool | Mô Tả / Description | Hướng Dẫn Cài Đặt / Installation Guide |
| --- | --- | --- |
| **Python 3.x** | Ngôn ngữ lập trình chính cho khóa học này. / The main programming language for this course. | Tải từ `python.org`. Đảm bảo thêm Python vào PATH. / Download from `python.org`. Ensure Python is added to PATH. |
| **MAVProxy** | Trạm mặt đất giao diện dòng lệnh dựa trên MAVLink. / A MAVLink-based command-line ground station. | Chạy lệnh trong terminal: `pip install MAVProxy` |
| **DroneKit-Python** | Thư viện API Python để điều khiển drone. / Python API library for drone control. | Chạy lệnh trong terminal: `pip install dronekit dronekit-sitl` |
| **ArduPilot SITL** | Trình mô phỏng phần mềm hệ thống bay. / Software In The Loop simulator for flight controllers. | Đi kèm khi cài đặt `dronekit-sitl` hoặc cài từ mã nguồn ArduPilot. / Included with `dronekit-sitl` or compiled from ArduPilot source. |
| **QGroundControl / Mission Planner** | Phần mềm điều khiển mặt đất dạng đồ họa (tùy chọn). / GUI Ground Control Station software (optional). | Tải file cài đặt từ trang chủ của dự án tương ứng. / Download installer from the respective project website. |

---

## Lý Thuyết / Theory

### 1. Giao Thức MAVLink Là Gì? / What is MAVLink Protocol?

**[Vietnamese]**
MAVLink (Micro Air Vehicle Link) là một giao thức truyền thông siêu nhẹ, được thiết kế đặc biệt cho các phương tiện không người lái (drone, xe tự hành, tàu ngầm tự hành). Nó đóng vai trò là "ngôn ngữ" chung giữa drone (Flight Controller) và trạm điều khiển mặt đất (Ground Control Station - GCS).
- **Cấu trúc bản tin (Message Structure):** Mỗi bản tin MAVLink có một header chứa thông tin về độ dài, sequence number, System ID (ID của drone), Component ID (ID của thành phần trên drone, ví dụ: camera hoặc autopilot), và Message ID. Tiếp theo là phần dữ liệu (payload) và cuối cùng là checksum để kiểm tra lỗi.
- **Heartbeat:** Đây là bản tin quan trọng nhất. Mỗi hệ thống MAVLink phải gửi bản tin heartbeat định kỳ (thường là 1Hz). Nếu GCS không nhận được heartbeat trong một khoảng thời gian, nó sẽ báo lỗi mất kết nối (Link Lost).
- **System ID:** Để điều khiển nhiều drone cùng lúc (swarm), mỗi drone phải có một System ID duy nhất (từ 1 đến 255).

**[English]**
MAVLink (Micro Air Vehicle Link) is a very lightweight messaging protocol designed specifically for unmanned vehicles (drones, rovers, subs). It acts as the common "language" between the vehicle's Flight Controller and the Ground Control Station (GCS).
- **Message Structure:** Every MAVLink message contains a header with packet length, sequence number, System ID (the drone's ID), Component ID (the component on the drone, e.g., camera or autopilot), and a Message ID. This is followed by the payload data and a checksum for error detection.
- **Heartbeat:** This is the most critical message. Every MAVLink system must broadcast a heartbeat message periodically (usually at 1Hz). If the GCS stops receiving heartbeats, it triggers a "Link Lost" error.
- **System ID:** To control multiple drones simultaneously (swarm behavior), each drone must be assigned a unique System ID (ranging from 1 to 255).

> ⚠️ **CẢNH BÁO AN TOÀN / SAFETY WARNING:**
> Luôn luôn tháo cánh quạt (propellers) ra khỏi động cơ khi lập trình hoặc thử nghiệm code với drone thật trên bàn làm việc để tránh tai nạn nghiêm trọng! / Always remove the propellers from the motors when programming or testing code with a real drone on your desk to prevent severe accidents!

### 2. MAVProxy & Kết Nối / MAVProxy & Connection

**[Vietnamese]**
MAVProxy là một trạm GCS dựa trên dòng lệnh (Command Line Interface), rất mạnh mẽ trong việc định tuyến (routing) các luồng dữ liệu MAVLink. Bạn có thể dùng MAVProxy để nhận dữ liệu từ drone qua cổng USB hoặc thiết bị Telemetry, sau đó phát lại (forward) luồng dữ liệu này qua cổng mạng (UDP/TCP) cho nhiều ứng dụng khác nhau đọc cùng lúc (ví dụ: vừa mở Mission Planner, vừa chạy code Python DroneKit).

**[English]**
MAVProxy is a powerful Command Line Interface (CLI) based GCS, primarily used for routing MAVLink data streams. You can use MAVProxy to receive data from the drone via a USB port or Telemetry radio, and then forward that data stream over network ports (UDP/TCP) to multiple applications simultaneously (e.g., running Mission Planner and a Python DroneKit script at the same time).

### 3. Đối Tượng Vehicle Trong DroneKit / The Vehicle Object in DroneKit

**[Vietnamese]**
Khi sử dụng DroneKit, sau khi kết nối thành công, bạn sẽ nhận được một đối tượng (object) gọi là `Vehicle`. Đối tượng này là đại diện của chiếc drone trong đoạn code Python của bạn.
- **vehicle.location:** Chứa thông tin GPS. `vehicle.location.global_relative_frame` cho biết tọa độ vĩ độ/kinh độ và độ cao (altitude) so với điểm cất cánh (Home).
- **vehicle.attitude:** Cho biết góc nghiêng của drone: pitch (chúc mũi/ngóc mũi), roll (nghiêng trái/phải), và yaw (xoay quanh trục Z).
- **vehicle.battery:** Đọc trạng thái pin, bao gồm điện áp (voltage), dòng điện (current), và phần trăm pin còn lại (level).
- **vehicle.mode:** Chế độ bay hiện tại (ví dụ: STABILIZE, GUIDED, AUTO, RTL). Trong lập trình tự động, chúng ta chủ yếu dùng chế độ `GUIDED`.
- **vehicle.armed:** Trạng thái an toàn của động cơ (Boolean). `True` nghĩa là động cơ đã sẵn sàng quay (Armed), `False` là động cơ bị khóa (Disarmed).

**[English]**
When using DroneKit, upon successful connection, you receive a `Vehicle` object. This object serves as the representation of the physical drone within your Python code.
- **vehicle.location:** Contains GPS data. `vehicle.location.global_relative_frame` provides the latitude/longitude coordinates and the altitude relative to the takeoff location (Home location).
- **vehicle.attitude:** Provides the drone's orientation: pitch (nose up/down), roll (tilt left/right), and yaw (rotation around the Z axis).
- **vehicle.battery:** Reads the battery status, including voltage, current drawn, and remaining percentage level.
- **vehicle.mode:** The current flight mode (e.g., STABILIZE, GUIDED, AUTO, RTL). For automated programming, we predominantly use `GUIDED` mode.
- **vehicle.armed:** The safety state of the motors (Boolean). `True` means motors are live and ready to spin (Armed), `False` means motors are locked (Disarmed).

### 4. Xử Lý Lỗi / Error Handling & Troubleshooting

| Hiện Tượng Lỗi / Error Symptom | Nguyên Nhân Khả Dĩ / Possible Cause | Cách Khắc Phục / Solution |
| --- | --- | --- |
| Lỗi Timeout khi kết nối / Timeout error on connect | Sai cổng COM hoặc baudrate. / Wrong COM port or baudrate. | Kiểm tra Device Manager, thử baudrate `57600` (telemetry) hoặc `115200` (USB). / Check Device Manager, try baudrate `57600` or `115200`. |
| Drone từ chối Arm (Arming denied) | Chưa có tín hiệu GPS 3D Fix, hoặc lỗi Pre-arm check. / No GPS 3D Fix, or Pre-arm check failure. | Đợi đèn GPS xanh, kiểm tra tin nhắn lỗi trên GCS (La bàn chưa calibrate, v.v.). / Wait for green GPS light, check GCS error messages. |
| Xe cất cánh lên một chút rồi rớt / Takes off slightly then drops | Vi phạm Geofence hoặc pin quá yếu. / Geofence breach or critical battery. | Tắt Geofence trong lúc test SITL hoặc kiểm tra pin. / Disable Geofence during SITL test or check battery. |
| DroneKit báo "AttributeError: 'Vehicle' object has no attribute '...'" | Phiên bản DroneKit lỗi thời so với ArduPilot. / DroneKit version mismatch with ArduPilot. | Cập nhật DroneKit hoặc khởi động lại kết nối. / Update DroneKit or restart the connection. |

---

## Code Thực Hành / Practice Code

Dưới đây là một kịch bản lập trình tự động hoàn chỉnh: Kết nối, Arm động cơ, Cất cánh đến độ cao mục tiêu, Lơ lửng, và Hạ cánh. Mã sử dụng DroneKit.
*Below is a complete automated programming script: Connect, Arm motors, Takeoff to a target altitude, Hover, and Land. The code uses DroneKit.*

> **Chuẩn bị trước khi chạy mã / Preparation before running code:**
> Cài đặt các gói cần thiết bằng lệnh terminal:
> `pip install dronekit dronekit-sitl`

```python
# week06_takeoff_land.py
# Khóa học DIY Drone Building - Tuần 6
# DIY Drone Building Course - Week 6

# Import các thư viện cần thiết từ DroneKit
# Import necessary modules from DroneKit
from dronekit import connect, VehicleMode, LocationGlobalRelative
import time

def connect_drone(connection_string):
    """
    Hàm kết nối với drone thông qua chuỗi kết nối.
    Function to connect to the drone via connection string.
    """
    print(f"[INFO] Đang kết nối tới drone: {connection_string} / Connecting to drone: {connection_string}")
    
    # Kết nối với xe, wait_ready=True đảm bảo tất cả tham số đã được tải về.
    # Connect to the vehicle, wait_ready=True ensures all parameters are downloaded.
    try:
        vehicle = connect(connection_string, wait_ready=True)
        print("[SUCCESS] Đã kết nối thành công! / Connection successful!")
        return vehicle
    except Exception as e:
        print(f"[ERROR] Lỗi kết nối / Connection error: {e}")
        return None

def arm_and_takeoff(vehicle, target_altitude):
    """
    Hàm chuẩn bị động cơ (Arm) và tự động cất cánh (Takeoff) tới độ cao chỉ định.
    Function to arm the motors and automatically takeoff to the specified altitude.
    """
    print("[INFO] Bắt đầu quá trình Arm động cơ... / Starting pre-arm checks...")

    # Chờ cho đến khi hệ thống tự động lái sẵn sàng (qua được pre-arm checks)
    # Wait until the autopilot is ready (passes pre-arm checks)
    while not vehicle.is_armable:
        print(" Đang chờ drone sẵn sàng (Pre-arm checks)... / Waiting for vehicle to initialise...")
        time.sleep(1)

    print("[INFO] Chuyển sang chế độ GUIDED / Switching to GUIDED mode")
    # Đặt chế độ bay sang GUIDED để cho phép điều khiển bằng mã
    # Set flight mode to GUIDED to allow code control
    vehicle.mode = VehicleMode("GUIDED")

    print("[INFO] Kích hoạt động cơ (Arming motors)...")
    # Gửi lệnh arm động cơ
    # Send command to arm motors
    vehicle.armed = True

    # Vòng lặp chờ xác nhận động cơ đã được arm thành công
    # Loop to wait for confirmation that motors are successfully armed
    while not vehicle.armed:
        print(" Đang chờ xác nhận Arm... / Waiting for arming confirmation...")
        time.sleep(1)
        
    print(f"[INFO] Cất cánh lên độ cao / Taking off to {target_altitude}m")
    
    # Lệnh cất cánh đơn giản của DroneKit
    # DroneKit's simple takeoff command
    vehicle.simple_takeoff(target_altitude)

    # Vòng lặp giám sát độ cao. Chờ cho đến khi đạt 95% độ cao mục tiêu.
    # Altitude monitoring loop. Wait until 95% of target altitude is reached.
    while True:
        # Đọc độ cao hiện tại so với điểm cất cánh
        # Read current altitude relative to home location
        current_altitude = vehicle.location.global_relative_frame.alt
        print(f" Độ cao hiện tại / Current altitude: {current_altitude:.1f}m")
        
        # Nếu đã đạt tối thiểu 95% độ cao mục tiêu, thoát vòng lặp
        # Break loop if we reach at least 95% of target altitude
        if current_altitude >= target_altitude * 0.95:
            print("[SUCCESS] Đã đạt độ cao mục tiêu! / Reached target altitude!")
            break
        time.sleep(1)

# Chương trình chính / Main execution
if __name__ == "__main__":
    # Thay đổi chuỗi này tùy theo môi trường. 
    # Dùng '127.0.0.1:14550' cho SITL hoặc GCS. Dùng '/dev/ttyUSB0' hoặc 'COM3' cho Telemetry.
    # Change this string based on your environment.
    # Use '127.0.0.1:14550' for SITL or GCS forwarding. Use '/dev/ttyUSB0' or 'COM3' for Telemetry hardware.
    connection_string = '127.0.0.1:14550'
    
    # Gọi hàm kết nối / Call connect function
    my_drone = connect_drone(connection_string)
    
    if my_drone:
        # In ra một số thông tin Telemetry cơ bản
        # Print some basic Telemetry data
        print("\n--- Thông số Telemetry / Telemetry Data ---")
        print(f" GPS: {my_drone.gps_0}")
        print(f" Battery: {my_drone.battery}")
        print(f" Last Heartbeat: {my_drone.last_heartbeat}")
        print(f" Is Armable?: {my_drone.is_armable}")
        print(f" System status: {my_drone.system_status.state}")
        print(f" Mode: {my_drone.mode.name}")
        print("-------------------------------------------\n")

        # Cất cánh lên 10 mét / Take off to 10 meters
        target_alt = 10.0
        arm_and_takeoff(my_drone, target_alt)

        # Cho drone lơ lửng trong 10 giây
        # Hover for 10 seconds
        print("[INFO] Đang lơ lửng... / Hovering for 10 seconds...")
        time.sleep(10)

        # Ra lệnh quay về điểm xuất phát và hạ cánh
        # Command to Return To Launch and land
        print("[INFO] Lệnh Return To Launch (RTL)... / Issuing Return To Launch command...")
        my_drone.mode = VehicleMode("RTL")

        # Đóng kết nối để giải phóng tài nguyên
        # Close connection to free resources
        print("[INFO] Đóng kết nối xe / Closing vehicle connection")
        my_drone.close()
    else:
        print("[ERROR] Không thể chạy kịch bản do lỗi kết nối. / Cannot run script due to connection error.")
```

---

## Bài Tập / Exercises

1. **[Vietnamese]** Mở rộng đoạn mã trên: Sau khi cất cánh lên 10m, hãy viết một vòng lặp `while` kéo dài 15 giây để liên tục in ra góc nghiêng (Pitch, Roll, Yaw) của drone cứ mỗi 1 giây.
   **[English]** Extend the code above: After taking off to 10m, write a 15-second `while` loop that continuously prints the drone's attitude (Pitch, Roll, Yaw) every 1 second.
2. **[Vietnamese]** Chạy giả lập SITL bằng lệnh `dronekit-sitl copter`. Mở một terminal khác, kết nối mã Python của bạn vào IP `tcp:127.0.0.1:5760`. Kiểm tra xem drone có cất cánh trong môi trường giả lập được không.
   **[English]** Run the SITL simulator using the command `dronekit-sitl copter`. Open another terminal, connect your Python code to `tcp:127.0.0.1:5760`. Verify if the drone can take off in the simulated environment.

---

## Câu Hỏi Thảo Luận / Discussion Questions

1. Tại sao `MAVLink` lại được coi là giao thức chuẩn trong hệ sinh thái ArduPilot và PX4 thay vì sử dụng JSON qua HTTP? / Why is `MAVLink` considered the standard protocol in the ArduPilot and PX4 ecosystems instead of using JSON over HTTP?
2. Sự khác biệt giữa cổng kết nối bằng UDP và TCP trong việc định tuyến (routing) MAVLink là gì? Tại sao người ta thường dùng UDP hơn khi điều khiển drone ngoài trời? / What is the difference between UDP and TCP ports in MAVLink routing? Why is UDP preferred when controlling drones outdoors?
3. Bản tin `Heartbeat` có chức năng gì? Điều gì sẽ xảy ra với chuyến bay tự động nếu phần mềm của bạn dừng gửi heartbeat? / What is the function of the `Heartbeat` message? What happens to the autonomous flight if your software stops sending heartbeats?
4. Trong hàm `arm_and_takeoff`, tại sao chúng ta bắt buộc phải chuyển drone sang chế độ `GUIDED` trước khi ra lệnh `vehicle.armed = True`? / In the `arm_and_takeoff` function, why must we switch the drone to `GUIDED` mode before issuing the `vehicle.armed = True` command?
5. Rủi ro gì có thể xảy ra nếu vòng lặp kiểm tra độ cao (`while current_altitude < target_altitude`) không có lệnh `time.sleep()`? / What are the potential risks if the altitude checking loop (`while current_altitude < target_altitude`) omits the `time.sleep()` command?

---

## Bài Về Nhà / Homework

**[Vietnamese]** 
Nhiệm vụ của bạn trong tuần này là thiết kế một hệ thống giám sát pin đơn giản. Viết một script Python riêng biệt chỉ để kết nối với giả lập SITL. Cứ mỗi 2 giây, script sẽ đọc thông số `vehicle.battery.level` và `vehicle.battery.voltage`. Nếu `battery.level` giảm xuống dưới 30%, script sẽ phát ra một cảnh báo trên màn hình console liên tục cho đến khi người dùng can thiệp và kích hoạt lệnh RTL.

**[English]** 
Your task for this week is to design a simple battery monitoring system. Write a separate Python script that connects to the SITL simulator. Every 2 seconds, the script must read the `vehicle.battery.level` and `vehicle.battery.voltage` parameters. If `battery.level` drops below 30%, the script should output a warning on the console continuously until the user intervenes and triggers an RTL command.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (9-10đ) | Khá / Good (7-8đ) | Cần Cố Gắng / Needs Work (<7đ) |
| --- | --- | --- | --- |
| **Hiểu biết MAVLink / MAVLink Understanding** | Giải thích sâu sắc về Message ID, System ID, cơ chế bảo mật (MAVLink2). / Deep explanation of Message ID, System ID, security mechanisms (MAVLink2). | Nắm được định nghĩa cơ bản và chức năng của Heartbeat. / Understands basic definitions and Heartbeat function. | Không hiểu rõ cách dữ liệu di chuyển từ FC xuống GCS. / Unclear on how data moves from FC to GCS. |
| **Sử dụng MAVProxy / MAVProxy Usage** | Thành thạo định tuyến dữ liệu ra nhiều cổng TCP/UDP, lưu log chuyến bay. / Proficient in routing data to multiple TCP/UDP ports, logging flights. | Biết cách chạy MAVProxy để xem thông số cơ bản. / Knows how to run MAVProxy to view basic stats. | Không cài đặt hoặc không kết nối được MAVProxy. / Failed to install or connect MAVProxy. |
| **Lập trình DroneKit / DroneKit Programming** | Code sạch, xử lý Exception tốt, đọc telemetry trơn tru, không bị kẹp vòng lặp vô hạn. / Clean code, good Exception handling, smooth telemetry reads, no infinite loops. | Code chạy được hàm cất cánh và hạ cánh nhưng thiếu kiểm tra an toàn. / Code can run takeoff/land functions but lacks safety checks. | Code không chạy được do syntax error hoặc logic sai (arm không thành công). / Code fails to run due to syntax or faulty logic (arming fails). |
| **SITL Simulation / SITL Simulation** | Setup thành công môi trường giả lập, tích hợp với Mission Planner và chạy thử nghiệm đầy đủ. / Successfully set up sim environment, integrated with Mission Planner, full testing. | Chạy được SITL thông qua cửa sổ console đơn giản. / Ran SITL via a basic console window. | Không cấu hình được SITL, báo lỗi phiên bản Python hoặc thiếu thư viện. / Failed SITL config, Python version errors or missing libraries. |

---

## Quy Trình An Toàn: SITL vs Drone Thực Tế / Safety Procedures: SITL vs Real World

**[Vietnamese]**
Việc chuyển từ môi trường mô phỏng (SITL) sang drone thực tế đòi hỏi một quy trình an toàn nghiêm ngặt.
- **SITL (Mô phỏng):** Bạn có thể thoải mái thử nghiệm code, đâm vào chướng ngại vật ảo, hoặc bay ra khỏi vùng an toàn. Tuy nhiên, nó không thể mô phỏng hoàn hảo nhiễu sóng từ trường, gió mạnh, hoặc độ trễ mạng thực tế.
- **Thực tế (Real World):** 
  - **KHÔNG LẮP CÁNH QUẠT** trong lần đầu tiên chạy code trên drone thật.
  - Luôn cài đặt thông số GeoFence (hàng rào điện tử) để drone tự động quay về nếu bay quá xa.
  - Có sẵn tay điều khiển RC (Radio Controller) để chiếm quyền điều khiển thủ công bất cứ lúc nào (chuyển sang mode LOITER hoặc STABILIZE).
  - Đảm bảo pin được sạc đầy và khu vực bay thoáng đãng, xa khu dân cư.

**[English]**
Transitioning from simulation (SITL) to a physical drone requires strict safety procedures.
- **SITL (Simulation):** You can freely test code, crash into virtual obstacles, or fly out of bounds. However, it cannot perfectly simulate magnetic interference, strong winds, or real-world network latency.
- **Real World:**
  - **DO NOT ATTACH PROPELLERS** during the first time you run your code on the real hardware.
  - Always set up a GeoFence so the drone automatically returns if it flies too far.
  - Have an RC (Radio Controller) ready to take manual control at any time (switch to LOITER or STABILIZE mode).
  - Ensure the battery is fully charged and the flight area is open and away from populated areas.

---

## Các Ví Dụ Code Bổ Sung / Additional Code Examples

### 1. Đọc và Cài Đặt Tham Số (Parameters) / Reading and Setting Parameters

**[Vietnamese]** 
Hệ thống ArduPilot có hàng trăm tham số để cấu hình drone. Bằng DroneKit, bạn có thể dễ dàng đọc và thay đổi chúng. Dưới đây là cách đọc tốc độ bay tối đa (`WPNAV_SPEED`).
**[English]** 
The ArduPilot system has hundreds of parameters to configure the drone. With DroneKit, you can easily read and change them. Here is how to read the maximum waypoint navigation speed (`WPNAV_SPEED`).

```python
# Đọc tham số WPNAV_SPEED / Read WPNAV_SPEED parameter
current_speed = vehicle.parameters['WPNAV_SPEED']
print(f"Tốc độ bay hiện tại / Current waypoint speed: {current_speed} cm/s")

# Thay đổi tham số WPNAV_SPEED / Change WPNAV_SPEED parameter
# Cảnh báo: Việc thay đổi thông số này ảnh hưởng trực tiếp đến hành vi bay!
# Warning: Changing this parameter directly affects flight behavior!
vehicle.parameters['WPNAV_SPEED'] = 500  # 500 cm/s = 5 m/s
print(f"Tốc độ bay mới / New waypoint speed: {vehicle.parameters['WPNAV_SPEED']} cm/s")
```

### 2. Chuyển Đổi Các Chế Độ Bay Khác / Switching to Other Flight Modes

**[Vietnamese]**
Ngoài `GUIDED`, bạn thường xuyên phải sử dụng `LOITER` (giữ vị trí bằng GPS), `RTL` (quay về điểm xuất phát), và `AUTO` (bay theo điểm Waypoint cấu hình sẵn).
**[English]**
Besides `GUIDED`, you often need to use `LOITER` (GPS position hold), `RTL` (Return To Launch), and `AUTO` (fly predefined Waypoints).

```python
from dronekit import VehicleMode
import time

def set_mode(vehicle, mode_name):
    print(f"Đang chuyển sang chế độ / Switching to {mode_name} mode...")
    vehicle.mode = VehicleMode(mode_name)
    while vehicle.mode.name != mode_name:
        print(" Đang chờ chuyển chế độ... / Waiting for mode change...")
        time.sleep(1)
    print(f"Đã ở chế độ / Currently in {mode_name} mode!")

# Ví dụ sử dụng / Example usage:
# set_mode(vehicle, "LOITER")
# set_mode(vehicle, "RTL")
# set_mode(vehicle, "AUTO")
```

---

## Thuật Ngữ (Glossary of Terms)

| Thuật Ngữ / Term | Giải Nghĩa / Explanation |
| --- | --- |
| **GCS (Ground Control Station)** | Trạm điều khiển mặt đất (như Mission Planner, QGroundControl). / Software used to monitor and control the drone from the ground. |
| **Telemetry** | Luồng dữ liệu không dây truyền tải trạng thái của drone (độ cao, tọa độ, pin) về trạm điều khiển. / Wireless data stream transmitting drone status (altitude, GPS, battery) to the GCS. |
| **SITL (Software In The Loop)** | Phần mềm mô phỏng thuật toán điều khiển bay trên máy tính mà không cần phần cứng thực. / Software simulation of the flight controller algorithms on a PC without physical hardware. |
| **Flight Controller (FC)** | Bo mạch vi điều khiển trung tâm trên drone (ví dụ Pixhawk). / The central microcontroller board on the drone (e.g., Pixhawk). |
| **Waypoint** | Một điểm tọa độ GPS 3D mà drone được lập trình để bay tới. / A 3D GPS coordinate that the drone is programmed to fly to. |
| **Geofence** | Hàng rào điện tử vô hình giới hạn không gian bay tối đa của drone. / An invisible electronic fence limiting the drone's maximum flight area. |
| **Baudrate** | Tốc độ truyền dữ liệu qua cổng Serial (thường là 57600 cho Telemetry và 115200 cho USB). / Data transmission rate over Serial port (usually 57600 for Telemetry and 115200 for USB). |
| **Pitch / Roll / Yaw** | Góc chúc ngóc / nghiêng trái phải / xoay vòng của drone. / Nose up-down / tilt left-right / horizontal rotation of the drone. |

---

## Câu Hỏi Thường Gặp (FAQ - Frequently Asked Questions)

### Q1: Tại sao code chạy hoàn hảo trên SITL nhưng lại báo lỗi "Arming denied" trên drone thật?
**[Vietnamese]** Trên SITL, các điều kiện môi trường là lý tưởng. Trên drone thật, hệ thống sẽ từ chối Arm nếu: GPS chưa có tín hiệu 3D Fix, la bàn (compass) bị nhiễu, hoặc cảm biến IMU chưa được căn chỉnh (calibrate). Hãy cắm drone vào Mission Planner để xem lỗi chính xác là gì.
**[English]** In SITL, environmental conditions are ideal. On a real drone, arming is denied if: GPS lacks a 3D Fix, the compass is suffering from magnetic interference, or IMU sensors are uncalibrated. Connect the drone to Mission Planner to read the exact pre-arm error message.

### Q2: Làm sao để ngắt kết nối an toàn trong code Python?
**[Vietnamese]** Luôn sử dụng lệnh `vehicle.close()` ở cuối đoạn script. Nếu không, MAVProxy hoặc cổng Serial có thể bị "treo" (lock) và bạn sẽ phải khởi động lại terminal hoặc rút cáp USB.
**[English]** Always use the `vehicle.close()` command at the end of your script. Otherwise, MAVProxy or the Serial port might get "locked", forcing you to restart the terminal or physically replug the USB cable.

### Q3: DroneKit có tương thích với PX4 không?
**[Vietnamese]** DroneKit được tối ưu hóa cho ArduPilot. Mặc dù cả hai đều dùng MAVLink, nhưng PX4 xử lý chế độ bay và lệnh khác nhau. Để lập trình PX4, người ta thường dùng **MAVSDK-Python** thay vì DroneKit.
**[English]** DroneKit is optimized for ArduPilot. Although both use MAVLink, PX4 handles flight modes and commands differently. For PX4 programming, **MAVSDK-Python** is generally used instead of DroneKit.

### Q4: Nếu drone đang bay tự động (GUIDED) và mất kết nối với máy tính thì sao?
**[Vietnamese]** Tùy thuộc vào cài đặt Failsafe. Thông thường, nếu mất tín hiệu GCS (heartbeat bị mất) trong vài giây, drone sẽ tự động kích hoạt Failsafe (RTL hoặc Land) để trở về an toàn.
**[English]** This depends on the Failsafe settings. Usually, if the GCS signal is lost (heartbeat timeout) for a few seconds, the drone will automatically trigger a Failsafe action (RTL or Land) to return safely.

### Q5: Có thể lập trình bằng ngôn ngữ khác ngoài Python không?
**[Vietnamese]** Có. Bạn có thể dùng MAVSDK hỗ trợ C++, Swift, Java. Tuy nhiên, Python là ngôn ngữ dễ tiếp cận nhất cho việc phân tích dữ liệu và AI trên drone.
**[English]** Yes. You can use MAVSDK which supports C++, Swift, and Java. However, Python is the most accessible language for data analysis and AI integration on drones.

---
**[End of Document - Tài Liệu Nội Bộ Khóa Học / Internal Course Material]**
