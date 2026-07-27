# Tuần 8: Trí Tuệ Nhân Tạo Nhúng Edge AI & Mạng Nơ-ron CNN Tự Lái (Edge AI & Deep Learning Driving)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững khái niệm **Edge AI (Trí tuệ nhân tạo trên thiết bị biên)**: Chạy suy luận mạng nơ-ron học sâu trực tiếp trên phần cứng vi xử lý Raspberry Pi 4.
- Hiểu kiến trúc mạng **Mạng Nơ-ron Cuộn (Convolutional Neural Network - CNN)** học theo hành vi lái của con người (**Behavioral Cloning**).
- Thu thập tập dữ liệu ghi nhật ký hình ảnh và góc bẻ lái ($10,000+$ mẫu ảnh) để huấn luyện mô hình AI trên Google Colab.
- Đóng gói mô hình định dạng **TensorFlow Lite (`.tflite`)** và chạy suy luận bám làn đường tự động thời gian thực.

### English
- Master **Edge AI** concepts: Executing deep learning neural network inference directly on Raspberry Pi 4 edge hardware.
- Understand **Convolutional Neural Network (CNN)** architectures trained via **Behavioral Cloning**.
- Collect image and steering telemetry datasets ($10,000+$ samples) for training on Google Colab.
- Export **TensorFlow Lite (`.tflite`)** models and execute real-time autonomous lane-keeping inference.

---

## Lý Thuyết / Theory

### 1. Quy Trình Huấn Luyện Mạng Nơ-ron Tự Lái Behavioral Cloning

```text
 ┌────────────────┐      ┌────────────────┐      ┌────────────────┐      ┌────────────────┐
 │ DATA LOGGING   │ ───► │ COLAB TRAINING │ ───► │ TFLITE EXPORT  │ ───► │ EDGE INFERENCE │
 │ (Images + Steer│      │ CNN Model      │      │ (Quantized)    │      │ (Raspberry Pi 4│
 └────────────────┘      └────────────────┘      └────────────────┘      └────────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - TensorFlow Lite Edge AI Inference Engine on Raspberry Pi 4
```python
"""
Lesson 8: TensorFlow Lite Edge AI Autonomous Steering Engine
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import cv2
import time
import numpy as np

# Import lightweight TensorFlow Lite runtime
try:
    import tflite_runtime.interpreter as tflite
except ImportError:
    import tensorflow.lite as tflite

MODEL_PATH = "models/lane_navigation_model.tflite"

def load_tflite_model(model_path):
    interpreter = tflite.Interpreter(model_path=model_path)
    interpreter.allocate_tensors()
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()
    return interpreter, input_details, output_details

def predict_steering_angle(interpreter, input_details, output_details, img_frame):
    # Pre-process image to match CNN model input shape (e.g., 66x200 RGB normalized)
    resized = cv2.resize(img_frame, (200, 66))
    normalized = (resized / 255.0).astype(np.float32)
    input_data = np.expand_dims(normalized, axis=0)

    # Set input tensor
    interpreter.set_tensor(input_details[0]['index'], input_data)
    # Run inference
    interpreter.invoke()
    # Get predicted steering angle
    predicted_angle = interpreter.get_tensor(output_details[0]['index'])[0][0]
    return float(predicted_angle)

def main():
    print("[+] Loading TFLite CNN Self-Driving Model...")
    try:
        interpreter, input_details, output_details = load_tflite_model(MODEL_PATH)
        print("[+] Model Loaded Successfully!")
    except Exception as e:
        print(f"[-] Error loading model: {e}")
        return

    cap = cv2.VideoCapture(0)
    cap.set(cv2.CAP_PROP_FRAME_WIDTH, 640)
    cap.set(cv2.CAP_PROP_FRAME_HEIGHT, 480)

    print("[+] AI Autonomous Driving Engine Active! Press 'q' to quit.")

    while cap.isOpened():
        start_time = time.time()
        ret, frame = cap.read()
        if not ret: break

        # Predict steering angle using Edge AI
        steer_angle = predict_steering_angle(interpreter, input_details, output_details, frame)

        fps = 1.0 / (time.time() - start_time)

        output_frame = frame.copy()
        cv2.putText(output_frame, f"AI Steer: {steer_angle:.1f} deg | FPS: {fps:.1f}",
                    (20, 40), cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)

        cv2.imshow("RasPi 4 Edge AI Driving HUD", output_frame)
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

#### Bài 8.1: Thu Thập Dữ Liệu Lái Xe (Data Collector Script)
Viết script Python `data_collector.py` vừa điều khiển xe từ xa qua bàn phím vừa tự động lưu ảnh Camera vào thư mục `dataset/` và lưu góc bẻ lái tương ứng vào file `telemetry.csv`.

#### Bài 8.2: Đo Tốc Độ Suy Luận TFLite Model (Inference Benchmark)
Viết script Python đo thời gian suy luận (Inference Latency in ms) của mô hình TFLite trên Raspberry Pi 4 qua 100 khung hình.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 8.3: Huấn Luyện Mạng Nơ-ron CNN Trên Google Colab
1. Thu thập $2,000+$ ảnh sa hình.
2. Tải tập dữ liệu lên Google Colab.
3. Sử dụng Keras/TensorFlow xây dựng mạng CNN 3 lớp Convolutional + 2 lớp Fully Connected.
4. Huấn luyện mô hình và xuất file `lane_model.tflite`.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập CNN (Hands-on Colab Lab)

#### Bài 8.4: Huấn Luyện & Kiểm Thử Mô Hình TFLite Trên Google Colab
Mở Google Colab, chạy notebook huấn luyện mô hình bám làn đường, vẽ biểu đồ tổn hao (Training Loss vs Validation Loss) và xuất mô hình TFLite.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# Keras CNN Training Reference Solution on Colab
import tensorflow as tf
from tensorflow.keras import layers, models

# Define Lightweight CNN Model for Self-Driving Steering
model = models.Sequential([
    layers.Conv2D(24, (5, 5), strides=(2, 2), activation='relu', input_shape=(66, 200, 3)),
    layers.Conv2D(36, (5, 5), strides=(2, 2), activation='relu'),
    layers.Flatten(),
    layers.Dense(50, activation='relu'),
    layers.Dense(1) # Linear output for continuous steering angle
])

model.compile(optimizer='adam', loss='mse')
print(model.summary())

# Convert to TFLite format
converter = tf.lite.TFLiteConverter.from_keras_model(model)
tflite_model = converter.convert()
with open("model.tflite", "wb") as f: f.write(tflite_model)
print("[+] TFLite Model Exported Successfully!")
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức Edge AI & CNN** | Giải thích sâu sắc quy trình Behavioral Cloning, kiến trúc mạng Cuộn CNN, định dạng TFLite và đo độ trễ suy luận. | Hiểu quy trình thu thập dữ liệu và chạy suy luận TFLite trên Pi 4. | Nắm được định nghĩa AI nhưng chưa thu thập được dữ liệu. | Mô hình dự đoán sai góc bẻ lái. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Data Collector, TFLite Benchmark, Colab CNN Trainer & TFLite Exporter Lab). | Hoàn thành Bài 8.1 và Bài 8.2 đúng yêu cầu. | Code có lỗi suy luận quá chậm ($< 5\text{ FPS}$). | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
