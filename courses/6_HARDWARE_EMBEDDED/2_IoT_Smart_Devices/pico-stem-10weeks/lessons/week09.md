# Tuần 9: Khối Máy Trạng Thái PIO & Tối Ưu Bộ Nhớ RAM MicroPython (RP2040 PIO & Memory Optimization)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Khám phá tính năng độc quyền của chip RP2040: Khối ngoại vi lập trình được **PIO (Programmable I/O)** với 8 máy trạng thái độc lập (State Machines).
- Lập trình ngôn ngữ assembly PIO nhúng trong MicroPython (`@rp2.asm_pio`) để điều khiển dải đèn LED RGB WS2812B (Neopixel) với độ chính xác thời gian tính bằng nanosecond.
- Nắm vững các kỹ thuật tối ưu bộ nhớ RAM MicroPython: Giải phóng bộ nhớ rác `gc.collect()`, mảng cố định `array` và cấu trúc dữ liệu tiết kiệm bộ nhớ.
- Triển khai thuật toán **Máy trạng thái hữu hạn (FSM)** quản lý luồng hoạt động ứng dụng.

### English
- Explore RP2040's exclusive hardware feature: **Programmable I/O (PIO)** with 8 independent state machines.
- Program embedded PIO assembly (`@rp2.asm_pio`) driving WS2812B RGB Neopixel LEDs with nanosecond timing precision.
- Master MicroPython RAM optimization techniques: Garbage collection `gc.collect()`, typed `array` buffers, and memory-efficient structures.
- Deploy **Finite State Machines (FSM)** managing complex application workflows.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - RP2040 PIO Neopixel Driver & Memory Garbage Collector
```python
# MicroPython Code for Raspberry Pi Pico RP2040
# Lesson 9: RP2040 PIO Assembly Neopixel Driver & Memory Collector

import rp2
from machine import Pin
import time
import gc

# Define PIO Assembly State Machine for WS2812B 800kHz protocol
@rp2.asm_pio(sideset_init=rp2.PIO.OUT_LOW, out_shiftdir=rp2.PIO.SHIFT_LEFT, autopull=True, pull_thresh=24)
def ws2812():
    T1 = 2
    T2 = 5
    T3 = 3
    wrap_target()
    label("bitloop")
    out(x, 1)               .side(0) [T3 - 1]
    jmp(not_x, "do_zero")   .side(1) [T1 - 1]
    jmp("bitloop")          .side(1) [T2 - 1]
    label("do_zero")
    nop()                   .side(0) [T2 - 1]
    wrap()

# Initialize PIO State Machine 0 on GPIO 16
sm = rp2.StateMachine(0, ws2812, freq=8_000_000, sideset_base=Pin(16))
sm.active(1)

def show_color(r, g, b):
    # Pack RGB into 24-bit integer (GRB format for WS2812)
    grb = (g << 16) | (r << 8) | b
    sm.put(grb, 8)

print("[+] RP2040 PIO Neopixel Driver Online!")

colors = [(255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 0)]

for c in colors:
    show_color(*c)
    time.sleep(0.5)

# Free up unused memory
gc.collect()
print(f"[+] Free RAM Memory: {gc.mem_free()} bytes")
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 9.1: Đo Dung Lượng Bộ Nhớ RAM Tự Do
Viết script MicroPython sử dụng module `gc` đo lượng bộ nhớ RAM còn trống trước và sau khi khởi tạo một danh sách 1,000 phần tử.

#### Bài 9.2: Đèn LED Chớp Tắt Bằng Khối PIO Phần Cứng
Viết chương trình assembly PIO `@rp2.asm_pio` nhấp nháy đèn LED GPIO 15 hoàn toàn bằng phần cứng PIO mà không tốn tài nguyên CPU ARM.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 9.3: Hiệu Ứng Neopixel Cầu Vồng Dùng PIO
Viết script MicroPython tạo hiệu ứng xoay dải màu cầu vồng mịn mượt trên 8 đèn LED Neopixel bằng máy trạng thái PIO.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MicroPython (Hands-on Colab Lab)

#### Bài 9.4: Giả Lập Máy Trạng Thái FSM Trên Google Colab
Mở Google Colab, viết script Python mô phỏng bộ quản lý 3 trạng thái `STATE_IDLE`, `STATE_SAMPLING`, `STATE_REPORT` và tối ưu bộ nhớ RAM.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# FSM Memory Simulation Reference Solution
import gc

class StateMachine:
    def __init__(self):
        self.state = "IDLE"

    def transition(self, event):
        if self.state == "IDLE" and event == "START":
            self.state = "SAMPLING"
        elif self.state == "SAMPLING" and event == "STOP":
            self.state = "IDLE"

sm = StateMachine()
sm.transition("START")
print(f"[FSM] Current State: {sm.state}")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức PIO & Memory Optimization** | Giải thích sâu sắc kiến trúc khối PIO 8 state machines, lệnh assembly PIO, chuẩn màu Neopixel và thuật toán giải phóng bộ nhớ `gc.collect()`. | Hiểu cách tạo máy trạng thái PIO và quản lý bộ nhớ RAM. | Nắm được định nghĩa PIO nhưng chưa viết được assembly. | Lỗi syntax PIO. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (RAM Measure, PIO Blink, PIO Rainbow & Colab FSM Lab). | Hoàn thành Bài 9.1 và Bài 9.2 đúng yêu cầu. | Code có lỗi tràn bộ nhớ RAM hoặc Neopixel sáng sai màu. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi Pico RP2040 MicroPython 10 Weeks)*
