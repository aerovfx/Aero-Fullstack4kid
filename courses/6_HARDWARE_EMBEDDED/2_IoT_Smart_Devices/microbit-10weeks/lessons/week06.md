# Tuần 6: Ghi Nhật Ký Dữ Liệu Data Logging & Giao Tiếp Serial Plotter (Datalogger & Serial Data Science)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững tính năng **Data Logging (Ghi nhật ký dữ liệu)** tự động lưu trữ các tham số cảm biến vào bộ nhớ Flash nhúng của BBC micro:bit v2.
- Hiểu định dạng dữ liệu chuẩn bảng tính **CSV (Comma-Separated Values)** và quy trình trích xuất file `MY_DATA.HTM` / `datalog.csv` sang Microsoft Excel / Google Sheets.
- Sử dụng giao thức **Serial UART** để gửi chuỗi dữ liệu thực tính thời gian lên máy tính và trực quan hóa bằng công cụ **Serial Plotter**.
- Thực hành xây dựng trạm ghi nhật ký biến đổi nhiệt độ và độ xóc của chuyển động theo thời gian.

### English
- Master the **Data Logging** capabilities embedded in BBC micro:bit v2, logging sensor streams directly into onboard Flash memory.
- Understand **CSV (Comma-Separated Values)** file formats and export data logs (`MY_DATA.HTM` / `datalog.csv`) to Excel / Google Sheets.
- Utilize **Serial UART** communication to stream telemetry to host PCs and visualize data via **Serial Plotters**.
- Practice building autonomous time-series temperature and motion impact data loggers.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Ghi Nhật Ký Dữ Liệu & Định Dạng File CSV

#### Tiếng Việt
Tính năng Datalogger trên micro:bit v2 cho phép lưu trữ hàng ngàn dòng dữ liệu cảm biến ngay cả khi không kết nối với máy tính:
- Dữ liệu được ghi theo cấu trúc cột: `Timestamp, Temperature, Acceleration_Z, Light`.
- **Định dạng CSV:**
  ```text
  "Time (s)","Temp (C)","Light"
  0.0, 26.5, 120
  1.0, 26.8, 125
  2.0, 27.1, 118
  ```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MakeCode Python - Sensor Data Logging to Flash Memory
```python
# MakeCode Python Code for BBC micro:bit v2
# Lesson 6: Automatic Environmental Data Logger

# Configure Datalogger columns
datalogger.set_column_titles("Time_s", "Temp_C", "Light_Lvl")

def on_every_interval():
    # Log data every 1000ms (1 second)
    uptime_sec = input.running_time() / 1000.0
    temp = input.temperature()
    light = input.light_level()
    
    datalogger.log(
        datalogger.create_cv("Time_s", uptime_sec),
        datalogger.create_cv("Temp_C", temp),
        datalogger.create_cv("Light_Lvl", light)
    )
    
    # Flash LED indicator
    led.toggle(2, 2)

loops.every_interval(1000, on_every_interval)
```

---

### Code 2: MicroPython - Real-time Serial Telemetry for Serial Plotter
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 6: Real-time Serial Data Streamer for Python Plotter

from microbit import *

# Set Serial Baud Rate to 115200 bps
uart.init(baudrate=115200)

while True:
    t = running_time() / 1000.0
    ax = accelerometer.get_x()
    ay = accelerometer.get_y()
    az = accelerometer.get_z()
    
    # Format line for Serial Plotter (Tuple format: "ax:10, ay:20, az:30")
    serial_str = "ax:{}, ay:{}, az:{}\n".format(ax, ay, az)
    
    # Send string via USB Serial UART
    uart.write(serial_str)
    sleep(100)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 6.1: Trực Quan Hóa Đồ Thị Gia Tốc Qua Serial Plotter
Lập trình gửi dữ liệu gia tốc 3 trục ($a_x, a_y, a_z$) qua Serial UART. Mở công cụ **Serial Plotter** trong Mu Editor hoặc Arduino IDE để xem đồ thị sóng gia tốc thời gian thực khi lắc bo mạch.

#### Bài 6.2: Ghi Nhật Ký Nhiệt Độ Phòng 24h
Viết script MakeCode tự động ghi nhiệt độ phòng cứ mỗi 5 phút một lần vào tệp `datalogger`. Cắm hộp pin chạy 1 tiếng, sau đó cắm vào máy tính mở file `MY_DATA.HTM` xem biểu đồ.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 6.3: Thiết Bị Ghi Nhận Va Đập Xe Vận Chuyển Hàng Hóa (Blackbox Transport Logger)
Lập trình micro:bit đóng vai "Hộp đen vận chuyển": Tự động ghi lại mốc thời gian và giá trị gia tốc cực đại mỗi khi hộp hàng bị xóc mạnh ($> 2.5\text{g}$) hoặc bị rơi tự do.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 6.4: Xuất File CSV & Phân Tích Đồ Thị Trên Google Colab
1. Tải file `datalog.csv` từ micro:bit về máy tính.
2. Mở Google Colab, viết script Python dùng `pandas` và `matplotlib` đọc file CSV và vẽ biểu đồ nhiệt độ/ánh sáng chuyên nghiệp.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# Google Colab Python Script to Plot micro:bit CSV Data
import pandas as pd
import matplotlib.pyplot as plt

# Simulate reading exported micro:bit CSV
data = {'Time_s': [0, 1, 2, 3, 4], 'Temp_C': [26.5, 26.6, 26.8, 27.0, 27.2]}
df = pd.DataFrame(data)

plt.figure(figsize=(8, 4))
plt.plot(df['Time_s'], df['Temp_C'], marker='o', color='red')
plt.title('micro:bit Temperature Data Log')
plt.xlabel('Time (seconds)')
plt.ylabel('Temperature (°C)')
plt.grid(True)
plt.show()
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Data Logging & Serial** | Giải thích sâu sắc cấu trúc CSV, bộ nhớ Flash nhúng v2, Baud rate Serial UART và phân tích biểu đồ Pandas. | Hiểu cách sử dụng khối `datalogger` và xem Serial Plotter. | Nắm được định nghĩa Data Logging nhưng chưa xuất được file CSV. | Không ghi được dữ liệu. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Serial Plotter, Temperature Logger 24h, Blackbox Transport & Colab Pandas Lab). | Hoàn thành Bài 6.1 và Bài 6.2 đúng yêu cầu. | Code có lỗi ghi đè dữ liệu hoặc sai tốc độ Baud. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
