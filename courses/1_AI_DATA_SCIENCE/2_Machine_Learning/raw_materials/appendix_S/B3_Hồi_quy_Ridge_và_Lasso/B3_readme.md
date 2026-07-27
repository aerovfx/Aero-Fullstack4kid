# Hồi quy Ridge và Lasso

Hồi quy Ridge và Lasso là các phương pháp hồi quy tuyến tính có sử dụng regularization (ràng buộc) để giảm thiểu overfitting, đồng thời chọn lọc các đặc trưng quan trọng. Chúng đặc biệt hữu ích khi dữ liệu có nhiều biến và có nguy cơ đa cộng tuyến.

- **Hồi quy Ridge**: Thêm một điều khoản phạt tỷ lệ thuận với bình phương của hệ số hồi quy (L2-norm). Giảm độ lớn của tất cả các hệ số nhưng không loại bỏ hoàn toàn.
- **Hồi quy Lasso**: Thêm một điều khoản phạt tỷ lệ thuận với giá trị tuyệt đối của hệ số hồi quy (L1-norm). Có thể loại bỏ hoàn toàn một số biến, giúp chọn lọc đặc trưng.

## 1. Chuẩn bị dữ liệu

Dữ liệu Titanic từ Kaggle sẽ được sử dụng.

```python
# Import thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import Ridge, Lasso
from sklearn.metrics import mean_squared_error, r2_score

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Chọn các cột quan trọng
selected_features = ['Pclass', 'Sex', 'Age', 'Fare', 'SibSp', 'Parch']
target = 'Survived'

# Tiền xử lý dữ liệu
data['Age'].fillna(data['Age'].median(), inplace=True)
data['Fare'].fillna(data['Fare'].median(), inplace=True)
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Chia dữ liệu
X = data[selected_features]
y = data[target]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
```

## 2. Hồi quy Ridge

Sử dụng Ridge Regression để huấn luyện và đánh giá.

```python
# Ridge Regression
ridge = Ridge(alpha=1.0)
ridge.fit(X_train, y_train)

# Dự đoán
y_pred_ridge = ridge.predict(X_test)

# Đánh giá
ridge_mse = mean_squared_error(y_test, y_pred_ridge)
ridge_r2 = r2_score(y_test, y_pred_ridge)

print("Ridge Regression:")
print(f"Mean Squared Error: {ridge_mse:.4f}")
print(f"R^2 Score: {ridge_r2:.4f}")
```

## 3. Hồi quy Lasso

Sử dụng Lasso Regression để huấn luyện và đánh giá.

```python
# Lasso Regression
lasso = Lasso(alpha=0.01)  # Alpha nhỏ để giữ lại nhiều đặc trưng
lasso.fit(X_train, y_train)

# Dự đoán
y_pred_lasso = lasso.predict(X_test)

# Đánh giá
lasso_mse = mean_squared_error(y_test, y_pred_lasso)
lasso_r2 = r2_score(y_test, y_pred_lasso)

print("Lasso Regression:")
print(f"Mean Squared Error: {lasso_mse:.4f}")
print(f"R^2 Score: {lasso_r2:.4f}")

# Hiển thị các hệ số của Lasso
coefficients = pd.DataFrame({
    'Feature': selected_features,
    'Coefficient': lasso.coef_
}).sort_values(by='Coefficient', ascending=False)
print(coefficients)
```

## 4. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   - Ridge và Lasso đều giúp mô hình dự đoán khả năng sống sót dựa trên các đặc điểm như:
     - Giới tính (Sex): Phụ nữ thường có tỷ lệ sống sót cao hơn.
     - Hạng vé (Pclass): Hành khách ở hạng vé cao cấp có nhiều cơ hội sống sót hơn.
     - Số lượng người thân (SibSp, Parch): Có thể ảnh hưởng đến cơ hội sống sót.

2. **Lựa chọn đặc trưng quan trọng**:
   - Lasso giúp chọn lọc đặc trưng:
     - Ví dụ, nếu Parch hoặc SibSp có hệ số bằng 0, điều này cho thấy chúng ít ảnh hưởng đến khả năng sống sót.
   - Ridge giữ lại tất cả các đặc trưng nhưng giảm độ lớn của chúng, hữu ích khi tất cả các biến đều quan trọng.

3. **Giảm đa cộng tuyến**:
   - Trong Titanic, các đặc trưng như SibSp và Parch có thể có tương quan cao. Ridge Regression giúp xử lý vấn đề này.

4. **Giải thích mô hình**:
   - Hệ số của Ridge và Lasso cung cấp thông tin về mức độ ảnh hưởng của từng biến. Ví dụ:
     - Sex (giới tính) có hệ số cao nhất → biến quan trọng nhất.
     - Pclass (hạng vé) là yếu tố quyết định tiếp theo.

5. **Ứng dụng trong hệ thống khuyến nghị**:
   - Ridge và Lasso có thể được sử dụng để thiết lập hệ thống phân tích rủi ro trong các tình huống tương tự, ví dụ:
     - Dự đoán mức độ nguy hiểm của hành khách trên các chuyến tàu hoặc máy bay dựa trên lịch sử dữ liệu.

## 5. Kết luận

- Hồi quy Ridge thích hợp để sử dụng khi cần giữ lại tất cả các đặc trưng và giảm vấn đề đa cộng tuyến.
- Hồi quy Lasso phù hợp khi cần lựa chọn các đặc trưng quan trọng và giảm số lượng biến trong mô hình.

Trong bài toán Titanic, cả hai phương pháp đều có thể hỗ trợ phân tích các yếu tố ảnh hưởng đến khả năng sống sót và xây dựng các mô hình dự đoán hiệu quả.

