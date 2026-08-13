# Tuần 4: Phát hiện khuôn mặt với Haar Cascades

## Kết quả cần đạt

- Phân biệt phát hiện (detection) và nhận dạng (recognition) khuôn mặt.
- Dùng bộ phân loại Haar có sẵn của OpenCV trên ảnh và webcam.
- Điều chỉnh `scaleFactor`, `minNeighbors`, `minSize` để cân bằng bỏ sót và báo giả.

## 1. Nguyên lý ngắn gọn

Haar Cascade quét nhiều cửa sổ ở nhiều tỉ lệ và dùng chuỗi bộ phân loại để loại nhanh vùng không giống khuôn mặt. Nó nhẹ, chạy CPU tốt nhưng kém ổn định với mặt nghiêng, che khuất hoặc ánh sáng xấu.

## 2. Phát hiện trên webcam

```python
import cv2

model_path = cv2.data.haarcascades + "haarcascade_frontalface_default.xml"
detector = cv2.CascadeClassifier(model_path)
if detector.empty():
    raise RuntimeError("Không tải được Haar Cascade")

camera = cv2.VideoCapture(0)
try:
    while camera.isOpened():
        ok, frame = camera.read()
        if not ok:
            break

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        gray = cv2.equalizeHist(gray)
        faces = detector.detectMultiScale(
            gray,
            scaleFactor=1.1,
            minNeighbors=5,
            minSize=(60, 60),
        )

        for x, y, w, h in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)
        cv2.putText(frame, f"Faces: {len(faces)}", (20, 35),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
        cv2.imshow("Face detector", frame)
        if cv2.waitKey(1) & 0xFF == ord("q"):
            break
finally:
    camera.release()
    cv2.destroyAllWindows()
```

## 3. Hiểu tham số

- `scaleFactor` gần 1 chính xác hơn nhưng chậm hơn.
- `minNeighbors` lớn giảm báo giả nhưng có thể bỏ sót.
- `minSize` bỏ qua các vùng quá nhỏ và tăng tốc.

## 4. Đánh giá thay vì chỉ “nhìn thấy chạy”

Chuẩn bị 20 ảnh có mặt và 10 ảnh không có mặt. Ghi `TP` (phát hiện đúng), `FP` (báo nhầm), `FN` (bỏ sót), sau đó tính `precision = TP/(TP+FP)` và `recall = TP/(TP+FN)`.

## Quyền riêng tư

Chỉ dùng ảnh/webcam khi người tham gia đồng ý. Không lưu khuôn mặt mặc định; nếu cần lưu để học tập, công bố mục đích, thời hạn lưu và cách xóa.

## Thử thách

Làm mờ vùng mặt bằng `cv2.GaussianBlur` thay vì vẽ khung. So sánh kết quả khi mặt nghiêng, đeo khẩu trang và ánh sáng yếu; ghi lại ba giới hạn của Haar Cascade.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 04](../code/week04/README.md), học lần lượt từ `01_...` đến `20_...`.
