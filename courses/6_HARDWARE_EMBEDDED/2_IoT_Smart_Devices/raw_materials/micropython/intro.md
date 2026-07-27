# Nhập Môn MicroPython / Introduction to MicroPython
# *micro:bit STEM Curriculum — Session 1 of MicroPython Module*

---

## 1. MicroPython là gì? / What is MicroPython?

**Tiếng Việt:**  
MicroPython là phiên bản rút gọn của ngôn ngữ lập trình Python, được tối ưu hóa cho vi điều khiển và các thiết bị nhúng như micro:bit. Nó cho phép bạn viết code Python thực sự trên phần cứng nhỏ gọn.

**English:**  
MicroPython is a lean implementation of Python 3, optimized for microcontrollers and embedded devices like micro:bit. It allows you to write real Python code on compact hardware.

### So sánh MakeCode vs MicroPython / MakeCode vs MicroPython Comparison

| Tiêu chí | MakeCode (Blocks) | MicroPython |
|----------|------------------|-------------|
| Giao diện | Kéo thả / Drag & drop | Văn bản / Text-based |
| Phù hợp | Người mới bắt đầu / Beginners | Trung cấp trở lên / Intermediate+ |
| Tốc độ học | Nhanh / Fast | Chậm hơn / Slower |
| Tính năng | Đủ cho hầu hết / Sufficient | Linh hoạt hơn / More flexible |
| Dùng sau này | Không phổ biến / Less common | Python rất phổ biến / Very common |

---

## 2. Cài đặt môi trường / Setup

### Cách 1: Trình duyệt web (Khuyến nghị) / Browser Editor (Recommended)
1. Truy cập: https://python.microbit.org/v/3
2. Viết code trực tiếp trong trình duyệt
3. Click **Send to micro:bit** để nạp

### Cách 2: Mu Editor (Offline)
1. Tải tại: https://codewith.mu/
2. Cài đặt và mở
3. Chọn mode **BBC micro:bit**
4. Viết code và click **Flash**

### Cách 3: VS Code (Nâng cao)
1. Cài VS Code: https://code.visualstudio.com/
2. Cài extension "micro:bit" 
3. Kết nối micro:bit qua USB

---

## 3. Chương Trình Đầu Tiên / First Program

### Hello World
```python
from microbit import *

display.scroll('Hello, World!')
```

**Giải thích / Explanation:**
- `from microbit import *` — Nhập toàn bộ thư viện micro:bit / Import micro:bit library
- `display.scroll(...)` — Cuộn chữ qua màn hình LED / Scroll text across LED display

### Hiển thị hình ảnh / Display Images
```python
from microbit import *

# Hiển thị trái tim / Display heart
display.show(Image.HEART)
sleep(1000)

# Hiển thị mặt cười / Display happy face
display.show(Image.HAPPY)
sleep(1000)

# Tắt màn hình / Clear display
display.clear()
```

### Một số Image có sẵn / Built-in Images
| Image constant | Hình ảnh |
|---------------|---------|
| `Image.HEART` | ❤️ Trái tim |
| `Image.HAPPY` | 😊 Vui |
| `Image.SAD` | 😢 Buồn |
| `Image.SURPRISED` | 😮 Ngạc nhiên |
| `Image.ARROW_N` | ↑ Mũi tên Bắc |
| `Image.DIAMOND` | 💎 Kim cương |
| `Image.SKULL` | 💀 Đầu lâu |
| `Image.YES` | ✓ Đúng |
| `Image.NO` | ✗ Sai |

---

## 4. Input – Đọc nút bấm / Reading Buttons

```python
from microbit import *

while True:
    # Nếu nhấn nút A / If button A is pressed
    if button_a.is_pressed():
        display.show(Image.HAPPY)
    
    # Nếu nhấn nút B / If button B is pressed
    elif button_b.is_pressed():
        display.show(Image.SAD)
    
    # Không nhấn gì / Nothing pressed
    else:
        display.clear()
    
    sleep(100)  # Chờ 100ms / Wait 100ms
```

---

## 5. Biến và Vòng lặp / Variables and Loops

```python
from microbit import *

# Tạo biến đếm / Create counter variable
counter = 0

while True:
    if button_a.was_pressed():
        counter = counter + 1        # Tăng biến / Increment
        display.show(counter % 10)   # Hiển thị 0-9 / Display 0-9
    
    if button_b.was_pressed():
        counter = 0                  # Reset về 0 / Reset to 0
        display.show(0)
    
    sleep(50)
```

---

## 6. Hàm (Function) / Functions

```python
from microbit import *

def blink(times, speed):
    """
    Nhấp nháy LED matrix 'times' lần với tốc độ 'speed' ms
    / Blink LED matrix 'times' times with 'speed' ms delay
    """
    for i in range(times):
        display.show(Image.HEART)
        sleep(speed)
        display.clear()
        sleep(speed)

# Gọi hàm / Call function
blink(3, 300)   # Nhấp nháy 3 lần, 300ms
blink(5, 100)   # Nhấp nháy 5 lần, 100ms nhanh hơn
```

---

## 7. Điều Kiện Nâng Cao / Advanced Conditionals

```python
from microbit import *
import random

secret = random.randint(1, 10)  # Số bí mật 1-10

while True:
    display.scroll('Guess 1-10')
    
    if button_a.was_pressed():
        guess = random.randint(1, 10)   # Giả lập đoán ngẫu nhiên
        
        if guess == secret:
            display.show(Image.YES)     # Đúng!
            sleep(2000)
            secret = random.randint(1, 10)  # Số mới
        elif guess < secret:
            display.scroll('Higher')    # Cao hơn
        else:
            display.scroll('Lower')     # Thấp hơn
    
    sleep(100)
```

---

## 8. Tài Nguyên Học Thêm / Further Learning

| Nguồn | Mô tả | Link |
|-------|-------|------|
| micro:bit Python Editor | IDE online chính thức | https://python.microbit.org/v/3 |
| MicroPython Docs | Tài liệu tham khảo | https://microbit-micropython.readthedocs.io/ |
| Mu Editor | IDE offline | https://codewith.mu/ |
| Python.org | Học Python tổng quát | https://docs.python.org/3/tutorial/ |

---

## 9. Bài Tập Về Nhà / Homework

1. Viết chương trình hiển thị tên của bạn cuộn qua LED.  
   *Write a program to scroll your name across the LED.*
2. Tạo bộ đếm: nhấn A tăng, nhấn B giảm, không bao giờ âm.  
   *Create a counter: A increments, B decrements, never goes below 0.*
3. Thách thức: Tạo đèn giao thông bằng các hình ảnh trên LED.  
   *Challenge: Create a traffic light simulation using LED images.*

---

*Buổi tiếp theo / Next session: MicroPython nâng cao – Cảm biến & Radio / Advanced MicroPython – Sensors & Radio*
