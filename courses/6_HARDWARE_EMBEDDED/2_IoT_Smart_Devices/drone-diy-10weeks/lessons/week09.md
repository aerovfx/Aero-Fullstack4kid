# Tuần 9: Telemetry & Ground Control Dashboard / Week 9: Telemetry & Ground Control Dashboard

## Mục Tiêu / Learning Objectives

**Tiếng Việt:**
1. Hiểu nguyên lý hoạt động của sóng vô tuyến Telemetry (433MHz và 915MHz) và giao thức MAVLink.
2. Nắm bắt các khái niệm quan trọng về truyền dẫn không dây: tầm hoạt động (range), mất gói tin (packet loss), và cường độ tín hiệu (RSSI).
3. Tự xây dựng phần mềm Trạm Điều Khiển Mặt Đất (Ground Control Station - GCS) cơ bản bằng Python (Tkinter/PyQt5) hoặc Web (Flask + Socket.IO).
4. Thực hiện trực quan hóa dữ liệu theo thời gian thực (real-time data visualization) như biểu đồ độ cao, pin, và hướng di chuyển.
5. Ghi log dữ liệu chuyến bay ra file CSV/JSON và phân tích dữ liệu sau chuyến bay.
6. Tích hợp cảnh báo pin yếu và thiết kế giao diện (Dashboard widgets) như đường chân trời ảo (artificial horizon).

**English:**
1. Understand the working principles of Telemetry radio waves (433MHz and 915MHz) and the MAVLink protocol.
2. Grasp critical concepts of wireless transmission: range, packet loss, and Received Signal Strength Indicator (RSSI).
3. Build a custom basic Ground Control Station (GCS) software using Python (Tkinter/PyQt5) or Web technologies (Flask + Socket.IO).
4. Implement real-time data visualization such as altitude charts, battery levels, and heading.
5. Log flight data to CSV/JSON files and perform post-flight data analysis.
6. Integrate low-battery alerts and design dashboard widgets like the artificial horizon.

---

## Công Cụ & Phần Mềm / Tools & Software

**Tiếng Việt:**
- **Phần cứng:** Module Telemetry Radio (SiK radio 433MHz hoặc 915MHz), Cáp kết nối OTG, Máy tính hoặc Raspberry Pi.
- **Phần mềm/Thư viện:** 
  - Python 3.8+
  - DroneKit-Python (`pip install dronekit`)
  - Flask và Flask-SocketIO (`pip install Flask flask-socketio`)
  - Matplotlib và Pandas cho phân tích dữ liệu (`pip install matplotlib pandas`)
  - PyQt5 (Tùy chọn) (`pip install PyQt5`)
- **Trình duyệt Web:** Chrome, Firefox hoặc Edge để hiển thị Dashboard.

**English:**
- **Hardware:** Telemetry Radio Module (SiK radio 433MHz or 915MHz), OTG cable, PC or Raspberry Pi.
- **Software/Libraries:**
  - Python 3.8+
  - DroneKit-Python (`pip install dronekit`)
  - Flask and Flask-SocketIO (`pip install Flask flask-socketio`)
  - Matplotlib and Pandas for data analysis (`pip install matplotlib pandas`)
  - PyQt5 (Optional) (`pip install PyQt5`)
- **Web Browser:** Chrome, Firefox, or Edge to display the dashboard.

---

## Lý Thuyết / Theory

### 1. Telemetry Radio Modules (433MHz vs 915MHz) & SiK Radio
**Tiếng Việt:** 
Mạch Telemetry (Viễn trắc) cho phép giao tiếp hai chiều giữa drone và trạm mặt đất. Dòng SiK Radio rất phổ biến trong thế giới ArduPilot/PX4. 
- **433MHz:** Tần số thấp hơn, bước sóng dài hơn, khả năng đâm xuyên vật cản tốt hơn, tầm xa tốt hơn. Tuy nhiên, ở một số quốc gia, băng tần này bị hạn chế hoặc yêu cầu giấy phép.
- **915MHz:** Tần số cao hơn, tốc độ truyền tải có thể tốt hơn, ăng-ten nhỏ gọn hơn nhưng khả năng xuyên vật cản kém hơn một chút. Phổ biến ở Châu Mỹ.

**English:**
Telemetry modules allow two-way communication between the drone and the ground station. The SiK Radio series is highly popular in the ArduPilot/PX4 ecosystem.
- **433MHz:** Lower frequency, longer wavelength, better penetration through obstacles, and better range. However, in some countries, this band is restricted or requires a license.
- **915MHz:** Higher frequency, potentially better data rates, more compact antennas, but slightly worse obstacle penetration. Popular in the Americas.

### 2. MAVLink over Radio: Range, Packet Loss, RSSI
**Tiếng Việt:**
Dữ liệu được đóng gói theo chuẩn MAVLink. Khi truyền qua sóng radio, ta cần quan tâm đến:
- **Range (Tầm xa):** Phụ thuộc vào công suất phát (mW) và độ lợi ăng-ten (dBi).
- **Packet Loss (Mất gói tin):** Do nhiễu sóng hoặc ngoài vùng phủ sóng. Tỷ lệ mất gói cao sẽ làm GCS cập nhật chậm.
- **RSSI (Received Signal Strength Indicator):** Chỉ số cường độ tín hiệu nhận được. GCS dùng RSSI để cảnh báo người dùng khi drone đi quá xa và sắp mất kết nối.

**English:**
Data is encapsulated using the MAVLink standard. When transmitting over radio, we must monitor:
- **Range:** Depends on transmission power (mW) and antenna gain (dBi).
- **Packet Loss:** Caused by interference or being out of coverage. High packet loss causes delayed GCS updates.
- **RSSI (Received Signal Strength Indicator):** The strength of the received signal. GCS uses RSSI to warn users when the drone is flying too far and about to lose connection.

### 3. Ghi Log Dữ Liệu (Logging Flight Data to CSV/JSON)
**Tiếng Việt:**
Lưu lại dữ liệu chuyến bay (độ cao, tọa độ, pin) ra file CSV hoặc JSON rất quan trọng để phân tích lỗi, tối ưu hóa thuật toán điều khiển và làm tài liệu báo cáo.
**English:**
Saving flight data (altitude, coordinates, battery) to CSV or JSON files is crucial for debugging, optimizing control algorithms, and reporting.

### 4. WebSocket Streaming: Flask + Socket.IO
**Tiếng Việt:**
Để hiển thị dữ liệu lên trình duyệt mượt mà và không độ trễ, chúng ta không dùng HTTP Request thông thường (do tốn tài nguyên và chậm). Thay vào đó, WebSocket (thông qua Flask-SocketIO) tạo ra một kênh kết nối liên tục 2 chiều. Máy chủ Python đọc dữ liệu từ DroneKit và "đẩy" (emit) trực tiếp lên giao diện Web.
**English:**
To display data smoothly on a browser without latency, we avoid standard HTTP requests (which are resource-heavy and slow). Instead, WebSockets (via Flask-SocketIO) create a continuous two-way connection. The Python server reads data from DroneKit and "emits" it directly to the Web interface.

### 5. Giao Diện Bảng Điều Khiển (Dashboard Widgets)
**Tiếng Việt:**
Một GCS chuyên nghiệp cần có:
- **Attitude Indicator (Đường chân trời ảo):** Hiển thị góc nghiêng Pitch (ngóc/chúc) và Roll (nghiêng trái/phải).
- **Compass Rose (La bàn):** Hiển thị hướng (Heading / Yaw).
- **Battery Gauge:** Hiển thị phần trăm pin và đổi màu đỏ cảnh báo khi pin yếu.
**English:**
A professional GCS requires:
- **Attitude Indicator (Artificial Horizon):** Displays Pitch (nose up/down) and Roll (tilt left/right).
- **Compass Rose:** Displays Heading / Yaw.
- **Battery Gauge:** Displays battery percentage and turns red as a low-battery warning.

---

## Code Thực Hành / Practice Code

### Phần 1: Flask + Socket.IO Server (app.py)

```python
import time
import threading
import csv
from datetime import datetime
from flask import Flask, render_template
from flask_socketio import SocketIO, emit
from dronekit import connect

app = Flask(__name__)
app.config['SECRET_KEY'] = 'drone_secret_key'
socketio = SocketIO(app, cors_allowed_origins='*')

# Global vehicle object
vehicle = None
LOG_FILE = 'flight_log.csv'

def setup_logger():
    """Khởi tạo file CSV để ghi log / Initialize CSV file for logging"""
    with open(LOG_FILE, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(['Timestamp', 'Altitude_m', 'Battery_V', 'Battery_Lvl', 'Heading', 'GroundSpeed_ms', 'Mode'])

def telemetry_stream():
    """Luồng (Thread) chạy ngầm để lấy dữ liệu liên tục / Background thread to fetch data"""
    global vehicle
    while True:
        if vehicle:
            # Lấy dữ liệu / Fetch data
            alt = vehicle.location.global_relative_frame.alt or 0.0
            bat_v = vehicle.battery.voltage or 0.0
            bat_lvl = vehicle.battery.level or 0
            heading = vehicle.heading or 0
            speed = vehicle.groundspeed or 0.0
            mode = str(vehicle.mode.name)
            pitch = vehicle.attitude.pitch
            roll = vehicle.attitude.roll
            
            # Gói dữ liệu / Data payload
            data = {
                'altitude': round(alt, 2),
                'battery_v': round(bat_v, 2),
                'battery_lvl': bat_lvl,
                'heading': heading,
                'speed': round(speed, 2),
                'mode': mode,
                'pitch': round(pitch, 2),
                'roll': round(roll, 2),
                'timestamp': datetime.now().strftime('%H:%M:%S')
            }
            
            # Gửi qua WebSocket / Emit via WebSocket
            socketio.emit('telemetry', data)
            
            # Ghi log ra file CSV / Log to CSV
            with open(LOG_FILE, mode='a', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([data['timestamp'], alt, bat_v, bat_lvl, heading, speed, mode])
                
        time.sleep(0.5)  # Cập nhật 2 lần/giây | Update 2 times per second

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    print("Đang kết nối tới Drone... / Connecting to Drone...")
    # Kết nối tới drone qua cổng COM (Radio) hoặc SITL. Ví dụ: 'COM3', '/dev/ttyUSB0', hoặc '127.0.0.1:14550'
    connection_string = '127.0.0.1:14550' 
    try:
        vehicle = connect(connection_string, wait_ready=True)
        print("Kết nối thành công! / Connected successfully!")
        
        setup_logger()
        
        # Chạy luồng telemetry / Start telemetry thread
        t = threading.Thread(target=telemetry_stream)
        t.daemon = True
        t.start()
        
        # Chạy Web Server / Start Web Server
        socketio.run(app, host='0.0.0.0', port=5000, debug=False)
        
    except Exception as e:
        print(f"Lỗi kết nối / Connection Error: {e}")
```

### Phần 2: Web Dashboard Client (templates/index.html)

Tạo thư mục `templates` cùng cấp với `app.py` và lưu file `index.html`.
Create a `templates` folder in the same directory as `app.py` and save `index.html`.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drone Ground Control Dashboard</title>
    <!-- Bootstrap for quick styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Chart.js for data visualization -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Socket.IO -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.0.1/socket.io.js"></script>
    <style>
        body { background-color: #121212; color: #ffffff; }
        .card { background-color: #1e1e1e; border: none; margin-bottom: 20px; }
        .card-title { color: #00d2ff; }
        .alert-custom { background-color: #ff4d4d; color: white; display: none; }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h2 class="text-center mb-4">UAV Telemetry Dashboard</h2>
        
        <!-- Cảnh báo pin / Battery Warning -->
        <div id="batteryWarning" class="alert alert-custom text-center">
            <strong>WARNING:</strong> Low Battery! Please Return to Launch (RTL).
        </div>

        <div class="row">
            <!-- Thông số cơ bản / Basic Stats -->
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5 class="card-title">Flight Data</h5>
                    <p>Mode: <span id="modeVal" class="badge bg-primary">UNKNOWN</span></p>
                    <p>Altitude: <span id="altVal">0</span> m</p>
                    <p>Speed: <span id="speedVal">0</span> m/s</p>
                    <p>Heading: <span id="headVal">0</span>°</p>
                </div>
            </div>
            
            <!-- Trạng thái Pin / Battery Status -->
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5 class="card-title">Power</h5>
                    <p>Voltage: <span id="voltVal">0</span> V</p>
                    <p>Level: <span id="batLvlVal">0</span> %</p>
                    <div class="progress">
                        <div id="batProgress" class="progress-bar bg-success" role="progressbar" style="width: 100%"></div>
                    </div>
                </div>
            </div>

            <!-- Tọa độ tư thế / Attitude -->
            <div class="col-md-4">
                <div class="card p-3 shadow">
                    <h5 class="card-title">Attitude (Rad)</h5>
                    <p>Pitch: <span id="pitchVal">0</span></p>
                    <p>Roll: <span id="rollVal">0</span></p>
                </div>
            </div>
        </div>

        <!-- Biểu đồ độ cao / Altitude Chart -->
        <div class="row mt-4">
            <div class="col-md-12">
                <div class="card p-3 shadow">
                    <h5 class="card-title">Real-time Altitude (m)</h5>
                    <canvas id="altChart" height="80"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Kết nối WebSocket / Connect to WebSocket
        var socket = io.connect('http://' + document.domain + ':' + location.port);
        
        // Khởi tạo Chart.js / Initialize Chart.js
        var ctx = document.getElementById('altChart').getContext('2d');
        var altChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: [],
                datasets: [{
                    label: 'Altitude (m)',
                    data: [],
                    borderColor: '#00d2ff',
                    backgroundColor: 'rgba(0, 210, 255, 0.2)',
                    borderWidth: 2,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                scales: {
                    x: { display: true },
                    y: { beginAtZero: true }
                },
                animation: false // Tắt animation để vẽ mượt hơn / Disable animation for smoother real-time drawing
            }
        });

        // Nhận dữ liệu / Receive Data
        socket.on('telemetry', function(msg) {
            // Cập nhật text / Update text
            document.getElementById('modeVal').innerText = msg.mode;
            document.getElementById('altVal').innerText = msg.altitude;
            document.getElementById('speedVal').innerText = msg.speed;
            document.getElementById('headVal').innerText = msg.heading;
            
            document.getElementById('voltVal').innerText = msg.battery_v;
            document.getElementById('batLvlVal').innerText = msg.battery_lvl;
            
            document.getElementById('pitchVal').innerText = msg.pitch;
            document.getElementById('rollVal').innerText = msg.roll;

            // Cập nhật thanh Pin / Update Battery Bar
            var batBar = document.getElementById('batProgress');
            batBar.style.width = msg.battery_lvl + '%';
            
            // Xử lý cảnh báo pin yếu (< 20%) / Handle low battery warning
            var warningBox = document.getElementById('batteryWarning');
            if(msg.battery_lvl < 20) {
                batBar.classList.remove('bg-success');
                batBar.classList.add('bg-danger');
                warningBox.style.display = 'block';
            } else {
                batBar.classList.remove('bg-danger');
                batBar.classList.add('bg-success');
                warningBox.style.display = 'none';
            }

            // Cập nhật biểu đồ (Giữ tối đa 20 điểm dữ liệu) / Update chart (Keep max 20 data points)
            if(altChart.data.labels.length > 20) {
                altChart.data.labels.shift();
                altChart.data.datasets[0].data.shift();
            }
            altChart.data.labels.push(msg.timestamp);
            altChart.data.datasets[0].data.push(msg.altitude);
            altChart.update();
        });
    </script>
</body>
</html>
```

### Phần 3: Phân tích dữ liệu bằng Pandas & Matplotlib (Data Analysis)

Sau chuyến bay, bạn có file `flight_log.csv`. File code sau dùng để vẽ lại hành trình độ cao.
After the flight, you have `flight_log.csv`. The following script plots the altitude path.

```python
import pandas as pd
import matplotlib.pyplot as plt

# Đọc file CSV / Read CSV file
try:
    df = pd.read_csv('flight_log.csv')
    
    # Tạo đồ thị / Create plot
    plt.figure(figsize=(10, 5))
    plt.plot(df['Timestamp'], df['Altitude_m'], label='Altitude (m)', color='blue', linewidth=2)
    plt.plot(df['Timestamp'], df['GroundSpeed_ms'], label='Speed (m/s)', color='red', linestyle='dashed')
    
    # Định dạng / Formatting
    plt.title('Flight Analysis: Altitude & Speed over Time')
    plt.xlabel('Time')
    plt.ylabel('Value')
    plt.legend()
    plt.xticks(rotation=45)
    plt.grid(True)
    
    # Tối ưu khoảng cách nhãn thời gian / Optimize x-ticks if too many points
    if len(df) > 15:
        plt.xticks(df['Timestamp'][::len(df)//15]) 
        
    plt.tight_layout()
    plt.show()

except FileNotFoundError:
    print("Không tìm thấy file log! / Log file not found!")
```

---

## Bài Tập / Exercises

**Tiếng Việt:**
1. **Bài tập 1:** Chạy mô phỏng SITL trên máy tính. Khởi động Web Dashboard, dùng lệnh DroneKit từ bài cũ để ra lệnh cất cánh lên 15m. Quan sát biểu đồ độ cao vẽ realtime trên Dashboard.
2. **Bài tập 2:** Thêm hiển thị thông tin GPS (Vĩ độ - Latitude, Kinh độ - Longitude, Số vệ tinh - Satellites Visible) vào file `app.py` và `index.html`.
3. **Bài tập 3 (Nâng cao):** Tích hợp một nút bấm "RTL" (Return To Launch) trên giao diện Web. Khi bấm, gửi request từ Web về Flask server, và Flask server gọi lệnh `vehicle.mode = VehicleMode("RTL")`.

**English:**
1. **Exercise 1:** Run SITL simulation on your PC. Start the Web Dashboard, use DroneKit commands from previous lessons to command a takeoff to 15m. Observe the real-time altitude chart on the Dashboard.
2. **Exercise 2:** Add GPS information display (Latitude, Longitude, Satellites Visible) to `app.py` and `index.html`.
3. **Exercise 3 (Advanced):** Integrate an "RTL" (Return To Launch) button on the Web interface. When clicked, send a request from Web to Flask server, and have the server execute `vehicle.mode = VehicleMode("RTL")`.

---

## Câu Hỏi Thảo Luận / Discussion Questions

**Tiếng Việt:**
1. Tại sao ở những khu vực rừng núi hoặc nhiều vật cản, người ta ưu tiên sử dụng sóng radio tần số 433MHz hơn là 915MHz hoặc 2.4GHz?
2. Nếu Dashboard của bạn bị trễ (lag) 2-3 giây so với thực tế bay của drone, những nguyên nhân nào có thể gây ra hiện tượng này và cách khắc phục?
3. Giao thức WebSocket có ưu điểm gì so với việc dùng AJAX/HTTP Polling truyền thống để cập nhật dữ liệu liên tục?
4. Tại sao chúng ta cần ghi log (CSV/JSON) cục bộ trên máy tính (GCS) trong khi thẻ nhớ của mạch điều khiển (Pixhawk) cũng có lưu file log (.bin)?
5. Nếu bị ngắt kết nối Telemetry giữa chừng (Loss of Signal), theo bạn Drone nên được lập trình để tự động thực hiện hành động gì? (Failsafe).

**English:**
1. Why is the 433MHz frequency preferred over 915MHz or 2.4GHz in mountainous or obstacle-rich environments?
2. If your Dashboard has a 2-3 second latency compared to the drone's actual flight, what could be the causes and how do you fix it?
3. What are the advantages of WebSockets over traditional AJAX/HTTP Polling for continuous data updates?
4. Why do we need to log data (CSV/JSON) locally on the ground station (GCS) when the flight controller's SD card (Pixhawk) also saves log files (.bin)?
5. If the Telemetry connection drops mid-flight (Loss of Signal), what automatic action (Failsafe) should the drone be programmed to execute?

---

## Bài Về Nhà / Homework

**Tiếng Việt:**
Hoàn thiện Bài tập số 2 và 3. Quay một video ngắn màn hình (screen record) thể hiện cảnh bạn bấm nút RTL trên trang Web và quan sát chỉ số Altitude, Mode giảm/thay đổi trên Dashboard, đồng thời đính kèm file `flight_log.csv` nộp trên hệ thống học tập.

**English:**
Complete Exercises 2 and 3. Record a short screen video demonstrating clicking the RTL button on the Web page and observing the Altitude and Mode changes on the Dashboard. Submit the video along with your generated `flight_log.csv` file to the learning management system.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí / Criteria | Xuất Sắc / Excellent (9-10) | Khá / Good (7-8) | Đạt / Pass (5-6) | Cần Cố Gắng / Needs Improvement (<5) |
|---|---|---|---|---|
| **Code Flask & Socket.IO** | Cấu hình đúng, truyền mượt mà không lỗi. Đã thêm đầy đủ dữ liệu GPS theo yêu cầu. | Server chạy tốt, có truyền dữ liệu nhưng thiếu một số thông số nhỏ. | Chạy được server nhưng còn lỗi thi thoảng rớt kết nối. | Server lỗi, không thể kết nối hoặc khởi chạy. |
| **Giao diện & Biểu đồ (UI & Chart)** | Dashboard đẹp mắt, biểu đồ vẽ realtime mượt mà, cảnh báo pin hoạt động tốt, hiển thị rõ ràng. | Biểu đồ hiển thị đúng, giao diện ổn, cảnh báo pin hoạt động định dạng chưa đẹp. | Biểu đồ vẽ bị giật, giao diện xô lệch, thiếu cảnh báo. | Giao diện lỗi CSS/JS, biểu đồ không hiển thị dữ liệu. |
| **Tính năng điều khiển (Nút RTL)** | Nút hoạt động trơn tru, thay đổi Mode ngay lập tức và có thông báo phản hồi (Feedback) trên UI. | Nút RTL đổi được Mode nhưng không có thông báo xác nhận trên web. | Nút RTL gửi lệnh chậm, hoặc cần ấn nhiều lần mới nhận. | Không làm bài tập 3, hoặc nút bị lỗi 404/500. |
| **Ghi và Phân Tích Dữ Liệu (Logging)** | File CSV đúng chuẩn, Script phân tích vẽ đồ thị rõ ràng, chú thích đầy đủ. | Có file CSV và vẽ được đồ thị nhưng thiếu nhãn dán (labels/legends). | File CSV lưu bị thiếu dòng thời gian, đồ thị khó đọc. | Không lưu được file CSV, không có file phân tích log. |

---
*End of Week 9 Lesson Content*
