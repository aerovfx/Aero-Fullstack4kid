# Tuần 3: Cảm Biến Khoảng Cách & Phát Hiện Vật Cản / Week 3: Distance Sensors & Obstacle Detection

## Mục Tiêu / Objectives
Trong tuần này, chúng ta sẽ tập trung vào việc trang bị "đôi mắt" cho chiếc xe tự hành của mình. Việc cảm nhận môi trường xung quanh và phát hiện vật cản là bước cơ bản nhất để xe có thể tự di chuyển an toàn mà không va chạm. 
In this week, we will focus on equipping our autonomous car with "eyes". Sensing the surrounding environment and detecting obstacles is the most fundamental step for the car to navigate safely without collisions.

1. **Hiểu Nguyên Lý Hoạt Động Của Cảm Biến Siêu Âm HC-SR04 / Understand the Working Principle of the HC-SR04 Ultrasonic Sensor**
   Nắm bắt cách sóng âm phản xạ và tính toán khoảng cách. / Grasp how sound waves reflect and calculate distance.
2. **Triển Khai Mảng 3 Cảm Biến Siêu Âm / Implement a 3-Sensor Ultrasonic Array**
   Bố trí cảm biến để bao quát không gian phía trước. / Arrange sensors to cover the frontal space.
3. **Kết Hợp Cảm Biến Hồng Ngoại (IR) / Integrate Infrared (IR) Sensors**
   Sử dụng cảm biến IR cho các vật cản ở gần và bù đắp nhược điểm của cảm biến siêu âm. / Use IR sensors for close obstacles and compensate for ultrasonic sensor weaknesses.
4. **Xây Dựng Hệ Thống Quét Lidar Đơn Giản / Build a Simple Lidar-like Scanning System**
   Sử dụng động cơ Servo kết hợp cảm biến siêu âm để quét góc rộng. / Use a Servo motor combined with an ultrasonic sensor to sweep a wide angle.
5. **Xây Dựng Bản Đồ Lưới Chiếm Chỗ Cơ Bản / Build a Basic Occupancy Grid Map**
   Chuyển đổi dữ liệu tọa độ cực sang bản đồ vật cản đơn giản. / Convert polar coordinate data to a simple obstacle map.
6. **Lọc Dữ Liệu Chống Nhiễu / Implement Noise Filtering**
   Sử dụng bộ lọc trung bình trượt để ổn định tín hiệu đọc từ cảm biến. / Use a rolling average filter to stabilize sensor readings.

---

## Linh Kiện & Dụng Cụ / Components & Tools

Dưới đây là danh sách các linh kiện cần thiết cho bài học này cùng mức giá tham khảo. / Below is the list of required components for this lesson along with reference prices.

| Hình ảnh minh họa (Mô tả) / Illustration | Tên Linh Kiện (VI) | Component Name (EN) | Số lượng / Qty | Đơn giá tham khảo (VND) / Estimated Price | Tổng cộng (VND) / Total | Ghi chú / Notes |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 🎛️ | Cảm biến siêu âm HC-SR04 | HC-SR04 Ultrasonic Sensor | 3 | 25,000 | 75,000 | Phổ biến, dễ sử dụng, tầm đo 2cm - 400cm. |
| 🔴 | Cảm biến vật cản hồng ngoại | IR Obstacle Avoidance Sensor | 2 | 15,000 | 30,000 | Tốt cho vật cản gần, phản ứng cực nhanh. |
| 🔄 | Động cơ Servo SG90 | SG90 Micro Servo Motor | 1 | 35,000 | 35,000 | Góc quay 0 - 180 độ, dùng làm bệ quét (pan/tilt). |
| 🧠 | Bo mạch Arduino UNO R3 | Arduino UNO R3 Board | 1 | 150,000 | 150,000 | Bộ脑 trung tâm (đã có từ tuần trước). |
| 🔌 | Dây cắm Breadboard (Cái-Cái) | Jumper Wires (Female-Female) | 20 | 500 | 10,000 | Để kết nối trực tiếp cảm biến với Shield/Board. |
| 🧩 | Khung gắn Servo cho HC-SR04 | HC-SR04 Servo Mount Bracket | 1 | 20,000 | 20,000 | Có thể tự in 3D hoặc mua sẵn. |

**Lưu ý:** Giá cả chỉ mang tính chất tham khảo và có thể thay đổi tùy thuộc vào cửa hàng.
**Note:** Prices are for reference only and may vary depending on the store.

---

## Công Thức / Formulas

Trong quá trình lập trình cảm biến siêu âm, chúng ta sử dụng vật lý cơ bản về sóng âm để tính khoảng cách.
In the process of programming the ultrasonic sensor, we use basic physics of sound waves to calculate distance.

### 1. Vận Tốc Âm Thanh / Speed of Sound
Vận tốc âm thanh truyền trong không khí ở điều kiện tiêu chuẩn (20°C) là khoảng **343 m/s** (mét trên giây).
The speed of sound traveling in air at standard conditions (20°C) is approximately **343 m/s** (meters per second).

Để thuận tiện tính toán cho cảm biến (đo bằng microseconds - $\mu s$ và centimeters - cm), ta quy đổi như sau:
For convenient calculation for the sensor (measured in microseconds - $\mu s$ and centimeters - cm), we convert as follows:
$V_{sound} = 343 \text{ m/s} = 34,300 \text{ cm/s}$
$V_{sound} = \frac{34,300 \text{ cm}}{1,000,000 \mu s} = 0.0343 \text{ cm/\mu s}$

### 2. Tính Khoảng Cách Từ Thời Gian Tiếng Vang / Calculating Distance from Echo Time
Cảm biến siêu âm phát ra sóng, sóng dội vào vật cản và dội lại. Thời gian đo được (`echo_duration_μs`) là thời gian cho KHOẢNG CÁCH GẤP ĐÔI (đi và về).
The ultrasonic sensor emits a wave, it hits an obstacle and bounces back. The measured time (`echo_duration_μs`) is the time for DOUBLE the distance (round trip).

**Công thức chung / General Formula:**
$\text{Khoảng cách (cm)} = \frac{\text{Thời gian đo được } (\mu s) \times \text{ Vận tốc âm thanh } (\text{cm}/\mu s)}{2}$
$\text{Distance (cm)} = \frac{\text{echo\_duration\_}\mu s \times 0.0343}{2}$

**Hoặc viết gọn hơn trong code / Or written more concisely in code:**
$\text{Distance (cm)} = \frac{\text{echo\_duration\_}\mu s}{58.2}$
*(Vì $1 / 0.0343 \approx 29.1$, chia tiếp cho 2 ta được mẫu số $58.2$)*

### Ví dụ Tính Toán / Worked Example
**Tiếng Việt:** Nếu cảm biến đo được khoảng thời gian tiếng vang là $1500 \mu s$. Khoảng cách là bao nhiêu?
- $d = (1500 \times 0.0343) / 2 = 51.45 / 2 = 25.725 \text{ cm}$.
**English:** If the sensor measures an echo duration of $1500 \mu s$. What is the distance?
- $d = (1500 \times 0.0343) / 2 = 51.45 / 2 = 25.725 \text{ cm}$.

---

## Lý Thuyết / Theory

### 1. Cảm Biến Siêu Âm HC-SR04 / HC-SR04 Ultrasonic Sensor
Cảm biến HC-SR04 bao gồm hai trụ hình tròn nhỏ giống như đôi mắt. Một trụ là loa phát siêu âm (Transmitter), trụ kia là microphone thu siêu âm (Receiver).
The HC-SR04 sensor consists of two small cylindrical transducers that look like eyes. One is the ultrasonic transmitter, the other is the ultrasonic receiver.

**Quy trình hoạt động / Operation flow:**
1. Chân **TRIG** (Trigger) được kích hoạt lên mức CAO (HIGH) trong ít nhất 10 microseconds.
   The **TRIG** pin is set HIGH for at least 10 microseconds.
2. Cảm biến phát ra một chuỗi 8 xung âm thanh ở tần số 40kHz (vượt ngưỡng nghe của con người).
   The sensor bursts 8 pulses of sound at 40kHz (above human hearing).
3. Sóng âm thanh truyền đi, đập vào vật cản và dội lại.
   The sound waves travel, hit an obstacle, and reflect back.
4. Chân **ECHO** được kéo lên mức CAO ngay khi phát sóng, và hạ xuống mức THẤP ngay khi nhận được sóng phản xạ. Thời gian chân ECHO ở mức CAO chính là thời gian sóng di chuyển đi và về.
   The **ECHO** pin goes HIGH when the wave is sent, and drops LOW when the echo is received. The duration the ECHO pin stays HIGH represents the round-trip travel time.

⚠️ **Điểm yếu / Weaknesses:** HC-SR04 gặp khó khăn với các vật cản bằng vải mềm, bông (hấp thụ âm thanh) hoặc bề mặt quá nghiêng (làm chệch hướng sóng âm).
⚠️ **Weaknesses:** HC-SR04 struggles with soft fabrics, cotton (sound absorption), or highly angled surfaces (deflecting sound waves).

### 2. Lọc Chống Nhiễu Trung Bình Trượt / Rolling Average Filter
Trong môi trường thực tế, dữ liệu từ HC-SR04 đôi khi nhảy vọt bất thường (gọi là nhiễu / noise). Để hệ thống ổn định, ta không lấy giá trị tức thời mà lấy trung bình của N giá trị gần nhất.
In real-world environments, data from HC-SR04 sometimes spikes erratically (called noise). For system stability, we don't take the instantaneous value but the average of the last N values.

**Giải thích / Explanation:** 
Thay vì tin ngay khoảng cách đo được là `2cm` trong khi trước đó liên tục là `50cm`, bộ lọc sẽ giúp làm mượt sự đột biến này, ngăn xe không bị phanh gấp sai lầm.
Instead of immediately believing the measured distance is `2cm` when it was continuously `50cm` before, the filter smooths this spike, preventing the car from making erroneous emergency brakes.

### 3. Chiến Lược Đặt Mảng 3 Cảm Biến / 3-Sensor Array Placement Strategy
Sử dụng 1 cảm biến chỉ cho chúng ta biết khoảng cách ngay phía trước. Xe có thể va chạm với vật ở góc chéo. Giải pháp là dùng mảng 3 cảm biến: Front-Left, Front-Center, Front-Right.
Using 1 sensor only tells us the distance directly in front. The car could collide with objects at a diagonal angle. The solution is using a 3-sensor array: Front-Left, Front-Center, Front-Right.
- **Trái (Left):** Bố trí nghiêng góc khoảng 30-45 độ về bên trái. (Angled 30-45 degrees left).
- **Giữa (Center):** Nhìn thẳng về phía trước. (Looking straight ahead).
- **Phải (Right):** Bố trí nghiêng góc khoảng 30-45 độ về bên phải. (Angled 30-45 degrees right).
Điều này giúp chiếc xe có tầm nhìn toàn cảnh 180 độ thu hẹp. This gives the car a narrowed 180-degree panoramic view.

### 4. Cảm Biến Hồng Ngoại Tránh Vật Cản / IR Obstacle Avoidance Sensor
Cảm biến IR phát ra ánh sáng hồng ngoại và nhận ánh sáng phản xạ từ vật thể. 
The IR sensor emits infrared light and receives reflected light from objects.
- **Ưu điểm:** Tốc độ phản hồi cực kỳ nhanh (digital 0/1), hoạt động tốt ở cự ly gần (dưới 10cm). Tránh được điểm mù cự ly gần của siêu âm.
- **Advantages:** Extremely fast response time (digital 0/1), works well at close range (under 10cm). Avoids the ultrasonic close-range blind spot.
- **Nhược điểm:** Phụ thuộc vào màu sắc vật thể (màu đen hấp thụ tia hồng ngoại dẫn đến sai lệch), dễ bị nhiễu bởi ánh sáng mặt trời mạnh.
- **Disadvantages:** Object color dependent (black color absorbs IR causing errors), easily interfered by strong sunlight.

### 5. Kết Hợp Cảm Biến (Sensor Fusion) / Sensor Fusion
Sự kết hợp hoàn hảo! Cảm biến siêu âm phụ trách tầm xa (10cm - 200cm), Cảm biến hồng ngoại phụ trách "vòng bảo vệ khẩn cấp" ở cự ly rất gần (<10cm). Nếu bất kỳ cảm biến nào báo động, xe sẽ kích hoạt phanh hoặc chuyển hướng.
The perfect match! Ultrasonic handles long-range (10-200cm), IR handles the "emergency defense ring" at very close range (<10cm). If any sensor triggers an alarm, the car will brake or divert.

### 6. Xây Dựng Hệ Thống Quét Lidar Với Servo / Building a Lidar-like Scanner with Servo
Thay vì dùng nhiều cảm biến siêu âm, ta có thể gắn 1 cảm biến HC-SR04 lên trên động cơ Servo SG90. Servo sẽ liên tục xoay từ 0 độ đến 180 độ, tạo ra một bản đồ khoảng cách dạng quạt.
Instead of using many ultrasonic sensors, we can mount 1 HC-SR04 on an SG90 Servo motor. The servo will continuously sweep from 0 to 180 degrees, creating a fan-shaped distance map.

**Biểu diễn tọa độ cực (Polar Coordinates):** 
Tại mỗi thời điểm, hệ thống ghi nhận cặp giá trị: $(G\text{óc }\theta, \text{Khoảng cách } r)$. 
At any moment, the system records a value pair: $(Angle\ \theta, Distance\ r)$.

### 7. Phân Vùng Cảnh Báo Khoảng Cách / Threshold Zones
Hệ thống logic của xe tự hành cần được chia thành các VÙNG (Zones) để ra quyết định:
The autonomous car logic system needs to be divided into ZONES for decision making:
- 🟢 **SAFE ZONE (Vùng an toàn):** `Distance > 40cm`. Xe được phép đi nhanh, tăng tốc thoải mái. (Car allowed to go fast, accelerate freely).
- 🟡 **WARNING ZONE (Vùng cảnh báo):** `15cm < Distance <= 40cm`. Xe cần giảm tốc độ, chuẩn bị đánh lái né tránh. (Car needs to slow down, prepare to steer and avoid).
- 🔴 **DANGER ZONE (Vùng nguy hiểm):** `Distance <= 15cm`. Xe phải DỪNG KHẨN CẤP ngay lập tức, sau đó lùi lại. (Car must EMERGENCY STOP immediately, then reverse).

---

## Sơ Đồ Kết Nối / Wiring Diagram

### Sơ đồ 1: Gắn 1 Cảm biến HC-SR04 cơ bản / Diagram 1: Basic 1 HC-SR04 Wiring

| Chân HC-SR04 / HC-SR04 Pin | Chân Arduino / Arduino Pin | Loại Kết Nối / Connection Type | Màu Dây Gợi Ý / Suggested Wire Color |
| :--- | :--- | :--- | :--- |
| VCC | 5V | Nguồn cấp / Power | Đỏ / Red |
| GND | GND | Nối đất / Ground | Đen / Black |
| TRIG | D9 | Tín hiệu kích hoạt / Trigger (OUTPUT) | Vàng / Yellow |
| ECHO | D10 | Tín hiệu nhận / Echo (INPUT) | Xanh lá / Green |

### Sơ đồ 2: Hệ Thống Radar Quét (HC-SR04 + Servo SG90) / Diagram 2: Scanning Radar System

| Thiết bị / Device | Chân thiết bị / Device Pin | Chân Arduino / Arduino Pin |
| :--- | :--- | :--- |
| **Servo SG90** | Đỏ (VCC) / Red | 5V |
| | Nâu (GND) / Brown | GND |
| | Cam (Signal) / Orange | D3 (Có PWM) |
| **HC-SR04** | VCC | 5V |
| | GND | GND |
| | TRIG | D9 |
| | ECHO | D10 |

⚠️ **Cảnh Báo An Toàn / Safety Warning:**
Động cơ Servo có thể tiêu thụ dòng điện khá lớn khi bị kẹt (stall current). Nếu sử dụng Arduino cấp nguồn qua cổng USB, cẩn thận không sử dụng nhiều servo cùng lúc sẽ làm sụt áp mạch, reset Arduino hoặc làm hỏng cổng USB máy tính. Tốt nhất nên cấp nguồn pin riêng cho các động cơ và chia chung chân GND với Arduino.
Servo motors can consume high stall current. If powering Arduino via USB, be careful not to use multiple servos simultaneously as it can cause voltage drops, reset Arduino, or fry your computer's USB port. It's best to use a separate battery pack for motors and share the common GND with Arduino.

---

## Thực Hành / Hands-On

### Bài Thực Hành 1: Đọc khoảng cách cơ bản có lọc nhiễu / Lab 1: Basic Distance Reading with Filter
**Bước 1 / Step 1:** Lắp ráp mạch điện theo Sơ đồ 1. Sử dụng breadboard để cắm HC-SR04 nếu cần. (Assemble the circuit according to Diagram 1. Use a breadboard for the HC-SR04 if needed.)
**Bước 2 / Step 2:** Viết mã lệnh trên Arduino IDE (xem phần Code bên dưới). (Write code on Arduino IDE).
**Bước 3 / Step 3:** Mở Serial Monitor. Di chuyển bàn tay của bạn hoặc một cuốn sách lại gần và ra xa cảm biến. Quan sát sự thay đổi của khoảng cách. (Open Serial Monitor. Move your hand or a book closer and further from the sensor. Observe the distance changing.)
**Bước 4 / Step 4:** Mở Serial Plotter (Tools > Serial Plotter). Quan sát đồ thị biểu diễn khoảng cách. Đồ thị sẽ giúp bạn nhận ra việc lọc trung bình đã làm mượt đường cong dữ liệu như thế nào. (Open Serial Plotter. Observe the distance graph. The graph will help you realize how the average filtering smooths the data curve.)

### Bài Thực Hành 2: Radar Chống Va Chạm (Servo Scanner) / Lab 2: Anti-Collision Radar
**Bước 1 / Step 1:** Lắp Servo SG90 lên phía trước mũi xe khung gầm. (Mount SG90 Servo to the front of the chassis.)
**Bước 2 / Step 2:** Lắp giá đỡ (bracket) và gắn HC-SR04 lên trên Servo. Cắm dây theo Sơ đồ 2. (Attach the bracket and mount HC-SR04 onto the Servo. Wire according to Diagram 2.)
**Bước 3 / Step 3:** Tải đoạn mã Code Radar. Bạn sẽ thấy cảm biến liên tục quay quét qua lại như mắt của một robot. (Upload the Radar Code. You will see the sensor continuously sweeping back and forth like a robot's eye.)
**Bước 4 / Step 4:** Phân tích dữ liệu in ra Serial. Nếu vật cản xuất hiện ở góc 45 độ, khoảng cách nhỏ hơn 15cm, thông báo nguy hiểm sẽ được bật. (Analyze printed Serial data. If an obstacle appears at 45 degrees, distance < 15cm, a danger alert is triggered.)

---

## Code Arduino

### Đoạn Code 1: Cảm biến siêu âm với bộ lọc Trung bình trượt (Ultrasonic with Rolling Average Filter)

```cpp
/*
 * BÀI HỌC TUẦN 3: Cảm biến siêu âm và lọc nhiễu
 * WEEK 3 LESSON: Ultrasonic sensor and noise filtering
 * 
 * Mã lệnh này lấy mẫu khoảng cách liên tục và tính trung bình của 5 giá trị gần nhất
 * để làm cho kết quả đầu ra rất mượt mà.
 * This code samples distance continuously and averages the 5 most recent values
 * to make the output extremely smooth.
 */

const int TRIG_PIN = 9;
const int ECHO_PIN = 10;

// Cấu hình bộ lọc / Filter configuration
const int NUM_SAMPLES = 5;      // Số lượng mẫu để tính trung bình / Number of samples to average
int readings[NUM_SAMPLES];      // Mảng lưu trữ dữ liệu / Array to store data
int readIndex = 0;              // Chỉ số hiện tại của mảng / Current index of the array
long total = 0;                 // Tổng các giá trị / Running total
int averageDistance = 0;        // Khoảng cách trung bình tính toán / Calculated average distance

void setup() {
  Serial.begin(9600);           // Bật cổng giao tiếp Serial / Enable Serial communication
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  // Khởi tạo mảng toàn số 0 / Initialize array with 0s
  for (int i = 0; i < NUM_SAMPLES; i++) {
    readings[i] = 0;
  }
}

void loop() {
  // 1. Kích hoạt cảm biến / Trigger the sensor
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  // 2. Đo thời gian xung ECHO / Measure ECHO pulse time
  long duration = pulseIn(ECHO_PIN, HIGH, 30000); // Timeout sau 30ms (khoảng 5 mét) / Timeout 30ms

  // 3. Tính khoảng cách tức thời / Calculate instantaneous distance
  int currentDistance = duration * 0.034 / 2;
  
  // Xử lý lỗi nếu ngoài tầm (trả về 0 do timeout) / Handle out of range
  if (currentDistance <= 0 || currentDistance > 400) {
    currentDistance = 400; // Đặt thành max / Set to max
  }

  // 4. Áp dụng bộ lọc Trung bình trượt / Apply Rolling Average Filter
  total = total - readings[readIndex];       // Trừ đi giá trị cũ nhất / Subtract oldest value
  readings[readIndex] = currentDistance;     // Thêm giá trị mới / Add new value
  total = total + readings[readIndex];       // Cộng vào tổng / Add to total
  readIndex = readIndex + 1;                 // Tiến lên index tiếp theo / Move to next index

  if (readIndex >= NUM_SAMPLES) {
    readIndex = 0;                           // Vòng lặp lại từ đầu mảng / Wrap around
  }

  averageDistance = total / NUM_SAMPLES;     // Tính trung bình / Calculate average

  // 5. Phân loại vùng cảnh báo / Classify threshold zones
  String zoneStatus = "SAFE";
  if (averageDistance <= 15) {
    zoneStatus = "DANGER!!! STOP";
  } else if (averageDistance <= 40) {
    zoneStatus = "WARNING! SLOW DOWN";
  }

  // 6. In kết quả ra Serial / Print results to Serial
  Serial.print("Raw: ");
  Serial.print(currentDistance);
  Serial.print(" cm \t| Smoothed: ");
  Serial.print(averageDistance);
  Serial.print(" cm \t| Status: ");
  Serial.println(zoneStatus);

  delay(50); // Chờ 50ms trước lần đo tiếp theo / Wait 50ms before next reading
}
```

### Đoạn Code 2: Hệ Thống Radar Quét (Radar Scanner with Servo)

```cpp
/*
 * BÀI HỌC TUẦN 3: Radar quét không gian với Servo và Cảm biến siêu âm
 * WEEK 3 LESSON: Space scanning radar with Servo and Ultrasonic sensor
 */

#include <Servo.h>

const int TRIG_PIN = 9;
const int ECHO_PIN = 10;
const int SERVO_PIN = 3;

Servo myServo;  // Khởi tạo đối tượng Servo / Create Servo object

void setup() {
  Serial.begin(9600);
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  myServo.attach(SERVO_PIN); // Gắn Servo vào chân số 3 / Attach Servo to pin 3
  myServo.write(90);         // Đặt Servo về vị trí giữa ban đầu / Center servo initially
  delay(1000);
}

// Hàm phụ để đo khoảng cách / Helper function to measure distance
int measureDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if(duration == 0) return 400; // Timeout
  return duration * 0.034 / 2;
}

void loop() {
  // Quét từ phải sang trái (0 độ -> 180 độ) / Sweep Right to Left
  for(int angle = 0; angle <= 180; angle += 15) {
    myServo.write(angle);
    delay(100); // Chờ servo quay đến vị trí / Wait for servo to reach position
    
    int dist = measureDistance();
    
    // In ra dạng định dạng: Góc, Khoảng cách (để dễ parse bằng phần mềm)
    // Print format: Angle, Distance (easy to parse via software)
    Serial.print("Angle: ");
    Serial.print(angle);
    Serial.print("\tDist: ");
    Serial.print(dist);
    
    if(dist < 20) {
      Serial.println("\t -> OBJECT DETECTED!");
    } else {
      Serial.println("");
    }
  }
  
  // Quét từ trái về phải (180 độ -> 0 độ) / Sweep Left to Right
  for(int angle = 180; angle >= 0; angle -= 15) {
    myServo.write(angle);
    delay(100);
    int dist = measureDistance();
    
    Serial.print("Angle: ");
    Serial.print(angle);
    Serial.print("\tDist: ");
    Serial.print(dist);
    if(dist < 20) Serial.println("\t -> OBJECT DETECTED!");
    else Serial.println("");
  }
}
```

---

## Câu Hỏi Thảo Luận / Discussion

1. **Vấn đề bề mặt phản xạ (Reflective Surfaces):** Nếu xe đi về phía một tấm kính cường lực nghiêng 45 độ, cảm biến HC-SR04 sẽ gặp hiện tượng gì? Tại sao? Làm sao để khắc phục?
   *If the car drives towards a 45-degree angled tempered glass pane, what phenomenon will the HC-SR04 sensor experience? Why? How to overcome it?*
2. **Nhiễu Xuyên Âm (Crosstalk):** Nếu bạn lắp 3 cảm biến siêu âm phát cùng một lúc trên một xe, điều gì sẽ xảy ra với sóng âm? Làm thế nào để giải quyết vấn đề này trong lập trình?
   *If you mount 3 ultrasonic sensors pinging simultaneously on a car, what happens to the sound waves? How do you solve this in programming?*
3. **Ưu Nhược Điểm (Pros & Cons):** So sánh ưu và nhược điểm của việc dùng mảng 3 cảm biến siêu âm cố định so với việc dùng 1 cảm biến xoay trên servo. 
   *Compare the pros and cons of using a fixed 3-sensor array versus using a single sensor rotating on a servo.*
4. **Ảnh Hưởng Môi Trường (Environmental Impact):** Nhiệt độ môi trường ảnh hưởng đến vận tốc âm thanh. Ở 0°C vận tốc âm thanh là ~331m/s, ở 30°C là ~349m/s. Liệu sự chênh lệch này có đủ lớn để làm xe tự hành của chúng trên đâm vào tường không?
   *Temperature affects the speed of sound. At 0°C it's ~331m/s, at 30°C it's ~349m/s. Is this difference significant enough to cause our autonomous car to crash into a wall?*
5. **Giới Hạn Cảm Biến IR (IR Sensor Limitations):** Tại sao cảm biến vật cản hồng ngoại lại bị mù hoặc báo sai khi xe chạy ở ngoài trời lúc 12 giờ trưa nắng gắt?
   *Why does the IR obstacle sensor go blind or report false positives when driving outdoors at 12 noon under bright sunlight?*

---

## Bài Về Nhà / Homework & Mini-Project

### Bài tập lý thuyết / Theory Exercises:
1. Tính toán lại công thức khoảng cách nếu bạn mang chiếc xe này lên thám hiểm bề mặt Sao Hỏa (nơi bầu khí quyển chủ yếu là $CO_2$ và áp suất rất thấp, vận tốc âm thanh khoảng 240 m/s). 
   *Recalculate the distance formula if you take this car to explore the surface of Mars (where the atmosphere is mostly $CO_2$ and pressure is very low, speed of sound is about 240 m/s).*
2. Vẽ sơ đồ khối logic (flowchart) cho xe: Đi thẳng -> Gặp vật cản 15cm -> Dừng lại -> Quét servo trái/phải -> Quyết định rẽ bên nào rộng hơn.
   *Draw a logic flowchart for the car: Go straight -> See obstacle 15cm -> Stop -> Sweep servo left/right -> Decide to turn to the side with more space.*

### Mini-Project: "Rada Cảnh Báo Lùi Xe" / "Reverse Parking Radar"
**Yêu cầu / Requirements:**
- Sử dụng cảm biến siêu âm phía sau xe (hoặc giả lập trên bàn).
- Thêm một module Còi bíp (Buzzer) loại chủ động.
- Lập trình: Khoảng cách > 50cm (im lặng). 30-50cm (Bíp ngắt quãng chậm). 15-30cm (Bíp ngắt quãng nhanh). <15cm (Bíp liên tục dài báo động).
- **Mở rộng (Tùy chọn):** Kết hợp thêm 3 đèn LED (Xanh, Vàng, Đỏ) sáng tương ứng với từng dải khoảng cách.

---

## Đánh Giá / Assessment Rubric

Sử dụng bảng dưới đây để giáo viên / trợ giảng chấm điểm phần thực hành tuần này của học sinh.
Use the table below for teachers / TAs to grade students' practical work this week.

| Tiêu Chí Đánh Giá / Evaluation Criteria | Kém / Poor (0-4 đ) | Khá / Fair (5-7 đ) | Tốt / Good (8-10 đ) |
| :--- | :--- | :--- | :--- |
| **1. Lắp Ráp & Đi Dây (Wiring & Assembly)** | Đi dây lộn xộn, sai chân cắm, không gọn gàng. Có nguy cơ chạm chập. | Đi dây đúng sơ đồ nhưng chưa thực sự tối ưu hoặc hơi rối mắt. | Dây điện đi gọn gàng, chia nhóm rõ ràng, sử dụng dây thít, đảm bảo thẩm mỹ và an toàn. |
| **2. Code Cảm Biến (Sensor Code)** | Code copy paste không hiểu, không đọc được dữ liệu lên Serial Monitor. | Code chạy được, đọc được khoảng cách, nhưng chưa biết tinh chỉnh hoặc tối ưu. | Ứng dụng xuất sắc bộ lọc Trung bình trượt, code sạch, có chú thích đầy đủ. |
| **3. Cấu hình Servo (Servo Configuration)** | Servo không quay hoặc quay giật cục, sai góc nghiêm trọng. | Servo quét được nhưng góc bị lệch hoặc tốc độ quay chưa hợp lý với vòng lặp delay. | Cơ cấu quét mượt mà, định thời tốt, log ra Serial rõ ràng góc độ và khoảng cách tương ứng. |
| **4. Hiểu Lý Thuyết (Theory Comprehension)** | Không trả lời được các khái niệm về vận tốc âm thanh hoặc sóng phản xạ. | Trả lời được cơ bản công thức nhưng lúng túng khi hỏi mở rộng. | Giải thích rành mạch, tính toán tốt, hiểu rõ ưu nhược điểm của siêu âm và hồng ngoại. |
| **5. Hoàn Thành Bài Tập / Homework** | Không nộp hoặc nộp sai hoàn toàn. | Hoàn thành cơ bản một nửa yêu cầu của Mini-Project. | Hoàn thành xuất sắc Mini-Project, có thêm tính năng sáng tạo (đèn LED, LCD). |

---
**Chúc các bạn một tuần học tập vui vẻ và không bị "va chạm"!**
**Have a fun learning week and stay "collision-free"!**
