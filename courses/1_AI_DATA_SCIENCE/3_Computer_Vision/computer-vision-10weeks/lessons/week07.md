# Tuần 7: Transfer Learning

## Kết quả cần đạt

- Giải thích vì sao đặc trưng học từ ImageNet có thể tái sử dụng.
- Huấn luyện “đầu phân loại” khi đóng băng backbone.
- Fine-tune một phần mô hình với learning rate nhỏ.

## 1. Khi nào nên dùng?

Transfer learning hữu ích khi dữ liệu riêng ít. Mô hình pretrained đã biết các đặc trưng thị giác chung; ta thay lớp phân loại cuối cho bài toán mới. MobileNetV2 nhẹ và phù hợp cho bài thực hành hoặc thiết bị biên.

## 2. Giai đoạn 1: đóng băng backbone

```python
from tensorflow import keras
from tensorflow.keras import layers

IMG_SIZE = (160, 160)
NUM_CLASSES = 4

base = keras.applications.MobileNetV2(
    input_shape=IMG_SIZE + (3,),
    include_top=False,
    weights="imagenet",
)
base.trainable = False

inputs = keras.Input(shape=IMG_SIZE + (3,))
x = layers.RandomFlip("horizontal")(inputs)
x = layers.RandomRotation(0.05)(x)
x = keras.applications.mobilenet_v2.preprocess_input(x)
x = base(x, training=False)
x = layers.GlobalAveragePooling2D()(x)
x = layers.Dropout(0.2)(x)
outputs = layers.Dense(NUM_CLASSES, activation="softmax")(x)
model = keras.Model(inputs, outputs)

model.compile(optimizer="adam",
              loss="sparse_categorical_crossentropy",
              metrics=["accuracy"])
# model.fit(train_ds, validation_data=val_ds, epochs=5)
```

`training=False` giữ Batch Normalization ở chế độ suy luận, quan trọng khi dữ liệu mới nhỏ.

## 3. Giai đoạn 2: fine-tune các tầng cuối

```python
base.trainable = True
for layer in base.layers[:-30]:
    layer.trainable = False

model.compile(
    optimizer=keras.optimizers.Adam(learning_rate=1e-5),
    loss="sparse_categorical_crossentropy",
    metrics=["accuracy"],
)
# model.fit(train_ds, validation_data=val_ds, epochs=5)
```

Sau khi đổi `trainable`, phải compile lại. Learning rate nhỏ giúp không phá hỏng đặc trưng pretrained.

## Lỗi thường gặp

- Không dùng đúng hàm `preprocess_input` của backbone.
- Fine-tune toàn bộ từ đầu với learning rate lớn.
- Dữ liệu validation trùng người, video hoặc bối cảnh với train gây rò rỉ dữ liệu.

## Thử thách

So sánh ba thí nghiệm cùng dữ liệu: CNN tự xây, MobileNetV2 đóng băng, MobileNetV2 fine-tune. Báo số tham số trainable, thời gian mỗi epoch, validation accuracy và nhận xét trade-off.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 07](../code/week07/README.md), học lần lượt từ `01_...` đến `20_...`.
