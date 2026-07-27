# Tuần 10: Dự Án Cuối Khoá / Week 10: Final Capstone Project

## Mục Tiêu / Learning Objectives
- **VN:** Tổng hợp kiến thức toàn khoá học để thiết kế, lắp ráp, lập trình và vận hành một nhiệm vụ bay tự động hoàn chỉnh.
- **EN:** Synthesize knowledge from the entire course to design, assemble, program, and operate a fully autonomous flight mission.
- **VN:** Thực hiện quy trình phát triển từ thiết kế hệ thống, mô phỏng (SITL), kiểm thử thực tế đến thuyết trình báo cáo.
- **EN:** Execute the full development cycle from system design, Simulation In The Loop (SITL), real-world testing, to final presentation.
- **VN:** Hiểu rõ về an toàn bay, gỡ lỗi hệ thống (troubleshooting) và định hướng nghề nghiệp trong ngành công nghiệp Drone.
- **EN:** Understand flight safety, system troubleshooting, and career paths in the Drone industry.

## Công Cụ & Phần Mềm / Tools & Software
- Hardware: DIY Drone kit (Pixhawk, Raspberry Pi/Jetson Nano, ESCs, Motors, Frame, Lipo Battery, GPS, Telemetry, Camera, etc.)
- Software: QGroundControl / Mission Planner, ArduPilot / PX4 firmware, DroneKit-Python, MAVROS, ROS (Robot Operating System)
- Simulation: SITL (Software In The Loop), Gazebo
- IDE: Visual Studio Code

## Lý Thuyết / Theory

### 1. Tổng Quan Dự Án / Project Overview
- **VN:** Học viên sẽ xây dựng và trình diễn một nhiệm vụ drone tự động hoàn toàn. Mục tiêu là chứng minh sự ổn định của phần cứng và tính chính xác của phần mềm điều khiển.
- **EN:** Students will build and demonstrate a fully autonomous drone mission. The goal is to prove hardware stability and software control accuracy.

### 2. Các Hướng Dự Án (Chọn 1) / Project Tracks (Choose 1)
- **Track A - Aerial Survey:**
  - **VN:** Bay theo dạng lưới (grid pattern), chụp ảnh tự động và ghép bản đồ (stitch map).
  - **EN:** Fly a grid pattern, capture photos automatically, and stitch a 2D map.
- **Track B - Object Follower:**
  - **VN:** Sử dụng Computer Vision để tự động bám theo một mục tiêu có màu sắc cụ thể.
  - **EN:** Use Computer Vision to automatically track and follow a specifically colored target.
- **Track C - Delivery Sim:**
  - **VN:** Điều hướng tới một toạ độ GPS, bay lơ lửng (hover) trong 5 giây để thả hàng mô phỏng, sau đó quay về điểm xuất phát (Return to Launch - RTL).
  - **EN:** Navigate to a specific GPS waypoint, hover for 5 seconds to simulate dropping a package, then Return to Launch (RTL).

### 3. Mẫu Thiết Kế Dự Án / Project Design Document Template
- **Project Title:** (Tên dự án)
- **Track Chosen:** (Hướng đã chọn)
- **Team Members:** (Thành viên)
- **Problem Statement:** (Vấn đề cần giải quyết)
- **Hardware Architecture:** (Cấu trúc phần cứng: Flight Controller, Companion Computer, Sensors)
- **Software Architecture:** (Cấu trúc phần mềm: OS, Middleware, Libraries)
- **Flowchart:** (Sơ đồ luồng hoạt động của hệ thống)

### 4. Yêu Cầu Về Sơ Đồ Kiến Trúc Hệ Thống / System Architecture Diagram Requirements
- **VN:** Sơ đồ phải thể hiện rõ các kết nối nguồn (Power), tín hiệu (Signal), giao tiếp dữ liệu (UART, I2C, SPI) giữa Pixhawk, Companion Computer, Camera và các cảm biến khác.
- **EN:** The diagram must clearly show power, signal, and data communication connections (UART, I2C, SPI) among Pixhawk, Companion Computer, Camera, and other sensors.

### 5. Quy Trình Kiểm Thử / Testing Protocol
- **Bước 1 / Step 1: SITL (Simulation In The Loop)**
  - Chạy mô phỏng không có phần cứng để kiểm tra logic code. / Run hardware-less simulation to verify code logic.
- **Bước 2 / Step 2: HIL (Hardware In The Loop)**
  - Chạy code trên companion computer kết nối với flight controller giả lập. / Run code on companion computer connected to a simulated flight controller.
- **Bước 3 / Step 3: Ground Testing**
  - Tháo cánh quạt (props off), chạy thử motor và các cảm biến trên mặt đất. / Props off, test motors and sensors on the ground.
- **Bước 4 / Step 4: Real Flight Test**
  - Bay thử nghiệm thực tế tại khu vực an toàn, có người điều khiển an toàn (Safety Pilot) sẵn sàng can thiệp sang chế độ Manual. / Real flight in a safe zone with a Safety Pilot ready to switch to Manual mode.

### 6. Định Hướng Nghề Nghiệp / Career Paths in Drone Industry
- **UAV Hardware Engineer:** Chuyên thiết kế khung vỏ, tích hợp cảm biến, tối ưu hoá năng lượng. / Specializes in airframe design, sensor integration, power optimization.
- **Drone Software Developer:** Viết phần mềm bay tự động, xử lý ảnh, AI, giao tiếp MAVLink. / Writes autonomous flight software, computer vision, AI, MAVLink communication.
- **FPV Pilot / Commercial Operator:** Phi công điều khiển drone chuyên nghiệp cho quay phim, khảo sát, nông nghiệp. / Professional pilot for cinematography, surveying, agriculture.
- **Next Steps:** Tham gia thi lấy chứng chỉ bay (Ví dụ: Part 107 ở Mỹ), đóng góp cho các dự án mã nguồn mở như ArduPilot, PX4, hoặc tham gia các cuộc thi Drone. / Take certification exams, contribute to open source projects, or join Drone competitions.

### 7. Hướng Dẫn Gỡ Lỗi / Troubleshooting Guide
- **Issue 1:** Không thể kết nối DroneKit với SITL. / Cannot connect DroneKit to SITL.
  - **Fix:** Kiểm tra lại IP và port (thường là `127.0.0.1:14550`). Đảm bảo SITL đang chạy. / Check IP and port. Ensure SITL is running.
- **Issue 2:** Drone không cất cánh (Arming failed). / Drone fails to arm.
  - **Fix:** Kiểm tra GPS lock (cần 3D fix), la bàn (compass) đã calibrate chưa, và thông báo lỗi trên QGroundControl. / Check GPS lock, compass calibration, and QGroundControl error messages.
- **Issue 3:** Code Computer Vision chạy quá chậm. / Computer Vision code runs too slow.
  - **Fix:** Giảm độ phân giải camera, sử dụng các thư viện tối ưu phần cứng (ví dụ: TensorRT nếu dùng Jetson Nano). / Reduce camera resolution, use hardware-optimized libraries.

### 8. Danh Sách Kiểm Tra An Toàn / Safety Checklist for Final Demo Day
- [ ] Pin lipo đã sạc đầy và không bị phù. / Lipo batteries fully charged and not swollen.
- [ ] Cánh quạt không bị nứt, vỡ và được lắp đúng chiều (CW, CCW). / Propellers are intact and installed in correct direction.
- [ ] Ốc vít trên motor và frame đã được siết chặt. / All screws on motors and frame are tightened.
- [ ] La bàn (Compass) và IMU đã được hiệu chỉnh tại địa điểm bay. / Compass and IMU calibrated at the flight site.
- [ ] Đã có tín hiệu GPS Fix (ít nhất 8 vệ tinh). / GPS Fix achieved (at least 8 satellites).
- [ ] Safety pilot đã cầm tay điều khiển RC, sẵn sàng gạt công tắc đổi mode (Loiter/Stabilize). / Safety pilot holding RC, ready to switch modes.
- [ ] Khu vực bay không có người và chướng ngại vật. / Flight area is clear of people and obstacles.
- [ ] Telemetry kết nối ổn định tới Ground Station. / Stable telemetry connection to Ground Station.


## Code Thực Hành / Practice Code

Dưới đây là các đoạn code mẫu chi tiết cho cả 3 Track bằng Python và DroneKit. / Below is extensive boilerplate code for all 3 Tracks using Python and DroneKit.

### Track A - Aerial Survey (Grid Pattern & Photo Capture)
```python
from dronekit import connect, VehicleMode, LocationGlobalRelative
import time
import math

# Kết nối tới drone / Connect to drone
connection_string = '127.0.0.1:14550'
print(f"Connecting to vehicle on: {connection_string}")
vehicle = connect(connection_string, wait_ready=True)

def arm_and_takeoff(aTargetAltitude):
    print("Basic pre-arm checks")
    while not vehicle.is_armable:
        print(" Waiting for vehicle to initialise...")
        time.sleep(1)

    print("Arming motors")
    vehicle.mode = VehicleMode("GUIDED")
    vehicle.armed = True

    while not vehicle.armed:
        print(" Waiting for arming...")
        time.sleep(1)

    print("Taking off!")
    vehicle.simple_takeoff(aTargetAltitude)

    while True:
        print(" Altitude: ", vehicle.location.global_relative_frame.alt)
        if vehicle.location.global_relative_frame.alt >= aTargetAltitude * 0.95:
            print("Reached target altitude")
            break
        time.sleep(1)

def trigger_camera():
    # Giả lập thao tác chụp ảnh / Simulate camera trigger
    print(">>> SNAP! Đang chụp ảnh / Taking photo <<<")
    # Thực tế có thể dùng PWM hoặc thư viện picamera / Real world: use PWM or picamera

def generate_grid(start_loc, width, length, spacing):
    # Hàm tạo ra danh sách các waypoint dạng lưới / Generate grid waypoints
    waypoints = []
    # Logic tạo grid phức tạp sẽ ở đây / Complex grid logic here
    # Giả lập trả về 4 điểm hình vuông / Simulating a square
    wp1 = LocationGlobalRelative(start_loc.lat + 0.0001, start_loc.lon, start_loc.alt)
    wp2 = LocationGlobalRelative(start_loc.lat + 0.0001, start_loc.lon + 0.0001, start_loc.alt)
    wp3 = LocationGlobalRelative(start_loc.lat, start_loc.lon + 0.0001, start_loc.alt)
    waypoints.extend([wp1, wp2, wp3, start_loc])
    return waypoints

arm_and_takeoff(10)
print("Bắt đầu nhiệm vụ khảo sát / Starting survey mission")
home_location = vehicle.location.global_relative_frame
grid_waypoints = generate_grid(home_location, 50, 50, 10)

for wp in grid_waypoints:
    print("Di chuyển tới waypoint tiếp theo / Moving to next waypoint")
    vehicle.simple_goto(wp)
    time.sleep(10) # Đợi tới điểm / Wait to reach waypoint
    trigger_camera()

print("Hoàn thành nhiệm vụ, trở về / Mission complete, returning home")
vehicle.mode = VehicleMode("RTL")
vehicle.close()
```

### Track B - Object Follower (Computer Vision)
```python
import cv2
import numpy as np
from dronekit import connect, VehicleMode
import time

# Khởi tạo camera và kết nối / Init camera and connection
cap = cv2.VideoCapture(0)
# connection_string = '/dev/ttyUSB0' # Real drone
connection_string = '127.0.0.1:14550'
vehicle = connect(connection_string, wait_ready=True)

# Thông số PID đơn giản cho Yaw / Simple PID for Yaw
kp_yaw = 0.5

def send_movement_command(yaw_error):
    # Gửi lệnh xoay (Yaw) để hướng về mục tiêu / Send yaw command to face target
    # Sử dụng MAVLink command_long_send (CONDITION_YAW)
    print(f"Điều chỉnh Yaw với lỗi / Adjusting Yaw with error: {yaw_error}")
    # ... mavlink code ...

def detect_target(frame):
    # Nhận diện màu đỏ / Detect red color
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    lower_red = np.array([0, 120, 70])
    upper_red = np.array([10, 255, 255])
    mask = cv2.inRange(hsv, lower_red, upper_red)
    
    contours, _ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    if contours:
        largest_contour = max(contours, key=cv2.contourArea)
        if cv2.contourArea(largest_contour) > 500:
            x, y, w, h = cv2.boundingRect(largest_contour)
            center_x = x + w/2
            return center_x, mask
    return None, mask

print("Chờ cất cánh / Waiting for takeoff...")
# Giả định drone đã được cất cánh bằng tay hoặc script khác lên 5m / Assume drone took off to 5m

while True:
    ret, frame = cap.read()
    if not ret:
        break
        
    frame_center = frame.shape[1] / 2
    target_x, mask = detect_target(frame)
    
    if target_x is not None:
        error_x = target_x - frame_center
        print(f"Mục tiêu cách tâm / Target offset: {error_x} px")
        # Gửi tín hiệu điều khiển nếu sai lệch lớn / Send control if error is large
        if abs(error_x) > 50:
             send_movement_command(error_x * kp_yaw)
    else:
        print("Không thấy mục tiêu / No target detected")

    cv2.imshow("Original", frame)
    cv2.imshow("Mask", mask)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
vehicle.close()
```

### Track C - Delivery Sim (GPS Navigation)
```python
from dronekit import connect, VehicleMode, LocationGlobalRelative
import time

connection_string = '127.0.0.1:14550'
vehicle = connect(connection_string, wait_ready=True)

def arm_and_takeoff(aTargetAltitude):
    print("Basic pre-arm checks")
    while not vehicle.is_armable:
        print(" Waiting for vehicle to initialise...")
        time.sleep(1)

    print("Arming motors")
    vehicle.mode = VehicleMode("GUIDED")
    vehicle.armed = True

    while not vehicle.armed:
        print(" Waiting for arming...")
        time.sleep(1)

    print("Taking off!")
    vehicle.simple_takeoff(aTargetAltitude)

    while True:
        print(" Altitude: ", vehicle.location.global_relative_frame.alt)
        if vehicle.location.global_relative_frame.alt >= aTargetAltitude * 0.95:
            print("Reached target altitude")
            break
        time.sleep(1)

def drop_package():
    print(">>> Kích hoạt servo thả hàng / Activating drop servo <<<")
    # Thực tế: Điều khiển Servo qua kênh AUX trên Pixhawk / Real world: Control Servo via AUX channel
    # vehicle.channels.overrides['8'] = 2000
    time.sleep(2)
    # vehicle.channels.overrides['8'] = 1000
    print(">>> Đã thả hàng thành công / Package dropped successfully <<<")

target_lat = -35.363261
target_lon = 149.165230
delivery_location = LocationGlobalRelative(target_lat, target_lon, 15)

arm_and_takeoff(15)

print("Bay tới điểm giao hàng / Flying to delivery location")
vehicle.simple_goto(delivery_location)

# Chờ đợi tới nơi (giả lập delay đơn giản) / Wait to reach (simple delay simulation)
time.sleep(20)

print("Đã tới nơi, bắt đầu lơ lửng / Arrived, hovering for 5 seconds")
time.sleep(5)

drop_package()

print("Nhiệm vụ hoàn tất, quay về điểm xuất phát / Mission complete, Return to Launch")
vehicle.mode = VehicleMode("RTL")

# Chờ drone đáp xuống / Wait for landing
while vehicle.armed:
    print("Đang hạ cánh... / Landing...")
    time.sleep(2)

print("Đã hạ cánh an toàn. Đóng kết nối. / Landed safely. Closing connection.")
vehicle.close()
```

## Bài Tập / Exercises
1. **VN:** Mở rộng Track A: Sửa đổi code để drone bay ở 2 độ cao khác nhau trong cùng một nhiệm vụ.
   **EN:** Extend Track A: Modify the code to fly at 2 different altitudes within the same mission.
2. **VN:** Mở rộng Track B: Thêm bộ lọc Kalman đơn giản để dự đoán vị trí mục tiêu khi bị che khuất trong chốc lát.
   **EN:** Extend Track B: Add a simple Kalman filter to predict target location when temporarily occluded.
3. **VN:** Mở rộng Track C: Thay vì chỉ RTL, hãy thêm khả năng đọc tọa độ giao hàng từ một file text hoặc một request HTTP API.
   **EN:** Extend Track C: Instead of simple RTL, add the ability to read delivery coordinates from a text file or an HTTP API request.
4. **VN:** Tạo một bản vẽ (schematic) nháp về cách bạn kết nối pin, PDB (Power Distribution Board), Pixhawk và Jetson Nano.
   **EN:** Create a draft schematic showing how you connect the battery, PDB, Pixhawk, and Jetson Nano.

## Câu Hỏi Thảo Luận / Discussion Questions
1. **VN:** Tại sao việc thực hiện SITL (mô phỏng) lại cực kỳ quan trọng trước khi bay thực tế? Nếu bỏ qua bước này hậu quả có thể là gì? / **EN:** Why is performing SITL crucial before real flights? What are the consequences of skipping this step?
2. **VN:** Trong Track B (Object Follower), nếu trời quá tối hoặc ánh sáng thay đổi liên tục, thuật toán dựa trên màu sắc (HSV) sẽ bị ảnh hưởng thế nào? Đề xuất giải pháp thay thế. / **EN:** In Track B, if lighting conditions change rapidly, how does the color-based (HSV) tracking fail? Propose alternative solutions.
3. **VN:** Safety Pilot có vai trò gì trong quá trình thử nghiệm chuyến bay tự động? Nút "Kill Switch" hay việc chuyển sang chế độ "Stabilize" quan trọng như thế nào? / **EN:** What is the role of the Safety Pilot during autonomous testing? How important is the "Kill Switch" or switching to "Stabilize" mode?
4. **VN:** Hãy thảo luận về các quy định bay Drone ở quốc gia của bạn (ví dụ: khu vực cấm bay, độ cao tối đa, đăng ký thiết bị). / **EN:** Discuss the Drone flight regulations in your country (e.g., no-fly zones, max altitude, device registration).
5. **VN:** Drone giao hàng (Track C) đối mặt với những thách thức gì trong môi trường đô thị đông đúc so với khu vực nông thôn? / **EN:** What challenges do delivery drones (Track C) face in dense urban environments compared to rural areas?

## Bài Về Nhà / Homework
- **VN:** Hoàn thiện báo cáo dự án (Project Design Document) và chuẩn bị slide thuyết trình (10 slide) cho buổi Demo Day. Đảm bảo phần cứng đã sẵn sàng 100% theo checklist.
- **EN:** Finalize the Project Design Document and prepare the 10-slide presentation deck for Demo Day. Ensure hardware is 100% ready according to the safety checklist.
- **Yêu cầu Slide Thuyết Trình / Presentation Requirements:**
  - Slide 1: Title & Team info
  - Slide 2: Problem statement & Track choice
  - Slide 3: Hardware architecture & wiring
  - Slide 4: Software architecture & logic flow
  - Slide 5: SITL testing results (Videos/Screenshots)
  - Slide 6: Field testing challenges & Troubleshooting
  - Slide 7: Final results & Live Demo intro
  - Slide 8-10: Q&A, Lessons learned, Future work

## Đánh Giá / Assessment Rubric

Phần dự án cuối khoá được đánh giá dựa trên 4 tiêu chí chính, tổng 100 điểm. / The final capstone project is evaluated based on 4 main criteria, totaling 100 points.

### 1. Phần Cứng & Thiết Kế Hệ Thống (Hardware & System Design) - 25%
- **Xuất sắc (20-25đ):** Lắp ráp cực kỳ gọn gàng, dây cáp được quản lý tốt, hàn chắc chắn. Sơ đồ kiến trúc không có lỗi và thể hiện sự hiểu biết sâu sắc.
- **Khá (15-19đ):** Lắp ráp an toàn và bay được, nhưng dây cáp còn hơi lộn xộn. Sơ đồ kiến trúc đúng chức năng cơ bản.
- **Đạt (10-14đ):** Có thể bay nhưng tiềm ẩn rủi ro cơ khí (ốc lỏng, dây cạ vào vỏ). Sơ đồ thiếu chi tiết.
- **Không đạt (<10đ):** Lắp ráp sai nguyên tắc an toàn, không thể cất cánh, sơ đồ sai.

### 2. Phần Mềm & Thuật Toán (Software & Algorithms) - 35%
- **Xuất sắc (30-35đ):** Code được cấu trúc tốt (OOP, functions), comment rõ ràng. Xử lý tốt các tình huống ngoại lệ (failsafe, mất tín hiệu). Hoàn thành mượt mà toàn bộ nhiệm vụ.
- **Khá (20-29đ):** Code chạy đúng logic yêu cầu nhưng thiếu tính module. Hoàn thành nhiệm vụ chính nhưng còn giật cục hoặc xử lý ngoại lệ kém.
- **Đạt (15-19đ):** Code có chạy được nhưng thường xuyên cần khởi động lại. Chỉ hoàn thành một phần nhiệm vụ tự động.
- **Không đạt (<15đ):** Code lỗi syntax, không thể giao tiếp với Drone qua DroneKit, không chạy được SITL.

### 3. Demo Thực Tế & Thử Nghiệm (Live Demo & Testing) - 25%
- **Xuất sắc (20-25đ):** Drone thực hiện nhiệm vụ hoàn hảo ở điều kiện thực tế hoặc giả lập nghiêm ngặt. Phản ứng nhanh nhạy, an toàn được đặt lên hàng đầu.
- **Khá (15-19đ):** Hoàn thành nhiệm vụ nhưng có sự can thiệp nhỏ của Safety Pilot hoặc có độ trễ/sai số nhỏ (ví dụ: thả hàng chệch 2 mét).
- **Đạt (10-14đ):** Chỉ demo được trên SITL, hoặc demo thực tế gặp lỗi nặng phải hạ cánh khẩn cấp.
- **Không đạt (<10đ):** Không có sản phẩm demo, drone crash do lỗi ngớ ngẩn hoặc vi phạm an toàn nghiêm trọng.

### 4. Thuyết Trình & Trả Lời Câu Hỏi (Presentation & Q&A) - 15%
- **Xuất sắc (12-15đ):** Trình bày lưu loát, slide đẹp mắt (đúng chuẩn 10 slide). Trả lời xuất sắc các câu hỏi kỹ thuật từ ban giám khảo, giải thích rõ các lỗi đã gặp và cách khắc phục.
- **Khá (8-11đ):** Trình bày rõ ràng nhưng thiếu điểm nhấn. Slide đầy đủ thông tin. Trả lời được hầu hết các câu hỏi cơ bản.
- **Đạt (5-7đ):** Thuyết trình ấp úng, slide sơ sài. Không trả lời được các câu hỏi đi sâu vào bản chất kỹ thuật.
- **Không đạt (<5đ):** Không chuẩn bị slide hoặc không tham gia thuyết trình.

---
**Chúc các bạn hoàn thành xuất sắc dự án cuối khoá và bước những bước đầu tiên vào ngành công nghiệp không người lái đầy hứa hẹn!**
**Good luck with your final capstone project and taking your first steps into the promising unmanned systems industry!**

## Phụ Lục / Appendix (Glossary)
- **SITL:** Software In The Loop - Mô phỏng phần mềm mà không cần phần cứng.
- **HIL:** Hardware In The Loop - Kết nối mô phỏng với một phần cứng thật.
- **MAVLink:** Giao thức truyền thông siêu nhẹ dành cho drone.
- **ESC:** Electronic Speed Controller - Bộ điều tốc động cơ.
- **LiPo:** Lithium Polymer - Loại pin phổ biến dùng cho drone vì xả dòng cao.
- **PWM:** Pulse Width Modulation - Tín hiệu điều rộng xung dùng để điều khiển động cơ servo.
- **ROS:** Robot Operating System - Hệ điều hành (middleware) phổ biến cho robot và drone.
- **Gazebo:** Trình mô phỏng 3D mạnh mẽ thường được dùng với ROS và SITL.
- **QGroundControl:** Phần mềm điều khiển trạm mặt đất (Ground Control Station) phổ biến.

