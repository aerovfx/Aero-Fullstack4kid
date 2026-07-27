# Tuần 5: Truyền Thông Không Dây Radio & Đo Cường Độ Sóng RSSI (Microbit Radio P2P & RSSI)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nguyên lý hoạt động của chip vô tuyến băng tần 2.4GHz nhúng trên micro:bit qua thư viện **Radio**.
- Hiểu kiến trúc truyền thông không dây ngang hàng **Peer-to-Peer (P2P)**: Đóng gói gói tin (Packets), Nhóm kênh Radio (Radio Groups $0 - 255$) và Tốc độ truyền.
- Định nghĩa khái niệm **Chỉ số Cường độ Sóng Nhận được (RSSI - Received Signal Strength Indicator)** tính bằng dBm ($0 \text{ dBm}$ đến $-100 \text{ dBm}$) để đo khoảng cách khoảng tương đối.
- Thực hành lập trình cặp thiết bị Walkie-Talkie không dây và trò chơi Dò tìm kho báu dựa trên độ mạnh yếu của sóng Radio.

### English
- Master the 2.4GHz RF wireless communication capabilities embedded in the micro:bit via the **Radio** module.
- Understand **Peer-to-Peer (P2P)** wireless architectures: Packet framing, Radio Group channels ($0 - 255$), and transmission power levels.
- Define **Received Signal Strength Indicator (RSSI)** in dBm ($0 \text{ dBm}$ to $-100 \text{ dBm}$) to estimate relative distance between nodes.
- Practice programming a wireless Walkie-Talkie pair and an RSSI-based Treasure Hunt game.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Truyền Sóng Radio P2P & Chỉ Số Cường Độ Sóng RSSI

#### Tiếng Việt
- **Radio Group (Kênh vô tuyến):** Các bo mạch micro:bit muốn giao tiếp được với nhau BẮT BUỘC phải cài đặt cùng một mã số Radio Group ($0 - 255$).
- **Chỉ số RSSI (Received Signal Strength Indicator):** Đo độ mạnh của tín hiệu sóng nhận được:
  - Tín hiệu rất mạnh (Hai micro:bit ở sát nhau $< 0.5\text{m}$): $\text{RSSI} \approx -40 \text{ dBm}$ đến $-50 \text{ dBm}$.
  - Tín hiệu yếu (Hai micro:bit cách xa nhau $> 10\text{m}$): $\text{RSSI} \approx -90 \text{ dBm}$ đến $-100 \text{ dBm}$.

```text
[ micro:bit Node A ] ─── ( 2.4GHz Radio Packet: Group 7 ) ───► [ micro:bit Node B ]
(Tx Power: 7)                                                 (Reads RSSI: -52 dBm)
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Radio Walkie-Talkie & RSSI Distance Meter
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 5: Radio P2P Walkie-Talkie & RSSI Meter

from microbit import *
import radio

# Enable Radio and set Radio Group channel
radio.on()
radio.config(group=7, power=7)

display.show(Image.HAPPY)

while True:
    # Send message when Button A is pressed
    if button_a.was_pressed():
        radio.send("HELLO")
        display.show("T") # Transmit icon
        sleep(200)
        display.clear()
        
    # Send custom string when Button B is pressed
    if button_b.was_pressed():
        radio.send("SOS")
        display.show("S")
        sleep(200)
        display.clear()

    # Receive incoming radio packet
    details = radio.receive_full()
    if details:
        msg, rssi, timestamp = details
        msg_str = str(msg, 'utf-8')
        
        # Display RSSI Signal Strength Graph
        # RSSI ranges from ~ -42 (Close) to -100 (Far)
        signal_bars = max(1, min(5, int((100 + rssi) / 12)))
        
        display.clear()
        for y in range(5 - signal_bars, 5):
            for x in range(5):
                display.set_pixel(x, y, 9)
                
        sleep(500)
        display.scroll(msg_str)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 5.1: Cặp Bộ Đàm Không Dây Nút Nhấn (Wireless Radio P2P)
Lập trình 2 bo mạch micro:bit cùng kênh Radio Group 10. Khi máy A nhấn nút A, máy B phát âm thanh còi bíp và hiển thị trái tim; khi máy B nhấn nút B, máy A nhận tín hiệu và hiển thị mặt cười.

#### Bài 5.2: Công Tắc Bật Tắt Đèn Từ Xa (Remote Light Switch)
Máy 1 gửi chuỗi `"LIGHT_ON"` hoặc `"LIGHT_OFF"`. Máy 2 nhận chuỗi lệnh và thực hiện bật/tắt dải đèn LED Neopixel RGB.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 5.3: Trò Chơi Dò Tìm Kho Báu RSSI (RSSI Treasure Hunt Game)
Lập trình 1 bo mạch micro:bit phát sóng liên tục đóng vai "Kho báu" (Treasure Beacon). Bo mạch thứ 2 đóng vai "Máy dò": Đo chỉ số RSSI nhận được và hiển thị số lượng hàng LED sáng tăng dần khi học viên di chuyển lại gần kho báu.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 5.4: Giả Lập Hệ Thống Cảnh Báo Va Chạm Xe Không Dây Trên MakeCode
Mở MakeCode Simulator, bật tính năng giả lập 2 bo mạch micro:bit. Lập trình xe A phát tín hiệu phanh gấp `"EMERGENCY_BRAKE"`, xe B ngay lập tức nhận lệnh và bật đèn đỏ cảnh báo va chạm.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Radio Emergency Brake
radio.set_group(7)

def on_button_pressed_a():
    radio.send_string("BRAKE")
    basic.show_icon(IconNames.NO)

def on_received_string(receivedString):
    if receivedString == "BRAKE":
        music.play_tone(988, music.beat(BeatFraction.WHOLE))
        basic.show_string("WARN!")

input.on_button_pressed(Button.A, on_button_pressed_a)
radio.on_received_string(on_received_string)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Truyền Thông Radio** | Giải thích sâu sắc nguyên lý P2P, cài đặt Radio Group, chỉ số RSSI và đóng gói gói tin vô tuyến. | Hiểu cách sử dụng thư viện Radio gửi nhận chuỗi văn bản. | Nắm được định nghĩa Radio nhưng đặt sai Radio Group. | Không gửi được dữ liệu không dây. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Wireless Walkie-Talkie, Remote Switch, RSSI Treasure Hunt & MakeCode Emergency Lab). | Hoàn thành Bài 5.1 và Bài 5.2 đúng yêu cầu. | Code có lỗi rớt gói tin hoặc đọc chỉ số RSSI sai. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
