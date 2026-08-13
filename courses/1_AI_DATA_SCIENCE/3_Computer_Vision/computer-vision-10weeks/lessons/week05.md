# Tuần 5: Mạng neural tích chập (CNN) cơ bản

## Kết quả cần đạt

- Giải thích vai trò của convolution, activation, pooling và fully connected layer.
- Tính kích thước tensor qua từng tầng.
- Xây dựng và kiểm tra một CNN nhỏ bằng Keras.

## 1. CNN học gì?

Kernel trượt trên ảnh để tạo feature map. Các tầng đầu thường học cạnh và góc; tầng sâu kết hợp chúng thành hoa văn và bộ phận. ReLU thêm tính phi tuyến, pooling giảm kích thước, lớp Dense đưa đặc trưng tới nhãn dự đoán.

Với convolution `valid`, kích thước đầu ra một chiều là `(N - K) / S + 1`; với `padding="same"`, stride 1 giữ nguyên chiều cao và rộng.

## 2. Xây dựng mô hình

```python
from tensorflow import keras
from tensorflow.keras import layers

model = keras.Sequential([
    layers.Input(shape=(64, 64, 3)),
    layers.Rescaling(1.0 / 255),
    layers.Conv2D(16, 3, padding="same", activation="relu"),
    layers.MaxPooling2D(),
    layers.Conv2D(32, 3, padding="same", activation="relu"),
    layers.MaxPooling2D(),
    layers.Conv2D(64, 3, padding="same", activation="relu"),
    layers.GlobalAveragePooling2D(),
    layers.Dense(32, activation="relu"),
    layers.Dense(3, activation="softmax"),
])

model.compile(
    optimizer="adam",
    loss="sparse_categorical_crossentropy",
    metrics=["accuracy"],
)
model.summary()
```

Lớp cuối có 3 neuron vì ví dụ có 3 lớp. `softmax` trả về phân phối xác suất có tổng gần bằng 1.

## 3. Kiểm tra forward pass trước khi train

```python
import tensorflow as tf

fake_batch = tf.random.uniform((4, 64, 64, 3), maxval=255)
probabilities = model(fake_batch, training=False)
print(probabilities.shape)       # (4, 3)
print(tf.reduce_sum(probabilities, axis=1))
```

Kiểm tra này phát hiện sớm lỗi kích thước mà không cần đợi tải dữ liệu hay huấn luyện.

## 4. Overfitting và cách theo dõi

Nếu training accuracy tăng nhưng validation accuracy đứng yên hoặc giảm, mô hình đang nhớ dữ liệu. Có thể dùng augmentation, dropout, regularization, thêm dữ liệu hoặc giảm độ phức tạp.

## Thử thách

Thay `GlobalAveragePooling2D` bằng `Flatten`, so sánh số tham số trong `model.summary()`. Dự đoán mô hình nào dễ overfit hơn và giải thích bằng số liệu.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 05](../code/week05/README.md), học lần lượt từ `01_...` đến `20_...`.
