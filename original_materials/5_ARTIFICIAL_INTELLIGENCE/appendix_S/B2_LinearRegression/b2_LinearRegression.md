# Hồi quy tuyến tính (Linear Regression)

Hồi quy tuyến tính là một thuật toán được sử dụng để dự đoán các giá trị liên tục. Trong bài toán Titanic, một ứng dụng thực tế của hồi quy tuyến tính là dự đoán giá vé (Fare) dựa trên các đặc điểm khác như tuổi (Age), giới tính (Sex), và hạng vé (Pclass). Điều này có thể hữu ích trong việc xử lý dữ liệu bị thiếu hoặc kiểm tra mối quan hệ giữa các biến trong dữ liệu.

## 1. Chuẩn bị dữ liệu Titanic

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
import numpy as np

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Xem qua dữ liệu
data.head()
```

## 2. Tiền xử lý dữ liệu

Chuẩn bị dữ liệu cho mô hình hồi quy tuyến tính.

```python
# Chọn các cột quan trọng
selected_features = ['Age', 'Sex', 'Pclass']
target = 'Fare'

# Xử lý dữ liệu bị thiếu
data['Age'].fillna(data['Age'].median(), inplace=True)
data['Fare'].fillna(data['Fare'].median(), inplace=True)

# Mã hóa biến 'Sex'
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Tách dữ liệu
X = data[selected_features]
y = data[target]

# Chia tập dữ liệu thành train/test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
```

## 3. Xây dựng mô hình hồi quy tuyến tính

```python
# Khởi tạo và huấn luyện mô hình hồi quy tuyến tính
model = LinearRegression()
model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = model.predict(X_test)
```

## 4. Đánh giá mô hình

Sử dụng các chỉ số như Mean Squared Error (MSE) và R² Score để đánh giá.

```python
# Đánh giá mô hình
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

print(f"Mean Squared Error (MSE): {mse:.2f}")
print(f"R² Score: {r2:.2f}")
```

## 5. Hiển thị mối quan hệ dự đoán

```python
import matplotlib.pyplot as plt

# Vẽ biểu đồ so sánh giá trị thực và dự đoán
plt.figure(figsize=(8, 6))
plt.scatter(y_test, y_pred, alpha=0.7, color="blue")
plt.plot([y_test.min(), y_test.max()], [y_test.min(), y_test.max()], 'r--', linewidth=2, label="Đường dự đoán hoàn hảo")
plt.title("Dự đoán Giá Vé bằng Hồi quy tuyến tính")
plt.xlabel("Giá trị thực")
plt.ylabel("Giá trị dự đoán")
plt.legend()
plt.show()
```

## 6. Ứng dụng thực tế

Hồi quy tuyến tính trong bài toán Titanic có thể được áp dụng trong các trường hợp sau:

1. **Điền dữ liệu bị thiếu**:
   - Dự đoán giá vé bị thiếu: Khi dữ liệu về giá vé (Fare) bị thiếu, mô hình hồi quy tuyến tính có thể được sử dụng để ước tính giá trị dựa trên các đặc điểm khác như tuổi, hạng vé, và giới tính.

2. **Kiểm tra mối quan hệ giữa các biến**:
   - Mối quan hệ giữa hạng vé và giá vé: Có thể kiểm tra mối quan hệ tuyến tính giữa hạng vé (Pclass) và giá vé (Fare), giúp hiểu rõ hơn về cách phân bổ giá vé trên tàu Titanic.

3. **Dự báo trong các tình huống giả định**:
   - Dự đoán giá vé trong các điều kiện khác: Ví dụ, nếu một hành khách trẻ tuổi, là nữ và ở hạng vé cao cấp, mô hình có thể dự đoán giá vé tương ứng.

4. **Tích hợp vào hệ thống phân tích**:
   - Hồi quy tuyến tính có thể được kết hợp với các mô hình phân loại (như Logistic Regression) để xây dựng hệ thống phân tích phức tạp hơn, chẳng hạn như:
     - Tính xác suất sống sót và ước lượng chi phí liên quan.
     - Hỗ trợ tối ưu hóa phân bổ vé dựa trên các đặc điểm hành khách.

Kết hợp các ứng dụng trên giúp phân tích và khai thác dữ liệu Titanic hiệu quả hơn trong các bài toán thực tế.

