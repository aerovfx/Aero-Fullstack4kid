# Tuần 1: Kiến Trúc Vi Điều Khiển ESP32, GPIO, Xung PWM & Ngắt / Week 1: ESP32 Microcontroller, GPIO, PWM & Interrupts

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc phần cứng vi điều khiển **ESP32 DevKit V1** (Dual-Core Tensilica LX6, Wi-Fi, Bluetooth BLE).
- Hiểu sơ đồ chân **GPIO (General Purpose Input/Output)**, điện áp hoạt động 3.3V và giới hạn dòng điện tối đa trên từng chân (12mA - 40mA).
- Phân biệt các chế độ GPIO: `INPUT`, `OUTPUT`, `INPUT_PULLUP`, `INPUT_PULLDOWN`.
- Nắm vững phương pháp điều khiển độ sáng LED bằng kỹ thuật **Xung PWM (Pulse Width Modulation)** với bộ tạo xung `ledc` của ESP32.
- Lập trình **Ngắt phần cứng GPIO (Hardware Interrupts)** và kỹ thuật chống dội nút nhấn (Debounce) bằng phần mềm.
- Thực hành lắp mạch chớp tắt LED và điều khiển bằng nút nhấn trên Breadboard hoặc giả lập trực tuyến **Wokwi**.

### English
- Master the hardware architecture of the **ESP32 DevKit V1** (Dual-Core Tensilica LX6, Wi-Fi, Bluetooth BLE).
- Understand the **GPIO** pinout diagram, 3.3V logic level, and maximum current limits per pin (12mA - 40mA).
- Differentiate GPIO modes: `INPUT`, `OUTPUT`, `INPUT_PULLUP`, and `INPUT_PULLDOWN`.
- Master LED brightness control using **Pulse Width Modulation (PWM)** via ESP32's `ledc` hardware peripheral.
- Program **Hardware Interrupts** on GPIO pins and implement software button debouncing techniques.
- Practice wiring LED control circuits with pushbuttons on a physical Breadboard or **Wokwi** online simulator.

---

## Linh Kiện & Dụng Cụ / Components & Tools

### Tiếng Việt (Vietnamese)
- 1 x Board vi điều khiển ESP32 DevKit V1 (30 chân).
- 1 x Breadboard MB-102 (830 lỗ).
- 3 x Đèn LED (Đỏ, Vàng, Xanh lá).
- 3 x Điện trở $220\,\Omega$ (hạn dòng cho LED).
- 2 x Nút nhấn nhả (Pushbutton 4 chân).
- 2 x Điện trở $10\,\text{k}\Omega$ (điện trở Kéo lên / Kéo xuống).
- Dây cắm Breadboard đực-đực (Jumper wires).
- Phần mềm: Arduino IDE 2.3+ hoặc Wokwi Simulator.

### English
- 1 x ESP32 DevKit V1 Board (30-pin).
- 1 x Breadboard MB-102.
- 3 x LEDs (Red, Yellow, Green).
- 3 x $220\,\Omega$ Resistors (Current limiting).
- 2 x Pushbuttons (4-pin).
- 2 x $10\,\text{k}\Omega$ Resistors (Pull-up / Pull-down).
- Male-to-Male Jumper Wires.
- Software: Arduino IDE 2.3+ or Wokwi Simulator.

---

## Lý Thuyết / Theory

### 1. Tổng Quan Kiến Trúc Vi Điều Khiển ESP32 / ESP32 Architecture

#### Tiếng Việt
ESP32 là một SoC (System on Chip) mạnh mẽ do Espressif Systems phát triển, được sử dụng rộng rãi trong các ứng dụng IoT và Robot:
- **CPU:** Dual-Core 32-bit Tensilica Xtensa LX6, xung nhịp lên đến 240 MHz.
- **Bộ nhớ:** 520 KB SRAM nội, hỗ trợ Flash ngoài 4MB/8MB.
- **Kết nối không dây:** Wi-Fi 802.11 b/g/n (tốc độ lên đến 150 Mbps) + Bluetooth v4.2 BR/EDR & BLE.
- **Ngoại vi nhúng:** 34 chân GPIO, 12-bit ADC (18 kênh), 8-bit DAC (2 kênh), Touch Sensors, 16 kênh PWM hardware, UART, SPI, I2C.

> [!WARNING]
> **CẢNH BÁO ĐIỆN ÁP 3.3V LOGIC LEVEL:**
> Tất cả các chân GPIO của ESP32 hoạt động ở mức điện áp **3.3V**. Cấp điện áp 5V trực tiếp vào chân GPIO của ESP32 sẽ **LÀM CHÁY CHIP NGAY LẬP TỨC**.

#### English
The ESP32 is a powerful System on Chip (SoC) designed by Espressif Systems, widely used in IoT and Robotics:
- **CPU:** Dual-Core 32-bit Tensilica Xtensa LX6 up to 240 MHz.
- **Memory:** 520 KB SRAM, supports 4MB/8MB external Flash.
- **Wireless:** Wi-Fi 802.11 b/g/n + Bluetooth v4.2 BR/EDR & BLE.
- **Peripherals:** 34 GPIO pins, 12-bit ADC, 8-bit DAC, Touch Sensors, 16 hardware PWM channels, UART, SPI, I2C.

> [!WARNING]
> **3.3V LOGIC LEVEL WARNING:**
> All ESP32 GPIO pins operate at **3.3V**. Applying 5V directly to a GPIO pin will **PERMANENTLY DESTROY THE CHIP**.

---

### 2. Sơ Đồ Chân GPIO & Tính Toán Điện Trở Hạn Dòng / GPIO & Resistor Calculation

#### Tiếng Việt
Để bảo vệ đèn LED không bị cháy do quá dòng, ta sử dụng Định luật Ohm để tính giá trị điện trở hạn dòng $R$:

$$R = \frac{V_{\text{CC}} - V_{\text{LED}}}{I_{\text{LED}}}$$

Trong đó:
- $V_{\text{CC}} = 3.3\,\text{V}$ (Điện áp ra từ chân GPIO ESP32).
- $V_{\text{LED}} \approx 2.0\,\text{V}$ (Điện áp sụt trên LED đỏ/xanh).
- $I_{\text{LED}} \approx 10\,\text{mA} = 0.01\,\text{A}$ (Dòng điện an toàn qua LED).

$$R = \frac{3.3 - 2.0}{0.01} = 130\,\Omega \implies \text{Chọn điện trở chuẩn } 220\,\Omega$$

```text
[ESP32 GPIO 23] ─── (220 Ohm) ─── [Anode (+)] LED [( - ) Cathode] ─── [GND]
```

---

### 3. Nguyên Lý Điều Chế Độ Rộng Xung (PWM) & Ngắt Phần Cứng (Interrupts)

#### Tiếng Việt
**Xung PWM (Pulse Width Modulation):** Biến đổi mức điện áp trung bình bằng cách bật/tắt điện áp 3.3V với tần số cao.
- **Chu kỳ nhiệm vụ (Duty Cycle):** $D = \frac{T_{\text{ON}}}{T_{\text{ON}} + T_{\text{OFF}}} \times 100\%$
- **Điện áp trung bình:** $V_{\text{avg}} = V_{\text{CC}} \times D$

**Ngắt phần cứng (Hardware Interrupts):** Cho phép vi điều khiển tạm dừng chương trình chính ngay lập tức để xử lý sự kiện khi có sự thay đổi điện áp trên chân GPIO (`RISING`, `FALLING`, `CHANGE`).

---

## Sơ Đồ Đấu Nối Mạch Điện / Circuit Schematic

```text
               ESP32 DevKit V1
            ┌──────────────────┐
            │                  │
            │          GPIO 23 ├────[ 220 Ohm ]────( + ) LED Red ( - )──┐
            │                  │                                        │
            │          GPIO 22 ├────[ 220 Ohm ]────( + ) LED Green ( - )┤
            │                  │                                        │
            │          GPIO 4  ├───[ Pushbutton ]───[ 10k Ohm ]─────────┤
            │                  │          │                             │
            │           GND ───┴──────────┴─────────────────────────────┴─── [GND Rail]
            └──────────────────┘
```

---

## Code Mẫu Thực Hành C++ / Code Implementations

### Code 1: LED Dimmer using ESP32 PWM (LEDC Peripheral)
```cpp
/*
 * Lesson 1: ESP32 LED Dimmer via Hardware PWM (LEDC)
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>

const int LED_PIN = 23;      // GPIO pin connected to LED
const int PWM_FREQ = 5000;   // 5 kHz frequency
const int PWM_CHANNEL = 0;   // PWM channel 0
const int PWM_RESOLUTION = 8; // 8-bit resolution (0 - 255)

void setup() {
    Serial.begin(115200);
    Serial.println("[+] Initializing ESP32 PWM Dimmer...");
    
    // Configure LEDC PWM channel
    ledcSetup(PWM_CHANNEL, PWM_FREQ, PWM_RESOLUTION);
    
    // Attach GPIO pin to PWM channel
    ledcAttachPin(LED_PIN, PWM_CHANNEL);
}

void loop() {
    // Fade IN: Gradually increase LED brightness
    for (int dutyCycle = 0; dutyCycle <= 255; dutyCycle++) {
        ledcWrite(PWM_CHANNEL, dutyCycle);
        delay(10);
    }

    // Fade OUT: Gradually decrease LED brightness
    for (int dutyCycle = 255; dutyCycle >= 0; dutyCycle--) {
        ledcWrite(PWM_CHANNEL, dutyCycle);
        delay(10);
    }
}
```

---

### Code 2: Non-blocking Button Interrupt with Debounce
```cpp
/*
 * Lesson 1: Hardware Interrupts & Software Button Debouncing
 * Aero-Fullstack4kid - IoT & Robotics 10 Weeks
 */

#include <Arduino.h>

const int BUTTON_PIN = 4;
const int LED_PIN = 22;

volatile bool ledState = false;
volatile unsigned long lastInterruptTime = 0;
const unsigned long DEBOUNCE_DELAY_MS = 200; // 200ms debounce

// Interrupt Service Routine (ISR) - Must be stored in IRAM
void IRAM_ATTR handleButtonPress() {
    unsigned long currentTime = millis();
    if (currentTime - lastInterruptTime > DEBOUNCE_DELAY_MS) {
        ledState = !ledState;
        lastInterruptTime = currentTime;
    }
}

void setup() {
    Serial.begin(115200);
    pinMode(LED_PIN, OUTPUT);
    pinMode(BUTTON_PIN, INPUT_PULLUP);
    
    // Attach Hardware Interrupt to GPIO pin (Triggers on FALLING edge)
    attachInterrupt(digitalPinToInterrupt(BUTTON_PIN), handleButtonPress, FALLING);
    
    Serial.println("[+] Hardware Interrupt initialized on GPIO 4!");
}

void loop() {
    // Main loop remains responsive and non-blocking!
    digitalWrite(LED_PIN, ledState ? HIGH : LOW);
    
    // Perform background tasks...
    delay(100);
}
```

---

## Câu Hỏi Thảo Luận / Discussion Questions

1. Điều gì sẽ xảy ra nếu bạn nối trực tiếp chân GPIO của ESP32 vào cực dương của LED mà không dùng điện trở hạn dòng?
2. Sự khác biệt giữa `INPUT_PULLUP` và `INPUT_PULLDOWN` là gì? Tại sao chế độ `INPUT_PULLUP` lại được sử dụng phổ biến khi đấu nối nút nhấn?
3. Tại sao trong hàm xử lý ngắt ISR (Interrupt Service Routine) chúng ta không được sử dụng hàm `delay()` hay các câu lệnh in `Serial.println()`?
4. Kỹ thuật chống dội nút nhấn (Button Debouncing) bằng phần mềm dựa trên nguyên lý nào?
5. Bộ tạo xung PWM 8-bit của ESP32 cho phép điều khiển bao nhiêu mức độ sáng khác nhau?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 1.1: Trạm Đèn Giao Thông 3 Màu (Traffic Light Controller)
Lắp mạch 3 đèn LED (Đỏ: GPIO 23, Vàng: GPIO 22, Xanh: GPIO 21) và lập trình điều khiển chu kỳ đèn giao thông:
- Đèn Đỏ sáng 5 giây.
- Đèn Xanh sáng 4 giây.
- Đèn Vàng sáng 2 giây.

- **Đầu ra kỳ vọng:** Hệ thống chuyển trạng thái liên tục và in thông báo log ra Serial Monitor `[TRAFFIC LIGHT] RED ON (5s)`.

#### Bài 1.2: Điều Khiển Bật/Tắt 2 LED Độc Lập Bằng 2 Nút Nhấn
Sử dụng 2 nút nhấn ngắt `BUTTON_1` (GPIO 4) và `BUTTON_2` (GPIO 5) để điều khiển đảo trạng thái độc lập của `LED_1` và `LED_2`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 1.3: Trình Điều Khiển Độ Sáng LED Đa Cấp Nút Nhấn (Multi-level Brightness Controller)
Viết chương trình C++ điều khiển độ sáng của 1 đèn LED qua 4 cấp độ ($0\%, 33\%, 66\%, 100\%$). Mỗi lần nhấn nút ngắt GPIO, độ sáng tăng lên 1 cấp. Khi đạt $100\%$, lần nhấn tiếp theo đưa độ sáng về $0\%$.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập Wokwi (Hands-on Wokwi Lab)

#### Bài 1.4: Giả Lập Mạch Xung PWM & Ngắt GPIO Trên Wokwi Online
Mở trình giả lập [Wokwi ESP32 Simulator](https://wokwi.com/) và thực hiện:
1. Vẽ sơ đồ mạch gồm ESP32, 1 LED RGB 4 chân và 1 Nút nhấn.
2. Nối chân R, G, B của LED vào 3 kênh PWM `LEDC` khác nhau của ESP32.
3. Lập trình nút nhấn ngắt để mỗi lần nhấn nút, LED RGB đổi sang một màu ngẫu nhiên (Red, Green, Blue, Yellow, Cyan, Purple).

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Wokwi / Colab (Lab Reference Solution)

```cpp
#include <Arduino.h>

const int PIN_R = 23;
const int PIN_G = 22;
const int PIN_B = 21;
const int BTN_PIN = 4;

volatile int colorIndex = 0;
volatile unsigned long lastTime = 0;

const int colors[6][3] = {
    {255, 0, 0},   // Red
    {0, 255, 0},   // Green
    {0, 0, 255},   // Blue
    {255, 255, 0}, // Yellow
    {0, 255, 255}, // Cyan
    {255, 0, 255}  // Purple
};

void IRAM_ATTR changeColorISR() {
    if (millis() - lastTime > 200) {
        colorIndex = (colorIndex + 1) % 6;
        lastTime = millis();
    }
}

void setup() {
    Serial.begin(115200);
    ledcAttachPin(PIN_R, 0); ledcSetup(0, 5000, 8);
    ledcAttachPin(PIN_G, 1); ledcSetup(1, 5000, 8);
    ledcAttachPin(PIN_B, 2); ledcSetup(2, 5000, 8);
    
    pinMode(BTN_PIN, INPUT_PULLUP);
    attachInterrupt(digitalPinToInterrupt(BTN_PIN), changeColorISR, FALLING);
}

void loop() {
    ledcWrite(0, colors[colorIndex][0]);
    ledcWrite(1, colors[colorIndex][1]);
    ledcWrite(2, colors[colorIndex][2]);
    delay(50);
}
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Điện Tử & GPIO** | Giải thích sắc bén Định luật Ohm, tính chọn điện trở hạn dòng, xung PWM và cơ chế Ngắt GPIO. | Hiểu nguyên lý GPIO, PWM và cách sử dụng nút nhấn. | Nắm được định nghĩa GPIO nhưng chưa tính được điện trở hạn dòng. | Cắm sai cực LED hoặc làm ngắn mạch. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Traffic Light, Dual Button, Multi-level Dimmer & Wokwi RGB ISR Lab). | Hoàn thành Bài 1.1 và Bài 1.2 đúng yêu cầu. | Code có lỗi dội nút nhấn hoặc chưa dùng ngắt phần cứng. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Applied IoT & Robotics 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.
