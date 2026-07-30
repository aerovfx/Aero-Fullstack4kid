# Tuần 8: Computer Vision với OpenCV / Week 8: Computer Vision with OpenCV

## Mục Tiêu / Learning Objectives

### 🇻🇳 Tiếng Việt
- Hiểu được các nguyên lý cơ bản của thị giác máy tính (Computer Vision) và thư viện OpenCV.
- Tích hợp và cấu hình các loại camera (USB webcam, Raspberry Pi Camera, FPV với capture card) với máy tính nhúng (Companion Computer).
- Đọc, hiển thị và xử lý video stream cơ bản (chuyển đổi hệ màu BGR sang RGB/HSV, điều chỉnh kích thước khung hình).
- Xây dựng thuật toán phát hiện màu sắc và trích xuất đường viền (contours) để nhận dạng vật thể.
- Xây dựng hệ thống theo dõi tâm vật thể (centroid tracking) và giới hạn khung (bounding boxes).
- Hiểu và triển khai phát hiện ArUco marker cho tính năng hạ cánh chính xác (precision landing).
- Tìm hiểu về luồng quang học (Optical flow) và cảm biến px4flow cho ước lượng chuyển động không cần GPS.
- Nắm bắt kiến trúc luồng dữ liệu Drone + Computer Vision (Drone + CV pipeline).
- Tối ưu hóa xử lý thời gian thực: sự đánh đổi giữa tốc độ khung hình (frame rate) và độ phân giải (resolution).
- Hoàn thiện đoạn mã nguồn: phát hiện vật thể màu đỏ → tính toán độ lệch tâm → gửi lệnh điều khiển tới drone.
- Cài đặt Raspberry Pi kết hợp Pixhawk làm máy tính đồng hành.

### 🇬🇧 English
- Understand the basic principles of Computer Vision and the OpenCV library.
- Integrate and configure various cameras (USB webcam, Raspberry Pi Camera, FPV with capture card) with a Companion Computer.
- Read, display, and process basic video streams (convert BGR to RGB/HSV color spaces, resize frames).
- Build color detection algorithms and extract contours for object recognition.
- Build a centroid tracking system and draw bounding boxes around objects.
- Understand and implement ArUco marker detection for precision landing capabilities.
- Learn about Optical Flow concepts and px4flow sensors for GPS-denied motion estimation.
- Grasp the Drone + Computer Vision pipeline architecture.
- Optimize real-time processing: understanding the trade-offs between frame rate and resolution.
- Complete the code pipeline: detect a red object → compute the offset from the frame center → send correction commands to the drone.
- Setup Raspberry Pi + Pixhawk as a companion computer architecture.

---

## Công Cụ & Phần Mềm / Tools & Software

### Phần Cứng / Hardware
| Thiết bị / Device | Mô tả (VN) | Description (EN) |
|-------------------|------------|------------------|
| Raspberry Pi 4/5  | Máy tính nhúng đồng hành xử lý ảnh | Companion computer for image processing |
| Pixhawk 4/6C      | Bộ điều khiển bay nhận lệnh từ RPi | Flight controller receiving commands |
| RPi Camera Module | Camera chuyên dụng kết nối qua cổng CSI | Dedicated camera via CSI port |
| USB Webcam (Logitech) | Camera USB tiêu chuẩn dễ dàng cắm và chạy | Plug-and-play standard USB camera |
| FPV Camera + UVC  | Hệ thống camera FPV kết hợp card bắt hình UVC | FPV camera with UVC capture card |
| px4flow Sensor    | Cảm biến luồng quang học đo lường chuyển động | Optical flow sensor for odometry |
| Lidar Lite v3     | Cảm biến đo khoảng cách bằng tia Laser | Laser distance sensor for altitude |
| Cáp USB (Type-C)  | Kết nối dữ liệu RPi với FC | Connects RPi to Flight Controller |
| Mạch BEC 5V/3A    | Cấp nguồn riêng cho Raspberry Pi | Dedicated power supply for RPi |

### Phần Mềm / Software
- **Hệ điều hành / OS:** Ubuntu Server 20.04/22.04 LTS hoặc Raspberry Pi OS (Bản 64-bit khuyên dùng).
- **Ngôn ngữ / Language:** Python 3.8+ (Khuyến nghị dùng virtual environment).
- **Thư viện chính / Main Libraries:** 
  - `opencv-python` (Xử lý ảnh cơ bản)
  - `opencv-contrib-python` (Chứa module nhận dạng ArUco marker)
  - `numpy` (Tính toán ma trận tốc độ cao)
  - `pymavlink` hoặc `dronekit` (Giao tiếp với Flight Controller)
  - `imutils` (Thư viện hỗ trợ OpenCV viết ngắn gọn hơn)

---

## Lý Thuyết / Theory

### 1. Tích Hợp Camera (Camera Integration)
🇻🇳 Để drone có thể "nhìn" thấy môi trường, chúng ta cần trang bị các cảm biến hình ảnh. Môi trường trên không rung lắc và yêu cầu độ phản hồi nhanh, do đó chọn camera là tối quan trọng:
- **USB Webcam**: Giao thức UVC phổ biến nhất. Rất dễ sử dụng, cắm là chạy. Nhược điểm: nặng, cồng kềnh, độ trễ truyền qua bus USB đôi khi không ổn định.
- **Raspberry Pi Camera (CSI)**: Kết nối qua cổng cáp dẹt (ribbon cable) CSI. Ưu điểm: độ trễ cực thấp, truy cập trực tiếp vào phần cứng nén video (GPU) của Raspberry Pi, rất nhẹ.
- **FPV với Capture Card**: Truyền tín hiệu analog 5.8GHz hoặc hệ thống số (DJI, Walksnail) xuống mặt đất, sau đó dùng USB Capture Card để đưa hình ảnh vào máy tính trạm (Ground Station) xử lý. Giúp giảm tải hoàn toàn cho drone.

🇬🇧 For a drone to "see" its environment, we must equip it with image sensors. The aerial environment is shaky and requires fast response, so choosing a camera is critical:
- **USB Webcams**: The most popular UVC protocol. Plug-and-play. Disadvantages: heavy, bulky, USB bus latency can fluctuate.
- **Raspberry Pi Camera (CSI)**: Connects via the CSI ribbon cable. Advantages: ultra-low latency, direct access to the RPi's hardware video encoding (GPU), very lightweight.
- **FPV with Capture Card**: Transmits 5.8GHz analog or digital signals to the ground, then uses a USB Capture card to feed the image into a Ground Station for processing. Offloads all computing from the drone.

### 2. Các Cơ Bản Về OpenCV (OpenCV Basics)
🇻🇳 **OpenCV** (Open Source Computer Vision Library) là công cụ nền tảng trong lĩnh vực Robotics. 
- Mọi hình ảnh (Frame) trong OpenCV đều được lưu dưới dạng mảng đa chiều của NumPy (NumPy array).
- `cv2.imread()` / `cv2.imshow()`: Các hàm đọc ảnh từ ổ cứng và hiển thị lên cửa sổ giao diện GUI.
- `cv2.VideoCapture(0)`: Mở luồng video trực tiếp từ camera đầu tiên (ID=0) được tìm thấy.
- **LƯU Ý QUAN TRỌNG VỀ HỆ MÀU**: Khác với phần lớn các phần mềm máy tính sử dụng RGB (Đỏ-Xanh lá-Xanh dương), OpenCV lại biểu diễn mảng màu theo thứ tự **BGR** (Xanh dương-Xanh lá-Đỏ). Khi bạn dùng các thư viện khác (như Matplotlib) để hiển thị ảnh OpenCV, bạn sẽ thấy màu sắc bị sai lệch nếu không dùng hàm `cv2.cvtColor(image, cv2.COLOR_BGR2RGB)`.

🇬🇧 **OpenCV** is a foundational tool in Robotics.
- Every frame in OpenCV is represented as a multi-dimensional NumPy array.
- `cv2.imread()` / `cv2.imshow()`: Functions to read images from disk and display them on GUI windows.
- `cv2.VideoCapture(0)`: Opens the live video stream from the first camera (ID=0) found.
- **CRITICAL COLOR SPACE NOTE**: Unlike most software that uses RGB, OpenCV represents color channels in **BGR** order. If you use other libraries (like Matplotlib) to display OpenCV images, colors will look wrong unless converted via `cv2.cvtColor(image, cv2.COLOR_BGR2RGB)`.

### 3. Phát Hiện Màu Sắc (Color Detection with HSV)
🇻🇳 Không gian màu **HSV** (Hue, Saturation, Value) là lựa chọn tối ưu hơn RGB để nhận dạng vật thể dựa trên màu sắc ngoài thực tế.
- **Hue (Màu sắc):** Góc trên vòng tròn màu (0-179 trong OpenCV). Đại diện cho "tên" của màu (đỏ, xanh, vàng...).
- **Saturation (Độ bão hòa):** Mức độ rực rỡ của màu (0-255).
- **Value (Độ sáng):** Mức độ sáng tối (0-255).
Vì thông tin "màu" tách biệt với thông tin "ánh sáng", HSV ít bị ảnh hưởng bởi bóng râm hay ánh nắng gắt so với RGB.
Chúng ta dùng `cv2.inRange(hsv_img, lower_bound, upper_bound)` để tạo một mặt nạ nhị phân (Binary Mask), nơi các pixel nằm trong khoảng màu mục tiêu sẽ có giá trị 255 (trắng), còn lại là 0 (đen).

🇬🇧 The **HSV** (Hue, Saturation, Value) color space is a far better choice than RGB for real-world color-based object recognition.
- **Hue:** The color type (0-179 in OpenCV).
- **Saturation:** The vividness of the color (0-255).
- **Value:** The brightness (0-255).
Because color information (Hue) is decoupled from lighting (Value), HSV is much less sensitive to shadows or harsh sunlight.
We use `cv2.inRange()` to create a Binary Mask, where pixels within our target color range are white (255) and all others are black (0).

### 4. Theo Dõi Đối Tượng & Moment Ảnh (Object Tracking & Image Moments)
🇻🇳 Khi đã có Binary Mask, ta cần xác định tọa độ của vật thể:
1. `cv2.findContours()`: Tìm kiếm tất cả các đường viền kín (contours) của phần màu trắng trên ảnh.
2. `cv2.contourArea()`: Tính toán diện tích của từng contour để lọc bỏ các đốm nhiễu li ti (nhiễu).
3. **Image Moments (`cv2.moments`)**: Là phương pháp toán học để tìm trung bình có trọng số của các điểm ảnh. Công thức tìm trọng tâm: `cx = M10/M00` và `cy = M01/M00`.

🇬🇧 Once we have the Binary Mask, we must locate the object:
1. `cv2.findContours()`: Finds all closed boundaries of the white regions.
2. `cv2.contourArea()`: Computes the area of each contour to filter out tiny noise specs.
3. **Image Moments (`cv2.moments`)**: A mathematical method to find the weighted average of image pixels. Formula for centroid: `cx = M10/M00` and `cy = M01/M00`.

### 5. ArUco Marker & Hạ Cánh Chính Xác (Precision Landing)
🇻🇳 **ArUco Marker** là các hình vuông màu đen trắng, giống mã QR nhưng đơn giản hơn, chứa một ID độc nhất. Thư viện OpenCV cung cấp sẵn module nhận diện cực kỳ mạnh mẽ:
- Ưu điểm: Phân tích nhanh, có thể tính toán được ma trận xoay (Rotation) và dịch chuyển (Translation) của camera so với mặt phẳng chứa marker (Pose Estimation).
- Ứng dụng: Đặt marker trên bãi đỗ. Drone phát hiện marker, nội suy khoảng cách 3D (X, Y, Z) và gửi các lệnh tinh chỉnh tọa độ hạ cánh (Precision Landing).

🇬🇧 **ArUco Markers** are simple black-and-white square barcodes, simpler than QR codes, containing a unique ID. OpenCV provides a robust built-in detection module:
- Advantages: Fast parsing, capable of computing the camera's Rotation and Translation matrices relative to the marker's plane (Pose Estimation).
- Applications: Place a marker on the landing pad. The drone detects it, interpolates the 3D distance (X, Y, Z), and sends refined coordinate commands for Precision Landing.

### 6. Cảm Biến Luồng Quang Học (Optical Flow - px4flow)
🇻🇳 **Optical Flow** là kỹ thuật ước lượng chuyển động của các vật thể trong khung hình dựa trên sự thay đổi vị trí của các pixel qua thời gian.
- Trong thế giới Drone, module như **px4flow** hay cảm biến **Thrust** bao gồm một camera hướng xuống đất với tốc độ 100-250 FPS.
- Bằng cách so sánh các khung hình, nó phát hiện drone đang trôi về phía nào (drift) để bù đắp lực đẩy (Position Hold) ngay cả trong môi trường không có sóng GPS (trong nhà, hầm mỏ).

🇬🇧 **Optical Flow** is the technique of estimating the motion of objects in a frame based on pixel displacement over time.
- In the Drone world, modules like **px4flow** or **Thrust** sensors feature a downward-facing camera running at 100-250 FPS.
- By comparing frames, it detects drift direction and compensates thrust (Position Hold) even in GPS-denied environments (indoors, tunnels).

### 7. Kiến Trúc Hệ Thống (Drone + CV Pipeline Architecture)
🇻🇳 Quy trình xử lý liên tục 1 vòng lặp (Loop):
1. **Camera thu ảnh** (ví dụ 30 FPS).
2. **Xử lý OpenCV (RPi)** lọc nhiễu, tìm tọa độ `(cx, cy)`.
3. **Tính toán độ lệch (Error Vector)**: Sự khác biệt giữa `(cx, cy)` và tọa độ tâm khung hình `(width/2, height/2)`.
4. **Bộ điều khiển PID (Tùy chọn)**: Dùng thuật toán PID để biến Error Vector thành các vận tốc bù đắp `Vx`, `Vy`.
5. **Gửi lệnh qua MAVLink**: RPi dùng PyMAVLink đóng gói lệnh `SET_POSITION_TARGET_LOCAL_NED` và truyền qua UART/USB tới Pixhawk.
6. **Thực thi trên FC**: Pixhawk chuyển tín hiệu thành vòng quay motor.

🇬🇧 A continuous 1-loop process:
1. **Camera captures frame** (e.g., 30 FPS).
2. **OpenCV Processing (RPi)** filters noise, finds coordinates `(cx, cy)`.
3. **Calculate Error Vector**: Difference between `(cx, cy)` and frame center `(width/2, height/2)`.
4. **PID Controller (Optional)**: Converts Error Vector into compensation velocities `Vx`, `Vy`.
5. **Send via MAVLink**: RPi packages `SET_POSITION_TARGET_LOCAL_NED` using PyMAVLink and sends it via UART/USB to the Pixhawk.
6. **FC Execution**: Pixhawk translates signals to motor PWMs.

### 8. Tối Ưu Xử Lý Thời Gian Thực (Real-Time Processing Optimization)
🇻🇳 CPU của Raspberry Pi (ARM) yếu hơn rất nhiều so với Laptop. Các đánh đổi cần thiết:
- **Độ Phân Giải (Resolution)**: Xử lý 1080p có thể tụt FPS xuống 5. Hãy downscale ảnh bằng `cv2.resize()` xuống `640x480` hoặc thậm chí `320x240`. Hệ thống bay cần phản ứng nhanh hơn là hình ảnh sắc nét.
- **Vùng Ưu Tiên (ROI - Region of Interest)**: Nếu vật thể luôn ở nửa dưới ảnh, chỉ cắt (crop) xử lý nửa dưới thay vì toàn khung.

🇬🇧 Raspberry Pi CPUs (ARM) are much weaker than laptops. Necessary trade-offs:
- **Resolution**: Processing 1080p might drop FPS to 5. Downscale via `cv2.resize()` to `640x480` or `320x240`. Flight systems prioritize fast reactions over sharp images.
- **ROI**: If the object is always on the lower half, crop and process only that half instead of the full frame.

---

## Code Thực Hành / Practice Code

Dưới đây là một hệ thống (pipeline) hoàn chỉnh bằng Python. Script này lấy ảnh từ camera, tìm một vật thể màu đỏ lớn nhất, tính độ lệch của nó so với tâm màn hình, và xuất ra thông điệp điều khiển giả lập qua cơ chế PID đơn giản.
Below is a complete Python pipeline. This script captures images from the camera, finds the largest red object, calculates its offset from the screen center, and outputs simulated control messages via a simple PID mechanism.

```python
import cv2
import numpy as np
import time

# ==============================================================================
# HÀM PHÁT HIỆN MÀU ĐỎ VÀ TÌM TRỌNG TÂM / RED OBJECT DETECTION AND CENTROID
# ==============================================================================
def process_frame(frame, center_x, center_y):
    """
    VN: Xử lý khung hình, phát hiện vật thể màu đỏ và trả về tọa độ tâm (cx, cy) cùng với ảnh đã vẽ.
    EN: Processes the frame, detects the red object, and returns the centroid (cx, cy) and the annotated frame.
    """
    # 1. Chuyển đổi sang hệ màu HSV / Convert to HSV color space
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    
    # 2. Khai báo dải màu đỏ (HSV) / Define HSV range for Red
    # Màu đỏ trong HSV nằm ở 2 đầu của dải màu (khoảng 0-10 và 170-180)
    # Red in HSV wraps around 0 and 180. We define a simple mask here.
    lower_red_1 = np.array([0, 120, 70])
    upper_red_1 = np.array([10, 255, 255])
    
    lower_red_2 = np.array([170, 120, 70])
    upper_red_2 = np.array([180, 255, 255])
    
    mask1 = cv2.inRange(hsv, lower_red_1, upper_red_1)
    mask2 = cv2.inRange(hsv, lower_red_2, upper_red_2)
    mask = cv2.bitwise_or(mask1, mask2) # Kết hợp cả 2 mask / Combine masks
    
    # 3. Lọc nhiễu / Noise filtering (Morphological Operations)
    kernel = np.ones((5, 5), np.uint8)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel) # Xóa điểm nhiễu nhỏ (Erosion -> Dilation)
    mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel) # Lấp đầy lỗ trống (Dilation -> Erosion)
    
    # 4. Tìm contours (đường viền) / Find contours
    contours, hierarchy = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)
    
    cx, cy = None, None
    err_x, err_y = 0, 0
    
    if contours:
        # Tìm contour có diện tích lớn nhất / Find the largest contour
        largest_contour = max(contours, key=cv2.contourArea)
        area = cv2.contourArea(largest_contour)
        
        # Bỏ qua các contour quá nhỏ (nhiễu) / Ignore very small contours
        if area > 800:
            # 5. Tính toán Moments để tìm trọng tâm / Calculate Moments for centroid
            M = cv2.moments(largest_contour)
            if M['m00'] > 0:
                cx = int(M['m10'] / M['m00'])
                cy = int(M['m01'] / M['m00'])
                
                # Vẽ Hộp giới hạn (Bounding Box) / Draw Bounding Box
                x, y, w, h = cv2.boundingRect(largest_contour)
                cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
                
                # Vẽ điểm tâm vật thể / Draw object center point
                cv2.circle(frame, (cx, cy), 5, (255, 0, 0), -1)
                
                # Vẽ đường line từ tâm màn hình đến vật thể / Draw line from screen center to object
                cv2.line(frame, (center_x, center_y), (cx, cy), (0, 255, 255), 2)
                
                # Tính độ lệch (Error Offset). 
                # Trục X: phải là dương. Trục Y: Lên là dương (đối ngược với pixel Y của ảnh)
                err_x = cx - center_x
                err_y = center_y - cy 
                
                # Ghi text lên màn hình
                cv2.putText(frame, f"Err X: {err_x} Y: {err_y} Area: {int(area)}", (10, 30), 
                            cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)

    return cx, cy, err_x, err_y, frame, mask

# ==============================================================================
# BỘ ĐIỀU KHIỂN PID GIẢ LẬP / SIMULATED PID CONTROLLER
# ==============================================================================
# Các hệ số PID (Cần được Tuning ngoài thực tế) / PID Coefficients (Must be tuned in real life)
Kp = 0.005 
Ki = 0.0001
Kd = 0.002

prev_error_x = 0
integral_x = 0

def compute_pid_x(error_x, dt):
    global prev_error_x, integral_x
    
    # Khâu Proportional
    P = Kp * error_x
    
    # Khâu Integral (chống wind-up bằng giới hạn)
    integral_x += error_x * dt
    I = Ki * integral_x
    
    # Khâu Derivative
    D = Kd * ((error_x - prev_error_x) / dt) if dt > 0 else 0
    
    prev_error_x = error_x
    
    output = P + I + D
    
    # Giới hạn giá trị đầu ra (Vận tốc tối đa) / Limit output (Max velocity)
    return max(min(output, 0.5), -0.5) 

# ==============================================================================
# CHƯƠNG TRÌNH CHÍNH / MAIN EXECUTION
# ==============================================================================
def main():
    print("Khởi động hệ thống Camera... / Initializing Camera System...")
    
    # Sử dụng camera mặc định (0) hoặc thay bằng đường dẫn file video
    # Use default camera (0) or replace with a video file path
    cap = cv2.VideoCapture(0)
    
    if not cap.isOpened():
        print("LỖI: Không thể kết nối với Camera / ERROR: Cannot open Camera")
        return

    # Thiết lập độ phân giải đầu vào (Giảm để tăng tốc xử lý) / Set input resolution
    # RPi khuyên dùng 640x480 hoặc 320x240
    frame_width = 640
    frame_height = 480
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, frame_width)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, frame_height)
    cap.set(cv2.CAP_PROP_FPS, 30)
    
    center_frame_x = frame_width // 2
    center_frame_y = frame_height // 2

    last_time = time.time()

    try:
        while True:
            # Đọc khung hình / Read frame
            ret, frame = cap.read()
            if not ret:
                print("Không thể nhận khung hình, đang đợi... / Failed to grab frame, waiting...")
                time.sleep(0.1)
                continue
            
            # Tính toán thời gian vòng lặp (dt) / Calculate loop delta time
            current_time = time.time()
            dt = current_time - last_time
            last_time = current_time
            
            # Tính FPS thực tế / Calculate actual FPS
            fps = 1.0 / dt if dt > 0 else 0
                
            # Xử lý hình ảnh (Pipeline CV)
            # Resize cứng một lần nữa để đảm bảo an toàn nếu cấu hình ban đầu thất bại
            frame_resized = cv2.resize(frame, (frame_width, frame_height))
            
            # Vẽ crosshair trung tâm / Draw center crosshair
            cv2.line(frame_resized, (center_frame_x - 10, center_frame_y), (center_frame_x + 10, center_frame_y), (255, 255, 255), 1)
            cv2.line(frame_resized, (center_frame_x, center_frame_y - 10), (center_frame_x, center_frame_y + 10), (255, 255, 255), 1)
            
            cx, cy, err_x, err_y, annotated_frame, mask = process_frame(frame_resized, center_frame_x, center_frame_y)
            
            # In FPS lên góc màn hình / Print FPS on screen
            cv2.putText(annotated_frame, f"FPS: {int(fps)}", (10, 60), 
                        cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
            
            # Gửi lệnh điều khiển / Control Commands
            if cx is not None:
                # Tính toán PID giả lập / Simulated PID computation
                velocity_yaw = compute_pid_x(err_x, dt)
                
                # Hiển thị thông báo trên Console / Log to console
                print(f"[TRACKING] Đang theo dõi. Tọa độ: ({cx}, {cy}) | Yaw Cmd: {velocity_yaw:.3f} rad/s")
                
                # TODO: Sử dụng MAVLink để gửi vận tốc thực tế
                # Gỉa mã: send_mavlink_velocity_yaw(velocity_yaw)
                
            else:
                # Không thấy vật, lệnh dừng / No object, send STOP
                print("[IDLE] Không tìm thấy vật thể, Drone đang hover... / No object detected, hovering...")
                # TODO: send_mavlink_velocity_yaw(0.0)
                
            # Hiển thị kết quả (Cửa sổ GUI) / Display results
            cv2.imshow("Drone CV Pipeline", annotated_frame)
            cv2.imshow("Mask Debug", mask)
            
            # Quản lý sự kiện bàn phím / Keyboard event handler
            # Bấm 'q' để thoát / Press 'q' to quit
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
                
    except KeyboardInterrupt:
        print("Đã dừng bởi người dùng (Ctrl+C) / Stopped by user")
    finally:
        # Giải phóng tài nguyên Camera và cửa sổ / Release resources
        cap.release()
        cv2.destroyAllWindows()
        print("Đã giải phóng tài nguyên. Hệ thống kết thúc. / System shutdown.")

if __name__ == '__main__':
    main()
```

### Chú Ý An Toàn Thực Hành (Safety Warnings)
> **[CẢNH BÁO MỨC ĐỘ CAO / HIGH LEVEL WARNING]**
> - **Luôn tháo hoàn toàn toàn bộ cánh quạt (Remove All Propellers)** khi kiểm thử các thuật toán Computer Vision có liên kết vòng lặp kín (closed-loop) với Flight Controller trên bàn làm việc (Workbench). 
> - Một lỗi phần mềm như chia cho 0, hoặc giá trị lỗi âm dương bị đảo ngược (ví dụ nhầm lẫn tọa độ Y hướng xuống của hình ảnh OpenCV với hệ tọa độ NED cục bộ của không gian) có thể khiến động cơ quay cực max công suất một cách bất ngờ, dẫn đến tai nạn nghiêm trọng (lưỡi cắt, hỏa hoạn).
> - **Always remove propellers** when bench-testing CV algorithms combined with the Flight Controller. A logic bug, unexpected sign inversion (e.g. confusing OpenCV's top-left origin with the world's NED coordinate frame) can cause engines to spin up to maximum throttle unexpectedly, causing severe injuries.

---

## Bài Tập / Exercises

1. **Thay đổi không gian màu (Color space modification)**
   - 🇻🇳 Sửa đổi đoạn code trên để nhận diện màu Xanh dương (Blue) hoặc Xanh lá (Green) thay vì màu Đỏ. Tham khảo các công cụ "HSV Color Picker" online để lấy dải màu chính xác.
   - 🇬🇧 Modify the code above to detect Blue or Green colors instead of Red. Use online "HSV Color Picker" tools to obtain the exact ranges.
2. **Lọc nhiễu (Noise Filtering)**
   - 🇻🇳 Thử nghiệm thay đổi các giá trị kích thước kernel (ví dụ `(3,3)`, `(7,7)`, `(11,11)`) cho hàm `cv2.morphologyEx`. Quan sát xem nhiễu ở hậu cảnh thay đổi thế nào trên cửa sổ "Mask Debug".
   - 🇬🇧 Experiment with different kernel sizes (e.g., `(3,3)`, `(7,7)`) for `cv2.morphologyEx`. Observe how the background noise changes in the "Mask Debug" window.
3. **Phát Hiện ArUco Marker Cơ Bản (Basic ArUco Marker Detection)**
   - 🇻🇳 Sử dụng thư viện `cv2.aruco`, viết một script phụ (mini-script) mở webcam và phát hiện ID của một Marker (từ bộ `DICT_4X4_50`) được in ra giấy. Vẽ ID và hộp giới hạn lên khung hình.
   - 🇬🇧 Using the `cv2.aruco` library, write a mini-script to open the webcam and detect the ID of a Marker (from `DICT_4X4_50` dictionary) printed on paper. Draw the ID and bounding box on the frame.
4. **Logic Tìm Vật Thể (Search Logic)**
   - 🇻🇳 Hiện tại, nếu mất dấu, Drone sẽ đứng im (Hover). Cập nhật mã nguồn sao cho khi `cx is None`, drone bắt đầu quay từ từ (Yaw) tại chỗ để quét tìm lại vật thể đỏ trong tối đa 10 giây.
   - 🇬🇧 Currently, if sight is lost, the Drone hovers. Update the logic so that when `cx is None`, the drone initiates a slow spin (Yaw) in place to search for the red object for up to 10 seconds.

---

## Câu Hỏi Thảo Luận / Discussion Questions

1. **Về Không Gian Màu (On Color Spaces):**
   🇻🇳 Tại sao không gian màu HSV lại được ưu tiên sử dụng trong các bài toán tracking ngoài trời so với hệ màu RGB truyền thống? Bóng râm của đám mây làm ảnh hưởng đến yếu tố nào của HSV?
   🇬🇧 Why is the HSV color space prioritized in outdoor tracking tasks over traditional RGB? Which HSV component is affected by the shadow of a passing cloud?

2. **Về Hiệu Năng Xử Lý (Processing Performance):**
   🇻🇳 Trong kiến trúc pipeline của chúng ta, độ trễ hệ thống (system latency) làm suy yếu khả năng ổn định của vòng lặp PID. Điều gì xảy ra nếu thuật toán xử lý ảnh trên Raspberry Pi tốn quá 150ms mỗi khung hình (< 7 FPS)?
   🇬🇧 In our pipeline architecture, system latency degrades PID loop stability. What happens if the image processing algorithm on the Raspberry Pi takes over 150ms per frame (< 7 FPS)?

3. **Về Tối Ưu (Optimization):**
   🇻🇳 Nếu chúng ta sử dụng RPi 4 kết hợp camera USB 1080p gốc, chúng ta nên giảm tỷ lệ (downscale) hình ảnh xuống độ phân giải nào để duy trì mức độ FPS cao (>25 FPS)? Việc Crop khung hình (Region of Interest) khác với Downscale ở điểm nào?
   🇬🇧 If using an RPi 4 with a native 1080p USB camera, to what resolution should we downscale the image to maintain a high FPS (>25 FPS)? How does cropping a Region of Interest differ from Downscaling?

4. **Về Định Vị Không GPS (GPS-Denied Navigation):**
   🇻🇳 Cảm biến Optical Flow (luồng quang học) như px4flow đo lường cái gì ở bản chất vật lý? Ưu điểm của nó so với việc chỉ dùng IMU (Gia tốc kế + Con quay hồi chuyển) để ước lượng vị trí là gì?
   🇬🇧 What physical quantity does an Optical Flow sensor like px4flow fundamentally measure? What is its advantage over relying solely on an IMU (Accelerometer + Gyro) for position estimation?

5. **Về Ứng Dụng Nâng Cao (Advanced Applications):**
   🇻🇳 Giải thích nguyên lý cách ArUco marker hỗ trợ Drone thực hiện "Hạ cánh chính xác" (Precision Landing). Tại sao các hệ thống thực tế thường sử dụng một cụm (nest) nhiều Marker to nhỏ lồng vào nhau thay vì chỉ 1 marker lớn?
   🇬🇧 Explain the principle of how ArUco markers assist Drones in performing "Precision Landing." Why do real-world systems often use a nested cluster of large and small Markers rather than just a single large one?

---

## Bài Về Nhà / Homework

1. 🇻🇳 **Thực Hành: Tích hợp Camera vào Drone thật (Hardware Integration):** 
   Lắp đặt vững chắc máy tính Raspberry Pi và mô-đun Camera lên khung sợi carbon của drone. 
   - Yêu cầu: Sử dụng một bộ điều áp cấp điện độc lập mạch BEC 5V/3A (Battery Elimination Circuit) để cấp riêng cho RPi. Không được lấy nguồn 5V từ các chân Telem của Pixhawk vì dòng xả không đủ, sẽ gây sập nguồn FC giữa không trung (Brown-out).
   - Báo cáo: Quay video 2 phút trình bày quá trình đi dây, cắm cáp CSI, cách lắp giá đỡ chống rung và giải thích luồng cấp nguồn. Upload video hoặc link Google Drive vào báo cáo tuần.
   🇬🇧 **Practice: Real Drone Camera Integration:**
   Securely mount the Raspberry Pi and Camera module onto the drone's carbon fiber frame.
   - Requirement: Use an independent 5V/3A BEC to power the RPi. Do not draw 5V power from the Pixhawk's Telem ports as the current rating is insufficient and will cause a mid-air FC brown-out.
   - Report: Record a 2-minute video showing the wiring, CSI cable routing, anti-vibration mount placement, and explain the power flow. Submit the link in your weekly report.
   
2. 🇻🇳 **Nghiên cứu Cải Tiến (Algorithm Enhancement):** 
   Tham khảo lý thuyết thuật toán nhận diện ở chương trình OpenCV nâng cao, viết một phiên bản cập nhật của hàm `process_frame`. Chuyển đổi mã nguồn này từ việc bắt màu đỏ thủ công sang nạp một mô hình "Haar Cascade" hoặc mô hình Deep Learning nhẹ gọn (SSD MobileNet) để phát hiện khuôn mặt người (Face Detection).
   🇬🇧 **Research Algorithm Enhancement:**
   Referring to advanced OpenCV recognition techniques, write an updated version of `process_frame`. Transition the code from manual red-color thresholding to loading a lightweight pre-trained "Haar Cascade" or Deep Learning model (SSD MobileNet) to perform Face Detection.

---

## Đánh Giá / Assessment Rubric

| Tiêu chí / Criteria | Điểm / Score | Mô tả (VN) | Description (EN) |
|---------------------|--------------|------------|------------------|
| **Hiểu Lý Thuyết CV** (Theory) | 20% | Nắm rõ nguyên lý xử lý ảnh, hệ tọa độ không gian BGR/HSV, và các đánh đổi độ trễ. | Understands image processing principles, BGR/HSV color spaces, and latency trade-offs. |
| **Kỹ Năng Lập Trình** (Coding) | 30% | Viết code OpenCV chạy đúng chuẩn Python, tổ chức tốt, tối ưu FPS bằng Downscale/Masking. | Writes proper OpenCV Python code, well-organized, optimizes FPS via Downscale/Masking. |
| **Setup Phần Cứng** (Hardware) | 20% | Gắn RPi & Camera chắc chắn trên drone, bố trí mạch BEC cấp nguồn đúng tiêu chuẩn kỹ thuật an toàn. | Mounts RPi & Camera securely, properly implements BEC power standards for safety. |
| **Kiến Trúc Tích Hợp** (Integration) | 20% | Hiểu rõ luồng truyền tín hiệu: Frame -> CV Offset -> PID -> MAVLink -> FC PWM motor. | Grasps the signal flow: Frame -> CV Offset -> PID -> MAVLink -> FC PWM motor outputs. |
| **Báo Cáo Thực Hành** (Report) | 10% | Hoàn thành đầy đủ bài tập nâng cao, nộp video có quay giải thích rõ ràng và mạch lạc. | Completes advanced exercises, submits video with clear and coherent explanations. |

---
**Giảng viên / Instructor:** DIY Drone Building Course Team
**Phiên bản tài liệu / Document Version:** 1.0

### Tài Liệu Tham Khảo (References):
- [OpenCV Python Official Tutorials](https://docs.opencv.org/master/d6/d00/tutorial_py_root.html)
- [Ardupilot Companion Computers Documentation](https://ardupilot.org/dev/docs/companion-computers.html)
- [ArUco marker detection in OpenCV](https://docs.opencv.org/master/d5/dae/tutorial_aruco_detection.html)
- [PX4Flow Smart Camera Documentation](https://docs.px4.io/main/en/sensor/px4flow.html)
