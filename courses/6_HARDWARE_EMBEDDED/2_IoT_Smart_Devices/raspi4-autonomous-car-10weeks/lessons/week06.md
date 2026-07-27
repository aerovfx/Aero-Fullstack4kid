# Tuần 6: Nhận Diện Biển Báo Giao Thông & Đèn Tín Hiệu (Traffic Sign & Traffic Light Recognition)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kỹ thuật nhận diện dựa trên màu sắc **Color Masking** trong không gian màu HSV để phân loại Đèn giao thông (Đỏ, Vàng, Xanh).
- Hiểu thuật toán trích xuất đường viền **OpenCV Contour Analysis** và các đặc trưng hình học (Bounding Box, Aspect Ratio, Area) để nhận diện dạng biển báo.
- Tìm hiểu mô hình phân loại mẫu **Haar Cascade Classifier** hoặc **Contour Matching** để nhận diện Biển báo Dừng (STOP Sign).
- Xây dựng luồng quyết định trạng thái xe (State Logic Engine): Dừng 3 giây khi có biển STOP hoặc Đèn đỏ, tự động chạy tiếp khi Đèn xanh.

### English
- Master HSV **Color Masking** techniques to detect and classify Traffic Light states (Red, Yellow, Green).
- Understand **OpenCV Contour Analysis** and geometric features (Bounding Box, Aspect Ratio, Area) for traffic sign detection.
- Explore **Haar Cascade Classifiers** and Contour Matching algorithms detecting STOP signs.
- Build a State Logic Engine: Pause 3 seconds at STOP signs / Red lights, automatically resume driving on Green signals.

---

## Lý Thuyết / Theory

### 1. Dải Màu HSV Cho Đèn Giao Thông & Biển Báo

#### Tiếng Việt
Trong OpenCV, giá trị Hue (H) biến thiên từ $0$ đến $180$:
- **Màu Đỏ (Red):** $H \in [0, 10] \cup [170, 180]$, $S \in [100, 255]$, $V \in [100, 255]$.
- **Màu Vàng (Yellow):** $H \in [15, 35]$, $S \in [100, 255]$, $V \in [100, 255]$.
- **Màu Xanh Lá (Green):** $H \in [40, 85]$, $S \in [100, 255]$, $V \in [100, 255]$.

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - Traffic Light & STOP Sign Recognition Engine
```python
"""
Lesson 6: Traffic Light & STOP Sign Detection via OpenCV Color Masking & Contours
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import numpy as np

def detect_traffic_light(frame):
    """Detects Red or Green Traffic Lights in the upper portion of the frame"""
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Red Color Range Mask
    lower_red1 = np.array([0, 120, 120])
    upper_red1 = np.array([10, 255, 255])
    lower_red2 = np.array([170, 120, 120])
    upper_red2 = np.array([180, 255, 255])
    mask_red = cv2.bitwise_or(cv2.inRange(hsv, lower_red1, upper_red1),
                             cv2.inRange(hsv, lower_red2, upper_red2))

    # Green Color Range Mask
    lower_green = np.array([40, 120, 120])
    upper_green = np.array([85, 255, 255])
    mask_green = cv2.inRange(hsv, lower_green, upper_green)

    # Count non-zero pixels in masks
    red_pixels = cv2.countNonZero(mask_red)
    green_pixels = cv2.countNonZero(mask_green)

    if red_pixels > 500:
        return "RED_LIGHT"
    elif green_pixels > 500:
        return "GREEN_LIGHT"
    return "UNKNOWN"

def detect_stop_sign(frame):
    """Detects Octagonal Red STOP signs using Contours & Bounding Rect Aspect Ratio"""
    hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)
    lower_red = np.array([0, 120, 100])
    upper_red = np.array([10, 255, 255])
    mask = cv2.inRange(hsv, lower_red, upper_red)

    contours, _ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    for cnt in contours:
        area = cv2.contourArea(cnt)
        if area > 1500: # Filter small noise contours
            x, y, w, h = cv2.boundingRect(cnt)
            aspect_ratio = float(w) / h

            # STOP sign aspect ratio should be approximately 1.0 (Square/Octagon)
            if 0.8 <= aspect_ratio <= 1.2:
                # Approximate polygon vertices
                approx = cv2.approxPolyDP(cnt, 0.02 * cv2.arcLength(cnt, True), True)
                if len(approx) >= 6: # Octagonal shape has 8 sides
                    return True, (x, y, w, h)
    return False, None

def main():
    cap = cv2.VideoCapture(0)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    print("[+] Traffic Sign & Signal Recognition Active! Press 'q' to quit.")

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret: break

        # Detect Traffic Light Status
        light_status = detect_traffic_light(frame[0:240, :]) # Check upper half
        
        # Detect STOP Sign
        stop_detected, bbox = detect_stop_sign(frame)

        output_frame = frame.copy()

        if light_status == "RED_LIGHT":
            cv2.putText(output_frame, "TRAFFIC LIGHT: RED (STOP!)", (20, 40),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 0, 255), 2)
        elif light_status == "GREEN_LIGHT":
            cv2.putText(output_frame, "TRAFFIC LIGHT: GREEN (GO)", (20, 40),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)

        if stop_detected:
            x, y, w, h = bbox
            cv2.rectangle(output_frame, (x, y), (x + w, y + h), (0, 0, 255), 3)
            cv2.putText(output_frame, "STOP SIGN DETECTED!", (x, y - 10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)

        cv2.imshow("RasPi 4 AV Sign Recognizer", output_frame)
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

#### Bài 6.1: Nhận Diện Đèn Giao Thông Màu Vàng (Yellow Light Detection)
Bổ sung dải màu HSV cho Đèn Vàng ($H \in [15, 35]$). Khi gặp đèn vàng, in ra cảnh báo `[WARNING] Slow Down!`.

#### Bài 6.2: Vẽ Khung Viền Bounding Box Quanh Biển Báo
Lập trình khoanh vùng khung chữ nhật màu đỏ xung quanh tất cả các biển báo giao thông tìm thấy trong khung hình.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 6.3: Bộ Máy Trạng Thái Dừng Xe Tự Động 3 Giây (3-Second Auto Pause FSM)
Xây dựng FSM: Khi phát hiện biển STOP Sign lần đầu tiên, xe tự động dừng lại 3 giây, sau đó đánh dấu biển báo đã xử lý và tiếp tục chạy bám làn.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập OpenCV (Hands-on Colab Lab)

#### Bài 6.4: Nhận Diện Biển Báo Giao Thông Trên Google Colab
Mở Google Colab, nạp bộ ảnh sa hình chứa biển STOP Sign và Đèn giao thông. Viết script OpenCV phân loại chính xác các hình ảnh.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# Traffic Light Recognition Reference Solution on Colab
import cv2
import numpy as np

# Create synthetic red traffic light image
img = np.zeros((200, 200, 3), dtype=np.uint8)
cv2.circle(img, (100, 100), 40, (0, 0, 255), -1) # Red Circle

hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
mask = cv2.inRange(hsv, np.array([0, 120, 120]), np.array([10, 255, 255]))
count = cv2.countNonZero(mask)

print(f"[TEST] Red Light Detected! Active Pixels: {count}")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Nhận Diện Biển Báo** | Giải thích sâu sắc dải màu HSV, mặt nạ Color Masking, thuật toán Contours, Aspect Ratio và máy trạng thái FSM. | Hiểu cách phân loại đèn giao thông và biển báo STOP. | Nắm được định nghĩa HSV nhưng chưa lọc được màu đỏ. | Nhận diện sai màu sắc. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Yellow Light Mask, Bounding Box, 3-Second FSM & Colab Classifier Lab). | Hoàn thành Bài 6.1 và Bài 6.2 đúng yêu cầu. | Code có lỗi dừng xe không nhả phanh. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
