# Autoencoders (AE)

Autoencoders (AE) là một loại mô hình học sâu (deep learning) được sử dụng chủ yếu cho các tác vụ giảm chiều dữ liệu, phát hiện bất thường (anomaly detection), và tái tạo dữ liệu. Autoencoders có một mạng nơ-ron được chia thành hai phần chính: bộ mã hóa (encoder) và bộ giải mã (decoder). Bộ mã hóa giảm chiều dữ liệu và chuyển đổi nó thành một không gian chiều thấp, trong khi bộ giải mã cố gắng tái tạo lại dữ liệu từ không gian chiều thấp đó.

Trong trường hợp Titanic dataset, bạn có thể sử dụng Autoencoders để giảm chiều dữ liệu, tái tạo dữ liệu bị thiếu hoặc phát hiện các mẫu dữ liệu bất thường. Dưới đây là cách bạn có thể áp dụng Autoencoders vào bài toán Titanic.

## 1. Cài đặt thư viện

Đảm bảo bạn đã cài đặt các thư viện cần thiết:

```bash
pip install scikit-learn pandas keras tensorflow matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Chúng ta sẽ làm sạch và chuẩn hóa dữ liệu Titanic, xử lý giá trị thiếu và mã hóa các biến phân loại.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
import tensorflow as tf
from tensorflow.keras import layers
import matplotlib.pyplot as plt
import seaborn as sns

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Chọn các cột quan trọng
selected_features = ['Pclass', 'Sex', 'Age', 'Fare', 'SibSp', 'Parch']

# Xử lý dữ liệu bị thiếu
data['Age'].fillna(data['Age'].median(), inplace=True)
data['Fare'].fillna(data['Fare'].median(), inplace=True)

# Mã hóa biến 'Sex'
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Chuẩn hóa dữ liệu
scaler = StandardScaler()
X = data[selected_features]
X_scaled = scaler.fit_transform(X)
```

## 3. Xây dựng Autoencoder

Autoencoder bao gồm bộ mã hóa (encoder) và bộ giải mã (decoder). Bộ mã hóa sẽ giảm chiều dữ liệu, trong khi bộ giải mã sẽ tái tạo lại dữ liệu từ không gian chiều thấp.

```python
# Xây dựng kiến trúc Autoencoder
input_dim = X_scaled.shape[1]
encoding_dim = 2  # Giảm chiều xuống 2 chiều để dễ trực quan hóa

# Bộ mã hóa
input_layer = layers.Input(shape=(input_dim,))
encoded = layers.Dense(encoding_dim, activation='relu')(input_layer)

# Bộ giải mã
decoded = layers.Dense(input_dim, activation='sigmoid')(encoded)

# Tạo mô hình Autoencoder
autoencoder = tf.keras.Model(input_layer, decoded)

# Tạo mô hình bộ mã hóa
encoder = tf.keras.Model(input_layer, encoded)

# Tạo mô hình bộ giải mã
encoded_input = layers.Input(shape=(encoding_dim,))
decoder_layer = autoencoder.layers[-1]
decoder = tf.keras.Model(encoded_input, decoder_layer(encoded_input))

# Biên dịch mô hình
autoencoder.compile(optimizer='adam', loss='mean_squared_error')

# Huấn luyện mô hình Autoencoder
autoencoder.fit(X_scaled, X_scaled, epochs=100, batch_size=256, shuffle=True, validation_data=(X_scaled, X_scaled))
```

## 4. Trực quan hóa dữ liệu sau khi giảm chiều

Sau khi huấn luyện, bạn có thể sử dụng bộ mã hóa để giảm chiều dữ liệu xuống còn 2 chiều và trực quan hóa kết quả.

```python
# Giảm chiều dữ liệu xuống 2 chiều bằng cách sử dụng bộ mã hóa
X_encoded = encoder.predict(X_scaled)

# Tạo DataFrame với các thành phần đã giảm chiều
encoded_df = pd.DataFrame(data=X_encoded, columns=['Encoded1', 'Encoded2'])

# Thêm nhãn phân lớp (Survived) vào DataFrame
encoded_df['Survived'] = data['Survived']

# Vẽ biểu đồ phân tích
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Encoded1', y='Encoded2', hue='Survived', palette='viridis', data=encoded_df, s=100)
plt.title('Autoencoder - Titanic Survival Analysis')
plt.xlabel('Encoded Dimension 1')
plt.ylabel('Encoded Dimension 2')
plt.legend()
plt.show()
```

## 5. Đánh giá kết quả

Biểu đồ tán xạ sau khi giảm chiều dữ liệu sẽ giúp bạn quan sát mối quan hệ giữa các hành khách sống sót và không sống sót trong không gian 2D. Nếu các hành khách sống sót và không sống sót có sự phân tách rõ ràng trong không gian giảm chiều, bạn có thể dự đoán các đặc trưng quan trọng ảnh hưởng đến sự sống sót.

## 6. Ứng dụng thực tế trong bài toán Titanic

### 1. Phát hiện bất thường

Autoencoders có thể được sử dụng để phát hiện các điểm dữ liệu bất thường hoặc dữ liệu bị thiếu. Trong trường hợp Titanic, các hành khách với đặc điểm "lạ" hoặc không tương thích với phần lớn dữ liệu có thể được xác định là điểm bất thường.

Ứng dụng thực tế: Các hành khách có các đặc điểm bất thường (ví dụ, mức chi tiêu quá cao hoặc độ tuổi rất thấp so với các hành khách khác) có thể được kiểm tra và xử lý trước khi sử dụng dữ liệu để huấn luyện mô hình học máy.

### 2. Giảm chiều dữ liệu

Autoencoders có thể giảm chiều dữ liệu và tái tạo lại thông tin từ không gian chiều thấp, giúp đơn giản hóa dữ liệu mà không làm mất đi quá nhiều thông tin quan trọng.

Ứng dụng thực tế: Việc giảm chiều dữ liệu giúp các mô hình học máy dễ dàng xử lý hơn, từ đó cải thiện hiệu suất và giảm thời gian tính toán khi phân tích các yếu tố ảnh hưởng đến sự sống sót.

### 3. Tái tạo và xử lý giá trị thiếu

Autoencoders có thể được sử dụng để tái tạo dữ liệu bị thiếu. Trong trường hợp này, bạn có thể sử dụng mô hình để dự đoán các giá trị bị thiếu như "Age" hoặc "Fare".

Ứng dụng thực tế: Nếu có các giá trị bị thiếu trong dữ liệu, Autoencoders có thể dự đoán giá trị của chúng dựa trên các đặc trưng khác, giúp cải thiện độ chính xác của các mô hình học máy.

### 4. Trực quan hóa và phân tích dữ liệu

Việc sử dụng Autoencoders để giảm chiều dữ liệu giúp bạn có thể trực quan hóa dữ liệu trong không gian 2D hoặc 3D. Điều này rất hữu ích khi phân tích sự phân bố của các hành khách sống sót và không sống sót.

Ứng dụng thực tế: Việc phân tách hành khách sống sót và không sống sót dựa trên các đặc trưng như hạng vé, mức chi tiêu, và độ tuổi giúp các nhà phân tích có cái nhìn rõ ràng hơn về các yếu tố ảnh hưởng đến sự sống sót.

## 7. Kết luận

Autoencoders là một công cụ mạnh mẽ trong việc giảm chiều dữ liệu, phát hiện bất thường và tái tạo dữ liệu bị thiếu. Trong bài toán Titanic, Autoencoders có thể giúp phân tích các hành khách sống sót và không sống sót, tái tạo các giá trị thiếu, và phát hiện các điểm dữ liệu bất thường. Việc giảm chiều dữ liệu với Autoencoders cũng giúp cải thiện hiệu suất của các mô hình học máy khác và giúp trực quan hóa dữ liệu một cách dễ dàng hơn.

