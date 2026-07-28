# Tuần 1: Nhập môn Thị giác máy tính & OpenCV

## Kết quả cần đạt

Sau bài này, học viên có thể:

- Giải thích ảnh số là một ma trận điểm ảnh và phân biệt ảnh xám với ảnh màu BGR.
- Đọc, kiểm tra, hiển thị và lưu ảnh bằng OpenCV.
- Đọc webcam/video theo từng khung hình và giải phóng tài nguyên đúng cách.

## 1. Ảnh số dưới góc nhìn máy tính

Ảnh xám có dạng `(chiều cao, chiều rộng)`; mỗi phần tử thường nằm trong `[0, 255]`. Ảnh màu OpenCV có dạng `(chiều cao, chiều rộng, 3)` và lưu kênh theo thứ tự **BGR**, không phải RGB. Ví dụ, `image[20, 30]` là màu của điểm ảnh tại hàng 20, cột 30.

## 2. Cài đặt

```bash
python -m pip install opencv-python numpy
```

## 3. Đọc và lưu ảnh

```python
from pathlib import Path
import cv2

input_path = Path("data/sample.jpg")
image = cv2.imread(str(input_path))

if image is None:
    raise FileNotFoundError(f"Không đọc được ảnh: {input_path.resolve()}")

height, width, channels = image.shape
print(f"Kích thước: {width}x{height}, số kênh: {channels}")
print("Điểm ảnh góc trái (BGR):", image[0, 0])

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
Path("output").mkdir(exist_ok=True)
ok = cv2.imwrite("output/sample_gray.jpg", gray)
print("Đã lưu ảnh:", ok)
```

Luôn kiểm tra `image is None`: OpenCV thường không ném lỗi khi sai đường dẫn mà trả về `None`.

## 4. Đọc webcam theo thời gian thực

```python
import cv2

camera = cv2.VideoCapture(0)
if not camera.isOpened():
    raise RuntimeError("Không mở được webcam")

try:
    while True:
        ok, frame = camera.read()
        if not ok:
            break

        cv2.putText(frame, "Nhan Q de thoat", (20, 35),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
        cv2.imshow("Camera", frame)
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
finally:
    camera.release()
    cv2.destroyAllWindows()
```

## 5. Lỗi thường gặp

- Màu đỏ thành xanh: đã hiển thị ảnh BGR bằng thư viện mong đợi RGB; hãy đổi bằng `cv2.cvtColor(image, cv2.COLOR_BGR2RGB)`.
- Webcam không mở: thử chỉ số `1`, đóng ứng dụng đang dùng camera, kiểm tra quyền camera.
- Cửa sổ treo: vòng lặp phải gọi `cv2.waitKey(...)`.

## Thử thách cuối buổi

Viết chương trình webcam: nhấn `s` để lưu khung hình vào `output/`, nhấn `g` để chuyển qua lại giữa ảnh màu và ảnh xám, nhấn `q` để thoát. Tên ảnh không được trùng nhau.
