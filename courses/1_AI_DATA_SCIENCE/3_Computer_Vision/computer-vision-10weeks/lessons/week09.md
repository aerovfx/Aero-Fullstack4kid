# Tuần 9: Phân vùng ảnh

## Kết quả cần đạt

- Phân biệt semantic, instance và panoptic segmentation.
- Tạo mask bằng ngưỡng màu và cải thiện mask với morphology.
- Ghép chủ thể lên nền mới bằng alpha mask.

## 1. Từ pixel đến mask

Semantic segmentation gán một lớp cho mỗi pixel; instance segmentation còn tách từng vật thể cùng lớp. Trước khi dùng mạng sâu, ta xây baseline HSV để hiểu mask và phép toán hậu xử lý.

## 2. Tạo và làm sạch mask

```python
import cv2
import numpy as np

image = cv2.imread("data/subject_green_screen.jpg")
background = cv2.imread("data/background.jpg")
if image is None or background is None:
    raise FileNotFoundError("Thiếu ảnh đầu vào")

hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
green = cv2.inRange(hsv, (35, 40, 40), (90, 255, 255))

kernel = np.ones((5, 5), np.uint8)
green = cv2.morphologyEx(green, cv2.MORPH_OPEN, kernel)
green = cv2.morphologyEx(green, cv2.MORPH_CLOSE, kernel)
subject_mask = cv2.bitwise_not(green)
```

Opening xóa đốm nhỏ; closing lấp lỗ nhỏ. Kernel quá lớn sẽ xóa chi tiết tóc hoặc ngón tay.

## 3. Ghép nền bằng alpha blending

```python
background = cv2.resize(background, (image.shape[1], image.shape[0]))
alpha = subject_mask.astype(np.float32) / 255.0
alpha = cv2.GaussianBlur(alpha, (5, 5), 0)[..., None]

foreground = image.astype(np.float32)
back = background.astype(np.float32)
composite = foreground * alpha + back * (1.0 - alpha)
composite = np.clip(composite, 0, 255).astype(np.uint8)
cv2.imwrite("output/composite.jpg", composite)
```

Làm mờ nhẹ alpha giúp đường biên tự nhiên hơn. Công thức này cũng áp dụng cho mask do U-Net, DeepLab hoặc MediaPipe tạo ra.

## 4. Đánh giá mask

Pixel accuracy có thể cao dù bỏ sót vật thể nhỏ. Nên dùng IoU hoặc Dice giữa mask dự đoán và mask chuẩn, đồng thời xem riêng từng lớp.

## Lỗi thường gặp

- Mask và ảnh khác kích thước.
- Dùng mask `0/255` trực tiếp làm alpha mà không chia 255.
- Chia tập theo frame khiến train và validation gần như giống nhau.

## Thử thách

Tạo ứng dụng thay nền webcam. Cho phép nhấn phím để đổi giữa ba nền và hiển thị FPS. Nâng cao: so sánh baseline HSV với một mô hình segmentation pretrained trong điều kiện áo màu xanh.
