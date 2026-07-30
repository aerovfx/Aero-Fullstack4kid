# Tuần 1: Giới Thiệu Xe Tự Hành & Kiến Trúc Hệ Thống / Week 1: Intro to Autonomous Vehicles & System Architecture

## Mục Tiêu / Objectives
- **VI**:
  1. Hiểu khái niệm cơ bản về xe tự hành và phân biệt 6 cấp độ tự hành (theo tiêu chuẩn SAE J3016).
  2. Nắm vững kiến trúc hệ thống cốt lõi của robot tự hành: Vòng lặp Nhận thức (Sense) → Lập kế hoạch (Plan) → Hành động (Act).
  3. Phân biệt được phần cứng (khung gầm, cảm biến, máy tính nhúng) và phần mềm (Firmware, Middleware, Application).
  4. Nắm rõ các quy tắc an toàn khi làm việc với điện tử và cơ khí.
- **EN**:
  1. Understand the basic concepts of autonomous vehicles and differentiate the 6 levels of autonomy (SAE J3016).
  2. Master the core system architecture of autonomous robots: Sense → Plan → Act loop.
  3. Differentiate between hardware (chassis, sensors, embedded computers) and software (Firmware, Middleware, Application).
  4. Learn safety rules when working with electronics and mechanics.

## Linh Kiện & Dụng Cụ / Components & Tools

| Tên Linh Kiện / Component Name | Chức năng / Function | Số lượng / Qty | Giá dự kiến (VND) / Est. Price |
| :--- | :--- | :--- | :--- |
| Khung xe Robot 4 bánh / 4WD Robot Chassis | Cung cấp nền tảng vật lý / Physical platform | 1 | 250,000 |
| Arduino Mega 2560 | Xử lý cấp thấp (Firmware) / Low-level processing | 1 | 350,000 |
| L298N Motor Driver | Điều khiển động cơ DC / DC Motor control | 2 | 100,000 (2x50k) |
| Động cơ DC giảm tốc / DC Gear Motors | Truyền động bánh xe / Wheel actuation | 4 | Đi kèm khung xe / Included |
| Cảm biến siêu âm HC-SR04 / Ultrasonic | Đo khoảng cách / Distance measurement | 3 | 90,000 (3x30k) |
| Cảm biến hồng ngoại TCRT5000 / IR Sensor | Dò line, tránh vật cản / Line tracking, obstacle | 3 | 45,000 (3x15k) |
| Mạch IMU MPU6050 / 6-DOF IMU | Đo gia tốc, góc nghiêng / Acceleration, tilt | 1 | 60,000 |
| Raspberry Pi 4 Model B (4GB+) | Xử lý cấp cao (ROS2, AI) / High-level compute | 1 | 1,800,000 |
| Camera Raspberry Pi V2 | Thị giác máy tính / Computer vision | 1 | 450,000 |
| Pin LiPo 3S 11.1V 2200mAh | Nguồn cấp / Power supply | 1 | 350,000 |
| Mạch giảm áp LM2596 / Buck Converter | Ổn áp 5V cho Pi & Arduino / 5V regulator | 2 | 50,000 (2x25k) |
| Dây cắm Breadboard (Đực-Cái, Đực-Đực) / Jumper Wires | Kết nối linh kiện / Component wiring | 1 bộ / set | 50,000 |
| **Tổng cộng / Total** | | | **~3,595,000 VND** |

## Lý Thuyết / Theory

### 1. Xe Tự Hành Là Gì? / What is an Autonomous Vehicle?
**VI**: Xe tự hành là phương tiện có khả năng cảm nhận môi trường xung quanh và điều hướng an toàn với ít hoặc không cần sự can thiệp của con người. Chúng kết hợp nhiều loại cảm biến (radar, lidar, sonar, GPS, odometry và hệ thống quán tính) để xác định các đường đi thích hợp, cũng như phát hiện chướng ngại vật và tín hiệu giao thông.
**EN**: An autonomous vehicle is a vehicle capable of sensing its environment and navigating safely with little or no human input. They combine a variety of sensors to perceive their surroundings, such as radar, lidar, sonar, GPS, odometry and inertial measurement units.

#### Các cấp độ tự hành (SAE J3016) / Levels of Autonomy (SAE J3016)
Tiêu chuẩn SAE phân loại xe tự hành thành 6 cấp độ / SAE standard classifies autonomous vehicles into 6 levels:
- **Level 0 (No Automation)**: Tài xế kiểm soát hoàn toàn. (Xe máy, ô tô đời cũ). / Human driver does everything.
- **Level 1 (Driver Assistance)**: Hỗ trợ một hệ thống (ví dụ: Cruise Control). Tài xế vẫn phải tập trung. / An advanced driver assistance system (ADAS) on the vehicle can sometimes assist the human driver with either steering or braking/accelerating.
- **Level 2 (Partial Automation)**: Xe có thể tự lái và tự tăng/giảm tốc, nhưng tài xế phải giám sát và can thiệp ngay khi cần (Tesla Autopilot cơ bản). / The vehicle can control both steering and accelerating/braking under some circumstances. Human driver must continue to pay full attention.
- **Level 3 (Conditional Automation)**: Xe tự lái trong điều kiện nhất định (ví dụ: trên cao tốc). Tài xế có thể làm việc khác nhưng phải sẵn sàng tiếp quản khi hệ thống yêu cầu. / The vehicle can perform all aspects of the driving task under some circumstances. Human driver must be ready to take back control at any time.
- **Level 4 (High Automation)**: Hoàn toàn tự hành trong khu vực được định trước (Geofencing - ví dụ: Taxi tự lái Waymo). Không cần tài xế trong khu vực này. / The vehicle can perform all driving tasks and monitor the driving environment in certain conditions. Human attention is not required in these conditions.
- **Level 5 (Full Automation)**: Tự hành hoàn toàn trong mọi điều kiện, mọi nơi. Không cần vô lăng. / The vehicle can do all the driving in all circumstances. No human intervention is ever required.

Dự án DIY của chúng ta hướng tới **Level 2/3** trong một môi trường được kiểm soát. / Our DIY project aims for **Level 2/3** in a controlled environment.

### 2. So Sánh Các Loại Robot / Comparison of Robot Types
**Robot Hút Bụi (Robot Vacuum):**
- **Cảm biến / Sensors:** Cảm biến va chạm, hồng ngoại chống rơi, có thể có Lidar đơn giản. / Bump sensors, cliff sensors, maybe simple 2D Lidar.
- **Xử lý / Processing:** Thuật toán phủ kín diện tích đơn giản, SLAM cơ bản. / Simple area coverage algorithms, basic SLAM.
- **Tốc độ / Speed:** Rất chậm. / Very slow.

**Xe Tự Lái Thực Tế (Self-driving Car):**
- **Cảm biến / Sensors:** Lidar 3D, Radar, Camera độ phân giải cao, GPS RTK chính xác tới cm. / 3D Lidar, Radar, High-res Cameras, RTK GPS (cm accuracy).
- **Xử lý / Processing:** Máy tính chuyên dụng cực mạnh (Nvidia Drive), AI phức tạp xử lý thời gian thực. / Massive onboard compute, complex real-time AI.
- **Tốc độ / Speed:** Nhanh (lên tới 120km/h). Đòi hỏi độ an toàn tuyệt đối. / Fast (up to 120km/h). Requires absolute safety.

**Xe Dự Án DIY Của Chúng Ta (Our DIY Project Car):**
- **Cảm biến / Sensors:** Camera Pi, Cảm biến siêu âm, Hồng ngoại, IMU. / Pi Camera, Ultrasonic, IR, IMU.
- **Xử lý / Processing:** Raspberry Pi xử lý ảnh và thuật toán + Arduino điều khiển động cơ. / Raspberry Pi for vision/algorithms + Arduino for motor control.
- **Tốc độ / Speed:** Chậm (0.5 - 1 m/s), an toàn để thử nghiệm trong phòng. / Slow (0.5 - 1 m/s), safe for indoor testing.

### 3. Vòng Lặp Kiến Trúc Hệ Thống / System Architecture Loop
Mọi robot tự hành đều hoạt động dựa trên một vòng lặp liên tục: **Sense → Plan → Act**. / Every autonomous robot operates on a continuous loop: **Sense → Plan → Act**.

1. **Sense (Nhận Thức):**
   - Thu thập dữ liệu từ môi trường thông qua cảm biến. / Gathering data from the environment via sensors.
   - Ví dụ: Camera chụp ảnh đường, cảm biến siêu âm đo khoảng cách tới vật cản. / Example: Camera taking pictures of the road, ultrasonic measuring distance to obstacles.
   - Kết quả đầu ra: "Có một vật cản cách 30cm phía trước, vạch kẻ đường ở bên trái". / Output: "There is an obstacle 30cm ahead, lane line is on the left."

2. **Plan (Lập Kế Hoạch):**
   - Bộ não (Raspberry Pi/Arduino) xử lý dữ liệu và đưa ra quyết định. / The brain processes data and makes decisions.
   - Quá trình này bao gồm các cấp độ: / This includes multiple levels:
     - *Định vị (Localization):* Tôi đang ở đâu? / Where am I?
     - *Dự đoán (Prediction):* Vật cản kia sẽ di chuyển thế nào? / How will the obstacle move?
     - *Lập kế hoạch đường đi (Path Planning):* Làm sao để đi từ A đến B an toàn? / How to go from A to B safely?
   - Kết quả đầu ra: "Cần phanh lại hoặc đánh lái sang phải 15 độ". / Output: "Need to brake or steer right by 15 degrees."

3. **Act (Hành Động):**
   - Gửi tín hiệu điều khiển tới các cơ cấu chấp hành (động cơ, servo). / Sending control signals to actuators.
   - Ví dụ: Arduino băm xung PWM để giảm tốc độ động cơ DC. / Example: Arduino generates PWM to reduce DC motor speed.
   - Quá trình này làm thay đổi vị trí của xe trong môi trường, vòng lặp lại bắt đầu lại từ đầu. / This changes the vehicle's state in the environment, and the loop restarts.

### 4. Kiến Trúc Phần Cứng (Hardware Layers)
Hệ thống phần cứng của xe được chia thành nhiều lớp / The hardware system is divided into layers:
- **Chassis (Khung gầm):** Bộ khung vật lý chứa tất cả linh kiện. / The physical frame holding everything.
- **Power (Nguồn cấp):** Pin LiPo cung cấp dòng xả cao. Mạch hạ áp cung cấp đúng điện áp cho từng thiết bị (5V cho Pi/Arduino, 11.1V cho mạch công suất động cơ). / LiPo battery provides high current. Buck converters provide correct voltage (5V for logic, 11.1V for motors).
- **Actuators (Cơ cấu chấp hành):** Động cơ DC, bánh xe. Chịu trách nhiệm di chuyển. / DC motors, wheels. Responsible for movement.
- **Sensors (Cảm biến):** "Mắt và tai" của robot. / The "eyes and ears" of the robot.
- **Compute (Xử lý):** Bộ não. Chia làm 2 cấp: / The brain. Divided into 2 levels:
  - *Low-level (Arduino Mega):* Xử lý tín hiệu phần cứng thời gian thực, đọc encoder, băm xung PWM. / Real-time hardware interfacing, reading encoders, generating PWM.
  - *High-level (Raspberry Pi):* Chạy hệ điều hành Linux, xử lý ảnh camera, chạy AI, tính toán phức tạp. / Runs Linux, camera vision, AI, complex math.

### 5. Kiến Trúc Phần Mềm (Software Layers)
- **Firmware (Arduino):** Mã C++ giao tiếp trực tiếp với chân I/O. Vòng lặp cực nhanh (milliseconds). / C++ code interfacing directly with I/O pins. Very fast loop.
- **Middleware (ROS 2 / Python):** Cầu nối giữa các thành phần phần mềm. ROS 2 (Robot Operating System) cung cấp cơ chế truyền tin (Publish/Subscribe) giữa các node (tiến trình). / Bridge between software components. ROS 2 provides publish/subscribe messaging between nodes.
- **Application (Ứng dụng):** Thuật toán tự lái thực sự (ví dụ: bám làn đường, nhận diện biển báo, tránh vật cản). / The actual self-driving algorithms (lane keeping, sign detection, obstacle avoidance).

### 6. Tổng Quan Về Cảm Biến / Sensor Overview
- **GPS (Global Positioning System):** Xác định tọa độ (Kinh độ, Vĩ độ) trên bản đồ. Sai số thông thường 2-5m. Thích hợp chạy ngoài trời. / Determines coordinates. Typical error 2-5m. For outdoor use.
- **Ultrasonic (Siêu âm - HC-SR04):** Bắn sóng âm và đo thời gian vọng lại để tính khoảng cách. Rẻ, hoạt động tốt trong tối, bị nhiễu bởi bề mặt mềm. / Shoots sound waves and measures echo time. Cheap, works in dark, fails on soft surfaces.
- **IR (Hồng ngoại - TCRT5000):** Phát tia hồng ngoại và đo mức độ phản xạ. Dùng để phân biệt vạch đen/trắng (bám line) ở khoảng cách rất gần (<2cm). / Emits IR and measures reflection. Used for line tracking (black/white) at close range.
- **IMU (Inertial Measurement Unit - MPU6050):** Chứa gia tốc kế (Accelerometer) và con quay hồi chuyển (Gyroscope). Tính toán góc nghiêng và sự thay đổi hướng (Heading). / Contains accel and gyro. Calculates tilt and heading changes.
- **Camera (Vision):** Cung cấp lượng dữ liệu khổng lồ. Yêu cầu xử lý phức tạp (Computer Vision / AI) để hiểu hình ảnh. / Provides massive data. Requires complex processing to understand images.

## Sơ Đồ Kết Nối / Wiring Diagram
Trong tuần 1, chúng ta sẽ bắt đầu làm quen với kiến trúc cơ bản: Cấp nguồn và kết nối Arduino với máy tính.
*In week 1, we start with the basic architecture: Power and connecting Arduino to the computer.*

**Mô tả kết nối (Text description of wiring):**
1. **Nguồn (Power):**
   - Pin LiPo (Đỏ/+) -> Công tắc (Switch) -> Cực IN+ của mạch LM2596.
   - Pin LiPo (Đen/-) -> Cực IN- của mạch LM2596.
   - (CẢNH BÁO / WARNING: Dùng đồng hồ VOM đo và chỉnh biến trở trên LM2596 sao cho OUT+ và OUT- đúng 5.0V trước khi cắm vào bất cứ thiết bị nào!).
2. **Arduino:**
   - LM2596 OUT+ (5V) -> Chân `5V` trên Arduino Mega.
   - LM2596 OUT- (GND) -> Chân `GND` trên Arduino Mega.
   - Cáp USB nối Arduino Mega với máy tính (PC/Laptop) để nạp code.

## Thực Hành / Hands-On

### Bước 1: An Toàn Nhất Là Không Cấp Nguồn Mù / Step 1: Safety First - No Blind Powering
⚠️ **CẢNH BÁO AN TOÀN (SAFETY WARNINGS):**
- **Quy tắc 1:** Luôn tháo pin LiPo khi nối dây. (Always disconnect LiPo when wiring).
- **Quy tắc 2:** Luôn đo điện áp đầu ra của mạch hạ áp bằng đồng hồ vạn năng (VOM) TRƯỚC KHI kết nối vào Pi hoặc Arduino. Nếu điện áp > 5.5V, mạch điều khiển sẽ bị cháy ngay lập tức. (Always measure buck converter output BEFORE connecting to Pi/Arduino. >5.5V will fry them).
- **Quy tắc 3:** Không bao giờ để hai dây âm dương của Pin LiPo chạm nhau. Điều này gây đoản mạch, có thể gây cháy nổ pin. (Never short circuit the LiPo battery. It can explode).

### Bước 2: Tháo Ráp & Nhận Diện Linh Kiện / Step 2: Disassembly & Identification Lab
- Lấy bộ linh kiện ra bàn. (Lay out all components on the table).
- Đánh dấu (Label) từng linh kiện bằng băng dính giấy theo danh sách ở mục 2. (Label each component with masking tape based on the list).
- Tìm vị trí tương đối trên khung gầm: Động cơ ở dưới, Arduino ở tầng giữa, Raspberry Pi và Camera ở trên cao nhất. (Visualize placement: Motors bottom, Arduino middle, Pi & Camera top).

### Bước 3: Vẽ Sơ Đồ Hệ Thống / Step 3: Draw System Diagram Lab
- Lấy một tờ giấy A4 và bút. (Take an A4 paper and pen).
- Vẽ 3 khối chính (Draw 3 main blocks): SENSE (Cảm biến), PLAN (Raspberry Pi & Arduino), ACT (L298N & Động cơ).
- Vẽ các mũi tên luồng dữ liệu (Data flow arrows):
  - Camera -> Dữ liệu hình ảnh (Image data) -> Raspberry Pi.
  - Cảm biến siêu âm -> Xung điện (Pulses) -> Arduino.
  - Raspberry Pi -> Lệnh tốc độ (Velocity command) -> Arduino.
  - Arduino -> Tín hiệu PWM (PWM signals) -> L298N Motor Driver.
  - L298N -> Dòng điện (Current) -> Động cơ DC.

### Bước 4: Chạy Code Arduino Đầu Tiên / Step 4: First Arduino Run
- Tải và cài đặt Arduino IDE. (Download and install Arduino IDE).
- Kết nối Arduino Mega với máy tính qua cáp USB (Không cần pin LiPo lúc này, mạch lấy nguồn từ USB). (Connect Mega to PC via USB, no LiPo needed yet).
- Chọn Board: `Tools > Board > Arduino Mega or Mega 2560`.
- Chọn Port: `Tools > Port > (Chọn cổng COM tương ứng)`.

## Code Arduino

Chương trình này mô phỏng vòng lặp Sense-Plan-Act cơ bản trên Arduino.
*This program simulates the basic Sense-Plan-Act loop on Arduino.*

```cpp
/*
 * Week 1: Basic Sense-Plan-Act Loop Simulation
 * Tuần 1: Mô phỏng vòng lặp Nhận thức - Lập kế hoạch - Hành động
 */

// Định nghĩa các chân (Pin Definitions - Dummy pins for now)
const int SENSOR_PIN = A0;   // Chân đọc cảm biến giả lập (Simulated sensor pin)
const int ACTUATOR_PIN = 13; // LED tích hợp trên board đóng vai trò cơ cấu chấp hành (Built-in LED as actuator)

// Biến toàn cục (Global variables)
int sensorValue = 0;
String systemState = "IDLE"; // Trạng thái hệ thống

void setup() {
  // Khởi tạo Serial Monitor ở tốc độ 9600 baud để giao tiếp với máy tính
  // Initialize Serial Monitor at 9600 baud for PC communication
  Serial.begin(9600);
  
  // Cài đặt chế độ chân (Set pin modes)
  pinMode(SENSOR_PIN, INPUT);
  pinMode(ACTUATOR_PIN, OUTPUT);
  
  Serial.println("System Initialized. Starting Autonomous Loop...");
}

void loop() {
  // 1. SENSE (Nhận Thức)
  // Đọc giá trị từ cảm biến (0 - 1023)
  // Read value from sensor
  sensorValue = analogRead(SENSOR_PIN);
  
  // 2. PLAN (Lập Kế Hoạch)
  // Đưa ra quyết định dựa trên dữ liệu cảm biến
  // Make a decision based on sensor data
  if (sensorValue > 500) {
    // Nếu giá trị lớn hơn 500, giả sử có vật cản gần
    // If value > 500, assume obstacle is close
    systemState = "OBSTACLE_DETECTED - BRAKING";
  } else {
    // Không có vật cản, tiếp tục di chuyển
    // Clear path, continue moving
    systemState = "PATH_CLEAR - MOVING_FORWARD";
  }
  
  // 3. ACT (Hành Động)
  // Thực thi quyết định
  // Execute the decision
  if (systemState == "OBSTACLE_DETECTED - BRAKING") {
    digitalWrite(ACTUATOR_PIN, HIGH); // Bật LED cảnh báo (Turn on warning LED)
  } else {
    digitalWrite(ACTUATOR_PIN, LOW);  // Tắt LED (Turn off LED)
  }
  
  // In trạng thái ra màn hình để theo dõi (Print status for monitoring)
  Serial.print("Sensor: ");
  Serial.print(sensorValue);
  Serial.print(" | State: ");
  Serial.println(systemState);
  
  // Chờ 500ms trước khi lặp lại (Wait 500ms before next loop)
  delay(500); 
}
```

## Công Thức / Formulas

Trong khóa học này, chúng ta sẽ làm quen với một số công thức cơ bản. Tuần này, hãy xem xét công thức tính khoảng cách của cảm biến siêu âm.
*In this course, we will use some basic formulas. This week, let's look at the ultrasonic distance formula.*

**Công thức tính khoảng cách siêu âm (Ultrasonic Distance Formula):**
$$ D = \frac{v \times t}{2} $$
Trong đó (Where):
- $D$: Khoảng cách tới vật cản (Distance to obstacle) - Đơn vị: cm
- $v$: Vận tốc âm thanh trong không khí (Speed of sound in air) $\approx 0.0343$ cm/µs (ở 20°C).
- $t$: Thời gian từ lúc phát sóng đến lúc nhận lại sóng dội (Time from ping to echo) - Đơn vị: Microseconds (µs).
- Phải chia 2 vì sóng âm đi quãng đường cả đi lẫn về. (Divide by 2 because the wave travels to the object and back).

**Ví dụ có lời giải (Worked Example):**
- **Đề bài:** Cảm biến siêu âm ghi nhận thời gian $t = 1500$ µs. Tính khoảng cách.
- **Giải (Solution):**
  $D = \frac{0.0343 \times 1500}{2}$
  $D = \frac{51.45}{2}$
  $D = 25.725$ cm.
- **Kết luận:** Vật cản cách xe khoảng 25.7 cm. (Obstacle is 25.7 cm away).

## Câu Hỏi Thảo Luận / Discussion

1. **VI:** Tại sao chúng ta lại cần cả Arduino Mega và Raspberry Pi trên cùng một chiếc xe? Mỗi bo mạch đảm nhận nhiệm vụ cốt lõi gì? Tại sao không dùng 1 cái cho tất cả?
   **EN:** Why do we need both an Arduino Mega and a Raspberry Pi on the same vehicle? What is the core task of each board? Why not use just one for everything?
2. **VI:** Dựa vào phân loại của SAE J3016, hệ thống "Cruise Control" (ga tự động) giữ tốc độ cố định trên xe hơi cũ thuộc cấp độ (Level) mấy? Giải thích.
   **EN:** Based on SAE J3016 classification, what Level of autonomy is a standard "Cruise Control" system that maintains a constant speed? Explain.
3. **VI:** Trong vòng lặp Sense-Plan-Act, nếu bước "Sense" bị lỗi (ví dụ camera bị che bùn đất), điều gì sẽ xảy ra với các bước tiếp theo? Làm sao để khắc phục rủi ro này trong thực tế?
   **EN:** In the Sense-Plan-Act loop, if the "Sense" step fails (e.g., camera covered in mud), what happens to the subsequent steps? How is this risk mitigated in reality?
4. **VI:** Bạn hãy tìm một vật dụng trong nhà (ví dụ: máy giặt, điều hòa) và mô tả cách nó áp dụng vòng lặp Sense-Plan-Act.
   **EN:** Find a household appliance (e.g., washing machine, AC) and describe how it applies the Sense-Plan-Act loop.
5. **VI:** Tại sao vấn đề cấp điện (Power) lại là nguyên nhân gây cháy hỏng nhiều nhất đối với người mới bắt đầu làm robot? Biện pháp phòng tránh lớn nhất là gì?
   **EN:** Why are power supply issues the most common cause of fried components for beginners in robotics? What is the best preventive measure?

## Bài Về Nhà / Homework

- **Nhiệm vụ 1 (Mini quiz):** Ghép nối Cảm biến với Chức năng (Match Sensor to Function):
  - A. GPS --> 1. Phát hiện vạch đen trắng trên sàn nhà.
  - B. Ultrasonic (Siêu âm) --> 2. Tính toán xe đang nghiêng hay đang bị lật.
  - C. IR (Hồng ngoại) --> 3. Biết xe đang ở tọa độ nào trên Trái Đất.
  - D. IMU (Gia tốc & Góc) --> 4. Nhận diện biển báo giao thông STOP.
  - E. Camera --> 5. Đo khoảng cách tới bức tường phía trước.
- **Nhiệm vụ 2 (Mini-project):** Hãy cài đặt Arduino IDE trên máy tính cá nhân của bạn, biên dịch (Verify) đoạn code mẫu ở trên để đảm bảo không có lỗi (Done compiling), sau đó chụp ảnh màn hình nộp lại.
- **Nhiệm vụ 3:** Tạo một bảng Google Sheet (hoặc Excel), liệt kê lại toàn bộ linh kiện của khóa học. Cột cuối cùng, hãy tự tra cứu giá trị thực tế của chúng trên các trang thương mại điện tử (Shopee, Hshop, Nshop...) và tính tổng chi phí.

## Đánh Giá / Assessment Rubric

| Tiêu chí / Criteria | Xuất sắc / Excellent (10-9) | Đạt / Pass (8-5) | Cần cải thiện / Needs Work (<5) |
| :--- | :--- | :--- | :--- |
| **Kiến thức lý thuyết (Theory)** | Giải thích hoàn hảo vòng lặp SPA và 6 cấp độ tự hành. Trả lời đúng 100% quiz. | Nắm được khái niệm cơ bản. Sai 1-2 câu trong phần quiz. | Lẫn lộn giữa các cấp độ tự hành, chưa hiểu rõ quy trình SPA. |
| **Sơ đồ kiến trúc (Architecture Diagram)** | Vẽ đẹp, rõ ràng, chú thích đầy đủ luồng đi của dữ liệu. | Vẽ đủ các thành phần, luồng dữ liệu cơ bản đúng nhưng thiếu chi tiết. | Vẽ thiếu thành phần chính (Pi hoặc Arduino), mũi tên đi sai hướng. |
| **An toàn (Safety Awareness)** | Ghi nhớ tuyệt đối 3 quy tắc an toàn. Thực hành cẩn thận không để chạm chập. | Biết quy tắc an toàn nhưng đôi lúc cần giảng viên nhắc nhở tháo pin. | Bỏ qua cảnh báo, cắm nguồn tùy tiện không đo áp trước (Failing grade). |
| **Thực hành (Hands-on)** | Cài đặt Arduino IDE thành công, upload code chạy tốt, hiểu từng dòng lệnh. | Cài đặt được IDE, biên dịch thành công đoạn code nhưng chưa upload. | Không cài đặt được phần mềm do lỗi môi trường không tự sửa được. |
| **Bài tập về nhà (Homework)** | Nộp đầy đủ ảnh chụp màn hình, bảng BOM giá chi tiết, phân tích rõ ràng. | Nộp thiếu 1 phần nhỏ (ví dụ BOM chưa hoàn thiện). | Không nộp bài đúng hạn hoặc copy bài người khác. |

---
*Bản quyền thuộc về khóa học Xe Tự Hành DIY. Tài liệu nội bộ. / Copyright DIY Autonomous Car Course. Internal Document.*

### Phụ Lục Bổ Sung Dành Cho Học Viên Đam Mê Đọc Thêm (Bonus Appendix for Enthusiastic Readers)

**A. Tại sao lại dùng Arduino Mega thay vì Uno? (Why Mega instead of Uno?)**
Trong các dự án robot nhỏ, Arduino Uno (chip ATmega328P) thường là lựa chọn số một. Tuy nhiên, đối với một chiếc xe tự hành phức tạp, chúng ta sẽ cần điều khiển 4 động cơ, đọc nhiều cảm biến siêu âm, giao tiếp I2C với MPU6050, và đặc biệt là cần nhiều cổng Serial (UART).
Arduino Uno chỉ có 1 cổng Hardware Serial (dùng để cắm cáp USB nối máy tính). Việc dùng SoftwareSerial để giao tiếp với Raspberry Pi thường gây mất mát dữ liệu khi chạy ở tốc độ cao.
Arduino Mega 2560 giải quyết vấn đề này với 4 cổng Hardware Serial độc lập, bộ nhớ Flash lớn gấp 8 lần (256KB vs 32KB), và nhiều chân I/O hơn, cho phép khả năng mở rộng tuyệt vời.

**B. Giới thiệu về Raspberry Pi (Introduction to Raspberry Pi)**
Nhiều bạn thắc mắc Raspberry Pi là gì? Hiểu đơn giản, nó là một chiếc máy tính hoàn chỉnh (như laptop của bạn) nhưng được thu nhỏ bằng thẻ ATM. Nó có CPU kiến trúc ARM, RAM, cổng USB, cổng HDMI, kết nối WiFi/Bluetooth, và chạy hệ điều hành (thường là Raspberry Pi OS, một bản phân phối của Linux/Debian).
Trong dự án này, Pi đóng vai trò là "Bộ não nhận thức tầm cao" (High-level Cognitive Brain). Arduino không thể xử lý hình ảnh camera vì chip của nó chạy ở 16MHz và chỉ có vài KB RAM. Raspberry Pi 4 chạy ở tốc độ 1.5GHz với 4GB RAM, dư sức để chạy các mô hình AI (như YOLO, OpenCV) để nhận diện làn đường và biển báo giao thông.

**C. Giao tiếp giữa Pi và Arduino (Communication between Pi and Arduino)**
Làm thế nào để hai bộ não này nói chuyện với nhau? Chúng ta sẽ dùng cáp USB kết nối trực tiếp cổng USB của Pi vào cổng nạp USB của Arduino. Thông qua giao thức Serial over USB (UART), Pi sẽ gửi các chuỗi lệnh dạng text (ví dụ: `V_L=100,V_R=100`) xuống cho Arduino, và Arduino sẽ trả về trạng thái cảm biến (ví dụ: `DIST=30,YAW=45`). Giao tiếp này diễn ra liên tục khoảng 10-50 lần mỗi giây, giúp robot phản ứng kịp thời với môi trường.

**D. Cách sử dụng đồng hồ Vạn năng (VOM) cơ bản (Basic usage of Multimeter)**
1. Chọn thang đo: Để đo điện áp pin hoặc mạch hạ áp, vặn núm xoay về vùng có chữ `V` và đường thẳng (Điện áp một chiều - DC). Chọn thang 20V (vì pin chúng ta tối đa 12.6V, 20V là thang đo phù hợp nhất).
2. Kết nối que đo: Que Đen cắm vào cổng COM. Que Đỏ cắm vào cổng V/Ω/mA.
3. Tiến hành đo: Chạm đầu kim que Đen vào cực âm (-/GND), kim que Đỏ vào cực dương (+/VCC). Đọc kết quả trên màn hình.
Nếu màn hình hiện số âm (ví dụ -5.0V), có nghĩa là bạn đang cắm ngược que đo, hãy đảo lại.

**E. Bảo quản Pin LiPo (LiPo Battery Care)**
Pin LiPo (Lithium Polymer) cung cấp dòng xả lớn, rất mạnh mẽ, nhưng cũng rất dễ hỏng nếu không biết cách dùng.
- Không bao giờ xài cạn pin: Một cell pin LiPo đầy có điện áp 4.2V, cạn là 3.2V. Nếu dùng kiệt dưới 3.0V, pin sẽ phồng và hỏng vĩnh viễn. Pin 3S của chúng ta khi đầy là 12.6V. Khi thấy áp tổng tụt xuống quanh 10.5V, hãy sạc ngay!
- Luôn dùng còi báo pin (LiPo Alarm) cắm vào cổng balance của pin khi xe chạy. Còi sẽ hú to khi một trong các cell pin xuống dưới mức an toàn (thường cài đặt ở 3.5V).
- Khi không dùng thời gian dài (trên 1 tuần), hãy xả/sạc pin về mức lưu trữ (Storage level) là khoảng 3.8V/cell. Không cất pin khi đang đầy 100% hoặc cạn 0%.
- Sạc pin bằng sạc chuyên dụng có chức năng Balance (Cân bằng) như B3 hoặc iMax B6. Tuyệt đối không dùng nguồn Adapter thông thường cắm trực tiếp vào pin.

*Lưu ý: Mọi thao tác phần cứng trong các bài sau chỉ được tiến hành dưới sự giám sát của giảng viên, hãy tuân thủ nghiêm ngặt để đảm bảo an toàn cho thiết bị và bản thân!*
