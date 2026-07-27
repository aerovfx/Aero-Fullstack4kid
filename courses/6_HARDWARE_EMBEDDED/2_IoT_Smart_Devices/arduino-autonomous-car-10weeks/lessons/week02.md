# Tuần 2: Khung Xe, Động Cơ DC & Điều Khiển Tốc Độ / Week 2: Chassis, DC Motors & Speed Control

Chào mừng các bạn đến với Tuần 2 của khóa học Tự Hành / Welcome to Week 2 of the Autonomous Car course. Trong tuần này, chúng ta sẽ bắt đầu làm việc với phần cứng để xe có thể di chuyển / This week, we will start working with the hardware to make the car move.

---

## Mục Tiêu / Objectives

Sau khi hoàn thành bài học này, bạn sẽ có thể:
After completing this lesson, you will be able to:

1. Phân biệt được các loại khung xe cơ bản và lý do chọn loại 2 bánh dẫn động (differential drive).
   *Understand different chassis types and the rationale for choosing differential drive.*
2. Giải thích cấu tạo và nguyên lý hoạt động của động cơ DC, cũng như vai trò của bộ giảm tốc.
   *Explain the structure and working principle of DC motors and gearboxes.*
3. Hiểu và áp dụng kỹ thuật băm xung PWM để điều khiển tốc độ động cơ.
   *Understand and apply Pulse Width Modulation (PWM) to control motor speed.*
4. Biết cách sử dụng mạch điều khiển động cơ L298N (hoặc L9110S) thông qua cầu H (H-bridge).
   *Know how to use L298N or L9110S motor drivers using the H-bridge circuit.*
5. Lập trình Arduino để điều khiển xe đi thẳng, lùi, rẽ trái, rẽ phải và thay đổi tốc độ.
   *Program the Arduino to command the car to move forward, backward, left, right, and change speed.*
6. Nắm bắt khái niệm cơ bản về Odometry (đo đạc quãng đường) sử dụng xung từ encoder.
   *Grasp basic concepts of Odometry using encoder pulses.*

---

## Linh Kiện & Dụng Cụ / Components & Tools

Dưới đây là danh sách các thiết bị bạn cần chuẩn bị cho tuần này:
Below is the list of components you need to prepare for this week:

| STT / No. | Linh Kiện / Component | Mô Tả / Description | Số Lượng / Qty | Giá Ước Tính (VND) / Est. Price |
| :--- | :--- | :--- | :---: | :--- |
| 1 | Khung xe 2WD / 2WD Robot Chassis | Bao gồm đế Mica, 2 bánh xe, 1 bánh hướng dẫn / Includes acrylic base, 2 wheels, 1 caster wheel | 1 bộ / set | 120,000 |
| 2 | Động cơ DC giảm tốc / DC Gear Motor | Động cơ vàng 3V-6V có hộp số / Yellow TT motor 3V-6V with gearbox | 2 | 40,000 (20k/cái) |
| 3 | Mạch điều khiển động cơ L298N / L298N Motor Driver | Module điều khiển động cơ cầu H / H-bridge motor driver module | 1 | 55,000 |
| 4 | Arduino UNO R3 (Kèm cáp) / Arduino UNO R3 + Cable | Vi điều khiển chính / Main microcontroller board | 1 | 150,000 |
| 5 | Hộp pin 18650 / 18650 Battery Holder | Khay đựng 2 viên pin 18650 / Holder for 2x 18650 cells | 1 | 25,000 |
| 6 | Pin 18650 3.7V / 18650 Li-ion Battery | Nguồn cấp cho động cơ / Power source for motors | 2 | 100,000 (50k/viên) |
| 7 | Dây cắm cái-cái, đực-cái / Jumper Wires (F-F, M-F) | Để nối các linh kiện / For connecting components | 1 bó / pack | 30,000 |
| 8 | Băng dính cách điện, tua vít / Insulation tape, screwdriver | Dụng cụ lắp ráp / Assembly tools | 1 bộ / set | Tự có / Own |

*Lưu ý:* Giá trên chỉ mang tính chất tham khảo. Bạn có thể tìm mua linh kiện tại các cửa hàng điện tử ở chợ Nhật Tảo, hoặc trên các sàn thương mại điện tử (Shopee, Lazada).
*Note:* The prices above are for reference only. You can find these components at local electronics stores or online marketplaces.

---

> [!WARNING]
> ⚠️ CẢNH BÁO AN TOÀN / SAFETY WARNING
> Khi làm việc với pin 18650 và động cơ DC, bạn cần cực kỳ cẩn thận với việc cấp nguồn.
> - KHÔNG BAO GIỜ được đấu chập hai cực (âm và dương) của pin 18650 lại với nhau. Điều này có thể gây cháy nổ.
> - Luôn kiểm tra kỹ các dây nối nguồn điện trước khi bật công tắc.
> - Khi tháo lắp dây dẫn, đảm bảo đã ngắt nguồn điện (tháo pin hoặc tắt công tắc).
> 
> *When working with 18650 batteries and DC motors, you must be extremely careful with power connections.*
> *- NEVER short-circuit the positive and negative terminals of an 18650 battery. This can cause fire or explosion.*
> *- Always double-check power connections before turning on the switch.*
> *- Ensure power is disconnected when assembling or modifying wiring.*

---

## Lý Thuyết / Theory

### 1. Phân loại Khung Xe / Chassis Types

Để thiết kế một chiếc xe tự hành, việc đầu tiên là quyết định phương pháp lái (steering method). Có 3 loại phổ biến:
To design an autonomous car, the first step is deciding on the steering method. There are 3 common types:

#### a) Ackermann Steering (Giống xe ô tô thật / Like a real car)
- **Đặc điểm:** Sử dụng 2 bánh trước để bẻ lái, 2 bánh sau để truyền động.
- **Ưu điểm:** Di chuyển mượt mà, ổn định ở tốc độ cao.
- **Nhược điểm:** Phức tạp trong cơ khí, bán kính quay vòng (turning radius) lớn, không thể quay tại chỗ.

#### b) 4WD / 4-Wheel Drive (Dẫn động 4 bánh)
- **Đặc điểm:** Cả 4 bánh đều được gắn động cơ.
- **Ưu điểm:** Lực kéo mạnh, vượt địa hình tốt (Off-road).
- **Nhược điểm:** Tiêu thụ nhiều điện năng, khó điều khiển chính xác, bánh xe dễ bị trượt khi quay đầu (skid-steer).

#### c) Differential Drive (Dẫn động vi sai / 2 bánh độc lập)
- **Đặc điểm:** Có 2 bánh xe chủ động ở hai bên (trái và phải) và 1 bánh tự do (caster wheel) để giữ thăng bằng.
- **Ưu điểm:** Cơ khí cực kỳ đơn giản, có thể quay 360 độ tại chỗ (Zero-turn radius) bằng cách cho 2 bánh quay ngược chiều nhau.
- **Nhược điểm:** Khó đi thẳng một cách hoàn hảo do sai số cơ khí giữa 2 động cơ.

**Tại sao chúng ta chọn Differential Drive cho khóa học này?**
**Why differential drive for our robot?**
Sự đơn giản trong cả cơ khí và toán học điều khiển biến nó thành lựa chọn hoàn hảo cho người mới bắt đầu. Tính năng quay tại chỗ giúp xe dễ dàng điều hướng trong không gian hẹp (như chạy mê cung).
*Its mechanical and mathematical simplicity makes it perfect for beginners. The zero-turn capability allows easy navigation in tight spaces.*

### 2. Động Cơ DC (DC Motor Anatomy)

Động cơ DC (Direct Current - Dòng điện một chiều) là trái tim của hệ thống di chuyển.

- **Brushed vs Brushless (Có chổi than vs Không chổi than):** Động cơ vàng (TT motor) sử dụng trong khóa học là loại có chổi than (Brushed). Chúng rẻ, dễ điều khiển bằng cách đảo chiều dòng điện, nhưng tuổi thọ thấp hơn do ma sát của chổi than.
- **Gear Ratio (Tỉ số truyền):** Động cơ DC thông thường quay rất nhanh (ví dụ: 5000 vòng/phút - RPM) nhưng lực kéo (Torque) rất yếu. Hộp số giảm tốc (Gearbox) tích hợp sẽ giảm tốc độ quay (ví dụ còn 100 RPM) nhưng tăng lực kéo lên gấp nhiều lần, giúp xe chở được nặng. Thông thường loại TT motor có tỉ số truyền 1:48 hoặc 1:120.
- **Encoder (Đĩa mã hóa):** Động cơ cao cấp hơn sẽ có encoder gắn ở đuôi. Encoder tạo ra các xung (pulses) mỗi khi trục động cơ quay. Bằng cách đếm số xung này, Arduino có thể biết được bánh xe đã quay được bao nhiêu vòng, từ đó tính ra quãng đường đi được. Trong khóa học này, ta dùng loại động cơ TT không có encoder gắn sẵn, nhưng sau này ta sẽ dùng module cảm biến tốc độ quang học đóng vai trò tương đương.

### 3. Điều khiển tốc độ bằng PWM (PWM Fundamentals)

Bạn không thể thay đổi điện áp cung cấp từ pin một cách dễ dàng. Vậy làm sao để điều chỉnh tốc độ động cơ DC? Giải pháp là PWM (Pulse Width Modulation - Điều chế độ rộng xung).

Thay vì cấp điện liên tục, chúng ta sẽ bật và tắt dòng điện rất nhanh (hàng nghìn lần mỗi giây).
- **Duty Cycle (Chu kỳ nhiệm vụ):** Tỷ lệ phần trăm thời gian mà dòng điện ở trạng thái "Bật" (HIGH) trong một chu kỳ.
  - Duty Cycle = 0%: Động cơ dừng hoàn toàn (0V).
  - Duty Cycle = 100%: Động cơ quay tốc độ tối đa (5V hoặc điện áp pin).
  - Duty Cycle = 50%: Động cơ quay với khoảng 50% tốc độ tối đa.
- **Frequency (Tần số):** Số chu kỳ bật/tắt trong 1 giây. Nếu tần số đủ cao, động cơ do có quán tính sẽ quay mượt mà như thể được cấp một điện áp thấp hơn liên tục.

Trong Arduino, hàm `analogWrite(pin, value)` được sử dụng để tạo PWM. Giá trị `value` có dải từ 0 đến 255.
- `analogWrite(pin, 0)` -> Duty Cycle 0%
- `analogWrite(pin, 127)` -> Duty Cycle ~50%
- `analogWrite(pin, 255)` -> Duty Cycle 100%

### 4. Mạch điều khiển động cơ Cầu H (Motor Driver)

Vi điều khiển Arduino chỉ cấp được dòng điện rất nhỏ (khoảng 20mA - 40mA), không đủ để kéo động cơ (động cơ cần 200mA - 1000mA). Nếu nối trực tiếp động cơ vào Arduino, board mạch sẽ bị cháy ngay lập tức.
Do đó, chúng ta cần một mạch trung gian gọi là Motor Driver, và phổ biến nhất là L298N.

#### Mạch Cầu H (H-Bridge)
Là một mạch điện tử gồm 4 công tắc (transistor). Bằng cách đóng ngắt các công tắc chéo nhau, nó có thể đảo chiều dòng điện chạy qua động cơ, từ đó làm động cơ quay thuận hoặc quay nghịch.

#### Giới thiệu Module L298N
L298N có thể điều khiển 2 động cơ DC độc lập, chịu dòng điện lên đến 2A mỗi kênh.
Các chân giao tiếp:
- **Nguồn cấp:**
  - `VCC` (hoặc `+12V`): Nối với cực dương (+) của pin (từ 5V - 35V).
  - `GND`: Nối với cực âm (-) của pin VÀ nối chung với GND của Arduino (rất quan trọng!).
  - `+5V`: Nguồn 5V đầu ra (hoặc đầu vào nếu tháo jumper). Ta có thể dùng chân này để cấp nguồn ngược lại cho Arduino.
- **Điều khiển Động cơ A (Trái):**
  - `ENA`: Chân Enable A. Cấp PWM vào đây để điều khiển tốc độ.
  - `IN1` & `IN2`: Chân điều khiển hướng (Logic 1-0 hoặc 0-1 để quay thuận/nghịch).
- **Điều khiển Động cơ B (Phải):**
  - `ENB`: Chân Enable B. Cấp PWM vào đây để điều khiển tốc độ.
  - `IN3` & `IN4`: Chân điều khiển hướng.

*Lưu ý thay thế:* L9110S là một mạch nhỏ gọn hơn, phù hợp cho các động cơ công suất nhỏ, nhưng L298N vẫn là tiêu chuẩn và bền bỉ hơn.

---

## Sơ Đồ Kết Nối / Wiring Diagram

Việc kết nối đúng là vô cùng quan trọng. Hãy làm theo từng bước chậm rãi.
*Proper wiring is crucial. Follow each step slowly.*

1. **Kết nối Nguồn Điện (Power Connection):**
   - Pin 18650 Cực Dương (+) ➜ Công tắc ➜ Chân `VCC / +12V` của L298N.
   - Pin 18650 Cực Âm (-) ➜ Chân `GND` của L298N.
   - Chân `GND` của L298N ➜ Chân `GND` trên Arduino (BẮT BUỘC để chung mass / Must have common ground).
   - (Tùy chọn) Chân `+5V` của L298N ➜ Chân `VIN` hoặc `5V` trên Arduino (Để không cần cấp nguồn từ USB).

2. **Kết nối Động Cơ (Motor Connection):**
   - Động Cơ Trái (Left Motor) ➜ Chân `OUT1` và `OUT2` của L298N.
   - Động Cơ Phải (Right Motor) ➜ Chân `OUT3` và `OUT4` của L298N.
   *(Nếu sau này lập trình mà bánh xe quay ngược, bạn chỉ cần đảo 2 dây OUT1/OUT2 hoặc OUT3/OUT4)*

3. **Kết nối Tín Hiệu Arduino (Arduino Signals):**
   - L298N `ENA` ➜ Arduino Chân `10` (Chân có hỗ trợ PWM, thường có dấu ~).
   - L298N `IN1` ➜ Arduino Chân `9`.
   - L298N `IN2` ➜ Arduino Chân `8`.
   - L298N `IN3` ➜ Arduino Chân `7`.
   - L298N `IN4` ➜ Arduino Chân `6`.
   - L298N `ENB` ➜ Arduino Chân `5` (Có hỗ trợ PWM ~).

*(Hãy đảm bảo bạn đã rút 2 miếng Jumper màu đen mặc định trên chân ENA và ENB của L298N ra).*

---

## Thực Hành / Hands-On

### Bước 1: Lắp ráp cơ khí (Mechanical Assembly)
- Gắn 2 động cơ vào khung Mica bằng ốc vít dài. Đảm bảo phần dây điện của động cơ hướng vào trong.
- Gắn bánh xe dẫn hướng (caster wheel) ở phía trước hoặc sau.
- Cố định L298N, Arduino và khay pin lên khung xe bằng băng dính xốp 2 mặt hoặc trụ đồng. Cố gắng phân bố trọng lượng đều để xe không bị nghiêng.

### Bước 2: Đi dây điện (Wiring)
Thực hiện nối dây theo đúng sơ đồ ở phần trên. Kiểm tra lại lần 2 bằng mắt thường trước khi cắm pin. Đảm bảo không có dây nào bị chập (đặc biệt là dây nguồn).

### Bước 3: Nạp Code Test Động Cơ (Upload Test Code)
Chúng ta sẽ viết một đoạn code để kiểm tra xem 2 động cơ có hoạt động đúng chiều hay không.

---

## Code Arduino

Dưới đây là mã nguồn cơ bản để điều khiển xe. Code đã được modular hóa thành các hàm nhỏ (`moveForward`, `turnLeft`, `stopCar`, v.v.) giúp bạn dễ quản lý.
*Below is the basic code to control the car. It has been modularized into small functions for easy management.*

```cpp
// Tuần 2: Điều khiển xe Differential Drive cơ bản
// Week 2: Basic Differential Drive control

// --- Định nghĩa chân kết nối (Pin Definitions) ---

// Động cơ Trái (Left Motor)
const int ENA = 10; // Cấp PWM điều khiển tốc độ bánh trái
const int IN1 = 9;  // Điều khiển hướng bánh trái
const int IN2 = 8;  // Điều khiển hướng bánh trái

// Động cơ Phải (Right Motor)
const int ENB = 5;  // Cấp PWM điều khiển tốc độ bánh phải
const int IN3 = 7;  // Điều khiển hướng bánh phải
const int IN4 = 6;  // Điều khiển hướng bánh phải

// Tốc độ mặc định (0-255) / Default speed
int defaultSpeed = 150; 

void setup() {
  // Cài đặt tất cả các chân là OUTPUT
  // Set all motor control pins as OUTPUT
  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(ENB, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);

  // Mở Serial Monitor để debug
  Serial.begin(9600);
  Serial.println("Robot Car Initialized!");
  
  // Dừng xe khi vừa bật nguồn
  stopCar();
}

void loop() {
  // KỊCH BẢN TEST (TEST SCENARIO)
  // Xe sẽ đi thẳng 2 giây, lùi 2 giây, rẽ trái 1 giây, rẽ phải 1 giây, sau đó dừng.
  
  Serial.println("Moving Forward...");
  moveForward(defaultSpeed);
  delay(2000); // Đợi 2000 ms = 2 giây
  
  Serial.println("Moving Backward...");
  moveBackward(defaultSpeed);
  delay(2000);
  
  Serial.println("Turning Left...");
  turnLeft(defaultSpeed);
  delay(1000);
  
  Serial.println("Turning Right...");
  turnRight(defaultSpeed);
  delay(1000);
  
  Serial.println("Stopping...");
  stopCar();
  
  // Chờ 5 giây rồi lặp lại
  delay(5000); 
}

// ==========================================
// CÁC HÀM ĐIỀU KHIỂN (CONTROL FUNCTIONS)
// ==========================================

// Hàm đi thẳng / Move Forward
// 2 bánh cùng quay tới
void moveForward(int speed) {
  // Bánh trái quay tới
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, speed);
  
  // Bánh phải quay tới
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, speed);
}

// Hàm đi lùi / Move Backward
// 2 bánh cùng quay ngược
void moveBackward(int speed) {
  // Bánh trái quay lùi
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  analogWrite(ENA, speed);
  
  // Bánh phải quay lùi
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENB, speed);
}

// Hàm rẽ trái tại chỗ / Turn Left (Zero-turn)
// Bánh phải quay tới, bánh trái quay lùi
void turnLeft(int speed) {
  // Bánh trái quay lùi
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, HIGH);
  analogWrite(ENA, speed);
  
  // Bánh phải quay tới
  digitalWrite(IN3, HIGH);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, speed);
}

// Hàm rẽ phải tại chỗ / Turn Right (Zero-turn)
// Bánh trái quay tới, bánh phải quay lùi
void turnRight(int speed) {
  // Bánh trái quay tới
  digitalWrite(IN1, HIGH);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, speed);
  
  // Bánh phải quay lùi
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, HIGH);
  analogWrite(ENB, speed);
}

// Hàm dừng xe / Stop
void stopCar() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, 0);
  
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, 0);
}
```

> [!TIP]
> **Khắc phục lỗi hướng quay (Troubleshooting Direction):** 
> Sau khi nạp code, hãy nâng xe lên khỏi mặt bàn. Quan sát bánh xe ở hàm `moveForward`.
> Nếu bánh trái quay ngược ra sau, hãy rút 2 dây ở cực `OUT1` và `OUT2` của L298N ra và đổi chỗ cho nhau. Làm tương tự với bánh phải ở `OUT3/OUT4` nếu cần.

---

## Công Thức / Formulas

Làm sao để biết xe đi được bao xa? Đây là lúc ta làm quen với **Odometry** (Đo lường quãng đường dịch chuyển).

Nếu bạn có gắn Encoder vào động cơ, encoder sẽ đếm số xung (pulses).
Giả sử ta có:
- **PPR (Pulses Per Revolution):** Số xung trong 1 vòng quay của bánh xe (Ví dụ: 20 xung/vòng).
- **D (Diameter):** Đường kính của bánh xe (Ví dụ: bánh TT thường là 65mm = 6.5cm).
- **Pulses:** Số xung thực tế đã đếm được.

**Công thức tính chu vi bánh xe (Khoảng cách di chuyển trong 1 vòng quay):**
> Chu vi / Circumference (C) = π × D
> (Ví dụ: 3.14159 × 6.5cm = 20.42 cm)

**Công thức tính quãng đường đi được (Distance traveled):**
> Quãng đường (S) = (Pulses / PPR) × C
> Quãng đường (S) = (Số vòng quay) × (Chu vi bánh xe)

*Ví dụ thực tế:* Nếu encoder đếm được 40 xung, bánh xe quay được `40 / 20 = 2` vòng. Quãng đường đi được là `2 × 20.42 = 40.84 cm`.

### Giới thiệu về giới hạn của Dead Reckoning và PID (PID Teaser)
Trong bài thực hành hôm nay, bạn đang dùng thời gian (`delay()`) để ước lượng khoảng cách. Đây gọi là kỹ thuật chạy **Open-loop (Vòng lặp hở)**.
Bạn sẽ nhận ra rằng xe chạy không bao giờ thẳng hàng hoàn toàn, và góc rẽ 90 độ đôi khi lại thành 80 hoặc 100 độ. Nguyên nhân do pin yếu dần, ma sát mặt sàn không đều, sai số điện áp cấp cho mô-tơ...
Vì vậy, việc dùng thời gian (open-loop timing) là KHÔNG chính xác. 
Sau này (trong các tuần tiếp theo), chúng ta sẽ kết hợp Encoder và thuật toán **PID (Proportional-Integral-Derivative)** để điều khiển tốc độ từng bánh xe một cách chính xác (Closed-loop / Vòng lặp kín).

---

## Câu Hỏi Thảo Luận / Discussion

Hãy suy nghĩ và trả lời các câu hỏi sau để củng cố kiến thức:
Think about and answer the following questions to consolidate your knowledge:

1. **Về Khung Xe:** Nếu một xe dùng Ackermann steering (giống ô tô) mắc kẹt trong góc tường hẹp, nó có thể quay 180 độ để thoát ra không? Vì sao?
   *If an Ackermann steering car gets stuck in a tight corner, can it turn 180 degrees to escape? Why?*
2. **Về PWM:** Điều gì xảy ra nếu bạn cấp `analogWrite(pin, 300)` thay vì giới hạn ở 255? Arduino sẽ xử lý giá trị này như thế nào?
   *What happens if you input `analogWrite(pin, 300)` instead of a maximum of 255? How does Arduino handle this value?*
3. **Về L298N:** Chân GND của mạch L298N nối với cực âm của pin 18650 là hiển nhiên. Nhưng TẠI SAO BẮT BUỘC phải nối thêm một dây từ GND đó về chân GND của Arduino?
   *Why is it MANDATORY to connect the GND pin of the L298N to the Arduino's GND pin?*
4. **Về Chuyển Động:** Khi xe đang đi nhanh tới trước, nếu bạn muốn thắng (phanh) gấp, bạn sẽ lập trình thế nào? (Gợi ý: IN1/IN2 trạng thái ra sao?)
   *When moving fast forward, how would you program an emergency brake?*
5. **Về Odometry:** Nếu lốp xe của bạn bị mòn đi theo thời gian khiến đường kính bánh xe giảm xuống, công thức tính quãng đường ở trên sẽ cho ra kết quả lớn hơn hay nhỏ hơn so với thực tế xe di chuyển?
   *If your tire wears down over time, reducing its diameter, will the calculated distance formula output a value greater or smaller than the actual distance traveled?*

---

## Bài Về Nhà / Homework

**Mini-Project: Lái xe theo hình vuông (Drive in a Square Path)**

Hãy viết một đoạn chương trình (Sketch) Arduino mới để điều khiển xe của bạn thực hiện chính xác các hành động sau:
*Write a new Arduino sketch to make your car perform the following actions:*

1. Xe đứng yên 3 giây chờ người dùng buông tay.
2. Chạy thẳng một đoạn khoảng 50cm (Bạn phải tự cân chỉnh thông số `delay` và `speed` để xe chạy được cỡ 50cm).
3. Rẽ phải 90 độ (Lại tiếp tục tinh chỉnh `delay` trong hàm `turnRight`).
4. Lặp lại bước 2 và 3 tổng cộng 4 lần để vẽ thành một hình vuông.
5. Sau khi hoàn thành hình vuông, dừng xe vĩnh viễn (đưa vào một vòng lặp `while(true)` hoặc kết thúc hàm `loop()`).

**Thử thách nâng cao (Bonus):**
Hãy cho xe vừa chạy thẳng, vừa tăng tốc dần từ 0 lên 255 (sử dụng vòng lặp `for`), sau đó lại giảm tốc từ 255 về 0 một cách mượt mà.

---

## Đánh Giá / Assessment Rubric

Sử dụng bảng dưới đây để tự đánh giá hoặc chấm điểm cho học viên:
*Use the table below for self-assessment or grading students:*

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (4 điểm) | Tốt / Good (3 điểm) | Đạt / Fair (2 điểm) | Cần Cố Gắng / Needs Work (1 điểm) |
| :--- | :--- | :--- | :--- | :--- |
| **Lắp ráp (Assembly)** | Xe lắp chắc chắn, cân bằng, các dây đi gọn gàng, dùng dây rút cố định. | Xe lắp chắc chắn nhưng dây điện còn hơi rối. | Khung xe lỏng lẻo, lắp thiếu ốc hoặc phân bổ trọng lượng sai. | Xe không thể chạy do kẹt bánh hoặc bung linh kiện. |
| **Nối dây (Wiring)** | Nối chính xác 100%, có chung mass (GND), 18650 đúng cực, mạch không bị nóng. | Nối đúng nhưng thao tác chập chờn (cắm cáp bị lỏng). | Phải sửa lại dây nhiều lần, sai hướng quay do ngược cực. | Nối sai nghiêm trọng dẫn đến chập nguồn hoặc hỏng board. |
| **Lập trình (Coding)** | Viết code rõ ràng, có chú thích, dùng biến (variables) cho chân và thời gian. | Code chạy được nhưng viết cứng (hardcode) con số vào hàm. | Code còn một số lỗi cú pháp cần hỗ trợ sửa. | Không hiểu logic lập trình, copy-paste nhưng sai chỗ. |
| **Bài Hình Vuông (Square Path)** | Chạy gần như hoàn hảo hình vuông, sai số góc dưới 15 độ, sai số khoảng cách dưới 5cm. | Ra được hình vuông nhưng sai số khoảng 20-30 độ, không về đúng điểm xuất phát. | Xe chạy được 4 cạnh nhưng rẽ góc không đều, thành hình thang/thoi. | Xe chạy hỗn loạn, không kiểm soát được góc và chiều dài. |
| **Hiểu bài (Understanding)** | Trả lời đúng, sâu sắc cả 5 câu hỏi thảo luận, giải thích lưu loát. | Trả lời được 3-4 câu, cần sự gợi ý nhỏ. | Trả lời được 1-2 câu cơ bản, chưa hiểu bản chất PWM. | Không trả lời được các câu hỏi lý thuyết. |

---
**Chúc các bạn thành công! Hẹn gặp lại ở Tuần 3, nơi chúng ta sẽ lắp cảm biến siêu âm HC-SR04 để xe biết tránh vật cản.**
**Good luck! See you in Week 3, where we will install the HC-SR04 ultrasonic sensor for obstacle avoidance.**
