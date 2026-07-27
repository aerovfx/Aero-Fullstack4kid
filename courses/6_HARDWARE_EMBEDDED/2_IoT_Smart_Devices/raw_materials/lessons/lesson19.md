# Bài 19: La Bàn - Kim Chỉ Nam
# Lesson 19: Compass - Digital Compass

> **Đối tượng / Target:** Học sinh lớp 6–12 / Grade 6–12 Students  
> **Thời lượng / Duration:** 90 phút / 90 minutes  
> **Bộ kit / Kit:** Elecrow Crowtail STEAM Edu Kit + micro:bit  

---

## 1. Mục Tiêu Học Tập / Learning Objectives

**Sau bài học này, học sinh sẽ có thể:**  
*After this lesson, students will be able to:*

- 🧭 **Giải thích** từ trường Trái Đất và cách la bàn hoạt động.  
  *Explain Earth's magnetic field and how a compass works.*

- 📐 **Đọc và diễn giải** các góc phương vị (heading) từ 0° đến 360°.  
  *Read and interpret compass headings from 0° to 360°.*

- 🔧 **Hiệu chỉnh** (calibrate) cảm biến từ tính của micro:bit đúng cách.  
  *Calibrate the micro:bit's built-in magnetometer correctly.*

- 💻 **Lập trình** micro:bit bằng MakeCode và MicroPython để hiển thị hướng la bàn.  
  *Program the micro:bit using MakeCode and MicroPython to display compass direction.*

- 🗺️ **Xác định** 8 hướng chính (N, NE, E, SE, S, SW, W, NW) dựa trên góc đọc được.  
  *Identify 8 compass directions (N, NE, E, SE, S, SW, W, NW) from heading values.*

- 🌍 **Áp dụng** la bàn kỹ thuật số vào các tình huống thực tế như định hướng và tìm kho báu.  
  *Apply the digital compass to real-world scenarios such as navigation and treasure hunts.*

---

## 2. Lý Thuyết / Theory

### 2.1 Từ Trường Trái Đất / Earth's Magnetic Field

**Tiếng Việt:**  
Trái Đất hoạt động như một nam châm khổng lồ. Bên trong lõi Trái Đất có lớp kim loại nóng chảy (chủ yếu là sắt và niken) chuyển động liên tục. Sự chuyển động này tạo ra dòng điện, và dòng điện tạo ra từ trường bao quanh toàn bộ hành tinh.

Từ trường Trái Đất có hai cực:
- **Cực Bắc Từ (Magnetic North Pole):** Nằm ở vùng Bắc Cực Canada, hơi lệch so với Cực Bắc Địa lý (Geographic North Pole).
- **Cực Nam Từ (Magnetic South Pole):** Nằm ở vùng Nam Cực, cũng lệch so với Cực Nam Địa lý.

Các đường từ trường đi ra từ Cực Nam và đi vào Cực Bắc (theo quy ước vật lý). Kim la bàn luôn thẳng hàng với các đường từ trường này, do đó luôn chỉ về phía Bắc Từ.

*English:*  
*Earth acts like a giant magnet. Inside the core of Earth, there is molten metal (mainly iron and nickel) in constant motion. This motion generates electric currents, which in turn generate a magnetic field that surrounds the entire planet.*

*Earth's magnetic field has two poles:*
- ***Magnetic North Pole:** Located in Arctic Canada, slightly offset from the Geographic North Pole.*
- ***Magnetic South Pole:** Located in Antarctica, also offset from the Geographic South Pole.*

*Magnetic field lines exit from the South Pole and enter the North Pole (by physics convention). A compass needle always aligns with these field lines, so it always points toward Magnetic North.*

---

### 2.2 Góc Phương Vị La Bàn / Compass Heading

**Tiếng Việt:**  
La bàn đo hướng bằng góc tính theo độ (°), bắt đầu từ hướng Bắc và quay theo chiều kim đồng hồ:

- **0° / 360° = Bắc (North)**
- **90° = Đông (East)**
- **180° = Nam (South)**
- **270° = Tây (West)**

Góc này được gọi là **góc phương vị** (bearing hoặc heading). Trong hàng hải và hàng không, góc phương vị được sử dụng để xác định hướng di chuyển chính xác. Ví dụ: "Bay theo hướng 045°" nghĩa là bay theo hướng Đông Bắc.

*English:*  
*A compass measures direction in degrees (°), starting from North and rotating clockwise:*

- ***0° / 360° = North***
- ***90° = East***
- ***180° = South***
- ***270° = West***

*This angle is called the **bearing** or **heading**. In navigation and aviation, headings are used to determine exact direction of travel. For example: "Fly heading 045°" means flying Northeast.*

---

### 2.3 Độ Lệch Từ / Magnetic Declination

**Tiếng Việt:**  
Cực Bắc Từ không trùng với Cực Bắc Địa lý. Góc giữa hai hướng này tại một vị trí cụ thể gọi là **độ lệch từ** (magnetic declination hay magnetic variation).

- Độ lệch từ **dương (+):** Cực Bắc Từ lệch về phía Đông so với Cực Bắc Địa lý.
- Độ lệch từ **âm (-):** Cực Bắc Từ lệch về phía Tây so với Cực Bắc Địa lý.

Tại Việt Nam, độ lệch từ khoảng **-0.5° đến +1°** (gần như không đáng kể), nhưng ở các vùng khác như Alaska hay Canada, độ lệch từ có thể lên đến 20°+.

Để điều hướng chính xác, các hoa tiêu và thủy thủ phải tính đến độ lệch từ khi sử dụng la bàn.

*English:*  
*The Magnetic North Pole does not coincide with the Geographic North Pole. The angle between these two directions at a specific location is called **magnetic declination** (or magnetic variation).*

- ***Positive (+) declination:** Magnetic North is east of Geographic North.*
- ***Negative (−) declination:** Magnetic North is west of Geographic North.*

*In Vietnam, magnetic declination is approximately **-0.5° to +1°** (nearly negligible), but in regions like Alaska or Canada, it can reach 20°+.*

*For precise navigation, pilots and sailors must account for magnetic declination when using a compass.*

---

### 2.4 Cảm Biến Từ Tính Tích Hợp của micro:bit / micro:bit Built-in Magnetometer

**Tiếng Việt:**  
micro:bit phiên bản 1 và 2 đều có **cảm biến từ tính tích hợp** (magnetometer), cụ thể là chip **LSM303AGR** (v2) hoặc **MAG3110** (v1). Cảm biến này đo cường độ từ trường theo ba trục: X, Y, và Z.

Từ các giá trị đo được, micro:bit tính toán góc phương vị (heading) — tức là góc tính từ hướng Bắc theo chiều kim đồng hồ.

**Trong MakeCode:** Khối `compass heading (°)` trả về giá trị từ 0 đến 360.  
**Trong MicroPython:** Hàm `compass.heading()` trả về giá trị tương tự.

*English:*  
*Both micro:bit version 1 and 2 have a **built-in magnetometer**, specifically the **LSM303AGR** chip (v2) or **MAG3110** (v1). This sensor measures the magnetic field strength along three axes: X, Y, and Z.*

*From these measurements, the micro:bit calculates the compass **heading** — the clockwise angle from North.*

***In MakeCode:** The `compass heading (°)` block returns a value from 0 to 360.*  
***In MicroPython:** The `compass.heading()` function returns the same value.*

---

### 2.5 Hiệu Chỉnh La Bàn / Compass Calibration

**Tiếng Việt:**  
**Tại sao cần hiệu chỉnh?**  
Các thiết bị điện tử xung quanh (nam châm, điện thoại, máy tính, dây điện) và các vật kim loại (bàn kim loại, ghế, dụng cụ) tạo ra từ trường cục bộ làm nhiễu cảm biến từ tính của micro:bit. Nếu không hiệu chỉnh, số liệu đọc về hướng sẽ không chính xác.

**Quy trình hiệu chỉnh:**  
1. Khi chạy chương trình la bàn lần đầu, micro:bit sẽ hiển thị chữ **"TILT TO FILL SCREEN"** (cuộn trên màn hình LED).
2. Học sinh cầm micro:bit và **nghiêng thiết bị** theo mọi hướng để di chuyển một chấm sáng điền vào toàn bộ 25 ô LED trên màn hình.
3. Khi tất cả 25 LED sáng, hiệu chỉnh hoàn tất và micro:bit hiển thị một mặt cười `:)`.
4. Sau đó la bàn sẵn sàng hoạt động chính xác.

**Lưu ý quan trọng:** Thực hiện hiệu chỉnh ở khu vực **không có kim loại và thiết bị điện tử** gần đó để đảm bảo độ chính xác cao nhất.

*English:*  
***Why calibration is needed?***  
*Nearby electronic devices (magnets, phones, computers, power cables) and metal objects (metal tables, chairs, tools) create local magnetic fields that interfere with the micro:bit's magnetometer. Without calibration, heading readings will be inaccurate.*

***Calibration procedure:***  
*1. When running a compass program for the first time, the micro:bit will scroll **"TILT TO FILL SCREEN"** on the LED display.*  
*2. Students hold the micro:bit and **tilt the device** in all directions to move a dot and fill all 25 LED squares on the screen.*  
*3. When all 25 LEDs are lit, calibration is complete and the micro:bit shows a happy face `:)`.*  
*4. The compass is then ready for accurate operation.*

***Important note:** Perform calibration in an area **free from nearby metal objects and electronic devices** to ensure the highest accuracy.*

---

### 2.6 Các Hướng La Bàn / Cardinal and Intercardinal Directions

**Tiếng Việt:**  
La bàn chia vòng tròn 360° thành các hướng chính và phụ:

**4 hướng chính (Cardinal directions):**
- **Bắc (North - N):** 0° / 360°
- **Đông (East - E):** 90°
- **Nam (South - S):** 180°
- **Tây (West - W):** 270°

**4 hướng trung gian (Intercardinal / Ordinal directions):**
- **Đông Bắc (Northeast - NE):** 45°
- **Đông Nam (Southeast - SE):** 135°
- **Tây Nam (Southwest - SW):** 225°
- **Tây Bắc (Northwest - NW):** 315°

Khi lập trình la bàn 8 hướng, chúng ta chia vòng tròn 360° thành 8 phần bằng nhau, mỗi phần 45°. Mỗi hướng "chiếm" một khoảng ±22.5° quanh góc chính của nó.

*English:*  
*A compass divides the 360° circle into cardinal and intercardinal directions:*

***4 Cardinal directions:***
- ***North (N):** 0° / 360°*
- ***East (E):** 90°*
- ***South (S):** 180°*
- ***West (W):** 270°*

***4 Intercardinal (Ordinal) directions:***
- ***Northeast (NE):** 45°*
- ***Southeast (SE):** 135°*
- ***Southwest (SW):** 225°*
- ***Northwest (NW):** 315°*

*When programming an 8-direction compass, we divide the 360° circle into 8 equal 45° segments. Each direction "covers" a range of ±22.5° around its central angle.*

---

### 2.7 Ứng Dụng Thực Tế / Real-World Applications

**Tiếng Việt:**  
La bàn có rất nhiều ứng dụng trong cuộc sống:

- 🚢 **Hàng hải:** Thuyền trưởng dùng la bàn để điều hướng tàu.
- ✈️ **Hàng không:** Phi công dùng la bàn để xác định hướng bay.
- 🏕️ **Leo núi và cắm trại:** Người đi rừng dùng la bàn để không bị lạc.
- 🗺️ **Tìm kho báu (Geocaching):** Hoạt động giải trí sử dụng tọa độ GPS và la bàn.
- ⛏️ **Địa chất:** Nhà địa chất học dùng la bàn để ghi chép hướng của các lớp đá.
- 🏠 **Phong thủy:** Trong văn hóa Á Đông, la bàn dùng để xác định hướng nhà.
- 📱 **Điện thoại thông minh:** Ứng dụng bản đồ và điều hướng dùng la bàn số.

*English:*  
*Compasses have many real-world applications:*

- *🚢 **Maritime navigation:** Ship captains use compasses to navigate.*
- *✈️ **Aviation:** Pilots use compasses to determine flight headings.*
- *🏕️ **Hiking and camping:** Hikers use compasses to avoid getting lost.*
- *🗺️ **Treasure hunts (Geocaching):** Recreational activity using GPS coordinates and compass.*
- *⛏️ **Geology:** Geologists use compasses to record rock layer orientations.*
- *🏠 **Feng Shui:** In East Asian culture, compasses determine house orientation.*
- *📱 **Smartphones:** Maps and navigation apps use digital compasses.*

---

## 3. Bảng Khoảng Góc Phương Vị / Heading Ranges Table

| Hướng / Direction | Ký hiệu / Symbol | Khoảng góc / Degree Range |
|---|---|---|
| Bắc / North | N | 337.5° – 360° và / and 0° – 22.5° |
| Đông Bắc / Northeast | NE | 22.5° – 67.5° |
| Đông / East | E | 67.5° – 112.5° |
| Đông Nam / Southeast | SE | 112.5° – 157.5° |
| Nam / South | S | 157.5° – 202.5° |
| Tây Nam / Southwest | SW | 202.5° – 247.5° |
| Tây / West | W | 247.5° – 292.5° |
| Tây Bắc / Northwest | NW | 292.5° – 337.5° |

> **Ghi chú / Note:** Hướng Bắc chia thành hai phần vì vòng tròn "gói lại" từ 360° về 0°.  
> *North is split into two ranges because the circle "wraps around" from 360° back to 0°.*

---

## 4. Linh Kiện Cần Dùng / Components Needed

| STT | Linh kiện / Component | Số lượng / Qty | Ghi chú / Note |
|---|---|---|---|
| 1 | micro:bit (v1 hoặc v2) | 1 | Có cảm biến từ tích hợp / Has built-in magnetometer |
| 2 | Cáp micro USB / Micro USB cable | 1 | Kết nối với máy tính / Connect to PC |
| 3 | Pin 3V (AAA × 2) hoặc pin USB | 1 | Nguồn điện di động / Portable power |
| 4 | Hộp đựng pin / Battery pack | 1 | Đi kèm bộ kit / Included in kit |
| 5 | Máy tính / Computer | 1 | Để lập trình / For programming |

> **Không cần thêm cảm biến ngoài!** Cảm biến từ tính đã được tích hợp sẵn trong micro:bit.  
> *No external sensor needed! The magnetometer is already built into the micro:bit.*

---

## 5. Sơ Đồ Kết Nối / Wiring & Connection Description

**Tiếng Việt:**  
Bài học này sử dụng **cảm biến từ tính tích hợp** của micro:bit, vì vậy **không cần kết nối thêm linh kiện ngoài**. Màn hình LED 5×5 cũng đã tích hợp sẵn.

**Cách kết nối:**
1. Cắm cáp micro USB vào cổng USB của micro:bit.
2. Cắm đầu còn lại vào cổng USB của máy tính.
3. Màn hình LED và cảm biến từ sẵn sàng hoạt động ngay lập tức.
4. Khi chạy độc lập (không cần máy tính), gắn hộp pin vào cổng nguồn của micro:bit.

**Màn hình LED 5×5:**  
Màn hình gồm 25 đèn LED xếp thành lưới 5 hàng × 5 cột. Chúng ta sẽ dùng màn hình này để hiển thị mũi tên chỉ hướng la bàn.

*English:*  
*This lesson uses the micro:bit's **built-in magnetometer**, so **no external components need to be connected**. The 5×5 LED matrix is also already integrated.*

***Connection steps:***
*1. Plug the micro USB cable into the micro:bit's USB port.*  
*2. Plug the other end into the computer's USB port.*  
*3. The LED matrix and magnetometer are immediately ready.*  
*4. For standalone operation, attach the battery pack to the micro:bit's power connector.*

***5×5 LED Matrix:***  
*The display consists of 25 LEDs arranged in a 5-row × 5-column grid. We will use this display to show directional arrows for the compass.*

---

## 6. Mô Tả Khối MakeCode / MakeCode Block Description

**Tiếng Việt — Hướng dẫn từng bước:**

**Bước 1: Thêm phần mở rộng la bàn**
- Mở MakeCode tại `makecode.microbit.org`
- Nhấn **"+ Extension"** và tìm kiếm "compass" nếu cần (thường đã có sẵn trong phần **Input**)

**Bước 2: Khối `on start` (Khi bắt đầu)**
- Đặt khối `compass calibrate` (Hiệu chỉnh la bàn) bên trong khối `on start`
- Khối này chạy trò chơi hiệu chỉnh dot mỗi khi micro:bit khởi động

**Bước 3: Khối `forever` (Lặp mãi)**
- Tạo biến `heading` và gán giá trị: `set heading to compass heading (°)`
- Dùng chuỗi `if/else if/else` để kiểm tra góc:
  - `if heading < 22 OR heading > 337` → `show leds` (hiển thị mũi tên lên = Bắc)
  - `else if heading < 67` → `show leds` (hiển thị mũi tên chéo phải-trên = Đông Bắc)
  - `else if heading < 112` → `show leds` (hiển thị mũi tên phải = Đông)
  - `else if heading < 157` → `show leds` (hiển thị mũi tên chéo phải-dưới = Đông Nam)
  - `else if heading < 202` → `show leds` (hiển thị mũi tên xuống = Nam)
  - `else if heading < 247` → `show leds` (hiển thị mũi tên chéo trái-dưới = Tây Nam)
  - `else if heading < 292` → `show leds` (hiển thị mũi tên trái = Tây)
  - `else` → `show leds` (hiển thị mũi tên chéo trái-trên = Tây Bắc)

**Bước 4: Thêm nút bấm để xem số độ**
- Khối `on button A pressed`:
  - `show number compass heading (°)` — hiển thị số độ cuộn qua màn hình LED

*English — Step-by-step block description:*

***Step 1: Access compass blocks***
*- Open MakeCode at `makecode.microbit.org`*
*- Compass blocks are found in the **Input** category*

***Step 2: `on start` block***
*- Place `compass calibrate` block inside `on start`*
*- This runs the dot-tilting calibration game every time micro:bit starts up*

***Step 3: `forever` block***
*- Create variable `heading` and assign: `set heading to compass heading (°)`*
*- Use `if/else if/else` chain to check the angle:*
  *- `if heading < 22 OR heading > 337` → `show leds` (up arrow = North)*
  *- `else if heading < 67` → `show leds` (diagonal up-right arrow = NE)*
  *- `else if heading < 112` → `show leds` (right arrow = East)*
  *- `else if heading < 157` → `show leds` (diagonal down-right arrow = SE)*
  *- `else if heading < 202` → `show leds` (down arrow = South)*
  *- `else if heading < 247` → `show leds` (diagonal down-left arrow = SW)*
  *- `else if heading < 292` → `show leds` (left arrow = West)*
  *- `else` → `show leds` (diagonal up-left arrow = NW)*

***Step 4: Button for numeric display***
*- `on button A pressed` block:*
  *- `show number compass heading (°)` — scrolls the degree value across the LED*

---

## 7. Mã MicroPython / MicroPython Code

```python
# ============================================================
# Bài 19: La Bàn Kỹ Thuật Số - Digital Compass
# Lesson 19: Digital Compass with micro:bit
# Sử dụng cảm biến từ tính tích hợp / Using built-in magnetometer
# ============================================================

from microbit import *

# -----------------------------------------------------------
# Định nghĩa các mẫu mũi tên LED / Define LED arrow patterns
# -----------------------------------------------------------

# Mũi tên Bắc (↑) / North arrow (↑)
NORTH_ARROW = Image(
    "00900:"
    "09990:"
    "90909:"
    "00900:"
    "00900"
)

# Mũi tên Nam (↓) / South arrow (↓)
SOUTH_ARROW = Image(
    "00900:"
    "00900:"
    "90909:"
    "09990:"
    "00900"
)

# Mũi tên Đông (→) / East arrow (→)
EAST_ARROW = Image(
    "00900:"
    "00090:"
    "99999:"
    "00090:"
    "00900"
)

# Mũi tên Tây (←) / West arrow (←)
WEST_ARROW = Image(
    "00900:"
    "09000:"
    "99999:"
    "09000:"
    "00900"
)

# Mũi tên Đông Bắc (↗) / Northeast arrow (↗)
NE_ARROW = Image(
    "09999:"
    "00099:"
    "00909:"
    "09000:"
    "90000"
)

# Mũi tên Đông Nam (↘) / Southeast arrow (↘)
SE_ARROW = Image(
    "90000:"
    "09000:"
    "00909:"
    "00099:"
    "09999"
)

# Mũi tên Tây Nam (↙) / Southwest arrow (↙)
SW_ARROW = Image(
    "00009:"
    "00090:"
    "90900:"
    "99000:"
    "99990"
)

# Mũi tên Tây Bắc (↖) / Northwest arrow (↖)
NW_ARROW = Image(
    "99990:"
    "99000:"
    "90900:"
    "00090:"
    "00009"
)

# -----------------------------------------------------------
# Hàm xác định hướng / Direction determination function
# -----------------------------------------------------------

def get_direction(heading):
    """
    Nhận góc phương vị (0-360) và trả về:
    - tên hướng (string)
    - hình mũi tên (Image)
    
    Takes heading (0-360) and returns:
    - direction name (string)
    - arrow image (Image)
    """
    if heading > 337 or heading <= 22:
        return "N", NORTH_ARROW
    elif heading <= 67:
        return "NE", NE_ARROW
    elif heading <= 112:
        return "E", EAST_ARROW
    elif heading <= 157:
        return "SE", SE_ARROW
    elif heading <= 202:
        return "S", SOUTH_ARROW
    elif heading <= 247:
        return "SW", SW_ARROW
    elif heading <= 292:
        return "W", WEST_ARROW
    else:
        return "NW", NW_ARROW


# -----------------------------------------------------------
# Hiệu chỉnh la bàn / Compass calibration
# -----------------------------------------------------------
# QUAN TRỌNG: Luôn hiệu chỉnh trước khi dùng!
# IMPORTANT: Always calibrate before use!
compass.calibrate()

# Hiển thị thông báo sẵn sàng / Display ready message
display.show(Image.YES)
sleep(1000)
display.clear()

# -----------------------------------------------------------
# Vòng lặp chính / Main loop
# -----------------------------------------------------------
while True:
    # Đọc góc phương vị từ cảm biến / Read heading from sensor
    heading = compass.heading()
    
    # Lấy tên hướng và hình ảnh / Get direction name and image
    direction_name, arrow = get_direction(heading)
    
    # --- Nút A: Hiển thị mũi tên hướng / Button A: Show directional arrow ---
    if button_a.is_pressed():
        display.show(arrow)
    
    # --- Nút B: Hiển thị số độ / Button B: Show numeric heading ---
    elif button_b.is_pressed():
        display.scroll(str(heading) + "deg", delay=100)
    
    # --- Không bấm nút: Hiển thị tên hướng / No button: Show direction name ---
    else:
        display.show(arrow)
    
    # Dừng ngắn để tránh nhấp nháy / Short pause to avoid flickering
    sleep(200)
```

---

## 8. Mẫu Mũi Tên LED 5×5 / LED Arrow Patterns (5×5 Matrix)

**Mô tả bố cục pixel / Pixel layout description:**

Màn hình LED 5×5 được đánh số hàng 0–4 (trên xuống dưới) và cột 0–4 (trái sang phải).  
*The 5×5 LED display is numbered rows 0–4 (top to bottom) and columns 0–4 (left to right).*

### Mũi tên Bắc ↑ / North Arrow
```
. . # . .    (row 0: col 2 sáng / lit)
. # # # .    (row 1: cols 1,2,3 sáng / lit)
# . # . #    (row 2: cols 0,2,4 sáng / lit)
. . # . .    (row 3: col 2 sáng / lit)
. . # . .    (row 4: col 2 sáng / lit)
```

### Mũi tên Nam ↓ / South Arrow
```
. . # . .    (row 0: col 2)
. . # . .    (row 1: col 2)
# . # . #    (row 2: cols 0,2,4)
. # # # .    (row 3: cols 1,2,3)
. . # . .    (row 4: col 2)
```

### Mũi tên Đông → / East Arrow
```
. . # . .    (row 0: col 2)
. . . # .    (row 1: col 3)
# # # # #    (row 2: all cols)
. . . # .    (row 3: col 3)
. . # . .    (row 4: col 2)
```

### Mũi tên Tây ← / West Arrow
```
. . # . .    (row 0: col 2)
. # . . .    (row 1: col 1)
# # # # #    (row 2: all cols)
. # . . .    (row 3: col 1)
. . # . .    (row 4: col 2)
```

> **Lưu ý / Note:** Các hướng trung gian (NE, SE, SW, NW) dùng mũi tên chéo với đường chéo chính và đầu mũi tên ở góc tương ứng.  
> *Intercardinal directions (NE, SE, SW, NW) use diagonal arrows with a main diagonal line and arrowhead at the corresponding corner.*

---

## 9. Hoạt Động 1: La Bàn Kỹ Thuật Số Hiển Thị Mũi Tên
## Activity 1: Digital Compass with Directional Arrows

### Tiếng Việt — Hướng dẫn chi tiết:

**Mục tiêu:** Lập trình micro:bit hiển thị mũi tên chỉ hướng Bắc/Nam/Đông/Tây theo thời gian thực.

**Thời gian:** 30–40 phút

**Các bước thực hiện:**

**Bước 1: Chuẩn bị**
- Mở trình duyệt và truy cập `makecode.microbit.org`
- Tạo dự án mới, đặt tên "La ban kep thuat so"
- Kết nối micro:bit với máy tính bằng cáp USB

**Bước 2: Lập trình**
- Sao chép mã MicroPython ở mục 7 vào trình soạn thảo Python
- Hoặc tạo khối MakeCode theo mô tả ở mục 6
- Kiểm tra mã lần cuối trước khi nạp

**Bước 3: Nạp chương trình**
- Nhấn nút **Download** / **Flash**
- Chờ đèn LED màu vàng trên micro:bit nhấp nháy xong

**Bước 4: Hiệu chỉnh**
- Khi màn hình hiển thị **"TILT TO FILL SCREEN"**, nghiêng micro:bit theo mọi hướng
- Điền đủ 25 LED sáng → mặt cười `:)` xuất hiện
- **Quan trọng:** Đứng xa bàn kim loại và thiết bị điện tử khi hiệu chỉnh!

**Bước 5: Kiểm tra**
- Xoay micro:bit và quan sát mũi tên thay đổi
- Hướng mũi tên lên = Bắc, xuống = Nam, phải = Đông, trái = Tây
- Nhấn nút B để xem số độ chính xác

**Bước 6: Ghi nhận**
- Học sinh ghi vào bảng quan sát: Đứng quay mặt về 4 hướng và ghi số độ đo được

*English — Step-by-step instructions:*

***Objective:** Program the micro:bit to display real-time directional arrows for N/S/E/W.*

***Duration:** 30–40 minutes*

***Steps:***

***Step 1: Setup***
*- Open browser and go to `makecode.microbit.org`*  
*- Create new project, name it "Digital Compass"*  
*- Connect micro:bit to computer with USB cable*

***Step 2: Program***
*- Copy the MicroPython code from Section 7 into the Python editor*  
*- Or build MakeCode blocks as described in Section 6*  
*- Review code before flashing*

***Step 3: Flash***
*- Click **Download** / **Flash** button*  
*- Wait for the yellow LED on the micro:bit to stop blinking*

***Step 4: Calibrate***
*- When the screen shows **"TILT TO FILL SCREEN"**, tilt the micro:bit in all directions*  
*- Fill all 25 LEDs → happy face `:)` appears*  
*- **Important:** Stand away from metal tables and electronics during calibration!*

***Step 5: Test***
*- Rotate the micro:bit and observe the arrow changing*  
*- Arrow up = North, down = South, right = East, left = West*  
*- Press button B to see the exact degree reading*

***Step 6: Record***
*- Students fill in observation table: face each of 4 directions and record the degree reading*

---

## 10. Hoạt Động 2: Hiển Thị Góc Độ Số
## Activity 2: Numeric Heading Display in Degrees

### Tiếng Việt:

**Mục tiêu:** Hiển thị số độ chính xác và hiểu cách góc thay đổi khi xoay người.

**Thời gian:** 20–25 phút

**Bảng quan sát / Observation Table:**

| Hướng quay mặt / Facing direction | Số độ đo được / Degree reading | Hướng la bàn / Compass direction |
|---|---|---|
| Quay về cửa sổ / Facing window | ___°| ___ |
| Quay về bảng / Facing board | ___° | ___ |
| Quay 90° sang phải / Turn 90° right | ___° | ___ |
| Quay 180° / Turn 180° | ___° | ___ |

**Câu hỏi phân tích:**
1. Khi bạn xoay 90° sang phải, số độ thay đổi bao nhiêu?
2. Khi bạn xoay 180°, số độ thay đổi như thế nào?
3. Tại sao số độ không bao giờ đạt đúng 0° hay 90° hoàn toàn?

*English:*

***Objective:** Display precise degree values and understand how angles change as you rotate.*

***Duration:** 20–25 minutes*

***Analysis questions:***
*1. When you turn 90° right, by how much does the degree value change?*  
*2. When you turn 180°, how does the degree value change?*  
*3. Why do you never get exactly 0° or exactly 90°?*

---

## 11. Hoạt Động Thực Tế: Tìm Kho Báu Bằng La Bàn Micro:bit
## Real-World Activity: Treasure Hunt with micro:bit Compass

### Tiếng Việt — Hướng dẫn chi tiết:

**Mô tả hoạt động:**  
Giáo viên giấu "kho báu" (có thể là một phong bì có điểm thưởng, một món quà nhỏ) ở đâu đó trong lớp học hoặc sân trường. Học sinh nhận được "bản đồ chỉ dẫn" bằng hướng la bàn và khoảng cách bước chân.

**Ví dụ bản đồ:**
```
Xuất phát từ cửa lớp:
1. Đi về hướng Bắc (N) 10 bước chân
2. Rẽ sang hướng Đông (E) 5 bước chân
3. Đi về hướng Nam (S) 3 bước chân
4. Kho báu ở đây! (dưới ghế thứ 3 hàng bên phải)
```

**Vai trò của micro:bit:**
- Học sinh cầm micro:bit và sử dụng như một la bàn thực sự
- Xoay người cho đến khi mũi tên chỉ đúng hướng cần đi
- Đi theo số bước chân đã cho

**Chia nhóm:** 3–4 học sinh mỗi nhóm, mỗi nhóm có 1 micro:bit

**Mở rộng:**  
Học sinh tự thiết kế bản đồ kho báu cho nhóm khác!

*English — Detailed instructions:*

***Activity description:***  
*The teacher hides "treasure" (e.g., an envelope with bonus points or a small prize) somewhere in the classroom or schoolyard. Students receive a "treasure map" with compass directions and step counts.*

***Example map:***
```
Starting from the classroom door:
1. Walk North (N) 10 paces
2. Turn East (E) 5 paces
3. Walk South (S) 3 paces
4. Treasure is here! (under the 3rd chair on the right row)
```

***Role of micro:bit:***
*- Students hold the micro:bit and use it as a real compass*  
*- Rotate until the arrow points in the required direction*  
*- Walk the given number of paces*

***Groups:** 3–4 students per group, each group has 1 micro:bit*

***Extension:***  
*Students design their own treasure map for another group!*

---

## 12. Lưu Ý An Toàn / Safety Notes

> ⚠️ **Lưu ý an toàn quan trọng / Important Safety Notes:**

**Tiếng Việt:**
- 🧲 **Tránh nam châm:** Không để micro:bit gần nam châm mạnh vì có thể làm hỏng cảm biến.
- 🔧 **Khi hiệu chỉnh:** Đứng cách xa ít nhất 1 mét khỏi bàn kim loại, máy tính, điện thoại, và các thiết bị điện tử khác.
- ⚡ **Điện an toàn:** Chỉ dùng cáp USB chính hãng và nguồn pin theo hướng dẫn.
- 🤝 **Xử lý nhẹ nhàng:** micro:bit là thiết bị điện tử, tránh rơi hoặc bẻ cong.
- 🚶 **Khi di chuyển:** Cẩn thận khi đi lại trong hoạt động tìm kho báu, chú ý an toàn xung quanh.
- 📱 **Cất điện thoại:** Trong giờ hiệu chỉnh la bàn, học sinh để điện thoại vào túi hoặc xa khỏi micro:bit.

*English:*
- *🧲 **Avoid magnets:** Do not place the micro:bit near strong magnets as it can damage the sensor.*
- *🔧 **During calibration:** Stand at least 1 meter away from metal tables, computers, phones, and other electronics.*
- *⚡ **Electrical safety:** Only use genuine USB cables and battery power as instructed.*
- *🤝 **Handle gently:** The micro:bit is an electronic device; avoid dropping or bending it.*
- *🚶 **When moving:** Be careful when walking during the treasure hunt activity.*
- *📱 **Put away phones:** During compass calibration, students should keep phones in pockets or away from the micro:bit.*

---

## 13. Câu Hỏi Thảo Luận / Discussion Questions

**1. Tại sao la bàn lại chỉ về phía Bắc? Điều gì tạo ra từ trường Trái Đất?**  
*Why does a compass point North? What creates Earth's magnetic field?*

**2. Nếu bạn đang ở Cực Bắc Địa lý và dùng la bàn, la bàn sẽ chỉ về đâu?**  
*If you were standing at the Geographic North Pole and used a compass, where would it point?*

**3. Tại sao la bàn cần được hiệu chỉnh? Điều gì có thể gây nhiễu từ?**  
*Why does the compass need calibration? What can cause magnetic interference?*

**4. Sự khác nhau giữa "Bắc Từ" và "Bắc Địa lý" là gì? Điều này có ảnh hưởng gì đến thực tế?**  
*What is the difference between "Magnetic North" and "Geographic North"? How does this affect real life?*

**5. Ngoài la bàn, còn có những công cụ định hướng nào khác? Ưu nhược điểm của mỗi loại là gì?**  
*Besides a compass, what other navigation tools exist? What are the pros and cons of each?*

---

## 14. Bảng Đánh Giá / Assessment Rubric

| Tiêu chí / Criteria | Xuất sắc (4) / Excellent | Tốt (3) / Good | Đạt (2) / Satisfactory | Cần cải thiện (1) / Needs Improvement |
|---|---|---|---|---|
| **Hiểu biết lý thuyết** / *Theory understanding* | Giải thích đầy đủ từ trường Trái Đất, độ lệch từ, và hiệu chỉnh / *Fully explains Earth's magnetic field, declination, and calibration* | Giải thích được hầu hết các khái niệm chính / *Explains most key concepts* | Giải thích được các khái niệm cơ bản / *Explains basic concepts* | Còn nhầm lẫn về các khái niệm cơ bản / *Confused about basic concepts* |
| **Kỹ năng lập trình** / *Programming skill* | Mã chạy hoàn hảo, hiển thị 8 hướng chính xác, có chú thích đầy đủ / *Code runs perfectly, shows 8 directions accurately, full comments* | Mã chạy với hầu hết các hướng chính xác / *Code runs with most directions correct* | Mã chạy với 4 hướng chính / *Code works for 4 main directions* | Mã có lỗi hoặc không chạy được / *Code has errors or doesn't run* |
| **Sử dụng thiết bị** / *Device use* | Hiệu chỉnh thành công, sử dụng thành thạo, giải thích được cho người khác / *Calibrates successfully, uses proficiently, can explain to others* | Hiệu chỉnh thành công và sử dụng được / *Calibrates and uses successfully* | Hiệu chỉnh được với hướng dẫn / *Calibrates with guidance* | Cần nhiều hỗ trợ / *Needs much assistance* |
| **Hoạt động thực tế** / *Real-world activity* | Hoàn thành tìm kho báu và tự thiết kế bản đồ mới / *Completes treasure hunt and designs new map* | Hoàn thành tìm kho báu chính xác / *Completes treasure hunt accurately* | Hoàn thành với một vài lỗi định hướng / *Completes with some navigation errors* | Không hoàn thành được / *Unable to complete* |

---

## 15. Khám Phá Thêm / Further Exploration & Challenges

**Tiếng Việt — Thử thách nâng cao:**

1. 🌐 **La bàn 16 hướng:** Mở rộng chương trình để nhận biết 16 hướng (N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WNW, NW, NNW).

2. 📊 **Biểu đồ hướng:** Ghi lại hướng gió mỗi ngày trong 1 tuần và vẽ biểu đồ hoa gió (wind rose).

3. 🎮 **Trò chơi la bàn:** Lập trình trò chơi trong đó micro:bit "ra lệnh" hướng đi ngẫu nhiên và người chơi phải xoay micro:bit đúng hướng trong 3 giây.

4. 📡 **Tích hợp GPS:** Nghiên cứu cách GPS và la bàn kết hợp trong điện thoại thông minh.

5. 🗺️ **Dự án bản đồ trường:** Sử dụng micro:bit compass để đo hướng của các tòa nhà và vẽ bản đồ trường học.

*English — Advanced challenges:*

*1. 🌐 **16-direction compass:** Extend the program to recognize 16 directions (N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WNW, NW, NNW).*

*2. 📊 **Direction chart:** Record wind direction each day for 1 week and draw a wind rose diagram.*

*3. 🎮 **Compass game:** Program a game where the micro:bit commands a random direction and the player must rotate the micro:bit to the correct direction within 3 seconds.*

*4. 📡 **GPS integration:** Research how GPS and compass combine in smartphones.*

*5. 🗺️ **School map project:** Use the micro:bit compass to measure building orientations and draw a school map.*

---

## 16. Bảng Từ Vựng / Vocabulary List

| Thuật ngữ / Term | Tiếng Việt / Vietnamese | Tiếng Anh / English Definition |
|---|---|---|
| **La bàn** | Dụng cụ định hướng dùng từ trường Trái Đất | *A navigational instrument using Earth's magnetic field* |
| **Từ trường** | Vùng không gian xung quanh nam châm có lực từ tác dụng | *The region around a magnet where magnetic force acts* |
| **Cảm biến từ tính** (Magnetometer) | Thiết bị đo cường độ và hướng của từ trường | *Device that measures magnetic field strength and direction* |
| **Góc phương vị** (Heading/Bearing) | Góc đo theo chiều kim đồng hồ từ hướng Bắc (0°–360°) | *Clockwise angle measured from North (0°–360°)* |
| **Hiệu chỉnh** (Calibration) | Quá trình điều chỉnh cảm biến để đọc chính xác | *Process of adjusting a sensor for accurate readings* |
| **Độ lệch từ** (Magnetic Declination) | Góc lệch giữa Bắc Từ và Bắc Địa lý | *Angle between Magnetic North and Geographic North* |
| **Cực Bắc Từ** (Magnetic North Pole) | Điểm trên Trái Đất mà la bàn chỉ vào | *The point on Earth that compass needles point toward* |
| **Hướng chính** (Cardinal Direction) | Bốn hướng cơ bản: N, S, E, W | *The four basic directions: N, S, E, W* |
| **Hướng trung gian** (Intercardinal Direction) | Tám hướng phụ: NE, SE, SW, NW | *The four diagonal directions: NE, SE, SW, NW* |
| **Màn hình LED** (LED Matrix) | Lưới 5×5 đèn LED trên micro:bit | *5×5 grid of LEDs on the micro:bit* |
| **Nhiễu từ** (Magnetic Interference) | Sự xáo trộn từ trường do kim loại hoặc điện tử | *Disruption of the magnetic field by metals or electronics* |
| **Định hướng** (Navigation) | Kỹ năng xác định và di chuyển theo hướng mong muốn | *The skill of determining and moving in a desired direction* |

---

*Kết thúc Bài 19 / End of Lesson 19*  
*Bài tiếp theo: Bài 20 — Cảm biến kết hợp - Hệ thống cảnh báo*  
*Next: Lesson 20 — Combined Sensors - Warning System*
