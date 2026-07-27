# Tuần 6: Kiến Trúc Phần Mềm & Điều Khiển Motor qua Python / Week 6: Software Architecture & Python Motor Control

## Mục Tiêu / Objectives

- **Hiểu kiến trúc tổng thể:** Nắm vững cấu trúc phần mềm điều khiển xe tự hành, phân chia nhiệm vụ giữa Raspberry Pi (High-level) và Arduino (Low-level).
- **Understand System Architecture:** Master the overall software architecture for autonomous cars, distributing tasks between Raspberry Pi (High-level) and Arduino (Low-level).
- **Giao tiếp Serial / Serial Communication:** Thiết lập và lập trình giao tiếp ổn định giữa Python (Raspberry Pi) và Arduino qua cổng Serial UART sử dụng thư viện `pyserial`.
- **Thiết kế Giao thức / Protocol Design:** Xây dựng một giao thức truyền nhận lệnh (Command Protocol) dựa trên định dạng JSON over UART (ví dụ: `{"cmd":"move","left":200,"right":200}`).
- **Xử lý Đa luồng / Multithreading:** Ứng dụng threading trong Python để quản lý đồng thời các luồng đọc cảm biến, luồng điều khiển, và luồng ghi log mà không làm gián đoạn hệ thống.
- **Máy trạng thái / State Machine:** Thiết kế kiến trúc điều khiển theo dạng Máy trạng thái (State Machine): IDLE -> NAVIGATING -> AVOIDING -> ARRIVED.
- **Điều khiển GPIO trực tiếp / Direct GPIO Control:** Sử dụng Raspberry Pi GPIO để điều khiển linh kiện đơn giản.
- **Xây dựng Giao diện / Web Interface:** Phát triển ứng dụng Flask cơ bản để điều khiển và hiển thị trạng thái của xe tự hành thông qua trình duyệt web.
- **Giới thiệu ROS2 (Cơ bản) / Introduction to ROS2 (Teaser):** Tìm hiểu các khái niệm cơ bản của Robot Operating System 2: Nodes, Topics, và Messages.

## Công Cụ & Phần Mềm / Tools & Software

1. **Phần cứng / Hardware:**
   - Raspberry Pi 4 (RAM 4GB/8GB) với hệ điều hành Raspberry Pi OS (Bullseye hoặc Bookworm).
   - Thẻ nhớ MicroSD dung lượng từ 32GB trở lên. Nguồn Type-C tiêu chuẩn 5V/3A.
   - Arduino Uno hoặc Arduino Mega 2560 kết nối qua cáp USB loại A sang B.
   - Module điều khiển động cơ L298N, 2 hoặc 4 động cơ DC (Motor giảm tốc), nguồn pin Li-po 2S hoặc 3S.
   - Cảm biến siêu âm HC-SR04, dây cắm Jumper (Male-Female, Male-Male).
2. **Phần mềm / Software:**
   - Python 3.9+ trên Raspberry Pi (đã được cài sẵn trong OS mặc định).
   - Thư viện Python: `pyserial`, `threading`, `json`, `csv`, `flask`, `RPi.GPIO` (hoặc `gpiozero`).
   - Arduino IDE 2.x hoặc PlatformIO để nạp code cho vi điều khiển.
   - Trình duyệt web hiện đại (Chrome, Safari, Firefox) cho phần giao diện Flask.
3. **Môi trường kết nối / Connectivity:**
   - Kết nối SSH và VNC Viewer để truy cập, giám sát và lập trình từ xa (Remote Development) trên Raspberry Pi.
   - Phần mềm VS Code với extension "Remote - SSH" được khuyến nghị.

## Lý Thuyết / Theory

### 1. Thiết lập Raspberry Pi 4 (Raspberry Pi OS, SSH, VNC) / Raspberry Pi 4 Setup
Raspberry Pi 4 đóng vai trò là "bộ não" trung tâm xử lý cấp cao (High-level processor) của hệ thống xe tự hành. Tại sao không dùng trực tiếp Arduino để làm mọi việc? Bởi vì Arduino (RAM tính bằng KB, xung nhịp 16MHz) không thể chạy nổi Computer Vision, AI hoặc Máy chủ Web một cách mượt mà. Trong khi đó, Raspberry Pi 4 là một máy tính Linux mini với xung nhịp 1.5GHz+ và RAM lên đến 8GB.

- **Cài đặt Hệ Điều Hành / OS Installation:** 
  Sử dụng công cụ Raspberry Pi Imager chính thức. Flash ảnh hệ điều hành Raspberry Pi OS (bản 64-bit Lite hoặc Desktop tùy nhu cầu). Nếu bạn chỉ muốn dòng lệnh để tiết kiệm RAM cho AI, bản Lite là tuyệt vời. Tuy nhiên, nếu bạn mới học, bản Desktop có giao diện đồ họa (GUI) sẽ thân thiện hơn.
- **Cấu hình không dây / Wireless Setup:** 
  Từ phiên bản Imager mới, bạn có thể thiết lập sẵn thông tin WiFi (SSID, Password) bằng cách bấm vào biểu tượng "Bánh răng" (Settings) trước khi flash. Khi Pi cắm điện lần đầu, nó sẽ tự vào mạng nhà bạn.
- **SSH (Secure Shell):** 
  Là phương thức truy cập dòng lệnh từ xa bảo mật. Kích hoạt SSH giúp lập trình viên không cần dùng màn hình rời, bàn phím rời cắm trực tiếp vào Pi (còn gọi là thiết lập Headless). 
  - Lệnh truy cập từ máy Terminal/Command Prompt cá nhân: `ssh pi@<IP_ADDRESS_CUA_PI>`
  - Mật khẩu mặc định trước đây là `raspberry`, nhưng với hệ điều hành mới, bạn phải tạo User/Password trong lúc dùng Pi Imager.
- **VNC (Virtual Network Computing):** 
  Nếu dùng phiên bản Desktop, VNC cho phép truyền hình ảnh màn hình đồ họa. Kích hoạt thông qua tiện ích cấu hình lệnh `sudo raspi-config` -> Interfacing Options -> VNC -> Enable. Sau đó dùng phần mềm RealVNC Viewer trên máy tính để kết nối.

### 2. Giao tiếp Python và Arduino (pyserial) / Python Serial Communication with Arduino
Raspberry Pi (Python) và Arduino cần giao tiếp liên tục. Raspberry Pi chịu trách nhiệm xử lý thuật toán phức tạp (nhận diện làn đường, điều khiển web), sau đó xuất ra "quyết định" (tiến, lùi, rẽ). Nhưng Raspberry Pi không phù hợp trực tiếp băm xung PWM điều khiển L298N vì nhân hệ điều hành Linux chia sẻ tài nguyên không đều đặn (không Real-time thực sự), gây giật cục. Do đó, ta cần truyền "quyết định" đó xuống cho Arduino thực thi.

- Chuẩn giao tiếp Serial UART (Universal Asynchronous Receiver-Transmitter) qua cáp USB là cách ổn định và dễ cài đặt nhất (cắm là chạy - Plug & Play).
- Thư viện `pyserial` cung cấp API để ngôn ngữ Python đọc/ghi luồng Byte vào thiết bị `/dev/ttyUSB0` hoặc `/dev/ttyACM0` (đại diện cho Arduino trên Linux).
- Tốc độ truyền (Baud Rate): Là số bit truyền trong một giây. Cả hai thiết bị bắt buộc phải cài đặt một con số chung. Các mốc chuẩn là 9600, 115200 bps. Ở dự án xe tự hành, chúng tôi đề xuất `115200` để đảm bảo độ trễ (latency) cực kỳ thấp khi xử lý phản hồi từ cảm biến va chạm.

### 3. Thiết kế Giao thức Truyền lệnh (JSON over UART) / Command Protocol Design
Vấn đề cốt lõi: Làm sao Arduino hiểu Pi đang muốn gì? Nếu Pi chỉ gửi ký tự "F", Arduino biết là đi thẳng (Forward), nhưng đi thẳng với tốc độ bao nhiêu thì Arduino không rõ.
- Chúng ta cần thiết kế một **Giao thức (Protocol)**.
- **Định dạng JSON (JavaScript Object Notation):**
  - Ưu điểm: Đọc được bởi con người, cấu trúc phân cấp, cho phép tùy biến truyền nhiều tham số rất linh hoạt.
  - Khuyết điểm: Tốn nhiều dung lượng chuỗi ký tự hơn nhị phân. Ví dụ chữ `{"cmd":"stop"}` tốn đến 14 bytes so với 1 byte quy ước. Tuy nhiên, với Baud Rate lớn (115200), băng thông Serial UART hoàn toàn dư dả cho JSON mức độ thấp.
- **Cấu trúc bản tin điều khiển từ Pi xuống Arduino / Downlink Message:**
  Mỗi chuỗi JSON kết thúc bằng ký tự ngắt dòng `\n` để Arduino nhận diện dễ dàng.
  - `{"cmd":"move", "left":200, "right":200}` -> Yêu cầu đi thẳng (Vận tốc PWM bánh trái 200, bánh phải 200).
  - `{"cmd":"move", "left":-150, "right":150}` -> Yêu cầu xoay xe tại chỗ (Quay trái).
  - `{"cmd":"stop"}` -> Lệnh dừng toàn bộ hệ thống.
- **Cấu trúc bản tin phản hồi từ Arduino lên Pi / Uplink Message:**
  Arduino không chỉ im lặng nhận lệnh, nó còn phải báo cáo tình hình Sensor liên tục lên cho "Bộ não".
  - `{"status":"ok", "sonar":25.5, "encoders":[1024, 1025]}` -> Khoảng cách siêu âm (sonar) là 25.5 cm; và tình trạng Encoder (bộ đếm xung bánh xe).

### 4. Xử lý Đa luồng trong Python (Threading) / Python Threading
Xe tự hành là một hệ thống Real-Time (Thời gian thực). Việc xử lý nhiều tác vụ phải diễn ra đồng thời (Concurrency).
- Trong Python cơ bản, code chạy tuần tự. Nếu bạn bảo Python `time.sleep(1)` để chờ lấy cảm biến, thì trong 1 giây đó chương trình sẽ "đóng băng" (Blocking), không nhận được lệnh điều khiển mới từ Web. Điều này cực kỳ nguy hiểm nếu xe đang lao vào tường.
- **Thread (Luồng):** Module `threading` giúp tách chương trình thành các mạch thực thi song song, chia sẻ chung một không gian bộ nhớ biến. (Dù bị hạn chế một phần bởi cơ chế GIL - Global Interpreter Lock của Python, nhưng đối với các tác vụ I/O bound như chờ cổng Serial hay nhận HTTP request, Threading vẫn hoạt động hoàn hảo).
- Chúng ta sẽ thiết kế 3 luồng chính:
  1. **Luồng Đọc Cảm Biến (Sensor Reading Thread):** 
     Tạo 1 vòng `while True` vĩnh viễn ở chế độ nền (Daemon Thread). Liên tục thực thi lệnh `serial.readline()` để hốt dữ liệu mới nhất mà Arduino gửi lên, sau đó cập nhật vào một biến từ điển `sensor_data` chung.
  2. **Luồng Điều Khiển / Xử lý Chính (Main / Control Thread):**
     Nơi chứa server Flask nhận tín hiệu điều khiển từ người dùng, đọc dữ liệu từ biến `sensor_data` (được luồng 1 mớm vào), để ra quyết định xử lý (ví dụ: đang ấn nút tiến mà sonar báo có tường ở khoảng cách 10cm -> từ chối gửi lệnh Move).
  3. **Luồng Ghi Log (Logging Thread):**
     Lặng lẽ chạy ở chế độ nền, cứ mỗi 0.5 giây lại sao chép toàn bộ thông số trạng thái xe và ghi nối (append) vào một file `.csv` ở ổ cứng thẻ nhớ để phân tích sau chuyến đi (Telemetry Logging).

### 5. Kiến trúc Máy trạng thái (State Machine) / State Machine Architecture
Bất kỳ robot nào hoạt động bài bản đều được thiết kế dựa trên Máy Trạng Thái Hữu Hạn (FSM).
- Việc dùng quá nhiều biến `if - else` phức tạp lồng vào nhau, cộng với các cờ `flag_is_moving`, `flag_is_stopping` sẽ khiến code thành một đống bùi nhùi (Spaghetti Code) không thể mở rộng.
- **FSM** chia vòng đời hoạt động của Robot thành các mốc cụ thể:
  - **IDLE (Trạng thái chờ):** Xe khởi động xong, dừng tại chỗ, đèn LED tín hiệu nháy chậm. Sẵn sàng chờ lệnh.
  - **NAVIGATING (Đang dẫn đường):** Khi nhận tín hiệu "Go", chuyển sang Navigating. Lúc này Camera/Thuật toán chỉ đạo bánh lái chạy bám theo tuyến đường.
  - **AVOIDING (Trạng thái tránh vật cản):** Đang Navigating, luồng đọc Sensor bỗng nhiên thấy Sonar = 15cm (nguy hiểm). Lập tức hệ thống đá văng khỏi Navigating và nhảy sang trạng thái AVOIDING. Ở trạng thái này, xe tự lùi lại 2 giây, rẽ phải 1 giây, sau đó kiểm tra lại khoảng cách, nếu thoáng thì nhảy ngược lại về NAVIGATING.
  - **ARRIVED (Hoàn thành):** Đã đến vị trí đích, kết thúc vòng đời.

### 6. Tổng quan ROS2 (Teaser) / ROS2 Overview (Conceptual)
Chúng ta đang tự tay Build lại một "framework" điều khiển bằng Python, Threading, TCP, Serial. Tuy nhiên trong công nghiệp robotics (Tesla, Boston Dynamics, Amazon Robotics...), người ta có tiêu chuẩn chung gọi là Robot Operating System (ROS, hiện nay là ROS2).
- Mặc dù mang tên "Hệ điều hành", ROS2 thực chất là một Middleware framework (phần mềm trung gian).
- **Nodes (Nút):** Thay vì code mọi thứ vào 1 file Python duy nhất, trong ROS2, mỗi module phần cứng/phần mềm là 1 Node. Bạn có Node_Camera, Node_Lidar, Node_AI, Node_Motor_Driver. Nếu một Node gặp lỗi và crash (vỡ bộ nhớ), các Node khác không chết chùm.
- **Topics (Chủ đề):** Các Node nói chuyện bằng cơ chế Publish-Subscribe thông qua Topic (y như YouTube).
- **Publish/Subscribe:** `Node_Camera` phân tích và liên tục xuất góc lái ra Topic tên là `/steering_angle` (như phát livestream). `Node_Motor_Driver` bấm "Đăng ký kênh" (Subscribe) cái topic `/steering_angle` đó, hễ có con số mới là tự cập nhật PWM. Thiết kế vô cùng lỏng lẻo (Loosely coupled) nhưng lại cực kỳ vững vàng.

### 7. Điều khiển GPIO từ Raspberry Pi / Direct GPIO Control
Nếu xe của bạn cực kỳ đơn giản (không có encoder, không cần độ trễ 1ms, không xử lý ảnh mỏi CPU), bạn CÓ THỂ BỎ QUA Arduino. Raspberry Pi có sẵn hàng chân cắm Header 40-pin GPIO.
- Có thể dùng cáp Jumper nối thẳng tín hiệu IN1, IN2, ENA của module L298N vào chân GPIO của Pi.
- Sử dụng thư viện Python `gpiozero` hoặc `RPi.GPIO` để bật/tắt (HIGH/LOW) và xuất PWM.
- **Hạn chế:** Hệ điều hành Linux trên Pi là Non-RealTime OS (Hệ điều hành đa nhiệm không chia sẻ thời gian thực nghiêm ngặt). Khi Pi đang bận xử lý gửi dữ liệu WiFi hoặc cập nhật ứng dụng nền, quá trình băm xung PWM bằng phần mềm sẽ bị ngắt nhịp (Jitter). Hệ quả là động cơ kêu lạch cạch hoặc quay không đều đặn. Do đó mô hình Pi + Arduino vẫn là Golden Standard cho dân DIY chuyên nghiệp.

### 8. Giao diện điều khiển Web (Flask) / Web Interface with Flask
Tạo một Web Server nhỏ gọn, nhẹ nhàng bằng Flask ngay trên Raspberry Pi.
- Lập trình viên không cần tải App rườm rà. Bất kỳ Laptop, Tablet, Điện thoại nào có trình duyệt (chung mạng WiFi) đều có thể truy cập `http://IP_CUA_PI:5000` để điều khiển.
- Màn hình Web sẽ có bộ nút điều hướng (D-Pad), hiển thị giá trị tốc độ, thanh ghi Sensor real-time bằng AJAX/Fetch API.

---

## Code Python / Python Code

Dưới đây là một mô đun hoàn chỉnh (`motor_controller.py`) cho phần "Bộ não" trung tâm trên Raspberry Pi. Nó bao gồm Class bao gói toàn bộ quá trình giao tiếp Serial, xử lý luồng đọc ghi đồng thời (Multithreading), và cơ chế lưu trữ Telemetry file.
*Yêu cầu tiên quyết: Chạy lệnh `pip install pyserial flask` trong Terminal của Pi trước khi viết code.*

```python
# Tên file: motor_controller.py
# File này chứa Core Logic của hệ thống.
import serial
import json
import threading
import time
import csv
import os
from datetime import datetime

class MotorController:
    """
    Class quản lý toàn diện kết nối Serial với bo mạch Arduino cấp thấp (Low-level board).
    Bao gồm xử lý đa luồng (threading) cho Uplink telemetry, trạng thái State Machine.
    """
    def __init__(self, port='/dev/ttyUSB0', baudrate=115200):
        # 1. Cấu hình Serial Port
        self.port = port
        self.baudrate = baudrate
        self.serial_conn = None
        self.running = False
        
        # 2. Biến quản lý trạng thái máy (State Machine Variables)
        # Các trạng thái khả dụng: IDLE (chờ), NAVIGATING (Đang đi), AVOIDING (Tránh cản), ARRIVED (Đã đến)
        self.current_state = 'IDLE' 
        
        # 3. Dữ liệu Telemetry mới nhất từ Cảm biến (Data Dictionary)
        self.sensor_data = {
            'sonar': 999.0,         # Khoảng cách mặc định khi chưa bắt được vật (cm)
            'left_encoder': 0,      # Xung encoder bánh trái (cho PID)
            'right_encoder': 0      # Xung encoder bánh phải (cho PID)
        }
        
        # 4. Threading Lock (Khóa vùng nhớ an toàn cho đa luồng)
        # Vì luồng ReadThread liên tục ghi đè biến sensor_data, và luồng LogThread liên tục đọc nó.
        # Nếu không có Lock, có thể gây ra hiện tượng Data Corruption ở cấp độ Memory.
        self.data_lock = threading.Lock()
        
        # 5. Khởi tạo File Log Telemetry
        # Dữ liệu sẽ lưu ở định dạng CSV tiện lợi, có timestamp để đưa lên Excel vẽ biểu đồ.
        self.log_filename = f"telemetry_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv"
        self._init_csv_log()

    def _init_csv_log(self):
        """Hàm private: Khởi tạo file CSV, viết dòng tiêu đề cột (Headers)."""
        # Mode 'w' để tạo mới. newline='' để chuẩn hóa định dạng dòng trên các HĐH.
        with open(self.log_filename, mode='w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['Timestamp', 'State', 'Sonar_Distance_cm', 'Left_Enc', 'Right_Enc'])
        print(f"[INFO] Created Telemetry Log File: {self.log_filename}")

    def connect(self):
        """Hàm kết nối vào phần cứng Serial Port và khởi động các luồng ngầm (Background Threads)."""
        try:
            # timeout=1 đảm bảo readline không bị block vĩnh viễn nếu cáp tuột.
            self.serial_conn = serial.Serial(self.port, self.baudrate, timeout=1)
            
            # CỰC KỲ QUAN TRỌNG: Arduino sẽ reset cứng (auto-reset) khi cổng Serial được mở.
            # Ta phải ngủ (sleep) khoảng 2 giây để chờ bootloader Arduino chạy xong trước khi gửi lệnh đầu tiên.
            print("[INFO] Waiting for Arduino Bootloader to finish...")
            time.sleep(2.0)
            print(f"[SUCCESS] Connected successfully to {self.port} at {self.baudrate} bps.")
            self.running = True
            
            # Khởi tạo và Bật luồng đọc cảm biến (Daemon = True có nghĩa thread sẽ tự chết khi chương trình chính tắt)
            self.read_thread = threading.Thread(target=self._serial_reader_thread, daemon=True)
            self.read_thread.name = "SensorReadThread"
            self.read_thread.start()
            
            # Khởi tạo và Bật luồng ghi file Telemetry
            self.log_thread = threading.Thread(target=self._logging_thread, daemon=True)
            self.log_thread.name = "TelemetryLogThread"
            self.log_thread.start()
            
            return True
            
        except serial.SerialException as e:
            print(f"[ERROR] Failed to connect to port {self.port}. Error Details: {e}")
            return False

    def send_command(self, cmd, left_pwm=0, right_pwm=0):
        """
        API chính để gọi từ bên ngoài. Đóng gói lệnh thành JSON, encode bytes và quăng xuống Serial.
        - cmd (str): Tên lệnh như 'move', 'stop', 'beep'.
        - left_pwm (int): Xung điều tốc từ -255 đến 255. (- là lùi, + là tiến)
        - right_pwm (int): Tương tự bánh phải.
        """
        if not self.serial_conn or not self.running:
            print("[WARN] Serial connection is closed. Command ignored.")
            return
            
        payload = {
            "cmd": cmd,
            "left": left_pwm,
            "right": right_pwm
        }
        
        try:
            # Convert Dict to JSON string, thêm \n làm End-Of-Line marker để Arduino cắt chuỗi đúng.
            json_str = json.dumps(payload) + '\n'
            # Môi trường Serial UART truyền dòng nhị phân, phải encode UTF-8.
            self.serial_conn.write(json_str.encode('utf-8'))
            print(f"[CMD] >>> Sent to Arduino: {json_str.strip()}")
        except Exception as e:
            print(f"[ERROR] Error sending command: {e}")

    def _serial_reader_thread(self):
        """
        [PRIVATE THREAD] Luồng độc lập chuyên đọc dữ liệu từ phía Arduino gửi lên.
        Luồng này nằm trong vòng lặp vô tận chừng nào self.running còn = True.
        """
        print("[INFO] Sensor Reader Thread started.")
        while self.running:
            # in_waiting kiểm tra xem buffer của cổng COM có byte nào bị đọng không, nếu có mới đọc.
            if self.serial_conn and self.serial_conn.in_waiting > 0:
                try:
                    # Đọc cả dòng đến khi gặp '\n', decode về string bình thường, loại bỏ khoảng trắng dư thừa
                    raw_line = self.serial_conn.readline().decode('utf-8').strip()
                    
                    if raw_line:
                        # Parse JSON từ String sang Dictionary
                        data = json.loads(raw_line)
                        
                        # Sử dụng Context Manager khóa bộ nhớ 'with self.data_lock'
                        with self.data_lock:
                            # Cập nhật từ điển dữ liệu cảm biến
                            if "sonar" in data:
                                self.sensor_data['sonar'] = data.get('sonar', 999.0)
                            if "enc_l" in data:
                                self.sensor_data['left_encoder'] = data.get('enc_l', 0)
                            if "enc_r" in data:
                                self.sensor_data['right_encoder'] = data.get('enc_r', 0)
                                
                            # ----------------------------------------------------
                            # LOGIC KHẨN CẤP / SAFETY OVERRIDE (Mô phỏng Autonomous)
                            # Nếu vật cản quá gần (< 20cm) và xe đang tiến...
                            # ----------------------------------------------------
                            if self.sensor_data['sonar'] < 20.0 and self.current_state == 'NAVIGATING':
                                print("\n[EMERGENCY] !!! OBSTACLE DETECTED < 20cm !!!")
                                print("[STATE_MACHINE] SWITCHING: NAVIGATING -> AVOIDING")
                                self.current_state = 'AVOIDING'
                                
                                # Ra lệnh phanh gấp/lùi nhẹ ngay lập tức để tránh va chạm.
                                # Vượt qua các tầng xử lý cao hơn, gửi thẳng hàm send_command.
                                self.send_command('move', -150, -150)
                                
                except json.JSONDecodeError:
                    print(f"[WARN] JSON Parse failed for Uplink Message: '{raw_line}'")
                except Exception as e:
                    print(f"[ERROR] Reader thread encountered an error: {e}")
                    
            # Tạm dừng thread siêu ngắn 0.01s. Nếu không có sleep, vòng lặp while True 
            # sẽ đốt cháy 100% tài nguyên của 1 nhân CPU (Core).
            time.sleep(0.01) 

    def _logging_thread(self):
        """
        [PRIVATE THREAD] Luồng độc lập ghi dữ liệu xuống ổ đĩa USB/SDCard định kỳ mỗi 0.5s.
        Phục vụ cho việc Phân tích dữ liệu từ xa (Telemetry / Data Analytics).
        """
        print("[INFO] Telemetry Logging Thread started.")
        while self.running:
            # Lấy snapshot dữ liệu trong nháy mắt nhờ dùng khóa Lock
            with self.data_lock:
                sonar = self.sensor_data['sonar']
                l_enc = self.sensor_data['left_encoder']
                r_enc = self.sensor_data['right_encoder']
            
            # Trạng thái hiện tại
            state = self.current_state
            
            # Ghi nối thêm vào file (mode='a' append)
            try:
                with open(self.log_filename, mode='a', newline='') as f:
                    writer = csv.writer(f)
                    # Định dạng timestamp độ phân giải tới mili-giây
                    current_time_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]
                    writer.writerow([current_time_str, state, sonar, l_enc, r_enc])
            except Exception as e:
                print(f"[ERROR] Could not write to log file: {e}")
                
            # Cứ nửa giây thì ghi log 1 lần
            time.sleep(0.5)

    def close(self):
        """Hàm dọn dẹp hệ thống trước khi Shutdown xe."""
        print("\n[SHUTDOWN] Shutting down MotorController safely...")
        self.running = False
        
        # Đảm bảo lệnh Dừng được gửi xuống phần cứng vật lý
        self.send_command("stop", 0, 0)
        
        # Chờ phần cứng xử lý kịp lệnh
        time.sleep(0.5) 
        
        if self.serial_conn and self.serial_conn.is_open:
            self.serial_conn.close()
            print("[INFO] Serial Port closed successfully.")


# ======================================================================
# PHẦN THỬ NGHIỆM ĐỘC LẬP (Mô phỏng chay dưới dạng script, không qua Web)
# ======================================================================
if __name__ == "__main__":
    # Đổi thành cổng COM (ví dụ 'COM3') nếu chạy trên Windows với Arduino cắm vào máy tính.
    # Trên Raspberry Pi, thường là '/dev/ttyUSB0' hoặc '/dev/ttyACM0'.
    # Trên MacOS, thường là '/dev/cu.usbserial-xxx'
    car = MotorController(port='/dev/ttyUSB0', baudrate=115200) 
    
    if car.connect():
        try:
            print("\n----- DEMO MODE START -----")
            car.current_state = 'NAVIGATING'
            print("[DEMO] Starting car movement...")
            
            # Xe sẽ đi thẳng bằng 80% công suất motor
            car.send_command('move', 200, 200)
            
            # Chạy mô phỏng trong vòng 15 giây
            for second in range(15):
                # Khối trích xuất hiển thị Realtime lên Terminal
                with car.data_lock:
                    safe_state = car.current_state
                    safe_sonar = car.sensor_data['sonar']
                
                print(f"[TIMELINE {second}s] | State: {safe_state} | Sonar: {safe_sonar:.1f} cm")
                
                # Logic Auto-Recover: Trạng thái hiện tại đang là Tránh Cản (AVOIDING).
                # Giả sử xe đã lùi và khoảng cách phía trước rộng rãi trở lại (> 30cm).
                if safe_state == 'AVOIDING':
                    if safe_sonar > 30.0:
                        print("\n[STATE_MACHINE] Path is CLEAR! Recovering to NAVIGATING.")
                        car.current_state = 'NAVIGATING'
                        # Lại vọt tới
                        car.send_command('move', 200, 200)
                
                # Ngủ chờ qua giây tiếp theo
                time.sleep(1.0)
                
        except KeyboardInterrupt:
            # Xử lý sự kiện người dùng bấm Ctrl + C để dừng đột ngột kịch bản
            print("\n[WARN] Ctrl+C User Interrupt detected.")
        except Exception as general_err:
            print(f"\n[FATAL ERROR] {general_err}")
        finally:
            # Luôn luôn đảm bảo đóng cổng sạch sẽ, tắt động cơ (Fail-safe)
            car.close()
            print("----- DEMO MODE END -----")
    else:
        print("[FATAL] Could not initialize the hardware. Exiting system.")
```

Mã nguồn trên đã đáp ứng đầy đủ yêu cầu cho Core Backend. 
Bây giờ, chúng ta viết phần **Giao diện Web Flask** (`app.py`). Bạn cần đặt chung folder với file `motor_controller.py`. Web App sẽ đóng vai trò như chiếc Điều Khiển Từ Xa (Remote Controller) hiển thị Trạng thái (Dashboard) và nạp lệnh cho Class phía trên.

```python
# Tên file: app.py (Chạy Web Server)
# Cú pháp chạy lệnh: python3 app.py
from flask import Flask, render_template_string, request, jsonify
from motor_controller import MotorController
import time
import os

app = Flask(__name__)

# Khởi tạo đối tượng xe vào biến Toàn Cục (Global) để các Flask Route dùng chung.
# Chú ý: Ở hệ thống thực, cấu hình Port nên đọc từ file config.txt
SERIAL_PORT = '/dev/ttyUSB0' 
# Hack nhỏ: Tự phát hiện trên MacOS hoặc Linux để code chạy linh hoạt hơn
if not os.path.exists(SERIAL_PORT):
    # Nếu không thấy USB0, giả vờ xài port rác để Web Server không chết.
    print("[WARN] Target port /dev/ttyUSB0 not found. Proceeding without Hardware connected for UI Test.")
    # car = MotorController(port='COM4', baudrate=115200)

car = MotorController(port=SERIAL_PORT, baudrate=115200)
# Thử kết nối. Nếu không thành công, script vẫn cứ chạy Flask server lên màn hình cho học sinh xem UI.
connection_status = car.connect()

# =================================================================================
# GIAO DIỆN HTML/CSS/JS (Dạng Chuỗi nội tuyến - Inline string thay vì tách file rời)
# Trong dự án thật nên đặt vào folder "templates/index.html". Dùng inline để dễ copy-paste.
# =================================================================================
HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Autonomous Car Command Center</title>
    <style>
        /* CSS Reset & Cơ bản */
        * { box-sizing: border-box; }
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            text-align: center; 
            background-color: #1a1a2e; 
            color: #eaeaea; 
            margin: 0; padding: 20px; 
            /* Ngăn user bôi đen text khi bấm liên tục trên điện thoại */
            user-select: none;
        }
        h2 { color: #e94560; margin-bottom: 5px; }
        
        /* Box hiển thị thông số Dashboard */
        .dashboard { 
            margin: 20px auto; 
            background: #16213e; 
            padding: 20px 30px; 
            border-radius: 12px; 
            display: inline-block;
            box-shadow: 0 4px 15px rgba(0,0,0,0.5);
            border: 1px solid #0f3460;
        }
        .data-row { margin: 12px 0; font-size: 1.2rem; }
        .highlight { color: #00d2ff; font-weight: bold; font-size: 1.4rem; }
        .danger-text { color: #ff3366; font-weight: bold; }
        
        /* Bố cục nút bấm (D-Pad Controller Layout) */
        .controller-grid {
            display: grid;
            grid-template-columns: 80px 80px 80px;
            grid-template-rows: 80px 80px 80px;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }
        
        /* Nút bấm thẩm mỹ hiện đại */
        .btn { 
            border: none; 
            border-radius: 12px; 
            font-size: 24px; 
            font-weight: 900; 
            color: white; 
            cursor: pointer;
            box-shadow: 0 5px 0 #0d1b2a, 0 10px 15px rgba(0,0,0,0.4);
            transition: all 0.1s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .btn:active {
            box-shadow: 0 0 0 #0d1b2a, 0 2px 5px rgba(0,0,0,0.4);
            transform: translateY(5px);
        }
        
        /* Các màu nhấn cho từng chức năng */
        .btn-fwd { background: linear-gradient(135deg, #00b09b, #96c93d); grid-column: 2; grid-row: 1; }
        .btn-left { background: linear-gradient(135deg, #3a7bd5, #3a6073); grid-column: 1; grid-row: 2; }
        .btn-stop { background: linear-gradient(135deg, #cb2d3e, #ef473a); grid-column: 2; grid-row: 2; border-radius: 50%; border: 3px solid #fff; }
        .btn-right { background: linear-gradient(135deg, #3a7bd5, #3a6073); grid-column: 3; grid-row: 2; }
        .btn-rev { background: linear-gradient(135deg, #f2994a, #f2c94c); grid-column: 2; grid-row: 3; color: #333;}
        
        /* Footer thông báo trạng thái mạng */
        .footer-status { margin-top: 40px; font-size: 0.9rem; color: #777; }
    </style>
</head>
<body>
    <h2>🚀 Robot Car Base Station</h2>
    <p style="margin-top:0; color:#888;">Live Telemetry & Remote Override System</p>
    
    <div class="dashboard">
        <div class="data-row">
            Trạng Thái FSM: <span id="stateLabel" class="highlight">UNKNOWN</span>
        </div>
        <div class="data-row">
            Sonar Phía Trước: <span id="sonarLabel" class="highlight">--.-</span> cm
        </div>
        <div class="data-row" style="font-size: 0.9rem; color:#aaa;">
            Ping Time: <span id="pingLabel">--</span> ms
        </div>
    </div>

    <!-- Tay cầm Controller ảo -->
    <div class="controller-grid">
        <!-- Chú ý: Các tham số (cmd, tốc_trái, tốc_phải) -->
        <!-- Để điều hướng xe tăng tốc thẳng, 2 bánh có chung PWM dương -->
        <!-- Để rẽ tại chỗ (xoay tăng), 1 bánh âm, 1 bánh dương -->
        <button class="btn btn-fwd" onclick="sendCommand('move', 220, 220)">W</button>
        
        <button class="btn btn-left" onclick="sendCommand('move', -160, 160)">A</button>
        <button class="btn btn-stop" onclick="sendCommand('stop', 0, 0)">🛑</button>
        <button class="btn btn-right" onclick="sendCommand('move', 160, -160)">D</button>
        
        <button class="btn btn-rev" onclick="sendCommand('move', -200, -200)">S</button>
    </div>
    
    <div class="footer-status" id="connectionStatus">Connecting to Robot Base Server...</div>

    <script>
        // Mảng lưu thời gian đo Ping
        let lastPingReq = Date.now();

        // 1. Hàm Gửi lệnh điều khiển qua AJAX (Sử dụng Fetch API của JS hiện đại)
        function sendCommand(cmd, left, right) {
            fetch('/api/command', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                // Đóng gói Payload thành JSON string để ném về Server Python
                body: JSON.stringify({ cmd: cmd, left: left, right: right })
            })
            .then(res => res.json())
            .then(data => console.log("Server response:", data))
            .catch(err => console.error("Error sending command:", err));
        }

        // 2. Hàm Tự động khảo sát (Polling) dữ liệu Cảm biến 300ms một lần.
        // Hướng mở rộng: Để xịn hơn, nên đổi cấu trúc thành WebSockets thay vì Polling liên tục.
        setInterval(() => {
            lastPingReq = Date.now();
            fetch('/api/telemetry')
                .then(response => {
                    if(!response.ok) throw new Error("Network issue");
                    return response.json();
                })
                .then(data => {
                    // Update Ping latency (Time since fetch to response)
                    const latency = Date.now() - lastPingReq;
                    document.getElementById('pingLabel').innerText = latency;
                    
                    // Update Text Labels
                    const stateEl = document.getElementById('stateLabel');
                    stateEl.innerText = data.state;
                    
                    // Cảnh báo UI nếu trạng thái AVOIDING
                    if(data.state === 'AVOIDING') {
                        stateEl.className = "danger-text";
                    } else {
                        stateEl.className = "highlight";
                    }

                    document.getElementById('sonarLabel').innerText = data.sonar.toFixed(1);
                    document.getElementById('connectionStatus').innerText = "🟢 Link Active - Receiving Telemetry";
                    document.getElementById('connectionStatus').style.color = "#4CAF50";
                })
                .catch(error => {
                    document.getElementById('connectionStatus').innerText = "🔴 Link Lost! Server Offline.";
                    document.getElementById('connectionStatus').style.color = "#ff3366";
                });
        }, 300); // Tốc độ làm tươi giao diện
    </script>
</body>
</html>
"""

# -----------------
# CẤU HÌNH API ROUTES
# -----------------

@app.route('/')
def index_page():
    """Route mặc định: Trả về trang HTML giao diện chính."""
    # render_template_string tự parse string thuần thành HTML Response chuẩn Flask.
    return render_template_string(HTML_TEMPLATE)

@app.route('/api/command', methods=['POST'])
def handle_command_api():
    """
    Route API dạng RESTful: Nhận Request dạng POST chứa JSON từ Frontend truyền xuống.
    Nó trích xuất biến lệnh và chọc (invoke) vào object 'car' đang ở bộ nhớ.
    """
    request_data = request.json
    if not request_data:
        return jsonify({"status": "error", "message": "No JSON payload provided"}), 400
        
    cmd_val = request_data.get('cmd', 'stop')
    left_val = request_data.get('left', 0)
    right_val = request_data.get('right', 0)
    
    # Ép kiểu dữ liệu để đảm bảo an toàn, tránh hacker truyền mã độc (Injection)
    try:
        left_val = int(left_val)
        right_val = int(right_val)
    except ValueError:
        left_val, right_val = 0, 0
    
    # Cập nhật State Machine. Nếu là Stop thì xe ngơi nghỉ, nếu là lệnh Move thì đánh dấu là Navigating
    if cmd_val == 'stop':
        car.current_state = 'IDLE'
    else:
        car.current_state = 'NAVIGATING'
        
    # Kích hoạt lệnh xuống phần cứng qua hàm đã đóng gói.
    car.send_command(cmd_val, left_val, right_val)
    
    return jsonify({"status": "success", "executed_cmd": cmd_val})

@app.route('/api/telemetry', methods=['GET'])
def get_telemetry_api():
    """
    Route API trả về báo cáo cảm biến (GET Method) dưới dạng cục JSON.
    Frontend sẽ fetch API này để làm tươi màn hình mà không cần reload trang F5.
    """
    # Mượn Lock để đọc biến an toàn trong tích tắc, tránh đọc lúc data đang bị thay đổi dở dang
    with car.data_lock:
        data_packet = {
            "state": car.current_state,
            "sonar": car.sensor_data['sonar'],
            "enc_l": car.sensor_data['left_encoder'],
            "enc_r": car.sensor_data['right_encoder'],
            "system_time": datetime.now().strftime('%H:%M:%S')
        }
    return jsonify(data_packet)

# Điểm khởi chạy của Python Process
if __name__ == '__main__':
    print("\n=======================================================")
    print("   🌐 STARTING FLASK WEB CONTROL SERVER...")
    print("   👉 OPEN YOUR BROWSER AND GO TO: http://<PI_IP>:5000 ")
    print("=======================================================\n")
    
    # host='0.0.0.0' có nghĩa là Server này lắng nghe MỌI card mạng (LAN, Wifi)
    # chứ không chỉ lắng nghe ở '127.0.0.1' (localhost). 
    # Điều này bắt buộc để điện thoại nối chung WiFi có thể điều khiển xe.
    app.run(host='0.0.0.0', port=5000, debug=False)
```

## Code Arduino / Arduino Code

Để hệ thống hoàn chỉnh từ trên xuống dưới, trên mảng Vi điều khiển Arduino (thực thi phần Low-level real-time tasks), bạn cần viết một chương trình để phân tích chuỗi JSON được gửi từ Pi xuống. Chúng ta dùng thư viện `ArduinoJson` (một thư viện nổi tiếng, cài đặt thông qua Library Manager của Arduino IDE).

Tại sao không code chuỗi thuần tuý cho nhẹ? Vì parse chuỗi thuần tuý ở C++ cực kỳ đau đầu khi bạn thêm các biến thông số mới. ArduinoJson giúp deserialize JSON chỉ bằng 3 dòng code.

```cpp
// -------------------------------------------------------------
// Arduino Code (Giao tiếp JSON UART, Motor Driver L298N, Sonar)
// Board: Arduino Uno / Mega 2560
// Library Requirement: ArduinoJson (v6.x hoặc v7.x)
// -------------------------------------------------------------
#include <ArduinoJson.h>

// 1. PIN DEFINITIONS (Khai báo Chân cắm linh kiện)
// Phần động cơ (Module L298N)
#define ENA 9   // Chân băm xung tốc độ Bánh Trái (Phải cắm chân PWM có dấu ~)
#define IN1 8   // Hướng bánh trái (Tiến)
#define IN2 7   // Hướng bánh trái (Lùi)

#define IN3 6   // Hướng bánh phải (Tiến)
#define IN4 5   // Hướng bánh phải (Lùi)
#define ENB 10  // Chân băm xung tốc độ Bánh Phải (PWM ~)

// Phần Cảm biến siêu âm (HC-SR04)
#define TRIG_PIN 3  // Chân kích phát sóng siêu âm
#define ECHO_PIN 2  // Chân nhận tiếng vang vọng lại

// Các biến quản lý thời gian non-blocking (Không dùng hàm delay())
unsigned long lastTelemetryTime = 0;
const unsigned long TELEMETRY_INTERVAL = 100; // Định kỳ 100ms đẩy dữ liệu lên Pi (10 Hz)

void setup() {
  // Bật kênh Serial UART tốc độ cao, khớp với Python bên trên (Baud = 115200)
  Serial.begin(115200);
  while (!Serial) { ; } // Chờ kết nối Serial ổn định
  
  // Set pinMode cho module motor L298N là ngõ xuất tín hiệu (OUTPUT)
  pinMode(ENA, OUTPUT);
  pinMode(IN1, OUTPUT);
  pinMode(IN2, OUTPUT);
  pinMode(IN3, OUTPUT);
  pinMode(IN4, OUTPUT);
  pinMode(ENB, OUTPUT);
  
  // Set pinMode cho module siêu âm HC-SR04
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  
  // Khởi tạo ban đầu: Khóa chặt bánh xe
  stopMotors();
}

void loop() {
  // =======================================================
  // TASK 1: XỬ LÝ LỆNH TỪ RASPBERRY PI (DOWNLINK CONTROL)
  // =======================================================
  if (Serial.available() > 0) {
    // Đọc trọn 1 dòng (đến khi gặp ký hiệu kết thúc \n do JSON.dumps thêm vào ở Python)
    String incomingJson = Serial.readStringUntil('\n');
    incomingJson.trim(); // Dọn dẹp khoảng trắng dư, carriage return (\r)
    
    if (incomingJson.length() > 0) {
      // Phân bổ vùng nhớ 256 byte để giải mã JSON (Phù hợp với bản tin ngắn)
      StaticJsonDocument<256> doc;
      
      // Tiến hành deserialize String -> Json Document Object
      DeserializationError error = deserializeJson(doc, incomingJson);
      
      if (!error) {
        // Cú pháp C++ lấy biến rất giống Dictionary của Python
        String cmd = doc["cmd"]; 
        int leftPwm = doc["left"];
        int rightPwm = doc["right"];
        
        // Router xử lý mệnh lệnh
        if (cmd == "move") {
          setMotors(leftPwm, rightPwm);
        } else if (cmd == "stop") {
          stopMotors();
        } else {
          // Lệnh ngoại lệ không hỗ trợ, lờ đi để an toàn.
        }
      } else {
        // Có thể gửi log lỗi lên Pi nếu cần, nhưng thường thì skip
        // Serial.println("{\"status\":\"error\", \"msg\":\"JSON Parse Failed\"}");
      }
    }
  }
  
  // =======================================================
  // TASK 2: GỬI BÁO CÁO CẢM BIẾN LÊN PI (UPLINK TELEMETRY)
  // (Thực thi mà KHÔNG BLOCKING làm ảnh hưởng tới việc nhận lệnh nhánh trên)
  // =======================================================
  unsigned long currentMillis = millis();
  if (currentMillis - lastTelemetryTime >= TELEMETRY_INTERVAL) {
    
    // Đo khoảng cách thực
    float distance_cm = readSonar();
    
    // Đóng gói JSON
    StaticJsonDocument<128> outDoc;
    outDoc["status"] = "ok";
    outDoc["sonar"] = distance_cm;
    // outDoc["enc_l"] = 0; // Chỗ cho Encoder bài sau
    
    // Ép object json ra luồng Serial thẳng, nó sẽ tự gửi string nén chuẩn
    serializeJson(outDoc, Serial);
    
    // Quan trọng: In thêm 1 ký tự \n ở đuôi để hàm serial.readline() bên Python hiểu mà ngắt dòng
    Serial.println(); 
    
    lastTelemetryTime = currentMillis;
  }
}

// ---------------------------------------------------------
// HÀM BỔ TRỢ: ĐO KHOẢNG CÁCH SIÊU ÂM
// ---------------------------------------------------------
float readSonar() {
  // Gửi xung kích dài 10 micro-giây
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  
  // Lắng nghe tiếng vang trả về. PulseIn sẽ block chip tạm thời.
  // Thêm tham số Timeout 30000 ms (~30 mili-giây) tương đương đo cự ly tối đa 5 mét (500cm).
  // Đóng timeout là biện pháp sống còn để code Arduino không bị treo (freeze) nếu dây Sonar đứt.
  long duration = pulseIn(ECHO_PIN, HIGH, 30000); 
  
  // Trả về cự ly siêu lớn (999.0) để Python biết là trống đường
  if(duration == 0) return 999.0; 
  
  // Vận tốc âm thanh trong không khí = 343 m/s = 0.0343 cm/micro-giây. Phải chia 2 vì tính đường cả đi cả về.
  return (duration / 2.0) * 0.0343; 
}

// ---------------------------------------------------------
// HÀM BỔ TRỢ: ĐIỀU KHIỂN CẦU H CHỮ H (L298N) CHUẨN XÁC
// ---------------------------------------------------------
void setMotors(int leftSpeed, int rightSpeed) {
  // Xử lý logic BÁNH TRÁI (LEFT)
  if (leftSpeed >= 0) {
    // Chạy tiến (Forward)
    digitalWrite(IN1, HIGH);
    digitalWrite(IN2, LOW);
    // Hàm constrain giữ giá trị trong vùng an toàn 0-255 của phần cứng PWM Arduino
    analogWrite(ENA, constrain(leftSpeed, 0, 255));
  } else {
    // Chạy lùi (Reverse) nếu nhận số Âm
    digitalWrite(IN1, LOW);
    digitalWrite(IN2, HIGH);
    // Hàm abs() đổi số âm thành số dương tuyệt đối
    analogWrite(ENA, constrain(abs(leftSpeed), 0, 255));
  }
  
  // Xử lý logic BÁNH PHẢI (RIGHT)
  if (rightSpeed >= 0) {
    digitalWrite(IN3, HIGH);
    digitalWrite(IN4, LOW);
    analogWrite(ENB, constrain(rightSpeed, 0, 255));
  } else {
    digitalWrite(IN3, LOW);
    digitalWrite(IN4, HIGH);
    analogWrite(ENB, constrain(abs(rightSpeed), 0, 255));
  }
}

// Hàm ngắt khẩn cấp (Cắt hoàn toàn tín hiệu cầu H)
void stopMotors() {
  digitalWrite(IN1, LOW);
  digitalWrite(IN2, LOW);
  analogWrite(ENA, 0);
  
  digitalWrite(IN3, LOW);
  digitalWrite(IN4, LOW);
  analogWrite(ENB, 0);
}
```

## Bài Tập / Exercises

1. **Exercise 1: Trải nghiệm Giao thức Serial UART Bằng Tay (Manual Protocol Test)**
   - Kết nối module Arduino với máy tính thông qua cáp USB, đảm bảo driver cổng COM đã nhận dạng. Nạp đoạn mã `Arduino Code` ở trên qua phần mềm Arduino IDE.
   - Mở cửa sổ Công cụ Giám sát Serial Monitor (góc phải màn hình IDE). Dưới chân cửa sổ, cài đặt "Baud rate" thành `115200` và chế độ kết thúc dòng "Newline".
   - Trong ô gõ lệnh, nhập trực tiếp chuỗi JSON nguyên bản: `{"cmd":"move", "left":255, "right":255}` và nhấn Enter.
   - Quan sát đèn báo trạng thái trên mạch cầu H L298N, động cơ có phản hồi xoay hết tốc lực không? (Nên đặt xe lên đôn/kệ để bánh không chạm đất trong bước này).
   - Tiếp tục quan sát luồng chuỗi dữ liệu có dạng `{"status":"ok", "sonar": 105.2}` liên tục dội về màn hình. Dùng tay chắn trước mắt siêu âm để theo dõi sự biến thiên dữ liệu truyền ngược (Uplink telemetry).

2. **Exercise 2: Viết Tập Script Dừng Khẩn Cấp (Panic Button/Kill Switch)**
   - Bạn cần viết riêng rẽ một kịch bản lập trình Python mới (không dính tới file `motor_controller.py`), dung lượng siêu nhỏ.
   - Script chỉ làm ba công việc: Khởi tạo kết nối thư viện `serial`, Bơm lệnh JSON `{"cmd":"stop"}` ngay lập tức, và Close chương trình.
   - Hữu ích khi trong quá trình thử nghiệm kịch bản lái tự động sau này, thuật toán hỏng và chiếc xe vượt khỏi tầm kiểm soát đâm sầm vào chướng ngại. Chạy script Panic qua một tab Terminal khác để cứu nguy tức khắc.

3. **Exercise 3: Customizing the Dashboard Interface (Mở Rộng Giao Diện Web Flask)**
   - Bạn hãy chỉnh sửa khối `HTML_TEMPLATE` trong ứng dụng Flask để hiển thị "Tốc độ Bánh Trái (Left Speed)" và "Tốc độ Bánh Phải (Right Speed)" lên góc màn hình Dashboard.
   - Bổ sung một dải thanh trượt bằng HTML `<input type="range" id="speedSlider" min="0" max="255">`. Liên kết giá trị thanh trượt bằng sự kiện Javascript `oninput`, từ đó tùy chỉnh tham số vận tốc tối đa Base Speed để xe không bị cứng nhắc giật đột ngột với hằng số cố định là 220 nữa.

## Câu Hỏi Thảo Luận / Discussion (5)

1. **Baud Rate Mismatch (Sai Lệch Tốc Độ Baud):** Điều gì sẽ xảy ra về mặt kỹ thuật nếu như chương trình Arduino gọi lệnh `Serial.begin(9600)` trong khi luồng kết nối Python lại mở ở `115200`? Giải thích nguyên lý truyền tín hiệu nhị phân bất đồng bộ (Asynchronous) của đường truyền UART để làm rõ vấn đề này.
2. **JSON Format vs Binary Struct (So Sánh Định Dạng Chuỗi Truyền Tải):** Việc chuyển tải đối tượng sang chuỗi JSON tốn dung lượng băng thông hơn rất nhiều so với gửi một mảng gói bit nhị phân (Binary struct / Byte array) truyền thống trong Vi điều khiển (C). Tại sao các hệ sinh thái lập trình khởi đầu lại ưu chuộng JSON hơn? (Gợi ý: Tính tiện lợi trong quá trình Gỡ lỗi Debugging và Khả năng con người tự đọc hiểu - Human-readability).
3. **Hiệu ứng Khóa Toàn Cục GIL Trong Đa Luồng (Python GIL - Global Interpreter Lock):** Ở mục lý thuyết, bài giảng nhấn mạnh đến Python Threading. Khái niệm GIL khống chế máy ảo Python (CPython) không bao giờ thực thi cùng một lúc 2 dòng lệnh ở hai luồng khác nhau. Vậy tại sao GIL dường như ít tác động, hay thậm chí vẫn mang lại hiệu năng cao trong dự án này?
4. **Vòng lặp Chậm Gây Gián Đoạn ở Arduino (Blocking Code):** Nếu như hàm `loop()` chính của Arduino có lỡ tay ghi hàm trì hoãn lệnh `delay(1500);` để đợi nháy LED thì chuyện gì sẽ xảy ra với quá trình phân tích mệnh lệnh ngắt khẩn cấp khi gặp tường? Qua đó, lý giải tại sao việc dùng biến thời gian đếm `millis()` thay cho `delay()` là một tiêu chuẩn khắt khe trong Code Robot? (Xin kiểm chứng lại cách viết logic thời gian ở đoạn code mẫu).
5. **Định Hướng Công Nghiệp Hệ Thống (Transition to ROS2):** Dựa vào tư duy cấu trúc của khung nền hệ thống ROS2 (Node và Topic), nếu áp dụng tư tưởng đó, việc "xé lẻ" module `motor_controller.py` trên thành hai Node riêng biệt: một `Sensor_Publisher_Node` (thu thập rồi xuất thông số sonar) và một `Motor_Subscriber_Node` (thu nhận các lệnh PWM) mang lại lợi ích ưu việt nào trong phương pháp thiết kế cấu trúc hệ thống phần mềm Robot phức tạp?

## Bài Về Nhà / Homework

- **Cài đặt & Thực hành Phần Mềm Điều Khiển Trực Tuyến:**
  Các học viên sẽ tiến hành triển khai mã nguồn thư viện Flask app lên môi trường hệ điều hành Raspberry Pi vật lý. 
  1. Sử dụng kết nối cáp USB-B hoặc USB-C nối từ Pi với mạch Arduino nhằm đảm bảo thông luồng phần cứng.
  2. Bật một trình duyệt trên Smartphone cá nhân, truy cập địa chỉ IP LAN nội bộ của máy tính nhúng Pi (ví dụ nhập `http://192.168.0.105:5000` với 192.168.0.105 là địa chỉ IPv4 do router cấp phát).
  3. Tiến hành trải nghiệm quá trình lái và dẫn hướng chiếc xe chạy zích zắc qua các vật cản bằng các nút bấm mô phỏng ảo hiện trên màn hình điện thoại.
  4. Quay một thước phim video demo (thời lượng khuyến cáo khoảng 30 đến 45 giây) minh hoạ cảnh điều khiển êm ái, cũng như phô diễn thực tiễn màn hình dashboard cập nhật chỉ số radar Sonar liên tục theo thời gian thực (real-time) khi cố tình đưa tay chắn sát cảm biến.
  5. Đóng gói tập tin video demo đính kèm tệp văn bản đuôi CSV nhật ký hoạt động viễn trắc (VD: `telemetry_20240501_150000.csv`) để làm bằng chứng về sự hoàn chỉnh của toàn chuỗi luồng ghi log hoạt động.
  
- **Thử thách Nâng cao (Tùy chọn - Bonus): Lập Trình Hành Vi Ảo Của Web Control**
  Hiệu chỉnh lại các phím chức năng mũi tên trên thiết kế giao diện Web bằng Javascript thuần túy (Vanilla JS). Cấu hình logic sự kiện: khi ngón tay nhấn chạm (sự kiện `mousedown` hoặc `touchstart`), xe nhận lệnh chạy; và khi nhả lực tay ra khỏi phím bấm ảo (sự kiện `mouseup` hoặc `touchend`), trang web sẽ tự động sinh và bắn thêm một tín hiệu API dừng phanh khẩn cấp (`cmd: stop`). Việc hiệu chỉnh này nâng cấp giao diện phần mềm web sao cho nó trải nghiệm xúc giác chân thực hệt tay cầm cơ khí của xe RC thứ thiệt.

## Đánh Giá / Assessment Rubric

| Tiêu Chí (Criteria) | Trọng Số (Weight) | Xuất Sắc (Excellent - 100%) | Đạt (Satisfactory - 70-80%) | Cần Cải Thiện (Needs Improvement - Dưới 50%) |
| ------------------- | ----------------- | --------------------------- | --------------------------- | -------------------------------------------- |
| **Hệ thống Giao Thức (Protocol Logic)** | 25% | Thu phát dữ liệu kiểu JSON hoàn hảo, không có hiện tượng mất gói (packet loss). Cấu trúc parsing chuẩn xác, dữ liệu chạy thông suốt hai chiều. | Hệ thống phản hồi được lệnh cơ bản nhưng thi thoảng gián đoạn, thỉnh thoảng rớt kết nối hoặc phản hồi trễ do xử lý kẹt buffer (độ trễ Delay cao). | Hoàn toàn không bóc tách (parse) được gói dữ liệu JSON. Hệ thống báo lỗi Serial Timeout triền miên. |
| **Giao diện & Máy Chủ (Web App & Flask)** | 25% | Thiết kế Front-end mượt mà và trực quan. Việc điều khiển robot êm dịu, số liệu Sonar Distance làm tươi liên tục với tính thẩm mỹ tối ưu. | Chức năng phím nhấn Web điều khiển được mức độ đơn giản. Giao diện thô cứng, con số Sensor nhảy chậm hoặc thỉnh thoảng đứng giao diện. | Không tài nào khởi tạo được server bằng môi trường Python Flask. Không thể truy xuất IP từ điện thoại. |
| **Đa Luồng & Thu thập Log (Thread & Telemetry)**| 25% | Tập tin văn bản `.csv` được tạo dựng tự động với nội dung xuất sắc. Lưu log định kỳ 0.5s/lần trơn tru, đi kèm Timestamp mili-giây với sự tách bạch hoàn chỉnh. | Tệp CSV có sản sinh nhưng xuất hiện hiện tượng chồng lấp sai cấu trúc, bỏ lỡ nhịp thời gian, hoặc khoá bộ nhớ Lock dùng sai cách khiến chương trình sập vặt. | Không thu hoạch được bất cứ dấu tích gì về luồng ghi log ghi vết (Telemetry thread không chạy). |
| **Tư Duy Cấu Trúc (System Architecture)** | 15% | Học viên tiếp thu triệt để FSM. Module phần mềm có tính độc lập cao, tách lớp chuyên biệt. Dễ dàng sử dụng lại thư viện (Reusable Code). | Lập trình dồn một cụm vào vòng lặp vô tận (while-true), thiếu vắng việc chia hàm con. Hoạt động được nhưng khó cho lập trình viên khác nâng cấp. | Mã nguồn rối như tơ vò (Spaghetti code). Biến toàn cục lạm dụng bừa bãi. Hàm lồng vòng, gây sai số logic trầm trọng. |
| **Trình bày Báo Cáo (Media Report/Video)** | 10% | Đệ trình Video báo cáo chuẩn nét cao. Học viên giải đáp lưu loát các luận điểm câu hỏi. Hình ảnh minh hoạ sinh động trực quan tại thực địa. | Nộp bài và Video theo đúng kỳ hạn. Nhưng nội dung video thiếu dẫn chứng thuyết phục và thiếu minh giải. | Trễ hạn báo cáo nghiêm trọng, không nộp đủ file, hoặc Video có chất lượng âm thanh / hình ảnh kém, mờ nhạt đến mức không nhận dạng được thao tác học viên. |

*-- End of Week 6 Document --*
