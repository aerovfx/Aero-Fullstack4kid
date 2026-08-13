# Tuần 5: Thuật Toán Dò Vạch Làn Đường & Bộ Điều Khiển Bẻ Lái PID (Hough Lines & PID Lane Keeping)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nguyên lý toán học của thuật toán **Biến đổi Hough Lines (Hough Line Transform)** để phát hiện các đoạn thẳng vạch kẻ đường từ ảnh biên Canny.
- Phân loại vạch làn đường bên Trái ($m < 0$) và vạch làn đường bên Phải ($m > 0$) dựa trên hệ số góc (Slope $m = \frac{y_2 - y_1}{x_2 - x_1}$).
- Tính toán **Độ lệch tâm (Centerline Error)** giữa vị trí trung tâm xe và vị trí trung tâm làn đường thực tế.
- Triển khai **Bộ điều khiển Phản hồi Tỷ lệ P / PID (Proportional Steering Controller)** tự động điều chỉnh góc bẻ lái Servo mượt mà.

### English
- Master the mathematical principles of the **Hough Line Transform** detecting linear lane segments from Canny edge maps.
- Classify Left lane boundaries ($m < 0$) vs Right lane boundaries ($m > 0$) based on line slope ($m = \frac{y_2 - y_1}{x_2 - x_1}$).
- Calculate **Centerline Error** offset between camera center and actual lane midpoint.
- Implement a **Proportional (P / PID) Steering Controller** driving front wheel servos smoothly.

---

## Lý Thuyết / Theory

### 1. Công Thức Tính Độ Lệch Tâm & Bộ Điều Khiển Bẻ Lái Tỷ Lệ (Proportional Steering)

#### Tiếng Việt
Cho $X_{\text{camera}} = \frac{W}{2} = 320$ (Vị trí trung tâm ảnh $640 \times 480$).
Cho $X_{\text{lane\_center}} = \frac{X_{\text{left\_lane}} + X_{\text{right\_lane}}}{2}$ (Trung tâm làn đường thực tế).

- **Độ lệch tâm (Error $e$):**
  $$e = X_{\text{lane\_center}} - X_{\text{camera}}$$

- **Góc bẻ lái Servo ($\theta_{\text{steer}}$):**
  $$\theta_{\text{steer}} = 90^\circ + K_p \cdot e$$

Trong đó $K_p \approx 0.15 - 0.25$ là hệ số Tỷ lệ (Proportional Gain).

```text
       [ Left Lane: X_left ] ────────── [ Lane Center ] ────────── [ Right Lane: X_right ]
                                              │
                                              ├────── ( Error e ) ──────┤
                                              │                         │
                                     [ Target Center ]          [ Camera Center ]
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - Complete Hough Lines Lane Keeping & Steering Control Engine
```python
"""
Lesson 5: Hough Lines Lane Keeping & Proportional Steering Controller
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import numpy as np

# Proportional Controller Gain
KP = 0.18
STEERING_CENTER = 90 # Servo 90 deg = Straight

def detect_lane_lines(frame, edges):
    height, width = frame.shape[:2]
    camera_center = width // 2

    # Hough Line Transform (rho=1, theta=1 deg, threshold=20, minLineLength=20, maxLineGap=50)
    lines = cv2.HoughLinesP(edges, 1, np.pi/180, 20, minLineLength=20, maxLineGap=50)

    left_lines = []
    right_lines = []

    if lines is not None:
        for line in lines:
            x1, y1, x2, y2 = line[0]
            if x2 - x1 == 0: continue # Skip vertical lines to prevent zero division
            slope = (y2 - y1) / (x2 - x1)

            # Filter noise slopes (Ignore horizontal-ish lines)
            if abs(slope) < 0.3: continue

            if slope < 0: # Left Lane (Negative slope in image coordinates)
                left_lines.append(line[0])
            else:         # Right Lane (Positive slope in image coordinates)
                right_lines.append(line[0])

    # Calculate average X position of left and right lanes at lower frame
    y_eval = int(height * 0.8)
    
    x_left = 100 # Default fallback left
    x_right = width - 100 # Default fallback right

    if left_lines:
        x_left = int(np.mean([l[0] for l in left_lines]))
    if right_lines:
        x_right = int(np.mean([l[0] for l in right_lines]))

    lane_center = (x_left + x_right) // 2
    error = lane_center - camera_center

    # Calculate Proportional Steering Angle
    steering_angle = STEERING_CENTER + (KP * error)
    steering_angle = max(45, min(135, steering_angle)) # Clamp between 45 and 135 deg

    # Visualize Lanes and Center Offset on Frame
    output_frame = frame.copy()
    cv2.line(output_frame, (x_left, height), (x_left, y_eval), (255, 0, 0), 5)
    cv2.line(output_frame, (x_right, height), (x_right, y_eval), (0, 0, 255), 5)
    cv2.circle(output_frame, (lane_center, y_eval), 10, (0, 255, 0), -1)
    cv2.circle(output_frame, (camera_center, y_eval), 10, (255, 255, 0), -1)

    cv2.putText(output_frame, f"Error: {error} px | Steer: {steering_angle:.1f} deg",
                (20, 40), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 255), 2)

    return output_frame, steering_angle

def main():
    cap = cv2.VideoCapture(0)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    print("[+] Hough Lines Autonomous Steering Active! Press 'q' to quit.")

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret: break

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        blurred = cv2.GaussianBlur(gray, (5, 5), 0)
        edges = cv2.Canny(blurred, 50, 150)

        # ROI Masking
        h, w = frame.shape[:2]
        mask = np.zeros_like(edges)
        cv2.rectangle(mask, (0, int(h * 0.5)), (w, h), 255, -1)
        roi_edges = cv2.bitwise_and(edges, mask)

        annotated_frame, steer = detect_lane_lines(frame, roi_edges)

        cv2.imshow("RasPi 4 Lane Steering Engine", annotated_frame)
        if cv2.waitKey(1) & 0xFF == ord('q'): break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 5.1: Tinh Chỉnh Hệ Số Tỷ Lệ $K_p$ (Proportional Gain Tuning)
Thử nghiệm thay đổi các giá trị $K_p \in [0.05, 0.15, 0.30, 0.50]$ trên sa hình thực tế. Đánh giá hiện tượng xe bị bẻ lái chậm (Under-steering) hoặc lắc lư quá đà (Oscillation).

#### Bài 5.2: Xử Lý Ngoại Lệ Khi Mất Vạch Làn Đường (Single-Lane Fallback)
Cải tiến thuật toán: Khi mất vạch trái (chỉ thấy vạch phải), xe tự động ước lượng vị trí vạch trái bằng cách trừ đi $300\,\text{pixels}$ chiều rộng làn đường chuẩn.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 5.3: Bộ Điều Khiển Khâu Dẫn (PD Steering Controller)
Bổ sung khâu Vi phân (Derivative $D$) vào bộ điều khiển bẻ lái ($u = K_p \cdot e + K_d \cdot \frac{de}{dt}$) để dập tắt hiện tượng lắc lư khung xe khi đi vào đường cong gấp.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập OpenCV (Hands-on Colab Lab)

#### Bài 5.4: Giả Lập Thuật Toán Bám Làn Đường Trực Quan Trên Google Colab
Mở Google Colab, nạp 1 video sa hình thực tế và xuất ra video kết quả có vẽ đường trung tâm làn đường và giá trị góc bẻ lái Servo thời gian thực.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# OpenCV Lane Steering Reference Solution on Colab
import cv2
import numpy as np

# Create synthetic road with off-center lane
img = np.zeros((480, 640, 3), dtype=np.uint8)
cv2.line(img, (150, 480), (250, 250), (255, 255, 255), 8) # Left
cv2.line(img, (550, 480), (450, 250), (255, 255, 255), 8) # Right

camera_center = 320
lane_center = (150 + 550) // 2 # 350 px
error = lane_center - camera_center # +30 px
steer_angle = 90 + 0.2 * error # 96 deg

print(f"[SIMULATION] Error: {error} px | Calculated Steering Angle: {steer_angle} deg")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Dò Vạch & Bộ Điều Khiển** | Giải thích sâu sắc thuật toán Hough Lines, phân loại hệ số góc Slope $m$, công thức độ lệch tâm và bộ điều khiển PID bẻ lái. | Hiểu cách phát hiện vạch đường và tính góc bẻ lái Servo. | Nắm được định nghĩa Hough Lines nhưng chưa tính được độ lệch. | Xe bị lao ra khỏi sa hình. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Kp Tuning, Single-Lane Fallback, PD Steering & Colab Simulation Lab). | Hoàn thành Bài 5.1 và Bài 5.2 đúng yêu cầu. | Code có lỗi góc bẻ lái vượt quá giới hạn vật lý Servo. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
