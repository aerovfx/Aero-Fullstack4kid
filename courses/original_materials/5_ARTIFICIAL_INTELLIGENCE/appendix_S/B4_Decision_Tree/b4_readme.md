# Cây quyết định (Decision Tree)

Cây quyết định là một thuật toán phân loại mạnh mẽ, dễ hiểu, giúp dự đoán kết quả dựa trên các đặc điểm của dữ liệu. Trong bài toán Titanic, cây quyết định có thể được sử dụng để dự đoán khả năng sống sót (Survived) của hành khách dựa trên các đặc điểm như giới tính (Sex), tuổi (Age), hạng vé (Pclass), v.v.

## 1. Chuẩn bị dữ liệu

Tải và chuẩn bị dữ liệu Titanic.

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
import matplotlib.pyplot as plt
from sklearn import tree

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Xem qua dữ liệu
data.head()
```

## 2. Tiền xử lý dữ liệu

Chuẩn bị dữ liệu đầu vào cho mô hình cây quyết định.

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

## 3. Xây dựng mô hình cây quyết định

```python
# Khởi tạo và huấn luyện mô hình
dt_model = DecisionTreeClassifier(criterion='gini', max_depth=5, random_state=42)
dt_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = dt_model.predict(X_test)
```

## 4. Đánh giá mô hình

Sử dụng các chỉ số đánh giá hiệu quả của cây quyết định.

```python
# Độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

## 5. Trực quan hóa cây quyết định

Trực quan hóa cấu trúc của cây quyết định.

```python
# Trực quan hóa cây quyết định
plt.figure(figsize=(15, 10))
tree.plot_tree(dt_model, feature_names=selected_features, class_names=['Not Survived', 'Survived'], filled=True)
plt.title("Cấu trúc của Cây Quyết Định")
plt.show()
```

## 6. Ứng dụng thực tế của cây quyết định trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   - Ứng dụng thực tế: Với các đặc điểm như giới tính, tuổi, hạng vé, cây quyết định có thể xác định xem một hành khách cụ thể có khả năng sống sót hay không.
   - Ví dụ: Nếu hành khách là nữ và ở hạng vé cao cấp (Pclass = 1), khả năng sống sót sẽ cao hơn.

2. **Xác định các yếu tố quan trọng ảnh hưởng đến kết quả**:
   - Ví dụ:
     - Biến Sex (giới tính) thường được chọn là tiêu chí đầu tiên trong cây, cho thấy tầm quan trọng của nó.
     - Pclass (hạng vé) là yếu tố ảnh hưởng thứ hai.

3. **Hỗ trợ ra quyết định trong tình huống khẩn cấp**:
   - Ứng dụng thực tế:
     - Dựa trên đặc điểm hành khách, cây quyết định có thể gợi ý các ưu tiên cứu hộ (ví dụ: ưu tiên trẻ em, phụ nữ và hành khách ở hạng vé cao cấp).

4. **Giải thích trực quan và dễ hiểu**:
   - Cây quyết định dễ dàng giải thích cho cả người không có nền tảng kỹ thuật, giúp các nhà phân tích và nhà quản lý hiểu rõ các quy luật trong dữ liệu.

## Kết luận

Cây quyết định không chỉ dự đoán chính xác mà còn cung cấp một mô hình dễ hiểu để giải thích kết quả, đặc biệt hữu ích trong phân tích dữ liệu liên quan đến các quyết định mang tính chiến lược hoặc khẩn cấp. Trong bài toán Titanic, nó giúp phân tích các yếu tố sống còn, hỗ trợ cứu hộ và hiểu rõ dữ liệu.

