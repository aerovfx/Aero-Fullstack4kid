# Hồi quy logistic (Logistic Regression)

Hồi quy logistic (Logistic Regression) là một thuật toán học có giám sát được sử dụng để dự đoán các nhãn phân loại. Trong bài toán Titanic, hồi quy logistic có thể được sử dụng để dự đoán khả năng sống sót (Survived) của hành khách dựa trên các đặc điểm như tuổi (Age), giới tính (Sex), và hạng vé (Pclass).

## 1. Chuẩn bị dữ liệu Titanic

```python
# Import thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
import seaborn as sns
import matplotlib.pyplot as plt

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Xem qua dữ liệu
data.head()
```

## 2. Tiền xử lý dữ liệu

Chuẩn bị dữ liệu đầu vào cho mô hình hồi quy logistic.

```python
# Chọn các cột quan trọng
selected_features = ['Pclass', 'Sex', 'Age', 'Fare']
target = 'Survived'

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

## 3. Xây dựng mô hình hồi quy logistic

```python
# Khởi tạo và huấn luyện mô hình hồi quy logistic
model = LogisticRegression()
model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = model.predict(X_test)
```

## 4. Đánh giá mô hình

Sử dụng các chỉ số như độ chính xác, ma trận nhầm lẫn, và báo cáo phân loại.

```python
# Tính độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues', xticklabels=['Không sống sót', 'Sống sót'], 
            yticklabels=['Không sống sót', 'Sống sót'])
plt.title("Ma trận nhầm lẫn")
plt.xlabel("Dự đoán")
plt.ylabel("Thực tế")
plt.show()

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred, target_names=['Không sống sót', 'Sống sót']))
```

## 5. Ứng dụng cụ thể của hồi quy logistic trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách:**
   - Ứng dụng thực tế: Khi biết các thông tin như tuổi, giới tính, và hạng vé, mô hình có thể dự đoán liệu hành khách đó có khả năng sống sót hay không. Điều này rất hữu ích trong việc mô phỏng các tình huống cứu hộ hoặc phân tích rủi ro.

2. **Phân tích yếu tố ảnh hưởng đến khả năng sống sót:**
   - Ví dụ:
     - Phụ nữ và trẻ em có khả năng sống sót cao hơn.
     - Hành khách hạng nhất có tỷ lệ sống sót cao hơn so với hạng hai và ba.
   - Mô hình hồi quy logistic cung cấp các hệ số hồi quy, giúp định lượng mức độ ảnh hưởng của từng biến.

```python
# Xem các hệ số hồi quy
coefficients = pd.DataFrame({'Feature': selected_features, 'Coefficient': model.coef_[0]})
print(coefficients.sort_values(by='Coefficient', ascending=False))
```

3. **Quyết định ưu tiên cứu hộ:**
   - Ứng dụng thực tế: Trong trường hợp khẩn cấp, mô hình có thể giúp quyết định ưu tiên cứu hộ dựa trên đặc điểm của hành khách (ví dụ: ưu tiên trẻ em và phụ nữ).

4. **Tích hợp vào hệ thống dự đoán rủi ro:**
   - Hồi quy logistic có thể được tích hợp vào các hệ thống quản lý rủi ro hoặc phân tích dữ liệu lịch sử để dự đoán kết quả trong các kịch bản tương tự.

## 6. Kết luận

Hồi quy logistic không chỉ hỗ trợ trong việc dự đoán khả năng sống sót mà còn cung cấp cái nhìn sâu sắc về tác động của các đặc điểm đến kết quả. Đây là công cụ mạnh mẽ để phân tích dữ liệu phân loại, đặc biệt trong các tình huống cứu hộ, dự đoán, và ra quyết định chiến lược.

