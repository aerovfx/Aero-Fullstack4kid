# Tuần 2: Xử lý ảnh cơ bản

## Kết quả cần đạt

- Truy cập vùng ảnh bằng slicing NumPy.
- Resize đúng tỉ lệ, cắt ảnh theo ROI và chuyển đổi BGR, RGB, Gray, HSV.
- Tách vật thể theo màu bằng mặt nạ nhị phân.

## 1. Tọa độ ảnh và ROI

OpenCV truy cập ảnh theo `image[y, x]`, tức là hàng trước, cột sau. Một ROI từ `(x1, y1)` đến `(x2, y2)` được lấy bằng `image[y1:y2, x1:x2]`; biên phải và dưới không được tính.

```python
import cv2

image = cv2.imread("data/sample.jpg")
if image is None:
    raise FileNotFoundError("Thiếu data/sample.jpg")

h, w = image.shape[:2]
center_crop = image[h // 4: 3 * h // 4, w // 4: 3 * w // 4]
cv2.imwrite("output/center_crop.jpg", center_crop)
```

## 2. Resize không làm méo ảnh

```python
target_width = 640
scale = target_width / image.shape[1]
target_height = round(image.shape[0] * scale)
resized = cv2.resize(image, (target_width, target_height),
                     interpolation=cv2.INTER_AREA)
```

`INTER_AREA` phù hợp khi thu nhỏ; `INTER_LINEAR` là lựa chọn mặc định tốt khi phóng to vừa phải.

## 3. Tách màu trong không gian HSV

HSV tách sắc độ khỏi độ sáng nên thường ổn định hơn BGR khi tìm màu. Ví dụ sau tìm vùng màu xanh lá:

```python
import cv2
import numpy as np

image = cv2.imread("data/sample.jpg")
hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

lower_green = np.array([35, 50, 50], dtype=np.uint8)
upper_green = np.array([85, 255, 255], dtype=np.uint8)
mask = cv2.inRange(hsv, lower_green, upper_green)
green_only = cv2.bitwise_and(image, image, mask=mask)

cv2.imwrite("output/green_mask.png", mask)
cv2.imwrite("output/green_only.jpg", green_only)
```

## 4. Thực hành tổng hợp

1. Đọc ảnh và in kích thước.
2. Thu ảnh về chiều rộng 640 px mà không đổi tỉ lệ.
3. Chọn ROI bằng slicing.
4. Đổi ROI sang HSV, tạo mặt nạ màu.
5. Lưu cả ảnh gốc, ROI, mask và kết quả để so sánh.

## Lỗi thường gặp

- Nhầm `(x, y)` với `[y, x]` làm cắt sai vùng.
- Truyền kích thước cho `resize` theo `(height, width)`; OpenCV cần `(width, height)`.
- Ngưỡng HSV cố định không làm việc ở mọi điều kiện sáng; nên thử trackbar hoặc lấy mẫu nhiều ảnh.

## Thử thách

Tạo bộ đếm số điểm ảnh thuộc màu đã chọn và hiển thị phần trăm diện tích vật thể. Nâng cao: dùng trackbar để điều chỉnh sáu ngưỡng HSV theo thời gian thực.
