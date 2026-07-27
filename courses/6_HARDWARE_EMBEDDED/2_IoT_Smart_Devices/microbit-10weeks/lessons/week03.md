# Tuần 3: Cảm Biến Môi Trường, Độ Ẩm Đất & Siêu Âm HC-SR04 (Environmental Sensors & Crowtail IO)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Khám phá các cảm biến môi trường nhúng trên micro:bit: **Cảm biến nhiệt độ CPU** và **Cảm biến ánh sáng ma trận LED**.
- Nắm vững nguyên lý hoạt động của các cảm biến trong bộ **Elecrow Crowtail STEAM Kit**: Cảm biến độ ẩm đất dung kháng (Capacitive Soil Moisture Sensor) và Cảm biến siêu âm HC-SR04.
- Hiểu khái niệm **Hiệu chuẩn cảm biến (Sensor Calibration)**: Đo các giá trị cực đại/cực tiểu thực tế để chuyển đổi giá trị thô thành phần trăm ($\%$ độ ẩm) hoặc centimet ($\text{cm}$ khoảng cách).
- Thực hành lập trình trạm cảnh báo thời tiết và thiết bị kiểm tra độ ẩm chậu cây.

### English
- Explore built-in environmental sensors: **CPU Temperature Sensor** and **LED Matrix Light Level Sensor**.
- Master **Elecrow Crowtail STEAM Kit** external sensors: Capacitive Soil Moisture Sensor and HC-SR04 Ultrasonic Ranging Sensor.
- Master **Sensor Calibration** techniques: Mapping raw ADC data into real-world percentages ($\%$ soil moisture) and distance units ($\text{cm}$).
- Practice programming automated weather stations and plant moisture monitors.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Đọc Ánh Sáng Ma Trận LED & Cảm Biến Độ Ẩm Đất Dung Kháng

#### Tiếng Việt
- **Cảm biến ánh sáng LED:** Các đèn LED trên ma trận $5 \times 5$ được sử dụng luân phiên làm cảm biến phát quang ngược. Điện áp nạp trên các LED giảm dần tùy thuộc vào cường độ ánh sáng chiếu vào (Trả về giá trị $0 - 255$).
- **Cảm biến độ ẩm đất dung kháng (Capacitive Moisture Sensor):** Đo hằng số điện môi của đất mà không làm han gỉ điện cực.
  - Khi đất khô hoàn toàn: $V_{\text{raw}} \approx 800 - 900$ (Mức ADC cao).
  - Khi đất ngập nước: $V_{\text{raw}} \approx 300 - 400$ (Mức ADC thấp).
  - Công thức ánh xạ phần trăm độ ẩm đất:
    $$\text{Soil Moisture (\%)} = \text{map}(V_{\text{raw}}, \text{DryValue}, \text{WetValue}, 0, 100)$$

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: MicroPython - Calibrated Soil Moisture & Temperature Monitor
```python
# MicroPython Code for BBC micro:bit v2
# Lesson 3: Calibrated Soil Moisture & Environment Station

from microbit import *

# Calibration constants (Update after measuring your soil)
DRY_SOIL_ADC = 850
WET_SOIL_ADC = 350

def get_soil_moisture_percent():
    # Read Analog raw value from Pin 0 (Crowtail Moisture Sensor)
    raw_val = pin0.read_analog()
    
    # Constrain raw value within calibrated bounds
    constrained_val = max(min(raw_val, DRY_SOIL_ADC), WET_SOIL_ADC)
    
    # Linear interpolation mapping to 0 - 100%
    moisture_pct = (DRY_SOIL_ADC - constrained_val) * 100 / (DRY_SOIL_ADC - WET_SOIL_ADC)
    return int(moisture_pct)

while True:
    temp_c = temperature()
    light_lvl = display.read_light_level()
    moisture = get_soil_moisture_percent()

    if button_a.is_pressed():
        display.scroll("Temp: " + str(temp_c) + "C")
    elif button_b.is_pressed():
        display.scroll("Soil: " + str(moisture) + "%")
    else:
        # Display soil status icon
        if moisture < 30:
            display.show(Image.SAD) # Soil too dry!
        else:
            display.show(Image.HAPPY) # Soil moisture healthy
            
    sleep(200)
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 3.1: Đèn Ngủ Tự Động Theo Ánh Sáng Môi Trường (Smart Night Light)
Viết chương trình đọc mức ánh sáng `display.read_light_level()`.
- Khi ánh sáng quá tối ($< 50$), bật sáng toàn bộ 25 đèn LED ma trận $5 \times 5$.
- Khi trời sáng ($> 100$), tắt toàn bộ đèn LED.

#### Bài 3.2: Thước Đo Khoảng Cách Siêu Âm HC-SR04 Crowtail
Lập trình chân `P1` và `P2` kết nối cảm biến siêu âm Crowtail. Đo khoảng cách và hiển thị số cm trên ma trận LED khi nhấn `Button A`.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 3.3: Hệ Thống Cảnh Báo Tưới Cây Tự Động (Smart Plant Moisture Alert)
Viết script MicroPython đo độ ẩm đất chậu cây qua chân `P0`:
- Nếu độ ẩm $< 25\%$, nhấp nháy ma trận LED hình biểu tượng giọt nước và phát tiếng bíp cảnh báo qua loa.
- Tự động ghi nhận giá trị cực đại và cực tiểu trong ngày vào biến lưu trữ.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập MakeCode (Hands-on MakeCode Lab)

#### Bài 3.4: Trạm Thời Tiết Đa Cảm Biến Trên MakeCode Simulator
Mở MakeCode Simulator, lắp mạch micro:bit + Sonar Extension (HC-SR04) + Moisture Sensor. Lập trình hiển thị thông số tổng hợp môi trường lên màn hình.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab MakeCode / Colab (Lab Reference Solution)

```python
# MakeCode Python Reference Solution for Weather Station
def on_forever():
    temp = input.temperature()
    light = input.light_level()
    basic.show_string("T:" + str(temp) + " L:" + str(light))
    basic.pause(2000)

basic.forever(on_forever)
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Cảm Biến Môi Trường** | Giải thích sâu sắc nguyên lý đọc ánh sáng ma trận LED, cảm biến dung kháng, công thức hiệu chuẩn và siêu âm. | Hiểu cách đọc nhiệt độ, ánh sáng và cảm biến độ ẩm đất. | Nắm được định nghĩa cảm biến nhưng chưa hiệu chuẩn được dữ liệu. | Đọc sai chân tín hiệu. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Smart Night Light, Ultrasonic Ruler, Plant Alert & MakeCode Lab). | Hoàn thành Bài 3.1 và Bài 3.2 đúng yêu cầu. | Code có lỗi hiển thị giá trị âm hoặc đo khoảng cách sai. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - BBC micro:bit Applied STEM 10 Weeks)*
