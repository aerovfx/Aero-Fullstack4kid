# Bài 20: Cảm Biến Kết Hợp - Hệ Thống Cảnh Báo
# Lesson 20: Combined Sensors - Warning System

> **Đối tượng / Target:** Học sinh lớp 6–12 / Grade 6–12 Students  
> **Thời lượng / Duration:** 90 phút / 90 minutes  
> **Bộ kit / Kit:** Elecrow Crowtail STEAM Edu Kit + micro:bit  

---

## 1. Mục Tiêu Học Tập / Learning Objectives

**Sau bài học này, học sinh sẽ có thể:**  
*After this lesson, students will be able to:*

- 🔗 **Tích hợp** nhiều cảm biến khác nhau vào một hệ thống duy nhất.  
  *Integrate multiple different sensors into a single unified system.*

- 📡 **Giải thích** khái niệm lập trình hướng sự kiện (event-driven programming).  
  *Explain the concept of event-driven programming.*

- 🔢 **Áp dụng** logic Boolean (AND, OR, NOT) để kết hợp nhiều điều kiện cảm biến.  
  *Apply Boolean logic (AND, OR, NOT) to combine multiple sensor conditions.*

- 🗺️ **Thiết kế** và mô tả máy trạng thái (state machine) đơn giản.  
  *Design and describe a simple state machine.*

- ⚡ **Xây dựng** hệ thống cảnh báo ưu tiên với nhiều mức độ nguy hiểm.  
  *Build a priority-based warning system with multiple alert levels.*

- 💻 **Lập trình** MicroPython 80+ dòng với đầy đủ chú thích để điều khiển hệ thống phức tạp.  
  *Program 80+ line MicroPython code with full comments to control a complex system.*

- 🏠 **Áp dụng** tư duy hệ thống vào thiết kế hệ thống bảo mật nhà thông minh.  
  *Apply systems thinking to smart home security system design.*

---

## 2. Lý Thuyết / Theory

### 2.1 Tích Hợp Đa Cảm Biến / Multi-Sensor Integration

**Tiếng Việt:**  
Trong thực tế, các hệ thống thông minh hiếm khi chỉ dựa vào một loại cảm biến duy nhất. Việc kết hợp nhiều cảm biến mang lại nhiều lợi ích quan trọng:

**Lý do kết hợp nhiều cảm biến:**
- **Độ tin cậy cao hơn:** Nếu một cảm biến bị lỗi, các cảm biến khác vẫn hoạt động.
- **Giảm cảnh báo sai:** Yêu cầu nhiều cảm biến cùng phát hiện mới kích hoạt cảnh báo nghiêm trọng.
- **Thông tin toàn diện hơn:** Mỗi cảm biến cung cấp một góc nhìn khác nhau về môi trường.
- **Phân loại tình huống:** Kết hợp cảm biến giúp phân biệt các tình huống khác nhau (ví dụ: ồn ào bình thường vs. sự cố thực sự).

**Ví dụ thực tế:**  
Hệ thống chữa cháy tự động không chỉ dùng một cảm biến nhiệt. Nó kết hợp: cảm biến nhiệt, cảm biến khói, cảm biến ngọn lửa (hồng ngoại), và cảm biến CO₂. Chỉ khi nhiều cảm biến cùng phát hiện bất thường, hệ thống mới kích hoạt vòi phun nước để tránh cảnh báo sai.

*English:*  
*In real life, smart systems rarely rely on just one sensor. Combining multiple sensors provides several important benefits:*

***Reasons to combine multiple sensors:***
- ***Higher reliability:** If one sensor fails, others continue to work.*
- ***Reduced false alarms:** Requiring multiple sensors to detect simultaneously before triggering critical alerts.*
- ***More comprehensive information:** Each sensor provides a different perspective on the environment.*
- ***Situation classification:** Combined sensors help differentiate between situations (e.g., normal noise vs. actual emergency).*

***Real-world example:***  
*Automatic fire suppression systems don't rely on just one heat sensor. They combine: heat sensors, smoke sensors, infrared flame sensors, and CO₂ sensors. Only when multiple sensors detect anomalies simultaneously does the system activate the sprinklers to avoid false alarms.*

---

### 2.2 Lập Trình Hướng Sự Kiện / Event-Driven Programming

**Tiếng Việt:**  
**Lập trình hướng sự kiện** là phương pháp lập trình trong đó luồng thực thi chương trình được điều khiển bởi các **sự kiện** (events) xảy ra bên ngoài.

**Các khái niệm chính:**

- **Sự kiện (Event):** Một điều gì đó xảy ra mà chương trình cần phản ứng. Ví dụ: nhấn nút, nhiệt độ vượt ngưỡng, phát hiện âm thanh lớn.

- **Trình xử lý sự kiện (Event Handler):** Đoạn mã sẽ chạy khi một sự kiện cụ thể xảy ra. Trong MakeCode, đây là các khối như `on button A pressed` hoặc `on shake`.

- **Callback:** Một hàm được "đăng ký" để gọi lại khi sự kiện xảy ra. Trong Python, đây thường là hàm được truyền vào như đối số.

- **Vòng lặp sự kiện (Event Loop):** Chương trình liên tục "lắng nghe" (listening) các sự kiện và phản ứng khi chúng xảy ra.

**So sánh với lập trình tuần tự:**
- Lập trình tuần tự: thực hiện từng bước một, từ đầu đến cuối
- Lập trình hướng sự kiện: chờ đợi và phản ứng khi có điều gì đó xảy ra

*English:*  
***Event-driven programming** is a programming paradigm where program flow is controlled by **events** occurring externally.*

***Key concepts:***

- ***Event:** Something that happens that the program needs to react to. Examples: button press, temperature threshold exceeded, loud sound detected.*

- ***Event Handler:** The code that runs when a specific event occurs. In MakeCode, these are blocks like `on button A pressed` or `on shake`.*

- ***Callback:** A function "registered" to be called back when an event occurs. In Python, this is often a function passed as an argument.*

- ***Event Loop:** The program continuously "listens" for events and responds when they occur.*

***Comparison with sequential programming:***
*- Sequential programming: executes step by step from start to finish*
*- Event-driven programming: waits and reacts when something happens*

---

### 2.3 Logic Ưu Tiên / Priority Logic

**Tiếng Việt:**  
Khi nhiều cảnh báo xảy ra cùng lúc, hệ thống cần biết cảnh báo nào quan trọng hơn để xử lý trước. Đây gọi là **hệ thống ưu tiên** (priority system).

**Ví dụ thực tế:** Trong một bệnh viện:
- Ưu tiên cao nhất: tim ngừng đập → báo động ngay lập tức
- Ưu tiên 2: sốt cao → cần điều trị sớm
- Ưu tiên 3: áp suất máu bất thường → theo dõi
- Ưu tiên thấp: nhẹ nhàng nhắc bệnh nhân uống thuốc

**Cách triển khai trong lập trình:**
```python
if critical:          # Kiểm tra ưu tiên cao nhất trước
    handle_critical()
elif temp_alert:      # Sau đó ưu tiên 2
    handle_temp()
elif sound_alert:     # Tiếp theo ưu tiên 3
    handle_sound()
elif motion_alert:    # Cuối cùng ưu tiên thấp nhất
    handle_motion()
else:
    show_safe()       # Không có cảnh báo nào
```

*English:*  
*When multiple alerts occur simultaneously, the system needs to know which alert is more important to handle first. This is called a **priority system**.*

***Real-world example:** In a hospital:*
*- Highest priority: cardiac arrest → immediate alarm*
*- Priority 2: high fever → needs early treatment*
*- Priority 3: abnormal blood pressure → monitoring*
*- Low priority: gently remind patient to take medication*

---

### 2.4 Máy Trạng Thái / State Machines

**Tiếng Việt:**  
**Máy trạng thái** (State Machine) là mô hình thiết kế hệ thống trong đó:
- Hệ thống luôn ở trong một **trạng thái** (state) cụ thể tại bất kỳ thời điểm nào.
- Các **điều kiện** (conditions) kích hoạt **chuyển đổi** (transitions) giữa các trạng thái.
- Trong mỗi trạng thái, hệ thống thực hiện các hành động cụ thể.

**Sơ đồ máy trạng thái của hệ thống cảnh báo:**

```
                    [Nhiều cảm biến kích hoạt]
                    [Multiple sensors trigger]
         ┌──────────────────────────────────────┐
         ▼                                      │
    ┌─────────┐     [Nhiệt > 35°C]         ┌───────────┐
    │  SAFE   │ ─────────────────────────► │ TEMP_ALERT│
    │ (an toàn│     [Temp > 35°C]          │(cảnh báo  │
    │  )      │ ◄─────────────────────────  │ nhiệt)    │
    └─────────┘     [Nhiệt trở bình thường] └───────────┘
         │          [Temp normal]               │
         │  [Phát hiện âm thanh]                │ [+ cảm biến khác]
         │  [Sound detected]                    │ [+ other sensor]
         ▼                                      ▼
    ┌───────────┐                        ┌──────────────┐
    │SOUND_ALERT│ ──────────────────────►│   CRITICAL   │
    │(cảnh báo  │   [+ cảm biến khác]    │ (nguy hiểm   │
    │ âm thanh) │   [+ other sensor]     │  nghiêm      │
    └───────────┘                        │  trọng)      │
         │                               └──────────────┘
         │  [Phát hiện rung]                    │
         │  [Shake detected]                    │ [Tất cả về bình thường]
         ▼                                      │ [All return to normal]
    ┌───────────┐                               │
    │MOTION_ALERT◄──────────────────────────────┘
    │(cảnh báo  │
    │ chuyển    │
    │ động)     │
    └───────────┘
```

*English:*  
*A **State Machine** is a system design model where:*
*- The system is always in one specific **state** at any given time.*
*- **Conditions** trigger **transitions** between states.*
*- In each state, the system performs specific actions.*

---

### 2.5 Logic Boolean Kết Hợp Điều Kiện / Boolean Logic for Combining Conditions

**Tiếng Việt:**

| Toán tử / Operator | Ý nghĩa / Meaning | Ví dụ / Example |
|---|---|---|
| **AND** (và) | Cả hai điều kiện đều đúng | `sound AND temp` = cả âm thanh lớn VÀ nhiệt độ cao |
| **OR** (hoặc) | Ít nhất một điều kiện đúng | `sound OR motion` = âm thanh lớn HOẶC chuyển động |
| **NOT** (phủ định) | Điều kiện ngược lại | `NOT safe` = không an toàn |

**Định nghĩa trạng thái CRITICAL:**
```
CRITICAL = (sound_alert AND temp_alert) OR 
           (sound_alert AND motion_alert) OR 
           (temp_alert AND motion_alert)
         = (ít nhất 2 trong 3 cảm biến báo động)
```

*English:*  

| Operator | Meaning | Example |
|---|---|---|
| **AND** | Both conditions are true | `sound AND temp` = loud sound AND high temperature |
| **OR** | At least one condition is true | `sound OR motion` = loud sound OR movement |
| **NOT** | Opposite of the condition | `NOT safe` = not safe |

---

### 2.6 Ứng Dụng Thực Tế / Real-World Applications

**Tiếng Việt:**
- 🏠 **Hệ thống bảo mật nhà thông minh:** Kết hợp cảm biến chuyển động, cảm biến cửa, camera để phát hiện xâm nhập.
- 🏭 **Tự động hóa nhà máy:** Cảm biến nhiệt, áp suất, rung để phát hiện máy móc bất thường.
- 🌦️ **Trạm thời tiết:** Kết hợp nhiệt độ, độ ẩm, gió, mưa để dự báo thời tiết.
- 🚗 **Hệ thống an toàn ô tô:** Cảm biến va chạm, cảm biến buồn ngủ, cảm biến làn đường.
- 🏥 **Theo dõi bệnh nhân:** Nhịp tim, nhiệt độ, huyết áp, SpO₂ cùng lúc.

*English:*
- *🏠 **Smart home security:** Combines motion sensors, door sensors, cameras for intrusion detection.*
- *🏭 **Factory automation:** Heat, pressure, vibration sensors for machinery anomaly detection.*
- *🌦️ **Weather station:** Combines temperature, humidity, wind, rain for weather forecasting.*
- *🚗 **Car safety systems:** Crash sensors, drowsiness sensors, lane sensors.*
- *🏥 **Patient monitoring:** Heart rate, temperature, blood pressure, SpO₂ simultaneously.*

---

## 3. Mô Tả Máy Trạng Thái / State Machine Description

### Trạng thái SAFE (An toàn / Safe)
- **Điều kiện vào:** Không có cảm biến nào kích hoạt / *Entry condition: No sensors triggered*
- **Hành động:** Hiển thị mặt cười trên LED, im lặng / *Action: Show happy face on LED, silence*
- **Chuyển đổi ra:** → SOUND_ALERT nếu phát hiện âm thanh lớn; → TEMP_ALERT nếu T > 35°C; → MOTION_ALERT nếu rung / *Transitions out: → SOUND_ALERT if loud sound; → TEMP_ALERT if T > 35°C; → MOTION_ALERT if shake*

### Trạng thái SOUND_ALERT (Cảnh báo âm thanh / Sound Alert)
- **Điều kiện vào:** Cảm biến âm thanh (P0) phát hiện tiếng ồn lớn / *Entry: Sound sensor (P0) detects loud noise*
- **Hành động:** Hiển thị ký hiệu loa/tai nghe trên LED, còi buzzer tần số thấp / *Action: Show speaker/ear symbol on LED, buzzer at low frequency*
- **Chuyển đổi ra:** → CRITICAL nếu thêm cảm biến khác kích hoạt; → SAFE nếu âm thanh hết / *Transitions: → CRITICAL if other sensors trigger; → SAFE if sound stops*

### Trạng thái TEMP_ALERT (Cảnh báo nhiệt / Temperature Alert)
- **Điều kiện vào:** Nhiệt độ nội tại micro:bit > 35°C / *Entry: micro:bit internal temperature > 35°C*
- **Hành động:** Hiển thị biểu tượng nhiệt độ/ngọn lửa, còi buzzer tần số trung bình / *Action: Show temperature/flame icon, buzzer at medium frequency*
- **Chuyển đổi ra:** → CRITICAL nếu thêm cảm biến khác kích hoạt; → SAFE nếu nhiệt độ về bình thường / *Transitions: → CRITICAL if other triggers; → SAFE if temp returns to normal*

### Trạng thái MOTION_ALERT (Cảnh báo chuyển động / Motion Alert)
- **Điều kiện vào:** Gia tốc kế (accelerometer) phát hiện rung/lắc / *Entry: Accelerometer detects shake/motion*
- **Hành động:** Hiển thị biểu tượng chuyển động/mũi tên, còi buzzer ngắt quãng / *Action: Show motion/arrow icon, intermittent buzzer*
- **Chuyển đổi ra:** → CRITICAL nếu thêm cảm biến khác kích hoạt; → SAFE nếu yên tĩnh / *Transitions: → CRITICAL if other triggers; → SAFE if still*

### Trạng thái CRITICAL (Nguy hiểm nghiêm trọng / Critical)
- **Điều kiện vào:** Từ 2 cảm biến trở lên cùng kích hoạt / *Entry: 2 or more sensors trigger simultaneously*
- **Hành động:** Nhấp nháy toàn bộ LED, còi buzzer tần số cao liên tục / *Action: Flash all LEDs, continuous high-frequency buzzer*
- **Chuyển đổi ra:** → SAFE chỉ khi tất cả cảm biến về bình thường / *Transitions: → SAFE only when all sensors return to normal*

---

## 4. Hệ Thống Ưu Tiên / Priority System

| Mức độ / Level | Trạng thái / State | Ưu tiên / Priority | Hiển thị LED / LED Display | Còi / Buzzer |
|---|---|---|---|---|
| 🔴 **Mức 1 (Cao nhất)** | CRITICAL | Priority 1 | Toàn bộ LED nhấp nháy / All LEDs flash | Tần số cao liên tục / Continuous high freq |
| 🟠 **Mức 2** | TEMP_ALERT | Priority 2 | Biểu tượng lửa / Flame icon | Tần số trung bình / Medium freq |
| 🟡 **Mức 3** | SOUND_ALERT | Priority 3 | Biểu tượng loa / Speaker icon | Tần số thấp / Low freq |
| 🟢 **Mức 4 (Thấp nhất)** | MOTION_ALERT | Priority 4 | Biểu tượng chuyển động / Motion icon | Ngắt quãng / Intermittent |
| ✅ **Bình thường** | SAFE | — | Mặt cười / Happy face | Im lặng / Silent |

---

## 5. Linh Kiện Cần Dùng / Components Needed

| STT | Linh kiện / Component | Cổng / Port | Số lượng / Qty | Ghi chú / Note |
|---|---|---|---|---|
| 1 | micro:bit (v1 hoặc v2) | — | 1 | Bộ điều khiển chính / Main controller |
| 2 | Cảm biến âm thanh / Sound sensor (Crowtail) | P0 (analog) | 1 | Phát hiện tiếng ồn / Detects noise |
| 3 | Còi buzzer (Crowtail) | P1 (digital) | 1 | Phát âm thanh cảnh báo / Sounds alerts |
| 4 | Cảm biến nhiệt độ | Tích hợp / Built-in | — | Dùng `temperature()` của micro:bit |
| 5 | Gia tốc kế / Accelerometer | Tích hợp / Built-in | — | Dùng `accelerometer.was_gesture('shake')` |
| 6 | Màn hình LED 5×5 | Tích hợp / Built-in | — | Hiển thị trạng thái / Shows state |
| 7 | Cáp Crowtail / Crowtail cable | — | 2 | Kết nối cảm biến và còi / Connect sensor and buzzer |
| 8 | Cáp micro USB | — | 1 | Kết nối với máy tính / Connect to PC |
| 9 | Hộp pin / Battery pack | — | 1 | Nguồn di động / Portable power |

---

## 6. Sơ Đồ Kết Nối / Wiring & Connection Description

**Tiếng Việt:**

**Kết nối cảm biến âm thanh (Sound Sensor) → P0:**
1. Dùng cáp Crowtail 3 dây (màu đen - GND, màu đỏ - 3.3V, màu vàng - tín hiệu)
2. Cắm đầu cảm biến vào cổng cảm biến âm thanh
3. Cắm đầu còn lại vào cổng P0 trên bo mạch micro:bit hoặc breakout board
4. Dây màu vàng (tín hiệu) kết nối với chân P0
5. Dây đỏ kết nối 3.3V, dây đen kết nối GND

**Kết nối còi buzzer → P1:**
1. Dùng cáp Crowtail 3 dây
2. Cắm đầu còi vào cổng buzzer
3. Cắm đầu còn lại vào cổng P1
4. Dây màu vàng (tín hiệu) kết nối P1, đỏ = 3.3V, đen = GND

**Cảm biến nhiệt và gia tốc kế:**
- Đã tích hợp sẵn trong micro:bit, không cần kết nối thêm

**Sơ đồ tóm tắt:**
```
micro:bit
├── P0 ──────► [Cảm biến âm thanh / Sound Sensor]
├── P1 ──────► [Còi buzzer / Buzzer]
├── 3V3 ─────► Nguồn cảm biến / Sensor power
├── GND ─────► Đất chung / Common ground
├── [Built-in LED 5x5] ← Hiển thị trạng thái
├── [Built-in Temp sensor] ← Đọc nhiệt độ
└── [Built-in Accelerometer] ← Phát hiện rung
```

*English:*

***Sound Sensor connection → P0:***
*1. Use a 3-wire Crowtail cable (black=GND, red=3.3V, yellow=signal)*  
*2. Plug sensor end into the sound sensor port*  
*3. Plug other end into the P0 port on the micro:bit or breakout board*  
*4. Yellow wire (signal) connects to P0*  
*5. Red wire to 3.3V, black wire to GND*

***Buzzer connection → P1:***
*1. Use a 3-wire Crowtail cable*  
*2. Plug buzzer end into the buzzer port*  
*3. Plug other end into P1*  
*4. Yellow wire (signal) to P1, red = 3.3V, black = GND*

***Temperature sensor and accelerometer:***
*- Already built into the micro:bit, no additional connections needed*

---

## 7. Mô Tả Khối MakeCode / MakeCode Block Description

**Tiếng Việt — Hướng dẫn từng bước:**

**Bước 1: Khai báo biến**
- Tạo 5 biến: `sound_alert`, `temp_alert`, `motion_alert`, `critical`, `state`
- Đặt tất cả = `false` (hoặc 0) trong khối `on start`

**Bước 2: Khối `on shake` (Khi rung)**
- Đặt `motion_alert = true`

**Bước 3: Khối `forever` (Lặp mãi) — Đọc cảm biến**
- `set sound_val to analog read pin P0`
- `if sound_val > 700` → `set sound_alert = true` / `else set sound_alert = false`
- `if temperature > 35` → `set temp_alert = true` / `else set temp_alert = false`
- Sau vài giây, đặt lại: `if motion_alert AND (running time > last_shake + 3000)` → `set motion_alert = false`

**Bước 4: Khối `forever` — Xác định trạng thái (sau bước 3)**
- Đếm số cảm biến đang kích hoạt:
  - `count = (0 + sound_alert + temp_alert + motion_alert)`
- `if count >= 2` → `set state = "CRITICAL"`
- `else if temp_alert` → `set state = "TEMP"`
- `else if sound_alert` → `set state = "SOUND"`
- `else if motion_alert` → `set state = "MOTION"`
- `else` → `set state = "SAFE"`

**Bước 5: Khối `forever` — Phản ứng theo trạng thái**
- `if state == "CRITICAL"` → `show leds` (tất cả sáng) + `play tone 988 Hz for 1/4 beat`
- `else if state == "TEMP"` → `show leds` (biểu tượng lửa) + `play tone 523 Hz for 1/2 beat`
- `else if state == "SOUND"` → `show leds` (biểu tượng loa) + `play tone 262 Hz for 1/2 beat`
- `else if state == "MOTION"` → `show leds` (mũi tên) + `play tone 330 Hz for 1/8 beat, pause 1/8`
- `else` → `show icon happy face`

*English — Step-by-step:*

***Step 1: Declare variables***
*- Create 5 variables: `sound_alert`, `temp_alert`, `motion_alert`, `critical`, `state`*  
*- Set all to `false` (or 0) inside `on start` block*

***Step 2: `on shake` block***
*- Set `motion_alert = true`*

***Step 3: `forever` block — Read sensors***
*- `set sound_val to analog read pin P0`*  
*- `if sound_val > 700` → `set sound_alert = true` / `else set sound_alert = false`*  
*- `if temperature > 35` → `set temp_alert = true` / `else set temp_alert = false`*  
*- After a few seconds, reset: `if motion_alert AND (elapsed time > 3 sec since shake)` → `set motion_alert = false`*

***Step 4: `forever` block — Determine state***
*- Count active sensors*  
*- `if count >= 2` → `set state = "CRITICAL"`*  
*- Priority chain: TEMP → SOUND → MOTION → SAFE*

***Step 5: `forever` block — React to state***
*- Different LED patterns + buzzer tones per state*

---

## 8. Mã MicroPython / MicroPython Code

```python
# ============================================================
# Bài 20: Hệ Thống Cảnh Báo Kết Hợp
# Lesson 20: Combined Warning System
# 
# Cảm biến / Sensors:
#   - Cảm biến âm thanh (P0): kích hoạt SOUND_ALERT
#   - Nhiệt độ tích hợp: kích hoạt TEMP_ALERT nếu > 35°C
#   - Gia tốc kế (rung): kích hoạt MOTION_ALERT
#   - Nhiều cảm biến cùng lúc: trạng thái CRITICAL
#
# Ưu tiên: CRITICAL > TEMP > SOUND > MOTION > SAFE
# Priority: CRITICAL > TEMP > SOUND > MOTION > SAFE
# ============================================================

from microbit import *
import music

# -----------------------------------------------------------
# Ngưỡng cảm biến / Sensor thresholds
# -----------------------------------------------------------
SOUND_THRESHOLD = 700     # Ngưỡng âm thanh (0-1023) / Sound threshold
TEMP_THRESHOLD  = 35      # Ngưỡng nhiệt độ (°C) / Temp threshold
MOTION_RESET_MS = 5000    # Thời gian reset cảnh báo rung (ms) / Motion alert reset time

# -----------------------------------------------------------
# Định nghĩa mẫu LED / LED Pattern definitions
# -----------------------------------------------------------

# Mặt cười an toàn / Safe happy face
SAFE_PATTERN = Image(
    "09090:"
    "09090:"
    "00000:"
    "90009:"
    "09990"
)

# Biểu tượng loa (cảnh báo âm thanh) / Speaker icon (sound alert)
SOUND_PATTERN = Image(
    "00900:"
    "09900:"
    "99099:"
    "09900:"
    "00900"
)

# Biểu tượng ngọn lửa (cảnh báo nhiệt) / Flame icon (temp alert)
TEMP_PATTERN = Image(
    "00900:"
    "09090:"
    "09990:"
    "99999:"
    "09990"
)

# Biểu tượng chuyển động / mũi tên (cảnh báo rung) / Motion arrow
MOTION_PATTERN = Image(
    "00900:"
    "09990:"
    "90900:"
    "00900:"
    "00900"
)

# Nguy hiểm nghiêm trọng - X lớn / Critical danger - Large X
CRITICAL_PATTERN = Image(
    "90009:"
    "09090:"
    "00900:"
    "09090:"
    "90009"
)

# Tất cả LED sáng (cho nhấp nháy CRITICAL) / All LEDs on (for CRITICAL flash)
ALL_ON = Image(
    "99999:"
    "99999:"
    "99999:"
    "99999:"
    "99999"
)

# -----------------------------------------------------------
# Biến trạng thái / State variables
# -----------------------------------------------------------
sound_alert   = False    # Cảnh báo âm thanh / Sound alert active
temp_alert    = False    # Cảnh báo nhiệt độ / Temp alert active
motion_alert  = False    # Cảnh báo chuyển động / Motion alert active
motion_timer  = 0        # Thời điểm phát hiện rung / Time of last shake

# Hằng số trạng thái / State constants
STATE_SAFE     = 0
STATE_MOTION   = 1
STATE_SOUND    = 2
STATE_TEMP     = 3
STATE_CRITICAL = 4

current_state = STATE_SAFE   # Trạng thái hiện tại / Current state

# -----------------------------------------------------------
# Hàm đọc cảm biến âm thanh / Read sound sensor function
# -----------------------------------------------------------
def read_sound():
    """Đọc giá trị cảm biến âm thanh từ P0 (0-1023).
    Read sound sensor value from P0 (0-1023)."""
    return pin0.read_analog()

# -----------------------------------------------------------
# Hàm đọc nhiệt độ / Read temperature function
# -----------------------------------------------------------
def read_temperature():
    """Đọc nhiệt độ tích hợp của micro:bit (°C).
    Read micro:bit built-in temperature (°C)."""
    return temperature()

# -----------------------------------------------------------
# Hàm xác định trạng thái / Determine state function
# -----------------------------------------------------------
def determine_state(sound, temp, motion):
    """
    Xác định trạng thái hệ thống dựa trên các cảnh báo cảm biến.
    Determines system state based on active sensor alerts.
    
    Ưu tiên / Priority: CRITICAL > TEMP > SOUND > MOTION > SAFE
    """
    # Đếm số cảm biến đang kích hoạt / Count active sensors
    active_count = int(sound) + int(temp) + int(motion)
    
    # CRITICAL: từ 2 cảm biến trở lên / 2 or more sensors active
    if active_count >= 2:
        return STATE_CRITICAL
    
    # Kiểm tra theo thứ tự ưu tiên / Check in priority order
    elif temp:
        return STATE_TEMP
    elif sound:
        return STATE_SOUND
    elif motion:
        return STATE_MOTION
    else:
        return STATE_SAFE

# -----------------------------------------------------------
# Hàm phát tín hiệu còi / Buzzer signal function
# -----------------------------------------------------------
def play_alert_tone(state):
    """
    Phát còi tương ứng với trạng thái cảnh báo.
    Plays buzzer corresponding to the alert state.
    """
    if state == STATE_CRITICAL:
        # Tần số cao, liên tục / High frequency, continuous
        pin1.write_analog(512)   # Bật còi / Turn on buzzer
        sleep(100)
        pin1.write_analog(0)
        sleep(50)
    elif state == STATE_TEMP:
        # Tần số trung bình / Medium frequency
        pin1.write_analog(400)
        sleep(300)
        pin1.write_analog(0)
        sleep(200)
    elif state == STATE_SOUND:
        # Tần số thấp / Low frequency
        pin1.write_analog(256)
        sleep(400)
        pin1.write_analog(0)
        sleep(300)
    elif state == STATE_MOTION:
        # Ngắt quãng / Intermittent
        pin1.write_analog(300)
        sleep(150)
        pin1.write_analog(0)
        sleep(400)
    else:
        # An toàn - im lặng / Safe - silence
        pin1.write_analog(0)

# -----------------------------------------------------------
# Vòng lặp chính / Main loop
# -----------------------------------------------------------
display.show(Image.HAPPY)
sleep(500)

flash_state = False  # Dùng để nhấp nháy / Used for flashing

while True:
    # === Bước 1: Đọc cảm biến / Step 1: Read sensors ===
    
    # Đọc âm thanh / Read sound
    sound_val = read_sound()
    sound_alert = (sound_val > SOUND_THRESHOLD)
    
    # Đọc nhiệt độ / Read temperature
    temp_val = read_temperature()
    temp_alert = (temp_val > TEMP_THRESHOLD)
    
    # Kiểm tra rung (reset sau MOTION_RESET_MS ms) / Check shake (reset after timeout)
    if accelerometer.was_gesture('shake'):
        motion_alert = True
        motion_timer = running_time()
    
    # Tự động reset cảnh báo rung / Auto-reset motion alert
    if motion_alert and (running_time() - motion_timer > MOTION_RESET_MS):
        motion_alert = False
    
    # === Bước 2: Xác định trạng thái / Step 2: Determine state ===
    current_state = determine_state(sound_alert, temp_alert, motion_alert)
    
    # === Bước 3: Hiển thị và phát còi / Step 3: Display and buzzer ===
    
    if current_state == STATE_CRITICAL:
        # Nhấp nháy màn hình / Flash the screen
        flash_state = not flash_state
        if flash_state:
            display.show(ALL_ON)
        else:
            display.show(CRITICAL_PATTERN)
        play_alert_tone(STATE_CRITICAL)
    
    elif current_state == STATE_TEMP:
        display.show(TEMP_PATTERN)
        play_alert_tone(STATE_TEMP)
    
    elif current_state == STATE_SOUND:
        display.show(SOUND_PATTERN)
        play_alert_tone(STATE_SOUND)
    
    elif current_state == STATE_MOTION:
        display.show(MOTION_PATTERN)
        play_alert_tone(STATE_MOTION)
    
    else:  # STATE_SAFE
        display.show(SAFE_PATTERN)
        play_alert_tone(STATE_SAFE)
    
    # === Bước 4: Nút bấm để xem thông tin / Step 4: Button to show info ===
    
    if button_a.is_pressed():
        # Nút A: hiển thị giá trị âm thanh / Button A: show sound value
        display.scroll("S:" + str(sound_val), delay=80)
    
    if button_b.is_pressed():
        # Nút B: hiển thị nhiệt độ / Button B: show temperature
        display.scroll("T:" + str(temp_val) + "C", delay=80)
    
    # Dừng ngắn / Short pause
    sleep(100)
```

---

## 9. Mẫu Hình LED Cho Từng Trạng Thái / LED Patterns for Each Alert State

**Mô tả chi tiết từng mẫu / Detailed pattern description:**

### Trạng thái SAFE — Mặt cười / Happy face
```
. # . # .    (row 0: mắt / eyes at cols 1,3)
. # . # .    (row 1: mắt tiếp / eyes continued)
. . . . .    (row 2: trống / empty)
# . . . #    (row 3: góc miệng / mouth corners)
. # # # .    (row 4: nụ cười / smile)
```
*Biểu thị: An toàn, không có cảnh báo / Represents: Safe, no alerts*

### Trạng thái SOUND_ALERT — Biểu tượng loa / Speaker icon
```
. . # . .    (row 0: điểm tín hiệu / signal dot)
. # # . .    (row 1: thân loa trái / left speaker body)
# # . # #    (row 2: toàn bộ loa / full speaker)
. # # . .    (row 3: thân loa trái / left speaker body)
. . # . .    (row 4: điểm tín hiệu / signal dot)
```
*Biểu thị: Âm thanh lớn bất thường / Represents: Abnormally loud sound*

### Trạng thái TEMP_ALERT — Ngọn lửa / Flame
```
. . # . .    (row 0: đỉnh lửa / flame tip)
. # . # .    (row 1: thân lửa / flame body)
. # # # .    (row 2: phần giữa / middle)
# # # # #    (row 3: đáy rộng / wide base)
. # # # .    (row 4: chân lửa / flame base)
```
*Biểu thị: Nhiệt độ nguy hiểm / Represents: Dangerous temperature*

### Trạng thái MOTION_ALERT — Mũi tên chuyển động / Motion arrow
```
. . # . .    (row 0: đỉnh mũi tên / arrow tip)
. # # # .    (row 1: đầu mũi tên / arrow head)
# . # . .    (row 2: cánh mũi tên / arrow wing)
. . # . .    (row 3: thân / shaft)
. . # . .    (row 4: thân / shaft)
```
*Biểu thị: Phát hiện chuyển động / Represents: Motion detected*

### Trạng thái CRITICAL — Dấu X nguy hiểm / Danger X
```
# . . . #    (row 0: góc X / X corners)
. # . # .    (row 1: X trên / upper X)
. . # . .    (row 2: trung tâm / center)
. # . # .    (row 3: X dưới / lower X)
# . . . #    (row 4: góc X / X corners)
```
*Biểu thị: Nguy hiểm nghiêm trọng, nhiều cảm biến kích hoạt / Represents: Critical danger, multiple sensors active*

> **Chú ý nhấp nháy CRITICAL / CRITICAL flashing note:** Hệ thống xen kẽ giữa mẫu X và tất cả LED sáng để tạo hiệu ứng nhấp nháy báo động khẩn cấp.  
> *The system alternates between the X pattern and all-LEDs-on to create an emergency flashing effect.*

---

## 10. Âm Thanh Còi Cho Từng Trạng Thái / Buzzer Tone Patterns

| Trạng thái / State | Tần số / Frequency | Mẫu thời gian / Timing Pattern | Cảm giác / Feel |
|---|---|---|---|
| SAFE | Im lặng / Silent | — | Yên tĩnh / Calm |
| MOTION_ALERT | ~330 Hz | BÍP (150ms) - im (400ms) - lặp / BEEP(150ms)-quiet(400ms)-repeat | Chú ý nhẹ / Gentle attention |
| SOUND_ALERT | ~262 Hz (Do thấp / Low C) | BÍP (400ms) - im (300ms) - lặp / BEEP(400ms)-quiet(300ms)-repeat | Thông báo / Notification |
| TEMP_ALERT | ~523 Hz (Do cao / High C) | BÍP (300ms) - im (200ms) - lặp / BEEP(300ms)-quiet(200ms)-repeat | Cảnh báo khẩn / Urgent warning |
| CRITICAL | ~988 Hz (Si cao / High B) | BÍP (100ms) - im (50ms) - lặp nhanh / BEEP(100ms)-quiet(50ms)-rapid repeat | Khẩn cấp / Emergency |

> **Nguyên tắc thiết kế âm thanh / Sound design principle:** Tần số cao hơn và nhịp nhanh hơn = mức độ nguy hiểm cao hơn.  
> *Higher frequency and faster rhythm = greater danger level.*

---

## 11. Hoạt Động 1: Xây Dựng Hệ Thống Cảnh Báo Kết Hợp
## Activity 1: Build the Combined Warning System

### Tiếng Việt — Hướng dẫn chi tiết từng bước:

**Mục tiêu:** Lắp ráp và lập trình hệ thống cảnh báo hoàn chỉnh với 3 loại cảm biến.

**Thời gian:** 40–50 phút

**Phần A: Lắp ráp phần cứng (15 phút)**

1. **Chuẩn bị bàn làm việc:** Dọn sạch bàn, đặt micro:bit lên đế hoặc bìa carton.
2. **Kết nối cảm biến âm thanh:**
   - Lấy cảm biến âm thanh Crowtail và cáp 3 dây
   - Cắm cáp vào cổng của cảm biến âm thanh
   - Kết nối đầu còn lại vào P0 trên micro:bit hoặc breakout board
3. **Kết nối còi buzzer:**
   - Lấy còi buzzer Crowtail và cáp 3 dây
   - Cắm cáp vào cổng của còi
   - Kết nối vào P1
4. **Kiểm tra kết nối:** Đảm bảo tất cả dây cắm chặt và đúng chiều.

**Phần B: Lập trình (20 phút)**

1. Mở `makecode.microbit.org` hoặc trình soạn thảo MicroPython
2. Sao chép mã từ mục 8 (MicroPython) hoặc tạo khối theo mục 7
3. Xem lại mã: kiểm tra SOUND_THRESHOLD = 700, TEMP_THRESHOLD = 35
4. Nạp chương trình vào micro:bit

**Phần C: Kiểm tra hệ thống (15 phút)**

| Thử nghiệm / Test | Cách thực hiện / How to do | Kết quả mong đợi / Expected result |
|---|---|---|
| Kiểm tra SAFE | Không làm gì / Do nothing | Mặt cười + im lặng / Happy face + silence |
| Kiểm tra SOUND | Vỗ tay gần cảm biến / Clap near sensor | Biểu tượng loa + còi tần số thấp / Speaker + low beep |
| Kiểm tra TEMP | Kẹp micro:bit trong tay ấm / Hold in warm hand | Biểu tượng lửa + còi trung bình / Flame + medium beep |
| Kiểm tra MOTION | Lắc micro:bit / Shake micro:bit | Mũi tên + còi ngắt / Arrow + intermittent beep |
| Kiểm tra CRITICAL | Lắc VÀ vỗ tay cùng lúc / Shake AND clap simultaneously | X nhấp nháy + còi cao liên tục / Flashing X + continuous high beep |

*English — Step-by-step:*

***Objective:** Assemble and program the complete warning system with 3 sensor types.*

***Duration:** 40–50 minutes*

***Part A: Hardware assembly (15 min)***
*1. Clear your workspace, place micro:bit on a stand or cardboard.*
*2. Connect sound sensor to P0 using Crowtail cable.*
*3. Connect buzzer to P1 using Crowtail cable.*
*4. Verify all connections are secure and correctly oriented.*

***Part B: Programming (20 min)***
*1. Open `makecode.microbit.org` or MicroPython editor.*
*2. Copy code from Section 8 or build blocks from Section 7.*
*3. Review code: check thresholds are SOUND=700, TEMP=35.*
*4. Flash the program to micro:bit.*

***Part C: System testing (15 min)***
*Test each alert state and verify correct LED + buzzer response.*

---

## 12. Hoạt Động 2: Tùy Chỉnh và Mở Rộng Hệ Thống
## Activity 2: Customize and Extend the System

### Tiếng Việt:

**Thời gian:** 25–30 phút

**Thử thách tùy chỉnh:**

**Cấp độ 1 — Thay đổi ngưỡng:**
- Thử thay `SOUND_THRESHOLD = 700` thành `500` hoặc `900`
- Quan sát: Giá trị nào phù hợp nhất với môi trường lớp học của bạn?
- Ghi lại giá trị tốt nhất vào bảng

**Cấp độ 2 — Thêm thông tin hiển thị:**
- Khi nhấn nút A: hiển thị giá trị âm thanh thực tế (S:734)
- Khi nhấn nút B: hiển thị nhiệt độ thực tế (T:29C)
- Khi nhấn cả A+B: hiển thị trạng thái hiện tại (SAFE, SOUND, TEMP, MOTION, CRIT)

**Cấp độ 3 — Thêm cảm biến mới (nâng cao):**
- Thêm cảm biến ánh sáng (P2): kích hoạt LIGHT_ALERT khi quá tối
- Điều chỉnh logic ưu tiên để tích hợp cảm biến mới
- Thiết kế mẫu LED mới cho LIGHT_ALERT

**Cấp độ 4 — Ghi nhật ký (nâng cao):**
- Nghiên cứu cách dùng `uart.write()` để gửi log về máy tính
- Ghi lại mỗi khi có cảnh báo: thời gian + loại cảnh báo

*English:*

***Challenge levels:***

***Level 1 — Change thresholds:***
*- Change `SOUND_THRESHOLD = 700` to `500` or `900`*  
*- Observe: Which value best suits your classroom environment?*  
*- Record the best value in the table*

***Level 2 — Add more display info:***
*- Button A: show actual sound value (S:734)*  
*- Button B: show actual temperature (T:29C)*  
*- Both A+B: show current state name*

***Level 3 — Add new sensor (advanced):***
*- Add light sensor (P2): trigger LIGHT_ALERT when too dark*  
*- Adjust priority logic to integrate the new sensor*  
*- Design a new LED pattern for LIGHT_ALERT*

***Level 4 — Data logging (advanced):***
*- Research `uart.write()` to send logs to computer*  
*- Log every alert: timestamp + alert type*

---

## 13. Dự Án: Thiết Kế Hệ Thống Bảo Mật Nhà Thông Minh
## Project: Design Your Own Smart Home Security System

### Tiếng Việt — Hướng dẫn dự án đầy đủ:

**Mô tả dự án:**  
Học sinh (làm việc theo nhóm 3–4 người) sẽ thiết kế và lập trình một hệ thống bảo mật nhà thông minh hoàn chỉnh sử dụng micro:bit và bộ Crowtail.

**Yêu cầu tối thiểu (Minimum Requirements):**
- ✅ Sử dụng ít nhất 2 loại cảm biến
- ✅ Có ít nhất 3 trạng thái khác nhau (bao gồm SAFE)
- ✅ Có hệ thống ưu tiên rõ ràng
- ✅ LED hiển thị khác nhau cho mỗi trạng thái
- ✅ Còi buzzer hoạt động đúng theo trạng thái

**Kịch bản gợi ý / Scenario suggestions:**

**Kịch bản A: Hệ thống bảo mật phòng ngủ**
- Cảm biến: Âm thanh (P0) + Gia tốc kế (rung) + Ánh sáng (P2)
- SAFE: Phòng yên tĩnh, không rung, đèn bình thường
- NIGHT_MODE: Phát hiện chuyển động nhỏ vào ban đêm
- INTRUSION: Âm thanh lớn đột ngột + rung (có người đột nhập)
- EMERGENCY: Nhiều cảm biến cùng kích hoạt

**Kịch bản B: Hệ thống an toàn bếp**
- Cảm biến: Nhiệt độ (tích hợp) + Âm thanh (P0)
- SAFE: Nhiệt độ bình thường, yên tĩnh
- COOKING: Nhiệt độ tăng bình thường
- OVERHEAT: Nhiệt độ quá cao
- EMERGENCY: Nhiệt cao + âm thanh khói báo động

**Các bước thực hiện dự án:**
1. **Brainstorming (10 phút):** Chọn kịch bản, liệt kê cảm biến và trạng thái
2. **Thiết kế (15 phút):** Vẽ sơ đồ máy trạng thái, thiết kế mẫu LED
3. **Lập trình (30 phút):** Code dựa trên bài 20, điều chỉnh cho kịch bản của nhóm
4. **Kiểm tra (15 phút):** Test mọi trạng thái, sửa lỗi
5. **Trình bày (10 phút/nhóm):** Demo cho lớp, giải thích thiết kế

**Bảng thiết kế dự án / Project design template:**

| Trạng thái / State | Điều kiện / Condition | LED / Display | Còi / Buzzer | Ưu tiên / Priority |
|---|---|---|---|---|
| SAFE | (điền vào) | (điền vào) | Im lặng | — |
| STATE_1 | (điền vào) | (điền vào) | (điền vào) | 3 |
| STATE_2 | (điền vào) | (điền vào) | (điền vào) | 2 |
| CRITICAL | ≥2 cảm biến | X nhấp nháy | Cao/nhanh | 1 |

*English — Full project guide:*

***Project description:***  
*Students (working in groups of 3–4) will design and program a complete smart home security system using micro:bit and the Crowtail kit.*

***Minimum Requirements:***
*- ✅ Use at least 2 sensor types*  
*- ✅ Have at least 3 different states (including SAFE)*  
*- ✅ Have a clear priority system*  
*- ✅ Different LED displays for each state*  
*- ✅ Buzzer works correctly per state*

***Project steps:***
*1. **Brainstorming (10 min):** Choose scenario, list sensors and states*  
*2. **Design (15 min):** Draw state machine diagram, design LED patterns*  
*3. **Programming (30 min):** Code based on Lesson 20, adjust for your group's scenario*  
*4. **Testing (15 min):** Test all states, debug*  
*5. **Presentation (10 min/group):** Demo to class, explain design choices*

---

## 14. Lưu Ý An Toàn / Safety Notes

> ⚠️ **Lưu ý an toàn / Safety Notes:**

**Tiếng Việt:**
- ⚡ **Điện áp:** Chỉ kết nối cảm biến và thiết bị được thiết kế cho 3.3V với micro:bit. Không kết nối thiết bị 5V trực tiếp.
- 🔊 **Còi buzzer:** Không để còi buzzer gần tai vì có thể gây hại đến thính giác, đặc biệt khi ở chế độ CRITICAL.
- 🔌 **Kết nối:** Luôn kiểm tra kết nối trước khi cấp điện. Kết nối sai có thể làm hỏng cảm biến.
- 🤝 **Xử lý:** Cầm micro:bit cẩn thận, tránh tĩnh điện bằng cách chạm vào vật kim loại tiếp đất trước khi cầm bo mạch.
- 🌡️ **Nhiệt độ:** Không dùng lửa hoặc nguồn nhiệt thực sự để kiểm tra cảm biến nhiệt — dùng tay ấm hoặc hơi thở là đủ.
- 📏 **Không gian:** Đảm bảo có đủ không gian khi lắc micro:bit để không va chạm với người hoặc vật xung quanh.

*English:*
- *⚡ **Voltage:** Only connect sensors and devices designed for 3.3V with the micro:bit. Do not connect 5V devices directly.*
- *🔊 **Buzzer:** Do not hold the buzzer near your ear as it can harm hearing, especially in CRITICAL mode.*
- *🔌 **Connections:** Always check connections before powering on. Wrong connections can damage sensors.*
- *🤝 **Handling:** Hold the micro:bit carefully; avoid static electricity by touching a grounded metal object before handling the board.*
- *🌡️ **Temperature:** Do not use real fire or heat sources to test the temperature sensor — warm hands or breath are sufficient.*
- *📏 **Space:** Ensure enough space when shaking the micro:bit to avoid hitting people or objects nearby.*

---

## 15. Câu Hỏi Thảo Luận / Discussion Questions

**1. Tại sao hệ thống cảnh báo cần có nhiều mức ưu tiên? Điều gì xảy ra nếu tất cả cảnh báo đều có cùng mức độ ưu tiên?**  
*Why does a warning system need multiple priority levels? What would happen if all alerts had the same priority?*

**2. Hãy giải thích tại sao trạng thái CRITICAL (nhiều cảm biến cùng kích hoạt) lại nghiêm trọng hơn chỉ một cảm biến đơn lẻ?**  
*Explain why the CRITICAL state (multiple sensors simultaneously) is more serious than a single sensor trigger?*

**3. Trong lập trình hướng sự kiện, sự khác biệt giữa "đọc cảm biến liên tục trong vòng lặp" và "sự kiện shake" là gì?**  
*In event-driven programming, what is the difference between "continuously reading sensors in a loop" and a "shake event"?*

**4. Hãy mô tả một hệ thống cảnh báo trong cuộc sống thực mà bạn biết. Nó sử dụng những cảm biến nào? Hệ thống ưu tiên của nó hoạt động như thế nào?**  
*Describe a real-life warning system you know. What sensors does it use? How does its priority system work?*

**5. Nếu bạn thêm cảm biến độ ẩm vào hệ thống, bạn sẽ đặt nó ở mức ưu tiên nào và tại sao?**  
*If you added a humidity sensor to the system, what priority level would you assign it and why?*

---

## 16. Bảng Đánh Giá / Assessment Rubric

| Tiêu chí / Criteria | Xuất sắc (4) / Excellent | Tốt (3) / Good | Đạt (2) / Satisfactory | Cần cải thiện (1) / Needs Improvement |
|---|---|---|---|---|
| **Hiểu biết lý thuyết** / *Theory understanding* | Giải thích thành thạo máy trạng thái, logic ưu tiên, và lập trình hướng sự kiện / *Fluently explains state machines, priority logic, and event-driven programming* | Giải thích được hầu hết khái niệm chính / *Explains most key concepts* | Giải thích được khái niệm cơ bản / *Explains basic concepts* | Còn nhầm lẫn các khái niệm cơ bản / *Confused about basic concepts* |
| **Kỹ năng lập trình** / *Programming skills* | Mã hoạt động hoàn hảo, 80+ dòng có chú thích, xử lý tất cả 5 trạng thái / *Code runs perfectly, 80+ commented lines, handles all 5 states* | Mã hoạt động tốt với 4/5 trạng thái / *Code works well for 4/5 states* | Mã xử lý được trạng thái SAFE và 2 cảnh báo / *Code handles SAFE and 2 alerts* | Mã có lỗi hoặc chỉ xử lý một trạng thái / *Code has errors or handles only one state* |
| **Thiết kế hệ thống** / *System design* | Sơ đồ máy trạng thái hoàn chỉnh, logic ưu tiên rõ ràng, mẫu LED sáng tạo / *Complete state diagram, clear priority logic, creative LED patterns* | Thiết kế đầy đủ với một số sáng tạo / *Complete design with some creativity* | Thiết kế cơ bản đủ để hoạt động / *Basic design that functions* | Thiết kế không đầy đủ hoặc không rõ ràng / *Incomplete or unclear design* |
| **Dự án nhóm** / *Group project* | Hệ thống hoạt động hoàn hảo, trình bày thuyết phục, có thể trả lời mọi câu hỏi / *System works perfectly, compelling presentation, answers all questions* | Hệ thống hoạt động, trình bày tốt / *System works, good presentation* | Hệ thống hoạt động một phần, trình bày được / *System partially works, acceptable presentation* | Hệ thống không hoàn chỉnh, khó theo dõi / *System incomplete, hard to follow* |

---

## 17. Khám Phá Thêm / Further Exploration & Challenges

**Tiếng Việt:**

1. 🌐 **IoT (Internet of Things):** Nghiên cứu cách gửi dữ liệu cảm biến lên mạng Internet bằng micro:bit radio hoặc module WiFi ESP8266.

2. 📊 **Phân tích dữ liệu:** Thu thập dữ liệu từ hệ thống trong 1 giờ, xuất ra file CSV và vẽ biểu đồ phân tích bằng Excel hoặc Google Sheets.

3. 🤖 **Machine Learning:** Tìm hiểu về ML4Microbit — dùng học máy để nhận dạng cử chỉ và tích hợp vào hệ thống cảnh báo.

4. 📱 **Giao tiếp không dây:** Dùng tính năng radio của micro:bit để gửi cảnh báo đến một micro:bit khác ở phòng khác (hệ thống cảnh báo đa điểm).

5. 🔋 **Tiết kiệm năng lượng:** Nghiên cứu chế độ sleep của micro:bit để hệ thống hoạt động lâu hơn với pin.

*English:*

*1. 🌐 **IoT (Internet of Things):** Research sending sensor data to the Internet using micro:bit radio or an ESP8266 WiFi module.*

*2. 📊 **Data analysis:** Collect data from the system for 1 hour, export to CSV, and plot analysis charts in Excel or Google Sheets.*

*3. 🤖 **Machine Learning:** Explore ML4Microbit — use machine learning to recognize gestures and integrate into the warning system.*

*4. 📱 **Wireless communication:** Use micro:bit's radio feature to send alerts to another micro:bit in a different room (multi-point warning system).*

*5. 🔋 **Power saving:** Research micro:bit's sleep mode to make the system run longer on batteries.*

---

## 18. Bảng Từ Vựng / Vocabulary List

| Thuật ngữ / Term | Tiếng Việt / Vietnamese | Tiếng Anh / English Definition |
|---|---|---|
| **Máy trạng thái** (State Machine) | Mô hình hệ thống với các trạng thái và chuyển đổi rõ ràng | *System model with defined states and transitions* |
| **Trạng thái** (State) | Điều kiện cụ thể mà hệ thống đang ở tại một thời điểm | *Specific condition the system is in at a given moment* |
| **Chuyển đổi** (Transition) | Sự thay đổi từ trạng thái này sang trạng thái khác | *Change from one state to another* |
| **Sự kiện** (Event) | Điều gì đó xảy ra kích hoạt phản ứng của chương trình | *Something that occurs triggering a program response* |
| **Trình xử lý sự kiện** (Event Handler) | Đoạn mã chạy khi một sự kiện cụ thể xảy ra | *Code that runs when a specific event occurs* |
| **Callback** | Hàm được đăng ký để gọi lại khi có sự kiện | *Function registered to be called when an event occurs* |
| **Ưu tiên** (Priority) | Thứ tự quan trọng để xử lý khi nhiều sự kiện cùng xảy ra | *Order of importance when multiple events occur simultaneously* |
| **Logic Boolean** (Boolean Logic) | Hệ thống logic dùng AND, OR, NOT để kết hợp điều kiện | *Logic system using AND, OR, NOT to combine conditions* |
| **Tích hợp cảm biến** (Sensor Integration) | Kết hợp nhiều cảm biến vào một hệ thống duy nhất | *Combining multiple sensors into a unified system* |
| **Ngưỡng** (Threshold) | Giá trị mà cảm biến vượt qua để kích hoạt cảnh báo | *Value that a sensor must exceed to trigger an alert* |
| **Gia tốc kế** (Accelerometer) | Cảm biến đo gia tốc và phát hiện rung/lắc | *Sensor measuring acceleration and detecting shake/motion* |
| **Cảm biến âm thanh** (Sound Sensor) | Thiết bị chuyển đổi âm thanh thành tín hiệu điện | *Device that converts sound into electrical signals* |

---

## 19. Tổng Kết Chương Trình / Curriculum Summary: Bài 13–20

*Recap of what students have learned in Lessons 13–20*

### Tiếng Việt:

Chúc mừng! Bạn đã hoàn thành **Giai đoạn 3** của chương trình STEAM với micro:bit!

Trong 8 bài học vừa qua (Bài 13–20), bạn đã học:

| Bài / Lesson | Chủ đề / Topic | Kỹ năng chính / Key Skills |
|---|---|---|
| Bài 13 | Cảm biến ánh sáng / Light Sensor | Đọc cảm biến analog, điều chỉnh LED theo ánh sáng |
| Bài 14 | Cảm biến nhiệt độ / Temp Sensor | Đọc nhiệt độ, hiệu chỉnh, ứng dụng thực tế |
| Bài 15 | Cảm biến âm thanh / Sound Sensor | Phân tích tín hiệu âm thanh, ngưỡng kích hoạt |
| Bài 16 | Cảm biến chuyển động / Motion Sensor | Phát hiện rung, gia tốc kế |
| Bài 17 | Điều khiển servo / Servo Control | PWM, góc quay, điều khiển cơ học |
| Bài 18 | Màn hình OLED / OLED Display | Giao tiếp I2C, hiển thị đồ họa |
| **Bài 19** | **La bàn / Compass** | **Cảm biến từ, hiệu chỉnh, 8 hướng** |
| **Bài 20** | **Hệ thống cảnh báo / Warning System** | **Tích hợp đa cảm biến, máy trạng thái, ưu tiên** |

**Kỹ năng lập trình bạn đã thành thạo:**
- ✅ Đọc và xử lý tín hiệu analog và digital
- ✅ Sử dụng các cấu trúc điều kiện phức tạp (if/elif/else)
- ✅ Viết và gọi hàm (functions)
- ✅ Lập trình hướng sự kiện
- ✅ Thiết kế máy trạng thái
- ✅ Tích hợp nhiều module phần cứng

*English:*

*Congratulations! You have completed **Phase 3** of the STEAM program with micro:bit!*

*In the past 8 lessons (Lessons 13–20), you learned:*
- *Reading analog and digital sensor signals*
- *Applying complex conditional structures*
- *Writing and calling functions*
- *Event-driven programming*
- *State machine design*
- *Multi-hardware module integration*

---

## 20. Bước Tiếp Theo / Next Steps

### Tiếng Việt:

**Giai đoạn 4 sắp tới: Dự Án Sáng Tạo & Giao Tiếp Không Dây**

Trong các bài học tiếp theo, bạn sẽ:

- 📡 **Bài 21–22: Radio & Giao tiếp không dây** — Gửi và nhận dữ liệu giữa nhiều micro:bit, xây dựng mạng cảm biến phân tán.

- 🌐 **Bài 23–24: IoT cơ bản** — Kết nối micro:bit với Internet, gửi dữ liệu lên dashboard trực tuyến.

- 🤖 **Bài 25–26: Robot và điều khiển động cơ** — Điều khiển xe robot, tích hợp cảm biến để né tránh chướng ngại vật.

- 🏆 **Bài 27–30: Dự án tổng hợp** — Thiết kế và xây dựng một dự án STEAM hoàn chỉnh từ đầu đến cuối, trình bày trước hội đồng đánh giá.

**Lời khuyên để chuẩn bị:**
- Ôn lại khái niệm máy trạng thái (sẽ dùng rất nhiều trong điều khiển robot)
- Tìm hiểu sơ bộ về giao thức giao tiếp không dây (radio frequency, protocols)
- Bắt đầu nghĩ về dự án cá nhân bạn muốn xây dựng

*English:*

***Upcoming Phase 4: Creative Projects & Wireless Communication***

*In upcoming lessons, you will:*

- *📡 **Lessons 21–22: Radio & Wireless** — Send and receive data between multiple micro:bits, build a distributed sensor network.*

- *🌐 **Lessons 23–24: Basic IoT** — Connect micro:bit to the Internet, send data to an online dashboard.*

- *🤖 **Lessons 25–26: Robot and motor control** — Control a robot car, integrate sensors for obstacle avoidance.*

- *🏆 **Lessons 27–30: Capstone project** — Design and build a complete STEAM project from start to finish, present to an evaluation panel.*

***Tips to prepare:***
*- Review state machine concepts (will be used heavily in robot control)*  
*- Explore wireless communication protocols (radio frequency, protocols)*  
*- Start thinking about the personal project you want to build*

---

*Kết thúc Bài 20 và Giai đoạn 3 / End of Lesson 20 and Phase 3*  
*Hẹn gặp lại ở Giai đoạn 4! / See you in Phase 4!* 🚀
