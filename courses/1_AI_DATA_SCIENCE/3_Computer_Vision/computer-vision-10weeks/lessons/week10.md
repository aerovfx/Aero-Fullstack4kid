# Tuần 10: Hand Tracking & đồ án cuối khóa

## Kết quả cần đạt

- Lấy landmark bàn tay theo thời gian thực bằng MediaPipe.
- Chuyển tọa độ chuẩn hóa sang pixel và dùng landmark để tạo tương tác.
- Thiết kế đồ án có tiêu chí đánh giá, kiểm thử và demo rõ ràng.

## 1. Cài đặt

```bash
python -m pip install mediapipe opencv-python
```

## 2. Điều khiển con trỏ ảo bằng đầu ngón trỏ

Ví dụ dưới đây chỉ vẽ con trỏ trong cửa sổ video, không điều khiển chuột hệ điều hành nên an toàn để thử nghiệm.

```python
import cv2
import mediapipe as mp

hands_module = mp.solutions.hands
drawing = mp.solutions.drawing_utils
camera = cv2.VideoCapture(0)

with hands_module.Hands(
    static_image_mode=False,
    max_num_hands=1,
    min_detection_confidence=0.6,
    min_tracking_confidence=0.6,
) as hands:
    try:
        while camera.isOpened():
            ok, frame = camera.read()
            if not ok:
                break

            frame = cv2.flip(frame, 1)
            rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            result = hands.process(rgb)

            if result.multi_hand_landmarks:
                hand = result.multi_hand_landmarks[0]
                h, w = frame.shape[:2]
                tip = hand.landmark[hands_module.HandLandmark.INDEX_FINGER_TIP]
                x, y = int(tip.x * w), int(tip.y * h)
                cv2.circle(frame, (x, y), 16, (0, 255, 255), -1)
                drawing.draw_landmarks(frame, hand, hands_module.HAND_CONNECTIONS)

            cv2.imshow("Hand tracking", frame)
            if cv2.waitKey(1) & 0xFF == ord("q"):
                break
    finally:
        camera.release()
        cv2.destroyAllWindows()
```

Tọa độ landmark được chuẩn hóa trong khoảng gần `[0, 1]`. Khi webcam đã lật ngang, tọa độ hiển thị và chuyển động tay sẽ trực quan hơn.

## 3. Gợi ý đồ án

- Điều khiển game bằng cử chỉ: nhận biết trỏ, nắm tay, giơ hai ngón.
- Trợ lý đọc cảnh: detection vật thể và phát âm cảnh báo.
- Phân loại rác: camera nhận dạng và gợi ý thùng phù hợp.
- Camera riêng tư: phát hiện rồi làm mờ mặt theo thời gian thực.

## 4. Tiêu chí nghiệm thu (100 điểm)

- 20 điểm: bài toán, người dùng và phạm vi được mô tả rõ.
- 25 điểm: pipeline dữ liệu/mô hình chạy ổn định và mã nguồn dễ đọc.
- 20 điểm: đánh giá bằng metric và ít nhất ba tình huống khó.
- 15 điểm: xử lý lỗi đầu vào, camera và tài nguyên.
- 10 điểm: cân nhắc quyền riêng tư, thiên lệch và giới hạn.
- 10 điểm: README, hướng dẫn chạy và video/demo.

## Checklist trước khi demo

Khóa phiên bản thư viện, thử trên máy khác, chuẩn bị video dự phòng, không phụ thuộc đường dẫn tuyệt đối, hiển thị FPS/độ tin cậy, và nói rõ trường hợp hệ thống chưa xử lý tốt.

## Thử thách cuối khóa

Hoàn thiện một đồ án theo nhóm 2–3 người. Nộp mã nguồn, README, dữ liệu mẫu hợp lệ, bảng kết quả đánh giá và video demo 2–4 phút. Mỗi thành viên phải giải thích được một quyết định kỹ thuật và một giới hạn của sản phẩm.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
