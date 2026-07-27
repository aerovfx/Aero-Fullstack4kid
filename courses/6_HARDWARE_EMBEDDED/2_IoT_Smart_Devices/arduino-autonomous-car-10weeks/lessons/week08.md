# Tuần 8: Nhận Diện Vật Cản với OpenCV & Cảm Biến / Week 8: Obstacle Detection with OpenCV & Sensors

## Mục Tiêu / Objectives
Trong tuần này, học viên sẽ tìm hiểu sâu về các chiến lược tránh vật cản (obstacle avoidance) cho xe tự hành. Chúng ta sẽ kết hợp các thuật toán lý thuyết như Vector Field Histogram, Bug algorithms, và Potential Field với việc áp dụng thực tế bằng cách sử dụng đa cảm biến (multi-sensor fusion) và thị giác máy tính (computer vision) thông qua thư viện OpenCV. 
Kết thúc bài học, xe của bạn có thể tự động né tránh chướng ngại vật tĩnh và động trong thời gian thực, đảm bảo sự di chuyển an toàn và thông minh trong môi trường phức tạp.

This week, students will dive deep into obstacle avoidance strategies for autonomous vehicles. We will combine theoretical algorithms such as Vector Field Histogram, Bug algorithms, and Potential Fields with practical applications using multi-sensor fusion and computer vision via OpenCV. 
By the end of this lesson, your car will be able to autonomously avoid both static and dynamic obstacles in real-time, ensuring safe and intelligent navigation in complex environments.

**Các mục tiêu cụ thể / Specific objectives:**
1. Hiểu và cài đặt được các thuật toán tránh vật cản cơ bản như Reactive, Planned, và Hybrid. / Understand and implement basic obstacle avoidance algorithms such as Reactive, Planned, and Hybrid approaches.
2. Thiết lập hệ thống đa cảm biến bao gồm siêu âm, hồng ngoại và camera một cách đồng bộ. / Set up a synchronized multi-sensor system including ultrasonic, IR, and camera.
3. Sử dụng OpenCV để nhận diện vật cản dựa trên màu sắc, hình dáng và ước lượng độ sâu một cách hiệu quả. / Use OpenCV to efficiently detect obstacles based on color, shape, and depth estimation.
4. Xây dựng một cỗ máy trạng thái (state machine) mạnh mẽ và linh hoạt cho hành vi điều hướng. / Build a robust and flexible state machine for navigation behaviors.
5. Học cách xử lý các tình huống góc cạnh (edge cases) như gặp góc hẹp (dead ends) hoặc vật cản di chuyển nhanh. / Learn how to handle edge cases like dead ends or fast-moving obstacles.

## Công Cụ & Phần Mềm / Tools & Software
Để hoàn thành bài học này, học viên cần chuẩn bị đầy đủ các công cụ sau:
To complete this lesson, students need to prepare the following tools:

**Phần Cứng (Hardware):**
- Khung xe tự hành đã lắp ráp từ các tuần trước (bao gồm động cơ, bánh xe, mạch điều khiển motor L298N hoặc tương đương). / Assembled autonomous car chassis from previous weeks (including motors, wheels, L298N motor driver or equivalent).
- Raspberry Pi 4 (hoặc máy tính nhúng tương đương như Jetson Nano) để xử lý hình ảnh và logic bậc cao. / Raspberry Pi 4 (or equivalent embedded computer like Jetson Nano) for image processing and high-level logic.
- Arduino Uno/Mega làm vi điều khiển phụ đảm nhiệm xử lý tín hiệu phần cứng thời gian thực. / Arduino Uno/Mega as a secondary microcontroller handling real-time hardware signals.
- 3x Cảm biến khoảng cách siêu âm HC-SR04. / 3x HC-SR04 Ultrasonic Distance Sensors.
- 2x Cảm biến hồng ngoại dò vạch (IR sensors) dùng để phát hiện mép bàn hoặc cầu thang. / 2x Infrared (IR) line tracking sensors used for edge detection (e.g., table edges or stairs).
- Camera module (Pi Camera V2 hoặc USB Webcam tiêu chuẩn). / Camera module (Pi Camera V2 or standard USB Webcam).
- Nguồn cấp điện đủ mạnh (Pin Li-Po 2S/3S) và module hạ áp (Buck converter) cho Pi và Arduino. / Sufficient power supply (2S/3S Li-Po battery) and buck converters for the Pi and Arduino.

**Phần Mềm (Software):**
- Hệ điều hành Linux (Raspberry Pi OS hoặc Ubuntu). / Linux Operating System (Raspberry Pi OS or Ubuntu).
- Python 3.7+, thư viện OpenCV (`cv2`), Numpy, và Pyserial. / Python 3.7+, OpenCV (`cv2`), Numpy, and Pyserial libraries.
- Arduino IDE (phiên bản mới nhất) cho việc biên dịch và nạp code cho vi điều khiển. / Arduino IDE (latest version) for compiling and flashing the microcontroller.
- Môi trường phát triển (IDE) như VSCode hoặc Thonny. / Development environment (IDE) such as VSCode or Thonny.

## Lý Thuyết / Theory

### 1. Phân Loại Các Chiến Lược Tránh Vật Cản / Classification of Obstacle Avoidance Strategies
Tránh vật cản là một trong những thành phần cốt lõi của bất kỳ hệ thống robot tự hành nào, từ xe tự hành đơn giản đến các hệ thống xe tự lái tiên tiến (như Tesla Autopilot hay Waymo). Có ba cách tiếp cận chính, mỗi cách có ưu và nhược điểm riêng:
Obstacle avoidance is one of the core components of any autonomous robotic system, from simple rovers to advanced self-driving cars (like Tesla Autopilot or Waymo). There are three main approaches, each with its own pros and cons:

**A. Phương Pháp Phản Xạ (Reactive Approach)**
Phương pháp phản xạ hoạt động dựa trên dữ liệu cảm biến tức thời (real-time) mà không cần bản đồ môi trường. 
The reactive method works based on instantaneous (real-time) sensor data without requiring an environmental map.
- *Vector Field Histogram (VFH):* Đây là một thuật toán cực kỳ phổ biến. Không gian xung quanh robot được chia thành các lưới (grid) chứa xác suất có vật cản. VFH tạo ra một biểu đồ hướng (histogram) cực (polar histogram) từ các điểm dữ liệu này. Nó lọc ra các hướng bị chặn và chọn một hướng đi có mật độ vật cản thấp nhất nhưng lại gần với mục tiêu (goal) nhất. 
- *Ưu điểm (Pros):* Tốc độ phản hồi cực nhanh, tốn ít tài nguyên tính toán. Rất tốt cho các vật cản bất ngờ. (Extremely fast response time, low computational cost. Great for sudden obstacles.)
- *Nhược điểm (Cons):* Dễ bị kẹt ở các dạng vật cản hình chữ U (U-shaped traps) do thiếu tầm nhìn toàn cục. (Prone to getting stuck in U-shaped traps due to lack of global vision.)

**B. Phương Pháp Kế Hoạch (Planned/Global Approach)**
Đây là cách tiếp cận toàn cục (global). Robot được cung cấp một bản đồ từ trước, nó biết vị trí hiện tại và mục tiêu.
This is a global approach. The robot is provided a map in advance, knows its current position and the target.
- Robot sử dụng các thuật toán như A* (A-Star), Dijkstra, hoặc RRT (Rapidly-exploring Random Tree) để tính toán đường đi ngắn nhất hoặc an toàn nhất từ điểm A đến điểm B.
- *Ưu điểm (Pros):* Đảm bảo tìm được đường đi nếu có tồn tại đường đi, tránh được ngõ cụt. (Guarantees finding a path if one exists, avoids dead ends.)
- *Nhược điểm (Cons):* Phụ thuộc nhiều vào bản đồ. Nếu môi trường thay đổi (xuất hiện vật cản mới chưa có trong bản đồ), robot phải tính toán lại đường đi (re-planning), việc này tốn nhiều thời gian và CPU, đôi khi khiến xe phải dừng hẳn lại để suy nghĩ. (Heavily dependent on the map. If the environment changes, re-planning is computationally expensive and slow.)

**C. Phương Pháp Lai (Hybrid Approach)**
Trong thực tế, tất cả các hệ thống xe tự hành hiện đại đều sử dụng kiến trúc lai. 
In practice, all modern autonomous vehicle systems use a hybrid architecture.
- Tầng lập kế hoạch toàn cục (Global Planner) chạy ở tần số thấp (ví dụ 1Hz) sử dụng A* để tìm lộ trình tổng thể dựa trên bản đồ tĩnh.
- Tầng phản xạ cục bộ (Local Planner) chạy ở tần số cao (ví dụ 50Hz) sử dụng các thuật toán như VFH hoặc Potential Field để thực hiện việc tránh vật cản động cục bộ (local avoidance).
- (Global Planner runs at low frequency using A* for overall route. Local Planner runs at high frequency using VFH or Potential Field for immediate dynamic avoidance.)

### 2. Các Thuật Toán Bug: Bug0, Bug1, Bug2 (Bug Algorithms)
Thuật toán Bug là những phương pháp di chuyển mang tính chắp vá nhưng rất hiệu quả cho robot khi không có bản đồ, chỉ có khả năng nhận biết chướng ngại vật cục bộ và có la bàn chỉ hướng về đích.
Bug algorithms are ad-hoc but highly effective navigation methods for robots without a map, having only local obstacle sensing and a compass pointing to the goal.

- **Bug0:** 
  - Quy tắc: Đi thẳng về phía mục tiêu. Nếu gặp vật cản, đi dọc theo chu vi của vật cản sang một hướng ngẫu nhiên (hoặc cố định, ví dụ luôn rẽ phải) cho đến khi hướng tới mục tiêu được giải phóng hoàn toàn, sau đó lại tiếp tục đi thẳng.
  - (Rule: Move straight toward the target. If an obstacle is hit, follow the perimeter until the direction to the target is fully cleared, then resume straight movement.)
  - Hạn chế: Có thể bị kẹt trong vòng lặp vô hạn ở những vật cản có hình dạng phức tạp. (Limitation: Can easily get stuck in infinite loops with complex shapes.)

- **Bug1:** 
  - Quy tắc: Khi chạm vật cản ở điểm Q, robot lưu lại điểm này. Nó sẽ đi vòng quanh toàn bộ chu vi của vật cản cho đến khi quay lại điểm Q. Trong quá trình đó, nó ghi nhớ điểm có khoảng cách gần mục tiêu nhất (gọi là P). Sau khi hoàn thành một vòng, robot đi ngược lại (hoặc đi tiếp tùy chiều nào ngắn hơn) dọc theo chu vi để đến đúng điểm P, rồi rời vật cản và đi thẳng tới mục tiêu.
  - (Rule: When hitting an obstacle at point Q, circle the entire perimeter. Record the point closest to the goal (point P). Return to point P and head to the goal.)
  - Hạn chế: Rất an toàn, đảm bảo đến đích nếu có thể, nhưng cực kỳ kém hiệu quả về mặt quãng đường (phải đi hết cả chu vi vật cản, có thể rất lớn). (Safe, but highly inefficient regarding distance.)

- **Bug2:** 
  - Quy tắc: Robot duy trì một đường thẳng ảo (gọi là m-line) từ điểm xuất phát ban đầu đến đích. Nó di chuyển dọc theo m-line. Khi gặp vật cản, nó đi dọc theo biên của vật cản. Nó tiếp tục bám theo vật cản cho đến khi nó giao cắt lại với m-line ở một điểm *gần đích hơn* điểm chạm ban đầu. Khi đó, nó rời vật cản và tiếp tục đi trên m-line.
  - (Rule: Maintain an imaginary m-line from start to goal. When hitting an obstacle, follow its boundary until intersecting the m-line at a point closer to the goal than the initial hit point. Then resume on the m-line.)
  - Đây là sự thỏa hiệp xuất sắc giữa tốc độ của Bug0 và sự an toàn của Bug1. (Excellent compromise between Bug0's speed and Bug1's safety.)

### 3. Phương Pháp Trường Thế Mềm (Artificial Potential Field Method)
Một cách tiếp cận rất toán học và trực quan là Phương pháp Trường Thế (Potential Field).
A highly mathematical and intuitive approach is the Artificial Potential Field method.

Tưởng tượng robot là một hạt mang điện tích dương dương. 
- Điểm đích (Goal) được gán điện tích âm rất mạnh, do đó nó sinh ra một lực hút (Attractive Force) kéo robot lại gần.
- Các vật cản (Obstacles) được gán điện tích dương, do đó chúng sinh ra lực đẩy (Repulsive Force) đẩy robot ra xa.
- Lực đẩy này tỉ lệ nghịch với khoảng cách (càng gần vật cản, lực đẩy càng lớn theo hàm mũ).
- Tại mỗi chu kỳ, hệ thống tính tổng các vector lực (Tổng = Lực hút + Tổng các Lực đẩy từ các vật cản). Vector kết quả sẽ quyết định vận tốc (speed) và góc lái (steering angle) của xe.
- (Imagine the robot as a positively charged particle. Goal is negative (attractive). Obstacles are positive (repulsive). The resulting vector sum dictates speed and steering.)

**Toán học cơ bản (Basic Math):**
- Lực hút (F_att) = k_att * (P_goal - P_robot)
- Lực đẩy (F_rep) = k_rep * (1/d - 1/d0) * (1/d^2) * (P_robot - P_obstacle) nếu d < d0 (d là khoảng cách hiện tại, d0 là ngưỡng ảnh hưởng). Nếu d >= d0, F_rep = 0.
Vấn đề lớn nhất của phương pháp này là **Điểm tối thiểu cục bộ (Local Minima)**, nơi tổng lực bằng 0 (ví dụ khi vật cản nằm chính xác giữa robot và đích), làm robot bị kẹt đứng yên. Để giải quyết, người ta thường dùng Random Walk (đi ngẫu nhiên một chút) khi vận tốc gần bằng 0 quá lâu.

### 4. Đa Cảm Biến & Hợp Nhất Dữ Liệu (Multi-sensor Fusion)
Không một cảm biến đơn lẻ nào là hoàn hảo. Chúng ta phải kết hợp nhiều loại cảm biến để che lấp điểm yếu của nhau.
No single sensor is perfect. We must combine multiple sensor types to cover each other's weaknesses.

- **3x HC-SR04 (Siêu Âm / Ultrasonic):** 
  - Đặt ở phía trước (Front), chéo trái (Left 45 deg), và chéo phải (Right 45 deg). 
  - Cung cấp khoảng cách khá chính xác (lên tới 4m). 
  - Nhược điểm: Góc quét hẹp, dễ bị phản xạ sai (specular reflection) khi gặp bề mặt nhẵn nghiêng góc, vật liệu xốp hấp thụ sóng âm. (Narrow beam, prone to specular reflection on angled smooth surfaces, absorbed by soft materials.)
- **IR Sensors (Hồng ngoại):** 
  - Tốc độ phản hồi ánh sáng tức thời. Dùng để phát hiện các vật cản ở tầm rất gần (dưới 10cm) nơi mà siêu âm bị "mù" (blind spots). Hoặc quay xuống đất để phát hiện vực thẳm (cầu thang).
- **Camera (Thị Giác / Vision):** 
  - Cung cấp dữ liệu không gian hai chiều cực kỳ phong phú. Có thể phân biệt được màu sắc, hình dáng, đọc biển báo, nhận diện người.
  - Nhược điểm: Phụ thuộc vào ánh sáng môi trường (thiếu sáng hoặc ngược sáng đều làm hỏng thuật toán), tốn rất nhiều năng lượng CPU để xử lý. (Dependent on lighting, high CPU cost.)

### 5. Nhận Diện Vật Cản Bằng OpenCV / OpenCV for Obstacle Detection
Bên cạnh cảm biến khoảng cách thuần túy, chúng ta sẽ dùng Camera để nhận diện chướng ngại vật phức tạp hơn bằng Computer Vision.
Besides pure distance sensors, we will use a Camera to detect more complex obstacles using Computer Vision.

**A. Depth Estimation (Ước lượng độ sâu):** 
Nếu có stereo camera (2 mắt), ta có thể tính toán bản đồ độ sâu (Depth Map) dễ dàng thông qua thuật toán Disparity. Với monocular camera (1 mắt) như chúng ta đang dùng, ta có thể dùng kích thước bounding box (khung bao quanh vật thể) hoặc vị trí y (đáy của vật thể trên ảnh) để ước lượng khoảng cách. Kỹ thuật này gọi là Inverse Perspective Mapping (IPM) hoặc sử dụng các mô hình Deep Learning nhẹ như MiDaS.

**B. Color-based Obstacle Detection (Nhận diện theo màu sắc):** 
Để đơn giản hóa bài toán, chúng ta sẽ thiết lập môi trường sao cho các vật cản nguy hiểm được đánh dấu bằng màu đặc trưng, ví dụ: hình nón màu đỏ (red traffic cones). 
- Chuyển đổi không gian màu từ BGR (tiêu chuẩn của OpenCV) sang HSV (Hue, Saturation, Value).
- HSV tốt hơn RGB vì nó tách biệt thông tin màu (Hue) khỏi cường độ sáng (Value), giúp thuật toán bền bỉ hơn khi ánh sáng thay đổi.
- Chúng ta dùng hàm `cv2.inRange()` để tạo mask (mặt nạ) giữ lại các pixel màu đỏ, sau đó dùng `cv2.findContours()` để tìm biên giới vật thể, và bao nó bằng `cv2.boundingRect()`.

### 6. Cỗ Máy Trạng Thái Tránh Vật Cản / Avoidance Behavior State Machine
Quá trình đưa ra quyết định của xe không thể viết bằng chuỗi `if-else` lộn xộn. Nó phải được mô hình hóa bằng cỗ máy trạng thái hữu hạn (Finite State Machine - FSM):
The decision-making process cannot be written as a messy string of `if-else`. It must be modeled using a Finite State Machine (FSM):

- **Trạng thái khởi tạo (INIT):** Xe đứng yên, khởi động cảm biến, camera.
- **Trạng thái tiến (FORWARD):** Mặc định, xe chạy thẳng về phía trước ở tốc độ duy trì.
- **Trạng thái đánh giá (ASSESS):** Ngay khi *bất kỳ* cảm biến nào báo có vật cản gần. Xe giảm tốc hoặc dừng hẳn, phân tích dữ liệu từ 3 siêu âm và camera để quyết định né hướng nào an toàn hơn.
- **Trạng thái né trái/phải (AVOID_LEFT / AVOID_RIGHT):** Thực hiện lệnh bẻ lái hoặc quay lốp ngược chiều (đối với xe 4 bánh độc lập) để né vật cản. 
- **Trạng thái khôi phục (RESUME):** Sau khi né xong, xe chạy vòng cung trở lại hướng cũ để tiếp tục quỹ đạo m-line ban đầu.
- **Trạng thái khẩn cấp (STOP):** Nếu vật cản ở khoảng cách tử thần (< 10cm), ngắt nguồn động cơ ngay lập tức.

## Code Python / Python Code

Dưới đây là mã nguồn Python đầy đủ và chi tiết cho lớp `ObstacleDetector` sử dụng OpenCV và trạng thái máy móc FSM. Hãy đảm bảo bạn đã cài `opencv-python` và `numpy` trên Raspberry Pi.
Below is the complete and detailed Python source code for the `ObstacleDetector` class using OpenCV and the FSM state machine. Ensure you have installed `opencv-python` and `numpy` on the Pi.

```python
import cv2
import numpy as np
import time
from enum import Enum

# Định nghĩa các trạng thái cho FSM
# Define states for Finite State Machine
class State(Enum):
    INIT = 0
    FORWARD = 1
    ASSESS = 2
    AVOID_LEFT = 3
    AVOID_RIGHT = 4
    STOP = 5
    RESUME = 6

class ObstacleDetector:
    def __init__(self, camera_index=0, serial_port=None):
        """
        Khởi tạo hệ thống nhận diện.
        Initialize the detection system.
        :param camera_index: Chỉ số camera (thường là 0 cho camera mặc định)
        :param serial_port: Cổng serial giao tiếp với Arduino (vd: '/dev/ttyACM0')
        """
        print("[INIT] Booting up Obstacle Detection System...")
        
        # Khởi tạo camera với độ phân giải thấp để tăng FPS
        # Initialize camera with low resolution to boost FPS
        self.cap = cv2.VideoCapture(camera_index)
        self.cap.set(cv2.CAP_PROP_FRAME_WIDTH, 320)
        self.cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 240)
        
        # Kiểm tra xem camera có mở thành công không
        if not self.cap.isOpened():
            print("[ERROR] Camera cannot be opened. Check hardware connection!")
            exit()
            
        self.current_state = State.FORWARD
        self.last_state_change = time.time()
        
        # Định nghĩa dải màu đỏ trong không gian HSV (để tìm red cones)
        # Define red color range in HSV space (to find red cones)
        # Chú ý: Màu đỏ trong HSV bị chia làm 2 dải ở 2 đầu của phổ màu (0-10 và 170-180)
        # Note: Red color in HSV wraps around the hue spectrum (0-10 and 170-180)
        self.lower_red1 = np.array([0, 100, 100])
        self.upper_red1 = np.array([10, 255, 255])
        self.lower_red2 = np.array([160, 100, 100])
        self.upper_red2 = np.array([180, 255, 255])
        
        # Thông số cấu hình an toàn (cm)
        # Safety configuration parameters (cm)
        self.SAFE_DISTANCE = 40.0
        self.CRITICAL_DISTANCE = 15.0
        self.RESUME_TIME = 1.5 # Giây / Seconds

    def process_vision(self, frame):
        """
        Xử lý hình ảnh để nhận diện chướng ngại vật màu đỏ
        Process image to detect red color obstacles
        Trả về: (Boolean có vật cản, Tọa độ bounding box, Tọa độ tâm X)
        Returns: (Boolean is_obstacle, Bounding Box tuple, Center X coordinate)
        """
        # Áp dụng Gaussian Blur để giảm nhiễu trước khi chuyển màu
        # Apply Gaussian Blur to reduce noise before color conversion
        blurred = cv2.GaussianBlur(frame, (11, 11), 0)
        hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
        
        # Tạo mask kết hợp cho cả 2 dải màu đỏ
        # Create combined mask for both red ranges
        mask1 = cv2.inRange(hsv, self.lower_red1, self.upper_red1)
        mask2 = cv2.inRange(hsv, self.lower_red2, self.upper_red2)
        mask = cv2.bitwise_or(mask1, mask2)
        
        # Các phép toán hình thái học (Morphological Operations) để loại bỏ nhiễu hạt
        # Morphological operations to remove speckle noise
        kernel = np.ones((5,5), np.uint8)
        mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel, iterations=2) # Xóa nhiễu trắng / Remove white noise
        mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel, iterations=2) # Lấp lỗ đen / Fill black holes
        
        # Tìm các đường viền (contours) trong mask
        # Find contours in the mask
        contours, hierarchy = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        
        if len(contours) > 0:
            # Tìm contour có diện tích lớn nhất (vật cản gần nhất / to nhất)
            # Find the largest contour (closest / largest obstacle)
            c = max(contours, key=cv2.contourArea)
            area = cv2.contourArea(c)
            
            # Nếu diện tích đủ lớn (để loại bỏ các vật nhỏ hoặc ở quá xa)
            # If area is large enough (to ignore small or distant objects)
            if area > 1500:
                x, y, w, h = cv2.boundingRect(c)
                cx = x + (w // 2)
                return True, (x, y, w, h), cx
                
        return False, None, -1

    def fsm_update(self, cv_obstacle, cv_cx, frame_width, sonar_front, sonar_left, sonar_right):
        """
        Hàm cập nhật trạng thái FSM lõi. 
        Core FSM update function.
        Đầu vào là các dữ liệu tổng hợp (Fusion data) từ Camera và Siêu âm.
        Input is fusion data from Camera and Ultrasonic sensors.
        """
        # Tính toán xem vật cản trên camera nằm bên trái hay phải khung hình
        # Determine if visual obstacle is on the left or right of the frame
        is_cv_obs_left = False
        is_cv_obs_right = False
        if cv_obstacle:
            if cv_cx < frame_width // 2:
                is_cv_obs_left = True
            else:
                is_cv_obs_right = True

        # Trạng thái FORWARD: Đi thẳng, kiểm tra cảm biến liên tục
        if self.current_state == State.FORWARD:
            if sonar_front < self.SAFE_DISTANCE or cv_obstacle:
                print(f"[{time.time():.2f}] [FSM] Obstacle detected! Switching to ASSESS.")
                self.current_state = State.ASSESS
                
        # Trạng thái ASSESS: Dừng lại phân tích xem nên né hướng nào
        elif self.current_state == State.ASSESS:
            if sonar_front < self.CRITICAL_DISTANCE:
                self.current_state = State.STOP
            else:
                # So sánh không gian trống 2 bên
                # Cả không gian trống từ siêu âm lẫn phân tích ảnh đều được xem xét
                left_score = sonar_left
                right_score = sonar_right
                
                # Phạt (penalize) hướng nếu camera thấy có vật cản đỏ bên đó
                if is_cv_obs_left: left_score -= 20
                if is_cv_obs_right: right_score -= 20
                
                if left_score > right_score:
                    print(f"[{time.time():.2f}] [FSM] Decision: Turn LEFT. (Scores: L={left_score:.1f}, R={right_score:.1f})")
                    self.current_state = State.AVOID_LEFT
                else:
                    print(f"[{time.time():.2f}] [FSM] Decision: Turn RIGHT. (Scores: L={left_score:.1f}, R={right_score:.1f})")
                    self.current_state = State.AVOID_RIGHT
                    
        # Trạng thái AVOID_LEFT: Đang né trái
        elif self.current_state == State.AVOID_LEFT:
            # Điều kiện thoát: Phía trước đã hoàn toàn trống trải
            # Exit condition: Front is completely clear
            if sonar_front > self.SAFE_DISTANCE * 1.5 and not cv_obstacle:
                print(f"[{time.time():.2f}] [FSM] Path clear. Switching to RESUME.")
                self.current_state = State.RESUME
                self.last_state_change = time.time()
                
        # Trạng thái AVOID_RIGHT: Đang né phải
        elif self.current_state == State.AVOID_RIGHT:
            if sonar_front > self.SAFE_DISTANCE * 1.5 and not cv_obstacle:
                print(f"[{time.time():.2f}] [FSM] Path clear. Switching to RESUME.")
                self.current_state = State.RESUME
                self.last_state_change = time.time()
                
        # Trạng thái RESUME: Vòng lại quỹ đạo cũ trong một khoảng thời gian
        elif self.current_state == State.RESUME:
            if time.time() - self.last_state_change > self.RESUME_TIME:
                print(f"[{time.time():.2f}] [FSM] Resumed successfully. Switching to FORWARD.")
                self.current_state = State.FORWARD
                
        # Trạng thái STOP: Chướng ngại vật quá gần, dừng khẩn cấp
        elif self.current_state == State.STOP:
            # Chỉ đi tiếp nếu có ai đó dời vật cản ra xa
            if sonar_front > self.SAFE_DISTANCE:
                print(f"[{time.time():.2f}] [FSM] Obstacle cleared. Switching to ASSESS.")
                self.current_state = State.ASSESS

        return self.current_state

    def send_motor_command(self, state):
        """
        Dựa vào trạng thái hiện tại, giả lập gửi lệnh điều khiển tới Arduino.
        Trong thực tế, bạn sẽ dùng thư viện pyserial để ghi dữ liệu:
        serial.write(b'W')
        """
        cmd_str = "IDLE"
        if state == State.FORWARD:
            cmd_str = "MOVING FORWARD (W)"
        elif state == State.ASSESS or state == State.STOP:
            cmd_str = "STOPPED (S)"
        elif state == State.AVOID_LEFT:
            cmd_str = "TURNING LEFT (A)"
        elif state == State.AVOID_RIGHT:
            cmd_str = "TURNING RIGHT (D)"
        elif state == State.RESUME:
            cmd_str = "CURVING BACK"
            
        return cmd_str

    def run(self):
        print("[INFO] Starting Obstacle Detection Main Loop...")
        frame_width = int(self.cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        
        try:
            while True:
                # Đọc ảnh từ Camera / Read frame from camera
                ret, frame = self.cap.read()
                if not ret:
                    print("[ERROR] Failed to grab frame.")
                    break
                    
                # GIẢ LẬP DỮ LIỆU SIÊU ÂM (Mock Data)
                # Trong thực tế, bạn sẽ đọc một chuỗi từ Serial (VD: "F:45 L:60 R:30") và parse nó.
                # In reality, read from Serial and parse the string.
                # Ở đây ta để cố định hoặc dùng thanh trượt (trackbars) nếu muốn test tương tác
                sonar_front = 55.0
                sonar_left = 60.0
                sonar_right = 40.0
                
                # Gọi hàm xử lý Vision
                is_cv_obs, bbox, cx = self.process_vision(frame)
                
                # Vẽ bounding box nếu có vật cản
                if is_cv_obs:
                    x, y, w, h = bbox
                    cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 3) # Viền xanh lá
                    cv2.circle(frame, (cx, y + h//2), 5, (255, 0, 0), -1) # Điểm tâm màu xanh dương
                    cv2.putText(frame, "WARNING: OBSTACLE", (x, y-10), 
                                cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 0, 255), 2)
                    
                    # Mô phỏng việc camera ghi đè cảm biến (Camera nhìn xa hơn siêu âm)
                    sonar_front = min(sonar_front, self.SAFE_DISTANCE - 5)
                
                # Cập nhật FSM
                current_state = self.fsm_update(is_cv_obs, cx, frame_width, sonar_front, sonar_left, sonar_right)
                
                # Lấy lệnh motor
                motor_action = self.send_motor_command(current_state)
                
                # Hiển thị trạng thái FSM và Action lên video streaming
                # Overlay HUD on the video stream
                overlay_text1 = f"STATE: {current_state.name}"
                overlay_text2 = f"ACTION: {motor_action}"
                
                # Dùng nền đen mờ (semi-transparent background) cho chữ dễ đọc
                cv2.rectangle(frame, (0, 0), (320, 60), (0, 0, 0), -1)
                cv2.addWeighted(frame, 0.5, frame, 0.5, 0, frame) # Làm cho hình chữ nhật mờ đi
                
                cv2.putText(frame, overlay_text1, (10, 25), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 2)
                cv2.putText(frame, overlay_text2, (10, 50), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 255), 2)
                
                # Xuất hình ảnh ra cửa sổ Desktop
                cv2.imshow("Autonomous Car Vision Dashboard", frame)
                
                # Chờ phím bấm, nhấn 'q' để thoát, 'ESC' cũng thoát
                key = cv2.waitKey(1) & 0xFF
                if key == ord('q') or key == 27:
                    print("[INFO] Quitting gracefully...")
                    break
                    
        finally:
            # Luôn luôn giải phóng tài nguyên phần cứng
            # Always release hardware resources
            self.cap.release()
            cv2.destroyAllWindows()
            print("[INFO] Resources released.")

if __name__ == "__main__":
    detector = ObstacleDetector()
    detector.run()
```

## Code Arduino / Arduino Code

Phần code này chạy trên vi điều khiển Arduino. Nhiệm vụ của nó là đọc phần cứng ở tần số cao một cách chính xác, xử lý sơ bộ và gửi dữ liệu sạch qua cổng Serial cho Raspberry Pi. Nó cũng đóng vai trò là "slave" thực thi các lệnh điều khiển động cơ từ Raspberry Pi.
This code runs on the Arduino microcontroller. Its job is to accurately read hardware at high frequency, preprocess, and send clean data via Serial to the Raspberry Pi. It also acts as a "slave", executing motor control commands from the Pi.

```cpp
/*
 * Autonomous Car - Low Level Controller (Week 8)
 * Handles 3x HC-SR04 Sensors and L298N Motor Driver.
 * Uses Non-Blocking millis() to avoid stopping the main loop.
 */

// Khai báo chân cho 3 cảm biến siêu âm (Sử dụng Analog pins như Digital để tiết kiệm chân)
// Pin declarations for 3 ultrasonic sensors (Using Analog pins as Digital to save pins)
const int TRIG_FRONT = A0;
const int ECHO_FRONT = A1;
const int TRIG_LEFT  = A2;
const int ECHO_LEFT  = A3;
const int TRIG_RIGHT = A4;
const int ECHO_RIGHT = A5;

// Khai báo chân điều khiển động cơ (L298N Motor Driver)
// Motor control pins (L298N)
const int ENA = 9;  // PWM speed control Motor A (Left)
const int IN1 = 8;  // Direction Motor A
const int IN2 = 7;  // Direction Motor A
const int ENB = 10; // PWM speed control Motor B (Right)
const int IN3 = 11; // Direction Motor B
const int IN4 = 12; // Direction Motor B

// Biến lưu trữ thời gian cho các tác vụ non-blocking
// Timing variables for non-blocking tasks
unsigned long lastSensorReadTime = 0;
const int SENSOR_READ_INTERVAL = 50; // ms (20Hz)

void setup() {
  // Tốc độ baud rate cao để giao tiếp với Raspberry Pi nhanh nhất
  Serial.begin(115200);
  
  // Thiết lập chân Cảm biến
  pinMode(TRIG_FRONT, OUTPUT); pinMode(ECHO_FRONT, INPUT);
  pinMode(TRIG_LEFT, OUTPUT);  pinMode(ECHO_LEFT, INPUT);
  pinMode(TRIG_RIGHT, OUTPUT); pinMode(ECHO_RIGHT, INPUT);
  
  // Thiết lập chân Động cơ
  pinMode(ENA, OUTPUT); pinMode(IN1, OUTPUT); pinMode(IN2, OUTPUT);
  pinMode(ENB, OUTPUT); pinMode(IN3, OUTPUT); pinMode(IN4, OUTPUT);
  
  // Đảm bảo xe đứng im lúc khởi động
  // Ensure the car is stationary at startup
  stopMotors();
  Serial.println("Arduino Initialized. Waiting for Pi...");
}

void loop() {
  // 1. Task: Đọc cảm biến định kỳ không dùng delay()
  // 1. Task: Read sensors periodically without delay()
  unsigned long currentMillis = millis();
  if (currentMillis - lastSensorReadTime >= SENSOR_READ_INTERVAL) {
    lastSensorReadTime = currentMillis;
    
    // Đọc khoảng cách (hàm readSonar tự có delay micro giây rất nhỏ, chấp nhận được)
    long distFront = readSonar(TRIG_FRONT, ECHO_FRONT);
    long distLeft = readSonar(TRIG_LEFT, ECHO_LEFT);
    long distRight = readSonar(TRIG_RIGHT, ECHO_RIGHT);
    
    // Gửi string dữ liệu sang Serial cho Pi
    // Send data string over Serial to Pi (Format: F:XX L:YY R:ZZ)
    Serial.print("F:"); Serial.print(distFront);
    Serial.print(" L:"); Serial.print(distLeft);
    Serial.print(" R:"); Serial.println(distRight);
  }
  
  // 2. Task: Kiểm tra lệnh điều khiển từ Raspberry Pi
  // 2. Task: Check for control commands from Raspberry Pi
  if (Serial.available() > 0) {
    // Đọc từng ký tự lệnh / Read single character command
    char cmd = Serial.read(); 
    
    // Bỏ qua các ký tự khoảng trắng hoặc ngắt dòng
    // Ignore whitespaces or newlines
    if (cmd == '\n' || cmd == '\r' || cmd == ' ') return;
    
    executeCommand(cmd);
  }
}

// Hàm đọc siêu âm có Timeout
// Ultrasonic reading function with Timeout
long readSonar(int trigPin, int echoPin) {
  // Tạo xung kích 10us
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  // Đọc xung phản hồi. Timeout 20000us (20ms) tương đương khoảng ~3.4 mét
  // Tránh việc hàm pulseIn treo Arduino nếu không có sóng phản hồi
  long duration = pulseIn(echoPin, HIGH, 20000); 
  
  // Nếu duration = 0 tức là vượt quá 3.4m, trả về một giá trị lớn giả định an toàn
  if (duration == 0) return 400; 
  
  // Vận tốc âm thanh: 340 m/s = 0.034 cm/us. Chia 2 vì sóng đi và về.
  long distance = (duration * 0.034) / 2;
  return distance;
}

// Hàm thực thi lệnh điều khiển động cơ
// Function to execute motor control commands
void executeCommand(char cmd) {
  int defaultSpeed = 150; // Tốc độ PWM (0-255)
  
  switch (cmd) {
    case 'W': // Tiến / Forward
      moveForward(defaultSpeed);
      break;
    case 'S': // Dừng / Stop
      stopMotors();
      break;
    case 'A': // Quay Trái / Turn Left (Quay tại chỗ / Point turn)
      turnLeft(defaultSpeed);
      break;
    case 'D': // Quay Phải / Turn Right
      turnRight(defaultSpeed);
      break;
    case 'X': // Lùi / Backward (Cho trường hợp kẹt)
      moveBackward(defaultSpeed);
      break;
    default:
      // Nếu nhận lệnh lạ, an toàn nhất là dừng
      // If unknown command, safest is to stop
      stopMotors(); 
      break;
  }
}

void moveForward(int speed) {
  analogWrite(ENA, speed);
  analogWrite(ENB, speed);
  digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW);  // Left motor forward
  digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW);  // Right motor forward
}

void moveBackward(int speed) {
  analogWrite(ENA, speed);
  analogWrite(ENB, speed);
  digitalWrite(IN1, LOW); digitalWrite(IN2, HIGH);  // Left motor backward
  digitalWrite(IN3, LOW); digitalWrite(IN4, HIGH);  // Right motor backward
}

void stopMotors() {
  analogWrite(ENA, 0);
  analogWrite(ENB, 0);
  digitalWrite(IN1, LOW); digitalWrite(IN2, LOW);
  digitalWrite(IN3, LOW); digitalWrite(IN4, LOW);
}

void turnLeft(int speed) {
  analogWrite(ENA, speed);
  analogWrite(ENB, speed);
  digitalWrite(IN1, LOW); digitalWrite(IN2, HIGH); // Left backward
  digitalWrite(IN3, HIGH); digitalWrite(IN4, LOW); // Right forward
}

void turnRight(int speed) {
  analogWrite(ENA, speed);
  analogWrite(ENB, speed);
  digitalWrite(IN1, HIGH); digitalWrite(IN2, LOW); // Left forward
  digitalWrite(IN3, LOW); digitalWrite(IN4, HIGH); // Right backward
}
```

## Bài Tập Thực Hành / Practice Exercises

**Bài tập 1: Căn chỉnh bộ lọc HSV cho môi trường thực tế / Exercise 1: Calibrate HSV filter for real environments**
Trong điều kiện ánh sáng thực tế ở phòng học, màu sắc trên camera có thể bị sai lệch rất nhiều so với thông số mặc định (ví dụ đèn huỳnh quang vs đèn LED, hay có ánh nắng mặt trời). 
- Yêu cầu: Viết một script Python riêng biệt (dùng `cv2.createTrackbar`) để kéo các thanh trượt `H`, `S`, `V` realtime và tìm ra dải `lower` / `upper` tối ưu nhất cho màu của vật cản (ví dụ: chai nước màu đỏ, hoặc biển báo giao thông thu nhỏ).
- In real classroom lighting, colors can shift heavily. Write a separate Python script using `cv2.createTrackbar` to adjust H, S, V values in real-time to find the optimal ranges for your specific red obstacles.

**Bài tập 2: Tích hợp PySerial vào class ObstacleDetector / Exercise 2: Integrate PySerial**
Hiện tại class `ObstacleDetector` đang dùng dữ liệu siêu âm giả lập (mock data).
- Yêu cầu: Import thư viện `pyserial`, mở cổng nối tiếp `/dev/ttyACM0` (hoặc `/dev/ttyUSB0` tùy mạch), đọc chuỗi dữ liệu (ví dụ `F:45 L:60 R:30`), dùng regex hoặc hàm `split()` của Python để lấy ra 3 số nguyên khoảng cách. Truyền 3 số đó vào hàm `fsm_update()`.
- The current class uses mock ultrasonic data. Import `pyserial`, open the port, read the string, parse it, and feed real data into the `fsm_update()` function.

**Bài tập 3: Chinh phục Hành Lang / Exercise 3: Corridor Navigation Challenge**
Đây là bài kiểm tra thực tế (Physical Test).
- Setup: Đặt các thùng carton ngẫu nhiên (dạng zích-zắc) trên đường đi trong hành lang.
- Yêu cầu: Xe của bạn phải bắt đầu từ vạch xuất phát, di chuyển tự động (tự quyết định rẽ trái hay phải tùy vào vật cản), và đến đích ở đầu kia hành lang mà không chạm vào hộp hoặc tường quá 2 lần. Cập nhật FSM nếu cần thiết.

## Câu Hỏi Thảo Luận / Discussion (5)

1. **Vấn đề nhiễu chéo siêu âm (Cross-talk):** Nếu cả 3 cảm biến HC-SR04 cùng phát xung trigger tại một thời điểm, sóng siêu âm của cái này có thể bị cái kia bắt được, gây ra sai số trầm trọng. Trong code Arduino, chúng ta giải quyết việc này bằng cách nào? Liệu việc gọi hàm `readSonar` lần lượt có đủ an toàn chưa?
   (If all 3 sensors fire at once, cross-talk happens. How do we solve this in Arduino code? Is reading sequentially enough?)
2. **Khóa tử thần FSM (Dead-lock):** Trong cỗ máy trạng thái, điều kiện nào có thể khiến xe bị kẹt mãi mãi ở trạng thái `ASSESS` hoặc bị lặp vòng lặp `AVOID_LEFT` -> `AVOID_RIGHT` liên tục (hành vi rung lắc - oscillating)? Làm sao để dùng biến lưu thời gian (timestamp) giải quyết hiện tượng này?
   (What condition can cause an FSM dead-lock or continuous oscillation? How to use timestamps to solve this?)
3. **So sánh Thuật toán Bug và VFH:** Trong một môi trường hình mê cung phức tạp (như mê cung hình xoắn ốc), thuật toán Bug (như Bug2) hay Reactive (như VFH) sẽ hoạt động hiệu quả hơn? Tại sao?
   (In a complex maze environment, would Bug2 or VFH be more effective? Why?)
4. **Xử lý vật cản động (Dynamic Obstacles):** Nếu một vật cản (như một sinh viên đi ngang qua) đột ngột xuất hiện cắt mặt xe, FSM hiện tại sẽ xử lý thế nào? Nó có phân biệt được một vách tường đứng yên và một người đang di chuyển không? Hãy đề xuất cách cập nhật đoạn code Python để theo dõi vận tốc của vật cản.
   (How does the current FSM handle dynamic obstacles? Propose a way to update the Python code to track the obstacle's velocity.)
5. **Cảm biến Fusion Nâng cao (Kalman Filter):** Tại sao trong các hệ thống xe tự lái thực tế, người ta thường dùng Bộ lọc Kalman (Kalman Filter) để kết hợp dữ liệu siêu âm, camera và Lidar thay vì chỉ đơn giản là lệnh `if-else` tin tưởng một trong hai cảm biến?
   (Why do real autonomous vehicles use Kalman Filters for sensor fusion instead of simple if-else logic trusting one sensor?)

## Bài Về Nhà / Homework

1. **Cài đặt Cảm biến Vực thẳm (Cliff Sensor):**
   - Nhiệm vụ: Gắn 2 cảm biến hồng ngoại (IR module) chỉa xuống mặt đất ở phía trước xe.
   - Sửa đổi FSM: Thêm trạng thái `REVERSE` (Lùi khẩn cấp). Nếu phát hiện hụt mặt phẳng (có thể xe chuẩn bị rớt cầu thang hoặc mép bàn), lập tức ngắt lệnh đi thẳng, gọi động cơ lùi lại 2 giây, sau đó rẽ 180 độ. Nộp lại toàn bộ file `main.py` và `arduino_slave.ino` đã chỉnh sửa.
   - (Task: Install downward-facing IR cliff sensors. Add a `REVERSE` state to the FSM to back up and turn around if the car detects an edge/stairs. Submit modified code files.)

2. **Thuật Toán Bao Phủ Xoắn Ốc (Spiral Coverage Algorithm):**
   - Viết một script Python riêng biệt có tên `spiral_sweep.py` mô phỏng thuật toán lau nhà giống robot Roomba.
   - Xe bắt đầu ở trạng thái `SPIRAL`, bán kính quay bánh xe tăng dần theo thời gian. Khi đụng tường (dữ liệu siêu âm báo < 15cm), xe chuyển sang trạng thái `WALL_FOLLOW` (bám tường). Nộp kịch bản (script) và một sơ đồ (flowchart) giải thích luồng của FSM.
   - (Write a separate script `spiral_sweep.py` mimicking a Roomba. Start in `SPIRAL` with increasing radius. Upon hitting a wall, switch to `WALL_FOLLOW`. Submit script and flowchart.)

3. **Mở rộng nhận diện biển báo (Traffic Sign Recognition Extension):**
   - Tự học cách sử dụng Haar Cascades Classifier trong OpenCV. Tải một file `.xml` huấn luyện sẵn nhận diện biển STOP. Tích hợp nó vào trong class `ObstacleDetector`. Xe phải dừng lại ít nhất 5 giây nếu thấy biển STOP.
   - (Self-study Haar Cascades in OpenCV. Download a pre-trained STOP sign `.xml` file. Integrate it so the car stops for 5 seconds when seeing a STOP sign.)

## Đánh Giá / Assessment Rubric

Mỗi bài tập và báo cáo hàng tuần được đánh giá dựa trên thang điểm sau để đảm bảo chất lượng kỹ thuật cao nhất.
Each weekly assignment and report is graded based on the following rubric to ensure highest technical quality.

| Tiêu Chí / Criterion | Xuất Sắc / Excellent (9-10) | Khá / Good (7-8) | Cơ Bản / Basic (5-6) | Cần Cố Gắng / Needs Work (<5) |
|----------------------|------------------------------|------------------|----------------------|-------------------------------|
| **1. Hiểu biết Lý Thuyết (Theory Mastery)** | Phân tích sâu sắc sự khác biệt VFH, Bug và PF. Đóng góp ý tưởng đột phá trong thảo luận, bảo vệ được quan điểm. (Deep analysis of algorithms, breakthrough ideas in discussion.) | Nắm vững cách thuật toán hoạt động, tham gia thảo luận nhưng thiếu ví dụ thực tế. (Understands algorithms, participates but lacks real-world examples.) | Trả lời được các khái niệm cơ bản dựa trên slide. (Can recall basic concepts based on slides.) | Hoàn toàn hiểu sai sự khác nhau giữa Global và Local planning. (Misunderstands global vs local planning.) |
| **2. Tích hợp & Code Python (Python & OpenCV)** | Xử lý đa luồng (threading) hoặc optimize FPS cao. Nhận diện bounding box chính xác trong mọi điều kiện ánh sáng. FSM không có lỗi dead-lock. (Uses threading for high FPS. Accurate bbox. Bug-free FSM.) | Code có cấu trúc tốt, chạy ổn định, FSM xử lý được 90% tình huống chuẩn. (Well-structured code, stable, FSM handles 90% standard cases.) | Code chạy được nhưng nhận diện sai màu (false positives) hoặc chạy quá giật/lag. (Runs but has false positives or lags heavily.) | Code không biên dịch được (Syntax error) hoặc văng lỗi giữa chừng (Runtime Error). (Syntax or Runtime errors.) |
| **3. Phần cứng & Code Arduino (Hardware & C++)** | Code dùng ngắt timer chuyên nghiệp, cực kỳ mượt. Lọc nhiễu siêu âm bằng median filter. Giao tiếp Serial cực kỳ ổn định. (Uses professional timer interrupts. Ultrasonic median filtering. Rock-solid Serial.) | Dùng `millis()` thay vì `delay()`. Số liệu ít nhiễu, xe chạy khá mượt mà. (Uses `millis()`. Low noise, car runs smoothly.) | Vẫn dùng `delay()` dẫn đến thỉnh thoảng xe không phản hồi (lagging). Không lọc nhiễu dữ liệu thô. (Still uses `delay()` causing lag. No raw data filtering.) | Đấu sai dây phần cứng, code không nạp được. Cháy hỏng linh kiện. (Wrong wiring, upload fails, blown components.) |
| **4. Thử Thách Thực Tế (Physical Challenge)** | Xe vượt qua chuỗi chướng ngại vật một cách thông minh, không chạm một lần nào, tốc độ tối ưu. (Flawless navigation, 0 collisions, optimal speed.) | Hoàn thành đường đi, có 1-2 lần va chạm nhẹ hoặc đứng khựng lại để "suy nghĩ". (Completes path, 1-2 minor bumps or hesitations.) | Đi được nửa đường, sau đó đâm tường hoặc kẹt ở góc không tự thoát được. (Goes halfway, hits a wall or gets trapped.) | Xe mất kiểm soát, chạy loạn xạ (runaway robot). (Car runs out of control.) |
| **5. Báo Cáo Kỹ Thuật (Technical Report)** | Ghi hình rõ nét, tài liệu Markdown đẹp. Trình bày được đồ thị dữ liệu cảm biến và phân tích trạng thái FSM chi tiết bằng Mermaid/Flowchart. (Clear video, beautiful MD docs. Shows sensor graphs and flowchart.) | Trình bày đủ phần được yêu cầu. Có video minh chứng nhưng thiếu đồ thị hoặc lưu log. (Covers requirements, has video but lacks graphs/logs.) | Báo cáo quá ngắn gọn, không giải thích các khó khăn gặp phải. (Too brief, no explanation of challenges faced.) | Copy bài của nhóm khác hoặc không nộp bài. Bị trừ 100% điểm tuần. (Plagiarism or missing submission. 100% penalty.) |

*Lưu ý từ Giảng Viên (Instructor's Note):* Hãy ưu tiên sự an toàn và cẩn thận trong việc sử dụng pin Li-Po. Luôn tắt nguồn khi tiến hành tinh chỉnh lại dây nối để tránh đoản mạch (short circuit) mạch L298N.
*(Please prioritize safety with Li-Po batteries. Always turn off power when rewiring to prevent short circuits on the L298N driver.)*
