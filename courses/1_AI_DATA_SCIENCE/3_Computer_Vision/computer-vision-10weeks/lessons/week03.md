# Tuần 3: Lọc ảnh & nhận diện biên

## Kết quả cần đạt

- Phân biệt blur trung bình, Gaussian và median.
- Dùng Sobel để quan sát gradient và Canny để tạo bản đồ biên.
- Giải thích vì sao cần khử nhiễu trước khi tìm biên.

## 1. Từ nhiễu đến biên

Biên là nơi cường độ sáng thay đổi mạnh. Nhiễu cũng tạo ra thay đổi mạnh, vì vậy pipeline phổ biến là: **ảnh màu → ảnh xám → khử nhiễu → gradient/biên**.

```python
import cv2

image = cv2.imread("data/sample.jpg")
if image is None:
    raise FileNotFoundError("Thiếu data/sample.jpg")

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5, 5), sigmaX=0)
edges = cv2.Canny(blurred, threshold1=50, threshold2=150)
cv2.imwrite("output/edges.png", edges)
```

Kernel Gaussian phải có kích thước lẻ. Ngưỡng thấp nối các biên yếu với biên mạnh; ngưỡng cao chọn biên chắc chắn.

## 2. So sánh Sobel theo hai hướng

```python
import cv2

sobel_x = cv2.Sobel(blurred, cv2.CV_64F, 1, 0, ksize=3)
sobel_y = cv2.Sobel(blurred, cv2.CV_64F, 0, 1, ksize=3)

abs_x = cv2.convertScaleAbs(sobel_x)
abs_y = cv2.convertScaleAbs(sobel_y)
gradient = cv2.addWeighted(abs_x, 0.5, abs_y, 0.5, 0)
cv2.imwrite("output/sobel_gradient.png", gradient)
```

Sobel X phản ứng mạnh với biên dọc; Sobel Y phản ứng mạnh với biên ngang. `CV_64F` giữ được gradient âm trước khi chuyển về ảnh 8-bit.

## 3. Đoạn mã thử nhiều mức ngưỡng

```python
for low in (30, 60, 90):
    high = low * 3
    result = cv2.Canny(blurred, low, high)
    cv2.imwrite(f"output/canny_{low}_{high}.png", result)
```

Đừng chọn ngưỡng chỉ dựa vào một ảnh. Hãy thử trên ảnh sáng, tối và có nhiễu rồi ghi lại cặp ngưỡng ổn định nhất.

## Lỗi thường gặp

- Canny trực tiếp trên ảnh màu hoặc ảnh nhiễu tạo quá nhiều đường giả.
- Blur quá mạnh làm mất chi tiết nhỏ.
- Ép Sobel thẳng về `uint8` làm mất gradient âm.

## Thử thách

Xây dựng “máy quét tài liệu”: tìm biên, lấy contour lớn nhất có bốn góc, sau đó vẽ bốn góc lên ảnh gốc. Nâng cao: biến đổi phối cảnh để đưa tài liệu về hình chữ nhật nhìn từ trên xuống.
