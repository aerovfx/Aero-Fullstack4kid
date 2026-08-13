# Tuần 4: Thị Giác Máy Tính OpenCV - Tiền Xử Lý Ảnh & Cắt Vùng Quan Tâm (OpenCV Image Pipeline & ROI)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc ma trận điểm ảnh (Pixel Matrix) và các **Không gian màu (Color Spaces)** trong OpenCV: BGR, Gray (Xám), HSV (Hue-Saturation-Value).
- Sử dụng thuật toán làm mịn ảnh **Gaussian Blur** để loại bỏ nhiễu nhiễu hạt trước khi xử lý.
- Hiểu và triển khai thuật toán tách biên **Canny Edge Detection** để phát hiện rìa vạch kẻ đường.
- Cắt và trích xuất **Vùng quan tâm (Region of Interest - ROI)** mặt đường để loại bỏ các chi tiết không cần thiết ngoài sa hình.

### English
- Master pixel matrix representations and **Color Spaces** in OpenCV: BGR, Grayscale, and HSV.
- Apply **Gaussian Blur** filtering algorithms to eliminate image noise prior to edge detection.
- Understand and implement **Canny Edge Detection** algorithms to extract lane boundary edges.
- Crop and isolate **Region of Interest (ROI)** road segments to filter out background clutter.

---

## Lý Thuyết / Theory

### 1. Quy Trình Tiền Xử Lý Ảnh Dò Vạch Đường (Image Processing Pipeline)

```text
 [ Input Frame (BGR) ] ───► [ Convert Gray / HSV ] ───► [ Gaussian Blur (5x5) ]
                                                                 │
                                                                 ▼
 [ Crop ROI (Lower 40%) ] ◄─── [ Binary Mask / Threshold ] ◄─── [ Canny Edge Detector ]
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - OpenCV Lane Edge Extraction & ROI Cropping Pipeline
```python
"""
Lesson 4: OpenCV Image Processing Pipeline for Autonomous Lane Detection
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import numpy as np

def process_lane_frame(frame):
    """Pre-processes input camera frame for lane detection"""
    # Step 1: Convert BGR to Grayscale
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Step 2: Apply Gaussian Blur (5x5 kernel) to reduce noise
    blurred = cv2.GaussianBlur(gray, (5, 5), 0)

    # Step 3: Apply Canny Edge Detection (Thresholds: 50, 150)
    edges = cv2.Canny(blurred, 50, 150)

    # Step 4: Define Region of Interest (ROI) Mask - Lower 40% of image
    height, width = frame.shape[:0], frame.shape[1]
    height = frame.shape[0]

    # Create polygon mask for the road area ahead
    mask = np.zeros_like(edges)
    polygon = np.array([[
        (0, int(height * 0.6)),
        (width, int(height * 0.6)),
        (width, height),
        (0, height)
    ]], np.int32)

    cv2.fillPoly(mask, polygon, 255)
    
    # Step 5: Bitwise AND to crop ROI
    cropped_edges = cv2.bitwise_and(edges, mask)
    
    return gray, edges, cropped_edges

def main():
    cap = cv2.VideoCapture(0)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    print("[+] OpenCV Lane Image Pipeline Active! Press 'q' to quit.")

    while cap.isOpened():
        ret, frame = cap.read()
        if not ret: break

        gray, edges, cropped_edges = process_lane_frame(frame)

        # Display raw vs processed ROI edges
        cv2.imshow("Raw Frame", frame)
        cv2.imshow("Canny Edges", edges)
        cv2.imshow("Cropped ROI Edges", cropped_edges)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 4.1: Tinh Chỉnh Ngưỡng Canny Edge bằng Trackbar
Viết script Python `canny_tuner.py` sử dụng thanh trượt OpenCV Trackbar cho phép tinh chỉnh động 2 ngưỡng `Threshold1` ($0-255$) và `Threshold2` ($0-255$) thời gian thực.

#### Bài 4.2: Cắt Mặt Nạ Hình Thang (Trapezoidal ROI Mask)
Viết hàm Python cắt vùng ROI dạng hình thang (Trapezoid) tập trung vào phần đường quy chiếu phía trước xe tự hành.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 4.3: Tách Vạch Kẻ Đường Màu Vàng & Trắng Trong Không Gian HSV
Lập trình lọc vạch đường màu vàng (Yellow Lane) và màu trắng (White Lane) kết hợp không gian màu HSV và phép toán Bitwise OR.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập OpenCV (Hands-on Colab Lab)

#### Bài 4.4: Xử Lý Chuỗi Video Sa Hình Đua Trên Google Colab
Mở Google Colab, viết script OpenCV nạp 1 video sa hình đua thực tế và xuất ra video mới chỉ chứa các biên đường trong vùng ROI.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# OpenCV ROI Pipeline Reference Solution on Colab
import cv2
import numpy as np

# Create synthetic road image
img = np.zeros((480, 640, 3), dtype=np.uint8)
# Draw white and yellow lane lines
cv2.line(img, (100, 480), (280, 280), (255, 255, 255), 10)
cv2.line(img, (540, 480), (360, 280), (0, 255, 255), 10)

gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
edges = cv2.Canny(gray, 50, 150)

print("[+] Road Synthetic Frame Processed successfully!")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Thị Giác Máy Tính** | Giải thích sâu sắc không gian BGR/HSV, toán tử Canny Edge, ma trận lọc Gaussian và thuật toán cắt vùng ROI. | Hiểu quy trình tiền xử lý ảnh và lọc biên Canny. | Nắm được định nghĩa OpenCV nhưng chưa cắt được ROI. | Không load được thư viện OpenCV. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Canny Trackbar, Trapezoid ROI, HSV Yellow/White Mask & Colab Video Pipeline Lab). | Hoàn thành Bài 4.1 và Bài 4.2 đúng yêu cầu. | Code có lỗi chọn sai vùng ROI làm mất vạch kẻ đường. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
