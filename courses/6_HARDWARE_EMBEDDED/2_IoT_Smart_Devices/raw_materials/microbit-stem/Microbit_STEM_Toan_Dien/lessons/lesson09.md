# BÀI 9: ĐÈN RGB – ĐÈN TRANG TRÍ
# LESSON 9: RGB LED – DECORATIVE LIGHTS

---

## 📋 THÔNG TIN BÀI HỌC / LESSON INFORMATION

| Mục / Item | Nội dung / Content |
|---|---|
| **Bài số / Lesson No.** | 9 |
| **Tiêu đề (VI)** | Đèn RGB – Đèn Trang Trí |
| **Title (EN)** | RGB LED – Decorative Lights |
| **Thời lượng / Duration** | 90 phút / 90 minutes |
| **Cấp độ / Level** | Trung cấp / Intermediate |
| **Giai đoạn / Phase** | Giai đoạn 2 – Cảm biến & Hiển thị / Phase 2 – Sensors & Display |

---

## 🎯 MỤC TIÊU BÀI HỌC / LEARNING OBJECTIVES

### Tiếng Việt
Sau khi hoàn thành bài học này, học sinh có thể:
1. Giải thích mô hình màu RGB và nguyên lý trộn màu cộng (additive color mixing).
2. Mô tả cách thức hoạt động của đèn NeoPixel (WS2812B) và giao thức dữ liệu của nó.
3. Lập trình micro:bit để điều khiển dải NeoPixel hiển thị màu sắc đơn lẻ và hiệu ứng cầu vồng.
4. Xây dựng chương trình trộn màu tương tác sử dụng các nút nhấn và cử chỉ lắc.
5. Tra cứu và sử dụng bảng mã màu Hex (#RRGGBB) trong lập trình.

### English
After completing this lesson, students will be able to:
1. Explain the RGB color model and the principle of additive color mixing.
2. Describe how NeoPixel (WS2812B) LEDs work and their data protocol.
3. Program a micro:bit to control a NeoPixel strip to display single colors and rainbow effects.
4. Build an interactive color mixer using buttons and shake gestures.
5. Look up and use Hex color codes (#RRGGBB) in programming.

---

## 🧰 VẬT LIỆU CẦN THIẾT / MATERIALS NEEDED

| Tên linh kiện (VI) | Component Name (EN) | Số lượng / Qty | Mô tả (VI) | Description (EN) |
|---|---|:---:|---|---|
| Bo mạch Micro:bit | Micro:bit board | 1 | Bộ vi điều khiển chính | Main microcontroller |
| Dải NeoPixel WS2812B | NeoPixel WS2812B strip | 1 | Dải 8 LED RGB có thể địa chỉ hóa | 8-LED addressable RGB strip |
| Cáp nối Crowtail | Crowtail connector cable | 1 | Cáp 4 chân kết nối linh kiện | 4-pin connector cable |
| Dây nối / Jumper wire | Jumper wire | 3 | Dây kết nối linh kiện | Component connection wires |
| Máy tính / Computer | Computer | 1 | Cài trình duyệt để lập trình | With browser for coding |
| Cáp Micro USB | Micro USB cable | 1 | Kết nối micro:bit với máy tính | Connect micro:bit to computer |
| Pin AA (tùy chọn) | AA batteries (optional) | 2 | Nguồn điện độc lập | Standalone power supply |

---

## 📚 PHẦN LÝ THUYẾT / THEORY SECTION

### 1. Mô Hình Màu RGB / The RGB Color Model

#### Tiếng Việt
**Mô hình màu RGB** dựa trên ba màu ánh sáng cơ bản: **Đỏ (Red)**, **Xanh lá (Green)** và **Xanh dương (Blue)**. Khác với trộn màu sơn (màu trừ), trộn màu ánh sáng là **trộn màu cộng (additive mixing)**:

- Đỏ + Xanh lá = **Vàng (Yellow)**
- Đỏ + Xanh dương = **Hồng/Magenta**
- Xanh lá + Xanh dương = **Lam/Cyan**
- Đỏ + Xanh lá + Xanh dương = **Trắng (White)**
- Không có màu nào = **Đen (Black / tắt)**

Mỗi kênh màu có giá trị từ **0 đến 255** (256 mức). Do đó tổng số màu có thể tạo ra là:
> 256 × 256 × 256 = **16.777.216 màu** (khoảng 16,7 triệu màu)

#### English
The **RGB color model** is based on three primary light colors: **Red**, **Green**, and **Blue**. Unlike paint mixing (subtractive), light mixing is **additive**:

- Red + Green = **Yellow**
- Red + Blue = **Magenta**
- Green + Blue = **Cyan**
- Red + Green + Blue = **White**
- No color = **Black (off)**

Each color channel has a value from **0 to 255** (256 levels). Therefore, the total number of colors is:
> 256 × 256 × 256 = **16,777,216 colors** (approximately 16.7 million colors)

---

### 2. Mã Màu Hex / Hex Color Codes

#### Tiếng Việt
**Mã màu Hex** là cách biểu diễn màu RGB bằng hệ thập lục phân (hexadecimal), định dạng: `#RRGGBB`.

- Mỗi cặp ký tự (RR, GG, BB) biểu diễn giá trị từ `00` đến `FF` (tức 0–255 trong hệ thập phân).
- Ví dụ: `#FF0000` = Đỏ thuần (R=255, G=0, B=0)
- Ví dụ: `#00FF00` = Xanh lá thuần (R=0, G=255, B=0)
- Ví dụ: `#FFFF00` = Vàng (R=255, G=255, B=0)

**Cách chuyển đổi:**
Hex `FF` = Thập phân `255` (vì F=15, FF = 15×16 + 15 = 255)
Hex `80` = Thập phân `128` (vì 8×16 + 0 = 128)

#### English
**Hex color codes** represent RGB colors in hexadecimal format: `#RRGGBB`.

- Each pair of characters (RR, GG, BB) represents a value from `00` to `FF` (i.e., 0–255 in decimal).
- Example: `#FF0000` = Pure Red (R=255, G=0, B=0)
- Example: `#00FF00` = Pure Green (R=0, G=255, B=0)
- Example: `#FFFF00` = Yellow (R=255, G=255, B=0)

**Conversion:**
Hex `FF` = Decimal `255` (because F=15, FF = 15×16 + 15 = 255)
Hex `80` = Decimal `128` (because 8×16 + 0 = 128)

---

### 3. NeoPixel / WS2812B – Đèn LED RGB Có Thể Địa Chỉ Hóa

#### Tiếng Việt
**NeoPixel** (hay **WS2812B**) là loại đèn LED RGB đặc biệt:

- **Có thể địa chỉ hóa (Addressable):** Mỗi LED có một địa chỉ riêng. Bộ vi điều khiển có thể bật/tắt hoặc đổi màu **từng LED riêng lẻ** mà chỉ dùng **một dây dữ liệu duy nhất**.
- **Nối tiếp (Daisy-chaining):** Các LED được nối liền nhau. Dữ liệu được truyền qua từng LED theo thứ tự từ đầu đến cuối dải.
- **Tích hợp IC điều khiển:** Mỗi LED có một vi chip nhỏ tích hợp bên trong, tự nhận và giải mã tín hiệu.
- **Giao thức 1 dây (Single-wire protocol):** Micro:bit chỉ cần kết nối **1 dây tín hiệu** để điều khiển toàn bộ dải LED.

**So sánh LED RGB đơn lẻ vs. NeoPixel:**

| Đặc điểm | LED RGB đơn lẻ | NeoPixel WS2812B |
|---|---|---|
| Số chân điều khiển | 3 (R, G, B) | 1 (DATA) |
| Số LED có thể điều khiển | 1 | Hàng trăm (cùng 1 dây) |
| Độ phức tạp | Thấp | Trung bình |
| Khả năng địa chỉ hóa | Không | Có |
| Ứng dụng | Hiển thị đơn giản | Dải đèn, hiệu ứng phức tạp |

#### English
**NeoPixel** (or **WS2812B**) is a special type of RGB LED:

- **Addressable:** Each LED has its own address. The microcontroller can turn on/off or change the color of **each LED individually** using only **a single data wire**.
- **Daisy-chaining:** LEDs are connected in series. Data is transmitted through each LED in order from the beginning to the end of the strip.
- **Integrated control IC:** Each LED has a tiny chip built inside that receives and decodes signals.
- **Single-wire protocol:** The micro:bit only needs **1 signal wire** to control the entire LED strip.

**Comparison: Single RGB LED vs. NeoPixel:**

| Feature | Single RGB LED | NeoPixel WS2812B |
|---|---|---|
| Control pins needed | 3 (R, G, B) | 1 (DATA) |
| Number of controllable LEDs | 1 | Hundreds (same wire) |
| Complexity | Low | Medium |
| Addressability | No | Yes |
| Application | Simple display | LED strips, complex effects |

---

### 4. Bánh Xe Màu Sắc / The Color Wheel

#### Tiếng Việt
**Bánh xe màu sắc (Color Wheel)** là một công cụ trực quan thể hiện mối quan hệ giữa các màu sắc:

- **Màu bổ sung (Complementary colors):** Hai màu nằm đối diện nhau trên bánh xe màu (ví dụ: Đỏ & Lam, Vàng & Tím). Khi đặt cạnh nhau, chúng tạo ra độ tương phản mạnh nhất.
- **Màu tương tự (Analogous colors):** Các màu nằm cạnh nhau (ví dụ: Đỏ, Cam, Vàng). Kết hợp chúng tạo cảm giác hài hòa.
- **Trong lập trình NeoPixel**, ta thường dùng giá trị **Hue (màu sắc, 0–359 độ)** để duyệt qua toàn bộ bánh xe màu một cách mượt mà.

#### English
The **Color Wheel** is a visual tool showing the relationships between colors:

- **Complementary colors:** Two colors opposite each other on the wheel (e.g., Red & Cyan, Yellow & Violet). They create the strongest contrast when placed together.
- **Analogous colors:** Colors next to each other (e.g., Red, Orange, Yellow). They create a harmonious feeling.
- **In NeoPixel programming**, we often use the **Hue value (0–359 degrees)** to smoothly cycle through the entire color wheel.

---

### 5. Cách Micro:bit Giao Tiếp với NeoPixel / How Micro:bit Communicates with NeoPixel

#### Tiếng Việt
Micro:bit giao tiếp với dải NeoPixel qua **giao thức tín hiệu 1 dây** tốc độ cao:

1. Micro:bit gửi một chuỗi xung điện (0 và 1) qua chân tín hiệu (thường là **P0, P1 hoặc P2**).
2. LED đầu tiên đọc **24 bit đầu tiên** (8 bit Đỏ + 8 bit Xanh lá + 8 bit Xanh dương) và lưu vào bộ nhớ.
3. Dữ liệu còn lại được chuyển tiếp đến LED tiếp theo, và cứ thế tiếp tục.
4. Sau khi tín hiệu "RESET" (khoảng thời gian im lặng >50µs), tất cả LED cùng hiển thị màu đã nhận.

#### English
The micro:bit communicates with the NeoPixel strip via a **high-speed single-wire signal protocol**:

1. The micro:bit sends a sequence of electrical pulses (0s and 1s) through the signal pin (usually **P0, P1, or P2**).
2. The first LED reads the **first 24 bits** (8 Red + 8 Green + 8 Blue) and stores them.
3. The remaining data is forwarded to the next LED, and so on.
4. After a "RESET" signal (a silence period of >50µs), all LEDs simultaneously display their received color.

---

## 💻 PHẦN THỰC HÀNH MAKECODE / MAKECODE PRACTICE SECTION

### Cài đặt Tiện ích Mở rộng NeoPixel / Adding the NeoPixel Extension

#### Tiếng Việt
Để sử dụng NeoPixel với MakeCode, bạn cần thêm tiện ích mở rộng:
1. Mở **makecode.microbit.org** trên trình duyệt.
2. Tạo dự án mới hoặc mở dự án hiện có.
3. Nhấn vào nút **"+ Extensions"** (Tiện ích mở rộng) ở cuối thanh công cụ bên trái.
4. Trong ô tìm kiếm, gõ **"neopixel"**.
5. Nhấn vào thẻ **NeoPixel** để cài đặt.
6. Một danh mục mới tên **"NeoPixel"** (màu xanh lá) sẽ xuất hiện trong thanh công cụ.

#### English
To use NeoPixels with MakeCode, you need to add the extension:
1. Open **makecode.microbit.org** in your browser.
2. Create a new project or open an existing one.
3. Click the **"+ Extensions"** button at the bottom of the left toolbar.
4. In the search box, type **"neopixel"**.
5. Click the **NeoPixel** card to install it.
6. A new category called **"NeoPixel"** (green colored) will appear in the toolbar.

---

### Hoạt động 1: Hiển thị Màu Đơn / Activity 1: Single Color Display

**Mục tiêu (VI):** Lập trình micro:bit bật đèn toàn bộ dải NeoPixel với màu đỏ, xanh lá và xanh dương tuần tự.

**Objective (EN):** Program micro:bit to light the entire NeoPixel strip with red, green, and blue sequentially.

**Kết nối (VI) / Wiring (EN):**
- Dây dữ liệu NeoPixel (DATA) → Chân **P0** của micro:bit / NeoPixel data wire (DATA) → micro:bit pin **P0**
- Dây nguồn NeoPixel (VCC/+) → **3V** của micro:bit / NeoPixel power wire (VCC/+) → micro:bit **3V**
- Dây nối đất NeoPixel (GND/-) → **GND** của micro:bit / NeoPixel ground wire (GND/-) → micro:bit **GND**

**Mô tả khối lệnh MakeCode / MakeCode Block Description:**

```
[on start]
  set strip to NeoPixel at pin P0 with 8 leds as RGB (GRB format)
  set strip brightness to 100

[forever]
  strip show color red
  pause 1000ms

  strip show color green
  pause 1000ms

  strip show color blue
  pause 1000ms

  strip clear
  pause 500ms
```

**Giải thích (VI):**
- `NeoPixel at pin P0 with 8 leds`: Khởi tạo dải 8 LED kết nối tại chân P0.
- `strip brightness to 100`: Đặt độ sáng (0–255). Giá trị 100 là vừa phải để tiết kiệm điện.
- `strip show color red`: Bật toàn bộ dải thành màu đỏ.
- `pause 1000ms`: Dừng 1 giây trước khi đổi màu.
- `strip clear`: Tắt toàn bộ dải.

**Explanation (EN):**
- `NeoPixel at pin P0 with 8 leds`: Initialize an 8-LED strip connected at pin P0.
- `strip brightness to 100`: Set brightness (0–255). Value 100 is moderate to save power.
- `strip show color red`: Turn the entire strip red.
- `pause 1000ms`: Wait 1 second before changing color.
- `strip clear`: Turn off the entire strip.

---

### Hoạt động 2: Hiệu Ứng Cầu Vồng / Activity 2: Rainbow Cycle

**Mục tiêu (VI):** Tạo hiệu ứng cầu vồng chuyển động trên dải NeoPixel.

**Objective (EN):** Create a moving rainbow effect on the NeoPixel strip.

**Mô tả khối lệnh MakeCode / MakeCode Block Description:**

```
[on start]
  set strip to NeoPixel at pin P0 with 8 leds as RGB (GRB format)
  set strip brightness to 80

[forever]
  strip show rainbow from 1 to 360
  pause 100ms
  strip rotate pixels by 1
```

**Giải thích (VI):**
- `show rainbow from 1 to 360`: Hiển thị dải màu từ góc Hue 1° đến 360° trên tất cả LED.
- `rotate pixels by 1`: Xoay vòng màu sắc 1 vị trí, tạo hiệu ứng chuyển động.
- Lặp lại trong khối `forever` tạo ra hoạt ảnh cầu vồng liên tục.

**Explanation (EN):**
- `show rainbow from 1 to 360`: Display colors from Hue 1° to 360° across all LEDs.
- `rotate pixels by 1`: Rotate the color pattern by 1 position, creating a movement effect.
- Repeating in the `forever` block creates a continuous rainbow animation.

---

### Hoạt động 3: Trộn Màu Tương Tác / Activity 3: Interactive Color Mixer

**Mục tiêu (VI):** Dùng nút A để tăng kênh Đỏ, nút B để tăng kênh Xanh lá, và lắc để đổi kênh Xanh dương.

**Objective (EN):** Use button A to cycle Red intensity, button B to cycle Green, and shake to cycle Blue.

**Mô tả khối lệnh MakeCode / MakeCode Block Description:**

```
[on start]
  set redVal to 0
  set greenVal to 0
  set blueVal to 255
  set strip to NeoPixel at pin P0 with 8 leds as RGB (GRB format)
  set strip brightness to 100
  strip show color rgb(redVal, greenVal, blueVal)

[on button A pressed]
  change redVal by 85
  if redVal > 255 then
    set redVal to 0
  strip show color rgb(redVal, greenVal, blueVal)
  show number redVal

[on button B pressed]
  change greenVal by 85
  if greenVal > 255 then
    set greenVal to 0
  strip show color rgb(redVal, greenVal, blueVal)
  show number greenVal

[on shake]
  change blueVal by 85
  if blueVal > 255 then
    set blueVal to 0
  strip show color rgb(redVal, greenVal, blueVal)
  show number blueVal
```

**Giải thích (VI):**
- `change redVal by 85`: Tăng giá trị Đỏ thêm 85 (tương ứng 4 bước: 0→85→170→255→0).
- `if redVal > 255 then set redVal to 0`: Đặt lại về 0 nếu vượt quá 255.
- `rgb(redVal, greenVal, blueVal)`: Tạo màu từ ba giá trị kênh riêng lẻ.
- `show number redVal`: Hiển thị giá trị Đỏ hiện tại lên màn hình micro:bit.

**Explanation (EN):**
- `change redVal by 85`: Increase the Red value by 85 (4 steps: 0→85→170→255→0).
- `if redVal > 255 then set redVal to 0`: Reset to 0 if it exceeds 255.
- `rgb(redVal, greenVal, blueVal)`: Create a color from three separate channel values.
- `show number redVal`: Display the current Red value on the micro:bit screen.

---

## 🐍 PHẦN CODE MICROPYTHON / MICROPYTHON CODE SECTION

### Thiết Lập Cơ Bản / Basic Setup

```python
# === BÀI 9: ĐÈN RGB - ĐÈN TRANG TRÍ ===
# === LESSON 9: RGB LED - DECORATIVE LIGHTS ===
#
# Tác giả / Author: STEM Teacher
# Ngày / Date: 2024
# Mô tả / Description:
#   Điều khiển dải NeoPixel WS2812B với Micro:bit
#   Control NeoPixel WS2812B strip with Micro:bit

from microbit import *
import neopixel
import random

# --- Khởi tạo / Initialization ---
# Số lượng LED trong dải / Number of LEDs in the strip
NUM_LEDS = 8

# Khởi tạo dải NeoPixel tại chân P0
# Initialize NeoPixel strip at pin P0
strip = neopixel.NeoPixel(pin0, NUM_LEDS)

# Hàm tắt toàn bộ dải / Function to turn off all LEDs
def clear_strip():
    for i in range(NUM_LEDS):
        strip[i] = (0, 0, 0)
    strip.show()

# Hàm đặt màu cho toàn bộ dải / Function to set all LEDs to one color
def fill_color(r, g, b):
    for i in range(NUM_LEDS):
        strip[i] = (r, g, b)
    strip.show()
```

---

### Code Hiệu Ứng Cầu Vồng / Rainbow Cycle Code

```python
# === HIỆU ỨNG CẦU VỒNG / RAINBOW CYCLE ===
# Chuyển đổi giá trị Hue (màu sắc, 0-255) sang RGB
# Convert Hue value (0-255) to RGB color

from microbit import *
import neopixel

NUM_LEDS = 8
strip = neopixel.NeoPixel(pin0, NUM_LEDS)

def wheel(pos):
    """
    Tạo màu cầu vồng từ giá trị vị trí (0-255).
    Generate rainbow colors across 0-255 positions.

    pos: vị trí trên bánh xe màu / position on color wheel (0-255)
    Trả về / Returns: tuple (R, G, B)
    """
    if pos < 85:
        # Đỏ sang Xanh lá / Red to Green
        return (255 - pos * 3, pos * 3, 0)
    elif pos < 170:
        # Xanh lá sang Xanh dương / Green to Blue
        pos -= 85
        return (0, 255 - pos * 3, pos * 3)
    else:
        # Xanh dương sang Đỏ / Blue to Red
        pos -= 170
        return (pos * 3, 0, 255 - pos * 3)

def rainbow_cycle(wait_ms=30):
    """
    Chạy hiệu ứng cầu vồng một lần qua toàn bộ bánh xe màu.
    Run rainbow cycle once through the color wheel.

    wait_ms: thời gian chờ giữa các bước (ms) / wait time between steps (ms)
    """
    for j in range(256):
        for i in range(NUM_LEDS):
            # Tính vị trí màu cho mỗi LED / Calculate color position for each LED
            pixel_index = (i * 256 // NUM_LEDS + j) % 256
            strip[i] = wheel(pixel_index)
        strip.show()
        sleep(wait_ms)

# --- Vòng lặp chính / Main loop ---
display.show(Image.HEART)  # Hiển thị tim khi khởi động / Show heart on startup
sleep(1000)
display.clear()

while True:
    # Chạy hiệu ứng cầu vồng liên tục / Run rainbow continuously
    rainbow_cycle(wait_ms=20)
```

---

### Code Trộn Màu Tương Tác / Interactive Color Mixer Code

```python
# === TRỘN MÀU TƯƠNG TÁC / INTERACTIVE COLOR MIXER ===
#
# Điều khiển / Controls:
#   Nút A (Button A)  : Tăng kênh Đỏ / Increase Red channel
#   Nút B (Button B)  : Tăng kênh Xanh lá / Increase Green channel
#   Lắc (Shake)       : Tăng kênh Xanh dương / Increase Blue channel
#   A + B cùng lúc    : Đặt lại về đen / Reset to black

from microbit import *
import neopixel

NUM_LEDS = 8
strip = neopixel.NeoPixel(pin0, NUM_LEDS)

# Giá trị ban đầu của các kênh màu
# Initial values for color channels
red_val   = 0    # Kênh Đỏ / Red channel (0-255)
green_val = 0    # Kênh Xanh lá / Green channel (0-255)
blue_val  = 128  # Kênh Xanh dương / Blue channel (0-255)
STEP = 85        # Bước nhảy mỗi lần nhấn / Step per button press

def update_display():
    """Cập nhật màu trên dải LED. / Update color on LED strip."""
    for i in range(NUM_LEDS):
        strip[i] = (red_val, green_val, blue_val)
    strip.show()

# Hiển thị màu ban đầu / Show initial color
update_display()
display.show(Image.HAPPY)
sleep(500)
display.clear()

while True:
    # Nút A: Tăng kênh Đỏ / Button A: Increase Red
    if button_a.was_pressed():
        red_val = (red_val + STEP) % 256
        display.scroll("R:" + str(red_val), delay=60)
        update_display()

    # Nút B: Tăng kênh Xanh lá / Button B: Increase Green
    if button_b.was_pressed():
        green_val = (green_val + STEP) % 256
        display.scroll("G:" + str(green_val), delay=60)
        update_display()

    # Lắc: Tăng kênh Xanh dương / Shake: Increase Blue
    if accelerometer.was_gesture('shake'):
        blue_val = (blue_val + STEP) % 256
        display.scroll("B:" + str(blue_val), delay=60)
        update_display()

    # Chờ ngắn để tránh đọc nút quá nhanh
    # Short delay to avoid reading buttons too fast
    sleep(100)
```

---

### Code Hiệu Ứng Nháy Ngẫu Nhiên / Random Sparkle Effect Code

```python
# === HIỆU ỨNG NHÁY NGẪU NHIÊN / RANDOM SPARKLE ===
# Tạo hiệu ứng ánh sáng lấp lánh / Create a twinkling light effect

from microbit import *
import neopixel
import random

NUM_LEDS = 8
strip = neopixel.NeoPixel(pin0, NUM_LEDS)

# Màu sắc cho hiệu ứng lấp lánh / Colors for sparkle effect
COLORS = [
    (255, 0,   0  ),  # Đỏ / Red
    (0,   255, 0  ),  # Xanh lá / Green
    (0,   0,   255),  # Xanh dương / Blue
    (255, 255, 0  ),  # Vàng / Yellow
    (255, 0,   255),  # Hồng / Magenta
    (0,   255, 255),  # Lam / Cyan
    (255, 255, 255),  # Trắng / White
]

while True:
    # Chọn ngẫu nhiên một LED và một màu
    # Randomly select an LED and a color
    pixel = random.randint(0, NUM_LEDS - 1)
    color = random.choice(COLORS)

    # Bật LED đó / Turn on that LED
    strip[pixel] = color
    strip.show()
    sleep(50)

    # Tắt LED đó / Turn off that LED
    strip[pixel] = (0, 0, 0)
    strip.show()
    sleep(random.randint(10, 80))
```

---

## 🎨 BẢNG THAM KHẢO MÀU SẮC / COLOR REFERENCE TABLE

| STT | Tên màu (VI) | Color Name (EN) | R | G | B | Mã Hex / Hex Code |
|:---:|---|---|:---:|:---:|:---:|:---:|
| 1 | Đỏ thuần | Pure Red | 255 | 0 | 0 | `#FF0000` |
| 2 | Xanh lá thuần | Pure Green | 0 | 255 | 0 | `#00FF00` |
| 3 | Xanh dương thuần | Pure Blue | 0 | 0 | 255 | `#0000FF` |
| 4 | Trắng | White | 255 | 255 | 255 | `#FFFFFF` |
| 5 | Đen / Tắt | Black / Off | 0 | 0 | 0 | `#000000` |
| 6 | Vàng | Yellow | 255 | 255 | 0 | `#FFFF00` |
| 7 | Hồng / Magenta | Magenta | 255 | 0 | 255 | `#FF00FF` |
| 8 | Lam / Cyan | Cyan | 0 | 255 | 255 | `#00FFFF` |
| 9 | Cam | Orange | 255 | 165 | 0 | `#FFA500` |
| 10 | Hồng nhạt | Pink | 255 | 192 | 203 | `#FFC0CB` |
| 11 | Tím | Purple | 128 | 0 | 128 | `#800080` |
| 12 | Nâu | Brown | 165 | 42 | 42 | `#A52A2A` |
| 13 | Xám | Gray | 128 | 128 | 128 | `#808080` |
| 14 | Xám đậm | Dark Gray | 64 | 64 | 64 | `#404040` |
| 15 | Xanh lá nhạt | Light Green | 144 | 238 | 144 | `#90EE90` |
| 16 | Xanh dương nhạt | Light Blue | 173 | 216 | 230 | `#ADD8E6` |
| 17 | Đỏ đậm | Dark Red | 139 | 0 | 0 | `#8B0000` |
| 18 | Vàng kim | Gold | 255 | 215 | 0 | `#FFD700` |
| 19 | Bạc | Silver | 192 | 192 | 192 | `#C0C0C0` |
| 20 | San hô | Coral | 255 | 127 | 80 | `#FF7F50` |

---

## ❓ CÂU HỎI THẢO LUẬN / DISCUSSION QUESTIONS

### Câu 1 / Question 1
**VI:** Nếu bạn trộn màu Đỏ (R=200, G=0, B=0) và màu Xanh lá (R=0, G=150, B=0) cùng nhau trên dải NeoPixel, bạn sẽ phải đặt giá trị R, G, B của một LED là bao nhiêu để mô phỏng màu trộn đó? Màu gì sẽ xuất hiện?

**EN:** If you mix Red (R=200, G=0, B=0) and Green (R=0, G=150, B=0) together on a NeoPixel strip, what R, G, B values would you set for a single LED to simulate the mixed color? What color would appear?

> *Gợi ý / Hint: Cộng các giá trị kênh lại, giới hạn tối đa là 255. / Add the channel values together, capping at 255.*

---

### Câu 2 / Question 2
**VI:** Tại sao NeoPixel WS2812B chỉ cần một dây dữ liệu duy nhất để điều khiển hàng trăm LED, trong khi LED RGB thông thường cần 3 dây? Giải thích cơ chế hoạt động.

**EN:** Why does the NeoPixel WS2812B only need a single data wire to control hundreds of LEDs, while a regular RGB LED needs 3 wires? Explain the mechanism.

> *Gợi ý / Hint: Nghĩ về IC tích hợp và cơ chế nối tiếp. / Think about the integrated IC and daisy-chain mechanism.*

---

### Câu 3 / Question 3
**VI:** Bạn muốn tạo hiệu ứng đèn theo nhịp tim (nhịp tim đập → đèn sáng lên rồi mờ dần). Bạn sẽ lập trình như thế nào? Liệt kê các bước logic.

**EN:** You want to create a heartbeat light effect (heartbeat → LEDs brighten then fade). How would you program this? List the logical steps.

> *Gợi ý / Hint: Dùng vòng lặp để tăng/giảm độ sáng từ từ. / Use a loop to gradually increase/decrease brightness.*

---

### Câu 4 / Question 4
**VI:** Màu bổ sung (complementary color) của màu Xanh dương (Blue) là gì? Tại sao các nhà thiết kế sử dụng màu bổ sung trong thiết kế để tạo sự tương phản?

**EN:** What is the complementary color of Blue? Why do designers use complementary colors to create contrast in design?

> *Gợi ý / Hint: Tra cứu bánh xe màu – màu đối diện với xanh dương là gì? / Check the color wheel – what is directly opposite blue?*

---

### Câu 5 / Question 5
**VI:** Nếu dải NeoPixel của bạn có 30 LED và mỗi LED tiêu thụ tối đa 60mA (khi trắng toàn phần), tổng dòng điện tối đa là bao nhiêu? Cổng USB của máy tính thường cung cấp 500mA – điều này có an toàn không?

**EN:** If your NeoPixel strip has 30 LEDs and each LED consumes up to 60mA (at full white), what is the maximum total current draw? A computer USB port typically provides 500mA – is this safe?

> *Gợi ý / Hint: 30 × 60mA = ? Sau đó so sánh với 500mA. / 30 × 60mA = ? Then compare with 500mA.*

---

## 📊 TIÊU CHÍ ĐÁNH GIÁ / ASSESSMENT RUBRIC

| Tiêu chí / Criterion | Xuất sắc (4) / Excellent | Tốt (3) / Good | Đạt (2) / Satisfactory | Cần cải thiện (1) / Needs Improvement |
|---|---|---|---|---|
| **Hiểu lý thuyết** / **Theory Understanding** | Giải thích đầy đủ và chính xác mô hình RGB, mã Hex, NeoPixel / Fully and accurately explains RGB model, Hex codes, NeoPixel | Giải thích đúng hầu hết các khái niệm / Explains most concepts correctly | Hiểu một số khái niệm cơ bản / Understands some basic concepts | Chưa hiểu các khái niệm cơ bản / Does not understand basic concepts |
| **Kỹ năng lập trình** / **Programming Skills** | Hoàn thành cả 3 hoạt động, không có lỗi, code sạch / Completes all 3 activities, no errors, clean code | Hoàn thành 2/3 hoạt động với lỗi nhỏ / Completes 2/3 activities with minor errors | Hoàn thành 1/3 hoạt động có hỗ trợ / Completes 1/3 activity with help | Chưa hoàn thành được hoạt động nào / Cannot complete any activity |
| **Khả năng sáng tạo** / **Creativity** | Tạo thêm hiệu ứng mới ngoài bài học / Creates additional effects beyond the lesson | Tùy chỉnh màu sắc và tốc độ / Customizes colors and speeds | Làm theo đúng hướng dẫn / Follows instructions exactly | Cần hỗ trợ để làm theo hướng dẫn / Needs help to follow instructions |
| **Thuyết trình & Giải thích** / **Presentation & Explanation** | Giải thích rõ ràng, tự tin, dùng đúng thuật ngữ kỹ thuật / Clear, confident, uses correct technical terms | Giải thích được với một vài lỗi nhỏ / Explains with a few minor errors | Giải thích cơ bản với hỗ trợ / Basic explanation with support | Không thể giải thích sản phẩm / Cannot explain the product |

---

## 🚀 HOẠT ĐỘNG MỞ RỘNG / EXTENSION ACTIVITIES

### 💡 Ý tưởng 1: Đèn Ngủ Cảm Xúc / Mood Lamp

**Mô tả (VI):** Tạo một chiếc đèn ngủ thay đổi màu sắc theo trạng thái cảm xúc:
- Nhấn nút A: Chế độ **Bình tĩnh** (Xanh lam, độ sáng thấp, chuyển màu chậm)
- Nhấn nút B: Chế độ **Năng lượng** (Đỏ/Vàng/Cam, chớp nhanh)
- Lắc nhẹ: Chế độ **Tập trung** (Trắng lạnh, ổn định)
- Vuốt logo: Chế độ **Ngủ** (Xanh lam rất thấp, fade in/out chậm)

**Description (EN):** Create a mood lamp that changes color based on emotional state:
- Press A: **Calm** mode (Blue, low brightness, slow transitions)
- Press B: **Energy** mode (Red/Yellow/Orange, fast pulse)
- Gentle shake: **Focus** mode (Cool white, steady)
- Touch logo: **Sleep** mode (Very dim blue, slow fade in/out)

**Kỹ năng học được / Skills learned:** Máy trạng thái (State machine), điều khiển độ sáng (PWM), thiết kế UX / trải nghiệm người dùng.

---

### 🎮 Ý tưởng 2: Trò Chơi Phản Xạ Màu / Color Reaction Game

**Mô tả (VI):** Một trò chơi phản xạ 2 người chơi:
1. Hệ thống hiển thị ngẫu nhiên một màu (Đỏ, Xanh lá hoặc Trắng) trên dải NeoPixel.
2. Nếu màu là Đỏ → Người chơi 1 (Nút A) phải nhấn trước.
3. Nếu màu là Xanh lá → Người chơi 2 (Nút B) phải nhấn trước.
4. Nếu màu là Trắng → Cả hai **không được** nhấn (sai phạm trừ điểm).
5. Màn hình hiển thị điểm số. Ai đạt 5 điểm trước thì thắng.

**Description (EN):** A 2-player reaction game:
1. The system randomly displays a color (Red, Green, or White) on the NeoPixel strip.
2. If the color is Red → Player 1 (Button A) must press first.
3. If the color is Green → Player 2 (Button B) must press first.
4. If the color is White → Both players must **not** press (penalty for pressing).
5. The screen shows scores. First to 5 points wins.

**Kỹ năng học được / Skills learned:** Số ngẫu nhiên, biến đếm điểm, logic game, tư duy thiết kế / Random numbers, score variables, game logic, design thinking.

---

### 🎵 Ý tưởng 3: Đèn Hiệu Ứng Âm Nhạc / Music Visualizer

**Mô tả (VI):** Kết hợp cảm biến âm thanh (microphone) của micro:bit v2 với dải NeoPixel:
1. Micro:bit v2 có microphone tích hợp đo mức âm thanh (0–255).
2. Độ to của âm thanh điều khiển số lượng LED sáng (kiểu VU Meter / đồng hồ âm lượng).
3. Âm thanh lớn hơn → nhiều LED sáng hơn; nhỏ hơn → ít LED sáng hơn.
4. Lắc để thay đổi chủ đề màu sắc (màu xanh dương, màu ấm, cầu vồng).

**Description (EN):** Combine the micro:bit v2 microphone with the NeoPixel strip:
1. The micro:bit v2 has a built-in microphone that measures sound level (0–255).
2. Sound loudness controls how many LEDs light up (like an audio VU meter).
3. Louder sound → more LEDs; quieter → fewer LEDs.
4. Shake to change color theme (cool blue, warm tones, rainbow).

**Kỹ năng học được / Skills learned:** Đọc cảm biến microphone, ánh xạ giá trị (mapping), thiết kế trực quan hóa dữ liệu / Reading microphone sensor, value mapping, data visualization design.

---

## 📖 BẢNG TỪ VỰNG CHÍNH / KEY VOCABULARY TABLE

| Tiếng Việt (VI) | English (EN) | Định nghĩa / Definition |
|---|---|---|
| Trộn màu cộng | Additive color mixing | Phương pháp trộn ánh sáng màu để tạo màu mới; trộn tất cả cho ra màu trắng / Method of mixing colored light to create new colors; all combined gives white |
| Mã màu Hex | Hex color code | Biểu diễn màu RGB dưới dạng hệ thập lục phân (#RRGGBB) / RGB color representation in hexadecimal format (#RRGGBB) |
| Kênh màu | Color channel | Một trong ba thành phần màu (R, G hoặc B) / One of the three color components (R, G, or B) |
| Có thể địa chỉ hóa | Addressable | Khả năng điều khiển từng LED riêng lẻ trong một dải / The ability to control each LED individually in a strip |
| Giao thức dữ liệu | Data protocol | Quy tắc định dạng và truyền tải dữ liệu giữa các thiết bị / Rules for formatting and transmitting data between devices |
| Nối tiếp / Dây chuyền | Daisy-chaining | Kết nối thiết bị thành chuỗi; đầu ra của cái này là đầu vào cái tiếp theo / Connecting devices in a chain; output of one feeds input of next |
| Dải LED | LED strip | Dải linh hoạt chứa nhiều đèn LED / A flexible strip containing multiple LEDs |
| Sắc độ | Hue | Thuộc tính màu sắc cơ bản xác định màu (đỏ, xanh lá...) / The basic color attribute identifying the color (red, green, etc.) |
| Độ bão hòa | Saturation | Độ thuần/đậm của màu sắc / The purity or intensity of a color |
| Độ sáng | Brightness / Value | Mức độ sáng tối của màu sắc / The lightness or darkness of a color |
| Màu bổ sung | Complementary color | Màu nằm đối diện trên bánh xe màu, tạo tương phản cao / Color opposite on the color wheel, creating high contrast |
| Bánh xe màu | Color wheel | Biểu đồ vòng tròn thể hiện quan hệ giữa các màu sắc / Circular diagram showing relationships between colors |
| Tín hiệu số | Digital signal | Tín hiệu chỉ có hai trạng thái: cao (1) hoặc thấp (0) / Signal with only two states: high (1) or low (0) |
| Khởi tạo | Initialize | Thiết lập các giá trị ban đầu cho chương trình / Setting up initial values for a program |
| Vòng lặp | Loop | Khối lệnh được thực thi lặp đi lặp lại / A block of code that executes repeatedly |

---

## 📝 GHI CHÚ GIÁO VIÊN / TEACHER'S NOTES

### Lưu ý Kỹ Thuật / Technical Notes

> **Cảnh báo / Warning:** Không kết nối quá 8 LED NeoPixel trực tiếp vào nguồn 3.3V của micro:bit. Với nhiều LED hơn, cần dùng nguồn điện ngoài 5V và kết nối GND chung với micro:bit. / Do not connect more than 8 NeoPixels directly to the micro:bit's 3.3V supply. For more LEDs, use an external 5V supply and connect GND to the micro:bit's GND.

> **Mẹo / Tip:** Đặt độ sáng (brightness) ở mức 50-100 trong giờ học để tiết kiệm pin và tránh làm chói mắt học sinh. / Set brightness to 50-100 during class to save battery and avoid dazzling students.

### Thứ Tự Giảng Dạy Khuyến Nghị / Recommended Teaching Sequence

| Phút / Min | Hoạt động (VI) | Activity (EN) |
|:---:|---|---|
| 0–10 | Giới thiệu lý thuyết RGB với ví dụ trực quan | Introduce RGB theory with visual examples |
| 10–20 | Giải thích NeoPixel vs. LED thông thường | Explain NeoPixel vs. regular LED |
| 20–35 | Hướng dẫn cài tiện ích mở rộng và Hoạt động 1 | Guide extension setup and Activity 1 |
| 35–60 | Học sinh tự làm Hoạt động 2 & 3 | Students do Activities 2 & 3 independently |
| 60–75 | Trình bày sản phẩm và thảo luận câu hỏi | Product presentation and discussion questions |
| 75–90 | Tổng kết và giới thiệu hoạt động mở rộng | Summary and extension activity introduction |

### Liên Kết Chương Trình / Curriculum Connections

- **Toán học / Mathematics:** Hệ số thập lục phân, phép tính phần trăm, lũy thừa (256³)
- **Vật lý / Physics:** Quang học, ánh sáng đơn sắc, cảm nhận màu sắc của mắt người
- **Nghệ thuật / Art:** Lý thuyết màu sắc, thiết kế ánh sáng, thẩm mỹ học
- **Tin học / Computer Science:** Biểu diễn dữ liệu nhị phân, giao thức truyền thông, lập trình sự kiện

---

*Tài liệu này là một phần của bộ giáo trình "Sáng Tạo STEAM cùng Elecrow Crowtail & Micro:bit"*

*This document is part of the "Creative STEAM with Elecrow Crowtail & Micro:bit" curriculum*

*Phiên bản / Version: 1.0 | Ngày cập nhật / Last Updated: 2024*
