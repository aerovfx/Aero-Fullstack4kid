# MicroPython Nâng Cao / Advanced MicroPython
# *micro:bit STEM — Session 2 of MicroPython Module*

---

## 1. Đọc cảm biến / Reading Sensors

### Nhiệt độ / Temperature
```python
from microbit import *

while True:
    temp = temperature()           # Đọc nhiệt độ (°C)
    display.scroll(str(temp) + 'C')
    sleep(2000)
```

### Gia tốc kế / Accelerometer
```python
from microbit import *

while True:
    x = accelerometer.get_x()
    y = accelerometer.get_y()
    z = accelerometer.get_z()
    print("X:", x, "Y:", y, "Z:", z)  # In ra serial
    sleep(500)
```

### Cảm biến ánh sáng / Light Sensor
```python
from microbit import *

while True:
    light = display.read_light_level()  # 0 = tối, 255 = sáng nhất
    if light < 50:
        display.show(Image.HAPPY)   # Tối → bật đèn
    else:
        display.clear()
    sleep(1000)
```

---

## 2. Giao tiếp Radio / Radio Communication

```python
import radio
from microbit import *

radio.on()
radio.config(channel=7, power=6)  # Chọn kênh 7, công suất 6

while True:
    if button_a.is_pressed():
        radio.send('hello')         # Gửi tin nhắn
        display.show(Image.ARROW_E)
    
    message = radio.receive()       # Nhận tin nhắn
    if message:
        display.scroll(message)
    
    sleep(100)
```

---

## 3. Xuất dữ liệu Serial (IoT giả lập) / Serial Output (IoT Simulation)

```python
from microbit import *
import json

while True:
    temp = temperature()
    light = display.read_light_level()
    x = accelerometer.get_x()
    
    # Tạo JSON payload
    data = {
        "temperature": temp,
        "light": light,
        "accel_x": x
    }
    
    # In ra serial (có thể đọc từ máy tính)
    print(json.dumps(data))
    sleep(5000)  # Gửi mỗi 5 giây
```

---

## 4. Điều khiển Servo / Servo Control

```python
from microbit import *

def set_servo(pin, angle):
    """
    Điều khiển servo theo góc (0-180).
    / Control servo by angle (0-180).
    """
    # Chuyển góc thành pulse width (1000-2000 microseconds)
    pulse = 1000 + (angle / 180) * 1000
    pin.set_analog_period(20)      # 20ms period (50Hz)
    pin.write_analog(int(pulse / 20000 * 1023))

# Mở cửa / Open door
set_servo(pin0, 90)
sleep(1000)

# Đóng cửa / Close door
set_servo(pin0, 0)
sleep(1000)
```

---

## 5. Sử dụng Mảng & Chuỗi / Arrays & Strings

```python
from microbit import *
import random

# Mảng điểm / Score array
scores = []

# Thêm điểm / Add scores
for i in range(5):
    score = random.randint(50, 100)
    scores.append(score)
    print("Score", i+1, ":", score)

# Tính trung bình / Calculate average
average = sum(scores) / len(scores)
print("Average:", average)

# Hiển thị trên LED / Display on LED
display.scroll("Avg:" + str(int(average)))
```

---

## 6. Cấu trúc điều kiện phức tạp / Complex Conditionals

```python
from microbit import *

def classify_temperature(temp):
    """Phân loại nhiệt độ / Classify temperature"""
    if temp < 10:
        return "Cold"
    elif temp < 20:
        return "Cool"
    elif temp < 30:
        return "Warm"
    else:
        return "Hot"

while True:
    temp = temperature()
    category = classify_temperature(temp)
    display.scroll(category)
    sleep(3000)
```

---

## 7. Thuật toán Bubble Sort / Bubble Sort Algorithm

```python
def bubble_sort(arr):
    """
    Sắp xếp nổi bọt / Bubble sort
    Độ phức tạp: O(n²)
    """
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]  # Hoán đổi / Swap
    return arr

# Test
data = [64, 34, 25, 12, 22, 11, 90]
sorted_data = bubble_sort(data)
print("Sorted:", sorted_data)
```

---

## 8. Xử lý lỗi / Error Handling

```python
from microbit import *

def safe_divide(a, b):
    """Chia an toàn / Safe division"""
    try:
        result = a / b
        return result
    except ZeroDivisionError:
        display.show("E")           # Hiển thị lỗi / Show error
        return None

# Test
result = safe_divide(10, 0)
if result is None:
    print("Cannot divide by zero!")
else:
    print("Result:", result)
```

---

## 📚 Tài nguyên MicroPython / MicroPython Resources

| Nguồn | Link |
|-------|------|
| MicroPython Docs (micro:bit) | https://microbit-micropython.readthedocs.io/ |
| Python.org Tutorial | https://docs.python.org/3/tutorial/ |
| W3Schools Python | https://www.w3schools.com/python/ |
| micro:bit Python Editor | https://python.microbit.org/v/3 |

---

*Nội dung này dành cho học sinh đã hoàn thành ít nhất Bài 1–20.*  
*This content is for students who completed at least Lessons 1–20.*
