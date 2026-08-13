# Tuần 8: Phát hiện vật thể với YOLO

## Kết quả cần đạt

- Phân biệt classification, detection và segmentation.
- Chạy mô hình YOLO pretrained trên ảnh/video.
- Đọc bounding box, confidence, class và đánh giá bằng IoU/mAP.

## 1. Khái niệm

Object detection trả về nhiều dự đoán dạng `(x1, y1, x2, y2, lớp, độ tin cậy)`. IoU đo phần giao chia phần hợp giữa khung dự đoán và khung thật. Non-Maximum Suppression loại các khung trùng nhau.

## 2. Cài đặt và suy luận

```bash
python -m pip install ultralytics opencv-python
```

```python
from pathlib import Path
from ultralytics import YOLO

model = YOLO("yolo11n.pt")
results = model.predict(
    source="data/street.jpg",
    conf=0.35,
    imgsz=640,
    save=False,
)

Path("output").mkdir(exist_ok=True)
for index, result in enumerate(results):
    result.save(filename=f"output/yolo_result_{index}.jpg")
    for box in result.boxes:
        class_id = int(box.cls.item())
        confidence = float(box.conf.item())
        xyxy = box.xyxy[0].tolist()
        print(model.names[class_id], f"{confidence:.2f}", xyxy)
```

Lần chạy đầu có thể tải trọng số. Dùng model nhỏ (`n`) để thử nhanh; model lớn hơn thường chính xác hơn nhưng chậm và tốn bộ nhớ.

## 3. Đếm đối tượng theo lớp

```python
from collections import Counter

counts = Counter()
for result in results:
    for box in result.boxes:
        counts[model.names[int(box.cls.item())]] += 1
print(dict(counts))
```

Đếm từng frame video không đồng nghĩa với đếm vật thể duy nhất. Muốn vậy cần tracking và ID ổn định qua thời gian.

## 4. Chuẩn dữ liệu tự huấn luyện

Mỗi ảnh cần file nhãn YOLO tương ứng: `class x_center y_center width height`, các tọa độ được chuẩn hóa về `[0, 1]`. Chia train/validation theo nguồn quay để tránh các frame gần giống nằm ở hai tập.

## Thử thách

Chạy cùng một video với `conf=0.25`, `0.5`, `0.75`; đo số detection và FPS. Giải thích ngưỡng nào phù hợp cho cảnh báo an toàn và ngưỡng nào phù hợp cho thống kê ít báo giả.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.
