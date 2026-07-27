# Bài 23: Radio – Bộ Đàm / Lesson 23: Radio – Walkie-Talkie

---

| Thông tin / Info        | Chi tiết / Details                                 |
|-------------------------|----------------------------------------------------|
| **Lớp / Grade**         | 6–12                                               |
| **Thời lượng / Duration** | 90 phút / 90 minutes                             |
| **Giai đoạn / Phase**   | Giai đoạn 4 – Truyền thông & Mạng / Phase 4 – Communication & Networking |
| **Công cụ / Tools**     | Microsoft MakeCode, MicroPython                    |
| **Tác giả / Author**    | Giáo viên STEM / STEM Educator                     |
| **Cập nhật / Updated**  | 2026-07-16                                         |

---

## 1. MỤC TIÊU BÀI HỌC / LEARNING OBJECTIVES

Sau khi hoàn thành bài học này, học sinh sẽ có thể:  
*After completing this lesson, students will be able to:*

1. **[VN]** Giải thích nguyên lý hoạt động của sóng radio và cách micro:bit truyền/nhận tín hiệu không dây.  
   **[EN]** Explain the basic principles of radio waves and how micro:bit transmits and receives wireless signals.

2. **[VN]** Cấu hình kênh radio (channel 0–255) để hai micro:bit giao tiếp độc lập với nhau.  
   **[EN]** Configure a radio channel (0–255) so that two micro:bit devices communicate independently.

3. **[VN]** Lập trình gửi và nhận tin nhắn văn bản giữa hai micro:bit bằng MakeCode và MicroPython.  
   **[EN]** Program text message sending and receiving between two micro:bit devices using both MakeCode and MicroPython.

4. **[VN]** Xây dựng ứng dụng bộ đàm hai chiều (walkie-talkie) với danh sách tin nhắn nhanh.  
   **[EN]** Build a two-way walkie-talkie application with a quick-reply message list.

5. **[VN]** Đọc và hiển thị cường độ tín hiệu (RSSI) để hiểu về chất lượng kết nối không dây.  
   **[EN]** Read and display signal strength (RSSI) to understand wireless connection quality.

6. **[VN]** Áp dụng mã hóa Caesar đơn giản để bảo vệ nội dung tin nhắn truyền qua radio.  
   **[EN]** Apply a simple Caesar cipher encryption to protect the content of radio messages.

7. **[VN]** Phân tích và giải quyết các vấn đề thường gặp trong truyền thông không dây (nhiễu, mất gói tin).  
   **[EN]** Analyze and troubleshoot common wireless communication issues (interference, lost packets).

---

## 2. THIẾT BỊ CẦN THIẾT / REQUIRED COMPONENTS

| STT | Thiết bị / Component            | Số lượng / Qty | Ghi chú / Notes                              |
|-----|---------------------------------|----------------|----------------------------------------------|
| 1   | BBC micro:bit (v1 hoặc v2)      | 2              | Cả hai đều hỗ trợ radio built-in / Both support built-in radio |
| 2   | Cáp USB Micro-B / USB-C         | 2              | Tùy phiên bản micro:bit / Depends on version  |
| 3   | Máy tính / Computer             | 2              | Hoặc 1 máy + USB hub / Or 1 PC + USB hub     |
| 4   | USB Hub (tùy chọn)              | 1              | Kết nối 2 micro:bit vào 1 máy / Connect 2 to 1 PC |
| 5   | Pin AAA / Battery pack          | 2 (tùy chọn)  | Để chạy không dây / For wireless operation   |
| 6   | Trình duyệt web / Browser       | —              | Chrome hoặc Edge để dùng MakeCode / Chrome or Edge for MakeCode |

> **Lưu ý / Note:** Khoảng cách truyền tín hiệu radio của micro:bit tối đa khoảng **70 mét** trong điều kiện lý tưởng (không vật cản).  
> *The micro:bit radio transmission range is up to approximately **70 metres** under ideal (unobstructed) conditions.*

---

## 3. LÝ THUYẾT / THEORY

### 3.1 Sóng Radio / Radio Waves Basics

**[VN]** Sóng radio là một dạng sóng điện từ với tần số nằm trong khoảng từ 3 Hz đến 300 GHz. Chúng được sử dụng rộng rãi trong truyền thông không dây: Wifi, Bluetooth, điện thoại di động, và cả micro:bit.

Micro:bit sử dụng chip **Nordic nRF51822** (v1) hoặc **nRF52833** (v2), hoạt động ở băng tần **2.4 GHz** – cùng dải tần với Bluetooth và WiFi. Module radio này cho phép micro:bit:
- Gửi dữ liệu (văn bản, số, chuỗi bytes) đến các micro:bit khác.
- Nhận dữ liệu từ các micro:bit trong cùng nhóm/kênh.
- Không cần bất kỳ thiết bị trung gian nào (router, server…).

**[EN]** Radio waves are a form of electromagnetic radiation with frequencies ranging from 3 Hz to 300 GHz. They are widely used in wireless communications: WiFi, Bluetooth, mobile phones, and the micro:bit itself.

The micro:bit uses a **Nordic nRF51822** (v1) or **nRF52833** (v2) chip, operating in the **2.4 GHz** band — the same range as Bluetooth and WiFi. This radio module allows the micro:bit to:
- Transmit data (text, numbers, byte strings) to other micro:bits.
- Receive data from micro:bits in the same group/channel.
- Operate without any intermediate devices (router, server, etc.).

---

### 3.2 Kênh Radio (0–255) / Radio Channels (0–255)

**[VN]** Micro:bit chia băng tần 2.4 GHz thành **83 kênh** (channel 0–82), mặc dù API cho phép đặt từ 0–255. Mỗi kênh sử dụng một tần số con khác nhau:

```
Tần số = 2400 + channel (MHz)
Ví dụ: channel 7 → 2407 MHz
```

- Hai micro:bit **phải cùng kênh** mới giao tiếp được với nhau.
- Dùng kênh khác nhau để tạo nhiều nhóm độc lập trong cùng phòng.
- Kênh mặc định là **7**.

**[EN]** The micro:bit divides the 2.4 GHz band into **83 channels** (channels 0–82), though the API allows values from 0–255. Each channel uses a different sub-frequency:

```
Frequency = 2400 + channel (MHz)
Example: channel 7 → 2407 MHz
```

- Two micro:bits **must share the same channel** to communicate.
- Use different channels to create multiple independent groups in the same room.
- The default channel is **7**.

---

### 3.3 Gói Tin (Packet) / Packets

**[VN]** Dữ liệu radio được gửi dưới dạng **gói tin (packet)**. Mỗi gói tin gồm:

| Trường / Field      | Kích thước / Size | Nội dung / Content                       |
|---------------------|-------------------|------------------------------------------|
| Preamble            | 1 byte            | Đánh dấu bắt đầu / Start marker         |
| Access Address      | 4 bytes           | Địa chỉ nhóm / Group address             |
| Length              | 1 byte            | Độ dài payload / Payload length          |
| Payload             | tối đa 32 bytes   | Dữ liệu thực / Actual data               |
| CRC                 | 3 bytes           | Kiểm tra lỗi / Error check               |

- Kích thước payload tối đa mặc định: **32 bytes**.
- Có thể tăng lên đến **251 bytes** bằng `radio.config(length=251)`.
- Nếu gói tin bị lỗi CRC, nó sẽ bị **hủy tự động** (tránh dữ liệu nhiễu).

**[EN]** Radio data is sent as **packets**. Each packet consists of:

| Field               | Size              | Content                                  |
|---------------------|-------------------|------------------------------------------|
| Preamble            | 1 byte            | Start marker                             |
| Access Address      | 4 bytes           | Group address                            |
| Length              | 1 byte            | Payload length                           |
| Payload             | up to 32 bytes    | Actual data                              |
| CRC                 | 3 bytes           | Error check                              |

- Default maximum payload size: **32 bytes**.
- Can be increased to **251 bytes** using `radio.config(length=251)`.
- If a packet fails the CRC check, it is **automatically discarded** (prevents corrupted data).

---

### 3.4 Phát (Broadcast) và Nhận (Receive) / Broadcast and Receive

**[VN]** Micro:bit sử dụng mô hình **broadcast** (phát đại trà):
- Một micro:bit gửi → **tất cả** micro:bit trong cùng kênh đều nhận.
- Không có cơ chế "gửi riêng tư" mặc định (phải tự mã hóa để bảo mật).
- Mỗi micro:bit có **buffer nhận** (hàng đợi) để lưu tạm các gói tin chưa đọc.
- `radio.receive()` trả về `None` nếu không có tin nhắn mới.

**[EN]** The micro:bit uses a **broadcast** model:
- One micro:bit sends → **all** micro:bits on the same channel receive.
- There is no built-in "private send" mechanism (you must implement your own encryption for privacy).
- Each micro:bit has a **receive buffer** (queue) to hold unread packets.
- `radio.receive()` returns `None` if there are no new messages.

**Sơ đồ phát sóng / Broadcast diagram:**
```
  [Micro:bit A] ──── phát / broadcast ────▶ [Micro:bit B]
       ▲                                          │
       │                                          │
       └──────────── nhận / receive ──────────────┘
```

---

### 3.5 Cường Độ Tín Hiệu (RSSI) / Signal Strength (RSSI)

**[VN]** RSSI (**Received Signal Strength Indicator**) là đơn vị đo cường độ tín hiệu nhận được, tính bằng **dBm (decibel-milliwatt)**:
- Giá trị càng **âm ít** (gần 0) → tín hiệu càng **mạnh** (ví dụ: -40 dBm).
- Giá trị càng **âm nhiều** (xa 0) → tín hiệu càng **yếu** (ví dụ: -90 dBm).
- Ngưỡng không nhận được: thường dưới **-100 dBm**.

Trong MicroPython:
```python
details = radio.receive_full()
# details = (message_bytes, rssi, timestamp)
rssi = details[1]   # Ví dụ: -55 (dBm)
```

**[EN]** RSSI (**Received Signal Strength Indicator**) measures the power level of the received signal in **dBm (decibel-milliwatt)**:
- Values **closer to 0** → **stronger** signal (e.g., -40 dBm).
- Values **farther from 0** (more negative) → **weaker** signal (e.g., -90 dBm).
- Typical reception threshold: below **-100 dBm**.

In MicroPython:
```python
details = radio.receive_full()
# details = (message_bytes, rssi, timestamp)
rssi = details[1]   # Example: -55 (dBm)
```

---

### 3.6 Mã Hóa Đơn Giản / Simple Encryption

**[VN]** Vì radio dùng mô hình broadcast, bất kỳ micro:bit nào cùng kênh đều có thể đọc tin nhắn. Để bảo mật cơ bản, ta dùng **mã hóa Caesar**:
- Dịch chuyển mỗi ký tự trong bảng chữ cái theo một số vị trí cố định (khóa/key).
- Người nhận cần biết khóa để giải mã.
- Đây là mã hóa đối xứng đơn giản nhất.

Ví dụ với key = 3:
```
Bản rõ:  H  E  L  L  O
Mã hóa:  K  H  O  O  R
```

**[EN]** Since radio uses a broadcast model, any micro:bit on the same channel can read messages. For basic security, we use **Caesar cipher encryption**:
- Shift each character in the alphabet by a fixed number of positions (the key).
- The receiver needs to know the key to decrypt.
- This is the simplest symmetric encryption scheme.

Example with key = 3:
```
Plaintext:  H  E  L  L  O
Encrypted:  K  H  O  O  R
```

---

## 4. THỰC HÀNH / HANDS-ON PRACTICE

> **Chuẩn bị / Preparation:**  
> Kết nối **micro:bit A** vào máy tính 1 (hoặc cổng USB bên trái của hub).  
> Kết nối **micro:bit B** vào máy tính 2 (hoặc cổng USB bên phải của hub).  
> Mở hai tab MakeCode riêng biệt cho mỗi micro:bit.  
>  
> *Connect **micro:bit A** to computer 1 (or left USB port of hub).*  
> *Connect **micro:bit B** to computer 2 (or right USB port of hub).*  
> *Open two separate MakeCode tabs for each micro:bit.*

---

### Bước 1: Cấu Hình Kênh Radio / Step 1: Configure Radio Channel

**Mục tiêu / Goal:** Bật radio và đặt cùng kênh cho cả hai micro:bit.  
*Turn on radio and set the same channel on both micro:bits.*

**[VN]** Trước khi gửi bất kỳ dữ liệu nào, bạn phải:
1. Bật radio bằng `radio.on()`.
2. Chọn kênh (0–255) bằng `radio.config(channel=...)`.
3. Đặt công suất phát (0–7) bằng `radio.config(power=...)`.
4. Đặt độ dài tối đa của payload bằng `radio.config(length=...)`.

**[EN]** Before sending any data, you must:
1. Turn on radio with `radio.on()`.
2. Choose a channel (0–255) with `radio.config(channel=...)`.
3. Set transmit power (0–7) with `radio.config(power=...)`.
4. Set maximum payload length with `radio.config(length=...)`.

**Code (cả hai micro:bit / both micro:bits):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

display.show(Image.YES)
sleep(1000)
display.clear()
```

**Kiểm tra / Check:** Cả hai micro:bit hiển thị dấu ✓ → cấu hình thành công.  
*Both micro:bits show ✓ → configuration successful.*

---

### Bước 2: Gửi Tin Nhắn Khi Nhấn Nút / Step 2: Send a Message on Button Press

**Mục tiêu / Goal:** Nhấn nút A trên micro:bit A để gửi chuỗi "HELLO".  
*Press button A on micro:bit A to send the string "HELLO".*

**Code – Micro:bit A (người gửi / sender):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

while True:
    if button_a.was_pressed():
        radio.send("HELLO")
        display.show(Image.ARROW_E)   # Hiển thị mũi tên gửi / Show send arrow
        sleep(500)
        display.clear()
    sleep(10)
```

**Giải thích / Explanation:**
- `radio.send(string)` → gửi chuỗi văn bản / sends a text string.
- `Image.ARROW_E` → biểu tượng mũi tên sang phải (phương Đông) / right-pointing arrow icon.
- `sleep(10)` ở cuối vòng lặp giúp tránh chiếm hết CPU / prevents CPU hogging.

---

### Bước 3: Nhận và Hiển Thị Tin Nhắn / Step 3: Receive and Display Message

**Mục tiêu / Goal:** Micro:bit B nhận tin nhắn từ A và cuộn hiển thị trên màn hình.  
*Micro:bit B receives the message from A and scrolls it on the display.*

**Code – Micro:bit B (người nhận / receiver):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

while True:
    message = radio.receive()
    if message:
        display.scroll(message, delay=80)
    sleep(10)
```

**Giải thích / Explanation:**
- `radio.receive()` → trả về chuỗi nhận được, hoặc `None` nếu chưa có tin / returns received string, or `None` if empty.
- `display.scroll(message, delay=80)` → cuộn văn bản với tốc độ 80ms/ký tự / scrolls text at 80ms/char speed.
- Nên đặt `delay` từ 60–120ms để dễ đọc / Set `delay` 60–120ms for readability.

**Thử nghiệm / Test:** Nhấn A trên micro:bit A → xem "HELLO" chạy trên micro:bit B.  
*Press A on micro:bit A → watch "HELLO" scroll on micro:bit B.*

---

### Bước 4: Bộ Đàm Hai Chiều / Step 4: Two-Way Walkie-Talkie

**Mục tiêu / Goal:** Cả hai micro:bit vừa gửi vừa nhận – đây là bộ đàm thực sự!  
*Both micro:bits can both send and receive — this is a true walkie-talkie!*

**[VN]** Bây giờ ta nạp **cùng một chương trình** cho cả hai micro:bit:
- Nút A: gửi tin nhắn "XIN CHAO"
- Nút B: gửi tin nhắn "TAM BIET"
- Tự động nhận và hiển thị tin nhắn từ phía kia

**[EN]** Now we flash the **same program** on both micro:bits:
- Button A: sends "XIN CHAO"
- Button B: sends "TAM BIET"
- Automatically receives and displays messages from the other side

**Code (cả hai micro:bit / both micro:bits):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

while True:
    # Gửi / Send
    if button_a.was_pressed():
        radio.send("XIN CHAO")
        display.show(Image.ARROW_E)
        sleep(300)
        display.clear()

    if button_b.was_pressed():
        radio.send("TAM BIET")
        display.show(Image.ARROW_E)
        sleep(300)
        display.clear()

    # Nhận / Receive
    message = radio.receive()
    if message:
        display.scroll(">> " + message, delay=80)

    sleep(10)
```

**Quan sát / Observe:**
- Nhấn A trên micro:bit A → micro:bit B hiển thị ">> XIN CHAO"
- Nhấn B trên micro:bit B → micro:bit A hiển thị ">> TAM BIET"
- *Press A on micro:bit A → micro:bit B shows ">> XIN CHAO"*
- *Press B on micro:bit B → micro:bit A shows ">> TAM BIET"*

---

### Bước 5: Danh Sách Câu Trả Lời Nhanh / Step 5: Quick Reply List

**Mục tiêu / Goal:** Chọn tin nhắn từ danh sách bằng nút A, gửi bằng nút B.  
*Select a message from a list with button A, send it with button B.*

**Code (cả hai micro:bit / both micro:bits):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

# Danh sách tin nhắn nhanh / Quick reply messages
replies = ['XIN CHAO!', 'OK!', 'CHO TOI!', 'KHONG!']
reply_index = 0

while True:
    # Chọn tin nhắn / Select message
    if button_a.was_pressed():
        reply_index = (reply_index + 1) % len(replies)
        display.scroll(str(reply_index), delay=50)

    # Gửi tin nhắn / Send message
    if button_b.was_pressed():
        radio.send(replies[reply_index])
        display.show(Image.YES)
        sleep(500)
        display.clear()

    # Nhận tin nhắn / Receive message
    message = radio.receive()
    if message:
        display.scroll('>> ' + message, delay=80)

    sleep(10)
```

**Cách dùng / How to use:**
| Thao tác / Action          | Kết quả / Result                              |
|----------------------------|-----------------------------------------------|
| Nhấn A 1 lần / Press A ×1 | Chuyển sang tin nhắn 1: "OK!" / Switch to msg 1 |
| Nhấn A 2 lần / Press A ×2 | Chuyển sang tin nhắn 2: "CHO TOI!" / Switch to msg 2 |
| Nhấn A 3 lần / Press A ×3 | Chuyển sang tin nhắn 3: "KHONG!" / Switch to msg 3 |
| Nhấn A 4 lần / Press A ×4 | Quay về tin nhắn 0: "XIN CHAO!" / Back to msg 0 |
| Nhấn B / Press B           | Gửi tin nhắn hiện tại / Send current message  |

---

### Bước 6: Hiển Thị Cường Độ Tín Hiệu / Step 6: Display Signal Strength (RSSI)

**Mục tiêu / Goal:** Đọc RSSI và hiển thị số thanh tín hiệu trên LED matrix.  
*Read RSSI and display signal bar count on the LED matrix.*

**Code (cả hai micro:bit / both micro:bits):**
```python
from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

# Chuyển RSSI sang số thanh (0–5) / Map RSSI to bars (0–5)
def rssi_to_bars(rssi):
    if rssi >= -50:
        return 5
    elif rssi >= -60:
        return 4
    elif rssi >= -70:
        return 3
    elif rssi >= -80:
        return 2
    elif rssi >= -90:
        return 1
    else:
        return 0

def show_signal_bars(bars):
    img = Image('00000:'
                '00000:'
                '00000:'
                '00000:'
                '00000:')
    col_brightness = 9
    for col in range(bars):
        for row in range(4, 4 - min(col + 1, 5), -1):
            img.set_pixel(col, row, col_brightness)
    display.show(img)

replies = ['XIN CHAO!', 'OK!', 'CHO TOI!', 'KHONG!']
reply_index = 0

while True:
    if button_a.was_pressed():
        reply_index = (reply_index + 1) % len(replies)
        display.scroll(str(reply_index), delay=50)

    if button_b.was_pressed():
        radio.send(replies[reply_index])
        display.show(Image.YES)
        sleep(500)
        display.clear()

    # Nhận có RSSI / Receive with RSSI
    details = radio.receive_full()
    if details:
        msg_bytes, rssi, timestamp = details
        try:
            message = msg_bytes.decode('utf-8')
        except:
            message = str(msg_bytes)
        bars = rssi_to_bars(rssi)
        show_signal_bars(bars)
        sleep(1000)
        display.scroll('>> ' + message, delay=80)
        display.scroll('RSSI:' + str(rssi), delay=60)

    sleep(10)
```

**Giải thích / Explanation:**
- `radio.receive_full()` → trả về tuple `(data_bytes, rssi_int, timestamp_int)` thay vì chỉ chuỗi.  
  *Returns a tuple `(data_bytes, rssi_int, timestamp_int)` instead of just a string.*
- RSSI thường từ **-40 đến -100 dBm**. Càng gần 0 càng tốt.  
  *RSSI is typically from -40 to -100 dBm. Closer to 0 means better signal.*
- Hàm `show_signal_bars()` tạo biểu đồ thanh tín hiệu trực quan.  
  *The `show_signal_bars()` function creates a visual signal bar chart.*

---

## 5. CHƯƠNG TRÌNH HOÀN CHỈNH / FULL MICROPYTHON PROGRAM

Dưới đây là chương trình đầy đủ cho cả hai micro:bit (code chung):  
*Below is the complete program for both micro:bits (shared code):*

```python
# ============================================================
# BÀI 23: RADIO – BỘ ĐÀM / LESSON 23: RADIO – WALKIE-TALKIE
# micro:bit MicroPython – Nạp cho cả A và B / Flash on both A & B
# ============================================================

from microbit import *
import radio

# --- CẤU HÌNH RADIO / RADIO SETUP ---
radio.on()
radio.config(channel=7, power=7, length=32)

# --- DANH SÁCH TIN NHẮN / MESSAGE LIST ---
replies = ['XIN CHAO!', 'OK!', 'CHO TOI!', 'KHONG!']
reply_index = 0

# --- HIỂN THỊ KHỞI ĐỘNG / STARTUP DISPLAY ---
display.scroll('R-23', delay=60)
display.show(Image.YES)
sleep(500)
display.clear()

# ============================================================
# VÒNG LẶP CHÍNH / MAIN LOOP
# ============================================================
while True:
    # --- CHỌN TIN NHẮN / SELECT MESSAGE (Button A) ---
    if button_a.was_pressed():
        reply_index = (reply_index + 1) % len(replies)
        display.scroll(str(reply_index), delay=50)

    # --- GỬI TIN NHẮN / SEND MESSAGE (Button B) ---
    if button_b.was_pressed():
        radio.send(replies[reply_index])
        display.show(Image.ARROW_E)
        sleep(500)
        display.clear()

    # --- NHẬN TIN NHẮN / RECEIVE MESSAGE ---
    message = radio.receive()
    if message:
        display.scroll('>> ' + message, delay=80)

    sleep(10)
```

---

## 6. HƯỚNG DẪN MAKECODE / MAKECODE GUIDE

**[VN]** Để lập trình bằng MakeCode (kéo thả khối lệnh):

### Khởi tạo / Setup (On Start block):
1. Vào tab **Radio** → Kéo khối `radio set group [7]` vào **on start**.
2. (Nâng cao) Vào **Radio** → More → `radio set transmit power [7]`.
3. Khởi tạo biến `replies` là mảng: `["XIN CHAO!", "OK!", "CHO TOI!", "KHONG!"]`.
4. Khởi tạo biến `replyIndex` = 0.

### Chọn tin nhắn / Select message (on button A pressed):
1. Khối `set replyIndex to` → `(replyIndex + 1) mod (length of replies)`.
2. Khối `show number replyIndex`.

### Gửi tin nhắn / Send message (on button B pressed):
1. Khối **Radio** → `radio send string` → `replies[replyIndex]`.
2. Khối `show leds` → vẽ biểu tượng gửi (mũi tên sang phải).
3. Khối `pause (ms) 500` → `clear screen`.

### Nhận tin nhắn / Receive message (on radio received receivedString):
1. Kéo khối **Radio** → `on radio received [receivedString]`.
2. Bên trong: `show string ">>" + receivedString`.

**[EN]** To program with MakeCode (block-based):

1. Go to the **Radio** tab → Drag `radio set group [7]` into **on start**.
2. (Advanced) Go to **Radio** → More → `radio set transmit power [7]`.
3. Initialize variable `replies` as array: `["XIN CHAO!", "OK!", "CHO TOI!", "KHONG!"]`.
4. Initialize variable `replyIndex` = 0.
5. In **on button A pressed**: cycle `replyIndex` and show it.
6. In **on button B pressed**: `radio send string replies[replyIndex]`, then show arrow icon.
7. In **on radio received [receivedString]**: `show string ">>" + receivedString`.

> **Lưu ý MakeCode / MakeCode Note:** Trong MakeCode, `radio set group` dùng số **0–255** (tương đương `channel` trong Python). Đảm bảo cả hai micro:bit có **cùng group number**.  
> *In MakeCode, `radio set group` uses numbers **0–255** (equivalent to `channel` in Python). Ensure both micro:bits have the **same group number**.*

---

## 7. MỞ RỘNG: RADIO CÓ MÃ HÓA / EXTENSION: ENCRYPTED RADIO

### Caesar Cipher – Mã hóa & Giải mã / Encryption & Decryption

**[VN]** Mã Caesar dịch chuyển mỗi chữ cái theo một số bước nhất định. Chỉ những người biết **khóa (key)** mới giải mã được.

**[EN]** The Caesar cipher shifts each letter by a fixed number of steps. Only those who know the **key** can decrypt it.

```python
# ============================================================
# BÀI 23 MỞ RỘNG: RADIO + MÃ HÓA CAESAR
# LESSON 23 EXTENSION: RADIO + CAESAR CIPHER ENCRYPTION
# Nạp cho cả A và B – Flash on both A & B
# ============================================================

from microbit import *
import radio

radio.on()
radio.config(channel=7, power=7, length=32)

KEY = 3  # Khóa mã hóa / Encryption key – phải giống nhau cả hai bên

# --- HÀM MÃ HÓA / ENCRYPT FUNCTION ---
def caesar_encrypt(text, key):
    result = ''
    for char in text.upper():
        if 'A' <= char <= 'Z':
            shifted = chr((ord(char) - ord('A') + key) % 26 + ord('A'))
            result += shifted
        else:
            result += char
    return result

# --- HÀM GIẢI MÃ / DECRYPT FUNCTION ---
def caesar_decrypt(text, key):
    return caesar_encrypt(text, 26 - key)

# --- TIN NHẮN / MESSAGES ---
replies = ['XIN CHAO', 'OK', 'CHO TOI', 'KHONG']
reply_index = 0

display.scroll('SECURE', delay=60)
display.clear()

while True:
    if button_a.was_pressed():
        reply_index = (reply_index + 1) % len(replies)
        display.scroll(str(reply_index), delay=50)

    if button_b.was_pressed():
        original = replies[reply_index]
        encrypted = caesar_encrypt(original, KEY)
        radio.send(encrypted)
        display.scroll('ENC:' + encrypted, delay=60)
        sleep(500)
        display.clear()

    message = radio.receive()
    if message:
        decrypted = caesar_decrypt(message, KEY)
        display.scroll('DEC:' + decrypted, delay=80)

    sleep(10)
```

**Ví dụ hoạt động / Working Example:**

| Gửi (A) / Send (A)        | Truyền qua radio / Over radio | Nhận & giải mã (B) / Receive & decrypt (B) |
|---------------------------|-------------------------------|---------------------------------------------|
| `XIN CHAO`                | `AKQ FKDR`                    | `XIN CHAO`                                  |
| `OK`                       | `RN`                          | `OK`                                        |
| `KHONG`                    | `NKRQJ`                       | `KHONG`                                     |

> **Thách thức / Challenge:** Thử dùng key = 13 (ROT13 – một dạng Caesar đặc biệt).  
> *Try using key = 13 (ROT13 – a special case of Caesar cipher).*

---

## 8. CÂU HỎI THẢO LUẬN / DISCUSSION QUESTIONS

1. **[VN]** Tại sao hai micro:bit phải dùng **cùng kênh (channel)** mới giao tiếp được? Điều gì xảy ra nếu chúng dùng kênh khác nhau?  
   **[EN]** Why must two micro:bits use the **same channel** to communicate? What happens if they use different channels?

2. **[VN]** So sánh mô hình **broadcast** của radio micro:bit với mô hình **unicast** (gửi riêng) của email. Ưu và nhược điểm của mỗi loại là gì?  
   **[EN]** Compare the **broadcast** model of micro:bit radio with the **unicast** model of email. What are the advantages and disadvantages of each?

3. **[VN]** RSSI = -45 dBm và RSSI = -85 dBm – tín hiệu nào mạnh hơn? Khoảng cách nào ước tính xa hơn? Tại sao?  
   **[EN]** RSSI = -45 dBm vs RSSI = -85 dBm — which is stronger? Which likely implies greater distance? Why?

4. **[VN]** Mã hóa Caesar có an toàn không trong thực tế? Kẻ tấn công cần thử bao nhiêu khóa để phá mã? Có cách nào phá mà không cần thử từng khóa không?  
   **[EN]** Is Caesar cipher actually secure in practice? How many keys does an attacker need to try to crack it? Is there a method to break it without brute-forcing every key?

5. **[VN]** Nếu trong phòng học có 10 nhóm đều dùng kênh 7, điều gì có thể xảy ra? Làm thế nào để giải quyết xung đột kênh (channel conflict)?  
   **[EN]** If 10 groups in the classroom all use channel 7, what might happen? How would you resolve channel conflicts?

---

## 9. BÀI TẬP VỀ NHÀ / HOMEWORK

### Bài tập cơ bản / Basic Assignment:
**[VN]** Mở rộng danh sách `replies` thành **8 tin nhắn** gồm cả tiếng Việt có dấu (dùng ký tự ASCII). Ghi lại video ngắn (10–15 giây) quá trình gửi và nhận giữa hai micro:bit.  
**[EN]** Extend the `replies` list to **8 messages** including messages in simplified Vietnamese (ASCII characters). Record a short video (10–15 seconds) of the sending and receiving process between two micro:bits.

### Bài tập nâng cao / Advanced Assignment:
**[VN]** Thiết kế hệ thống **báo động khoảng cách** (proximity alert): Nếu RSSI > -50 dBm (gần nhau), micro:bit phát âm thanh cảnh báo bằng pin speaker (v2) hoặc hiển thị cảnh báo đỏ. Nếu RSSI < -80 dBm (xa nhau), hiển thị thông báo "QUAT XA". Viết báo cáo (tối thiểu 200 từ) giải thích thiết kế và kết quả thực nghiệm.  
**[EN]** Design a **proximity alert** system: If RSSI > -50 dBm (close), the micro:bit plays a warning sound via speaker pin (v2) or shows a warning animation. If RSSI < -80 dBm (far), display "FAR AWAY". Write a report (minimum 200 words) explaining your design and experimental results.

### Bài tập sáng tạo / Creative Assignment:
**[VN]** Tạo trò chơi **"Trốn tìm Radio"**: Một micro:bit là "kẻ trốn" gửi tín hiệu RSSI liên tục, micro:bit kia là "kẻ tìm" hiển thị số thanh tín hiệu như la bàn. Người tìm phải tìm người trốn chỉ dựa vào cường độ tín hiệu!  
**[EN]** Create a **"Radio Hide-and-Seek"** game: One micro:bit is the "hider" broadcasting RSSI pings continuously, the other is the "seeker" displaying signal bars like a compass. The seeker must find the hider using only signal strength!

---

## 10. BẢNG ĐÁNH GIÁ / ASSESSMENT RUBRIC

| Tiêu chí / Criterion                                     | Xuất sắc (4) / Excellent (4)                                                 | Đạt (3) / Proficient (3)                                       | Cần cải thiện (2) / Developing (2)                              | Chưa đạt (1) / Beginning (1)                              |
|----------------------------------------------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------|------------------------------------------------------------------|-----------------------------------------------------------|
| **Kiến thức lý thuyết / Theory Knowledge**               | Giải thích đầy đủ sóng radio, kênh, gói tin, RSSI với ví dụ cụ thể / Fully explains radio waves, channels, packets, RSSI with examples | Giải thích được 3/4 khái niệm / Explains 3 of 4 concepts       | Giải thích được 1–2 khái niệm / Explains 1–2 concepts           | Không giải thích được / Cannot explain                    |
| **Cấu hình & Kết nối / Setup & Connection**              | Cấu hình đúng cả 2 micro:bit, cùng kênh, không lỗi / Both micro:bits correctly configured, same channel, no errors | Cấu hình đúng sau 1–2 lần thử / Correct after 1–2 attempts    | Cần hỗ trợ để cấu hình / Needs assistance to configure          | Không kết nối được / Cannot establish connection          |
| **Lập trình bộ đàm / Walkie-Talkie Programming**         | Code sạch, có chú thích, gửi/nhận ổn định, danh sách tin nhắn hoạt động / Clean commented code, stable send/receive, reply list works | Code hoạt động đúng nhưng thiếu chú thích / Works correctly but lacks comments | Code gửi hoặc nhận được, không hoàn chỉnh / Sends or receives, incomplete | Code không hoạt động / Code does not work                |
| **RSSI & Tín hiệu / RSSI & Signal**                      | Đọc và hiển thị RSSI chính xác, biểu đồ thanh hoạt động, giải thích ý nghĩa / Accurately reads/displays RSSI, bar chart works, explains meaning | Đọc RSSI đúng, hiển thị số / Correctly reads RSSI, displays number | Cố gắng đọc RSSI nhưng có lỗi / Attempts to read RSSI with errors | Không thực hiện được / Did not attempt                   |
| **Mã hóa / Encryption**                                  | Cài đặt Caesar cipher đúng, mã hóa và giải mã ổn định, giải thích logic / Correct Caesar cipher, stable enc/dec, explains logic | Mã hóa hoặc giải mã đúng một chiều / One-way enc or dec works  | Thử cài đặt nhưng có lỗi / Attempts implementation with bugs    | Không thực hiện được / Did not attempt                   |
| **Giải quyết vấn đề / Problem Solving**                  | Tự phát hiện và sửa lỗi, ghi chép quá trình debug / Self-identifies and fixes bugs, documents debug process | Sửa lỗi với một ít gợi ý / Fixes bugs with minimal hints       | Cần nhiều hỗ trợ để sửa lỗi / Needs significant help debugging  | Không sửa được lỗi / Cannot resolve bugs                 |
| **Thuyết trình / Presentation**                          | Giải thích rõ ràng, demo thuyết phục, trả lời câu hỏi tốt / Clear explanation, convincing demo, answers questions well | Trình bày đủ ý, demo hoạt động / Covers key points, working demo | Trình bày còn thiếu sót, demo chưa ổn định / Incomplete, unstable demo | Không thuyết trình được / Cannot present                 |

**Thang điểm / Scoring:**
- 25–28 điểm: **Xuất sắc / Excellent** ⭐⭐⭐⭐⭐
- 19–24 điểm: **Giỏi / Good** ⭐⭐⭐⭐
- 13–18 điểm: **Khá / Satisfactory** ⭐⭐⭐
- 7–12 điểm: **Cần cố gắng thêm / Needs Improvement** ⭐⭐
- ≤ 6 điểm: **Cần bổ sung kiến thức / Insufficient** ⭐

---

## 11. GHI CHÚ GIÁO VIÊN / TEACHER'S NOTES

### Quản lý kênh trong lớp học / Classroom Channel Management

**[VN]** Nếu lớp học có nhiều nhóm, hãy phân công kênh theo bảng sau để tránh nhiễu:

| Nhóm / Group | Kênh / Channel | Tần số / Frequency |
|--------------|----------------|--------------------|
| Nhóm 1       | 10             | 2410 MHz           |
| Nhóm 2       | 20             | 2420 MHz           |
| Nhóm 3       | 30             | 2430 MHz           |
| Nhóm 4       | 40             | 2440 MHz           |
| Nhóm 5       | 50             | 2450 MHz           |
| Nhóm 6       | 60             | 2460 MHz           |
| Nhóm 7       | 70             | 2470 MHz           |
| Nhóm 8       | 80             | 2480 MHz           |

**[EN]** If the classroom has multiple groups, assign channels using the table above to avoid interference.

### Lỗi thường gặp / Common Errors

| Lỗi / Error                          | Nguyên nhân / Cause                          | Giải pháp / Solution                           |
|--------------------------------------|----------------------------------------------|------------------------------------------------|
| Không nhận được tin nhắn / No receive | Khác kênh / Different channels               | Đặt cùng channel= / Set same channel=          |
| Tin nhắn bị cắt / Message truncated  | Vượt quá length=32 / Exceeds length=32       | Tăng length= hoặc rút ngắn tin / Increase length or shorten message |
| Nhận tin của nhóm khác / Cross-talk  | Cùng kênh với nhóm khác / Same channel as other group | Đổi channel= / Change channel=           |
| RSSI luôn là None / RSSI always None | Dùng receive() thay receive_full() / Using receive() instead of receive_full() | Dùng radio.receive_full() / Use radio.receive_full() |
| Chương trình treo / Program freezes  | Thiếu sleep() trong vòng lặp / Missing sleep() in loop | Thêm sleep(10) cuối while / Add sleep(10) at loop end |

---

## 12. LIÊN KẾT BÀI HỌC / LESSON CONNECTIONS

```
Bài 21: Bluetooth ──┐
                     ├──▶ Bài 23: Radio Walkie-Talkie ──▶ Bài 25: Mạng Lưới (Mesh)
Bài 22: LED Matrix ──┘                                      Lesson 25: Mesh Network
```

**Bài trước / Previous:** Bài 22 – Ma trận LED nâng cao / Lesson 22 – Advanced LED Matrix  
**Bài sau / Next:** Bài 24 – Cảm biến gia tốc & la bàn / Lesson 24 – Accelerometer & Compass  

---

## 13. TÀI NGUYÊN THAM KHẢO / REFERENCES

- [BBC micro:bit MicroPython Radio Documentation](https://microbit-micropython.readthedocs.io/en/v2-docs/radio.html)
- [MakeCode Radio Blocks Reference](https://makecode.microbit.org/reference/radio)
- [micro:bit Hardware: nRF52833 Datasheet](https://infocenter.nordicsemi.com/pdf/nRF52833_PS_v1.5.pdf)
- [Caesar Cipher – Wikipedia](https://en.wikipedia.org/wiki/Caesar_cipher)
- [RSSI Explained – Wi-Fi Alliance](https://www.wi-fi.org/)

---

*Tài liệu này được biên soạn cho chương trình STEM Sáng tạo với Micro:bit – Cấp độ Trung học.*  
*This document was compiled for the Creative STEM with Micro:bit curriculum – Secondary School Level.*

---

> **Phiên bản / Version:** 1.0  
> **Lần cập nhật cuối / Last Updated:** 2026-07-16  
> **Số dòng / Line count:** 350+  
> **Ngôn ngữ / Language:** Song ngữ Việt–Anh / Vietnamese–English bilingual
