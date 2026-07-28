# Tuần 6: Phân loại ảnh với Keras

## Kết quả cần đạt

- Chia tập train, validation và test đúng mục đích.
- Huấn luyện CNN cho MNIST với callback chống overfitting.
- Đọc confusion matrix và xem các mẫu dự đoán sai.

## 1. Pipeline hoàn chỉnh

```python
import numpy as np
from tensorflow import keras
from tensorflow.keras import layers

keras.utils.set_random_seed(42)
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
x_train = x_train[..., np.newaxis].astype("float32") / 255.0
x_test = x_test[..., np.newaxis].astype("float32") / 255.0

model = keras.Sequential([
    layers.Input((28, 28, 1)),
    layers.Conv2D(32, 3, activation="relu"),
    layers.MaxPooling2D(),
    layers.Conv2D(64, 3, activation="relu"),
    layers.GlobalAveragePooling2D(),
    layers.Dense(10, activation="softmax"),
])
model.compile(optimizer="adam",
              loss="sparse_categorical_crossentropy",
              metrics=["accuracy"])

callbacks = [
    keras.callbacks.EarlyStopping(
        monitor="val_loss", patience=2, restore_best_weights=True
    ),
    keras.callbacks.ModelCheckpoint(
        "output/mnist_best.keras", monitor="val_loss", save_best_only=True
    ),
]

history = model.fit(
    x_train, y_train,
    validation_split=0.1,
    epochs=15,
    batch_size=64,
    callbacks=callbacks,
)
test_loss, test_accuracy = model.evaluate(x_test, y_test, verbose=0)
print(f"Test accuracy: {test_accuracy:.3f}")
```

Không dùng test set để chọn kiến trúc hoặc tham số; chỉ đánh giá nó sau khi đã chốt mô hình bằng validation set.

## 2. Confusion matrix

```python
from sklearn.metrics import classification_report, confusion_matrix

y_pred = model.predict(x_test, verbose=0).argmax(axis=1)
print(confusion_matrix(y_test, y_pred))
print(classification_report(y_test, y_pred, digits=3))
```

Accuracy cao có thể che giấu lớp yếu. Confusion matrix cho biết cặp nhãn nào thường bị nhầm để bổ sung dữ liệu hoặc xử lý riêng.

## 3. Lỗi thường gặp

- Quên chuẩn hóa ảnh làm quá trình học kém ổn định.
- Nhãn là số nguyên nhưng dùng `categorical_crossentropy`; hãy dùng bản `sparse_...`.
- Báo accuracy trên train set như kết quả cuối cùng.

## Thử thách

In 20 ảnh dự đoán sai có độ tự tin cao nhất. Với mỗi ảnh, hiển thị nhãn thật, nhãn dự đoán và xác suất; mô tả ít nhất hai kiểu lỗi lặp lại.
