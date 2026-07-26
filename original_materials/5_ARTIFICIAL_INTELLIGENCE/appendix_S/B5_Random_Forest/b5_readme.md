# Random Forest

Random Forest là một thuật toán học máy mạnh mẽ dựa trên tập hợp các cây quyết định. Nó sử dụng kỹ thuật bagging để tạo ra nhiều cây và lấy trung bình (hoặc bỏ phiếu đa số) để đưa ra dự đoán cuối cùng. Điều này giúp giảm overfitting và tăng độ chính xác của mô hình.

## 1. Chuẩn bị dữ liệu

```python
# Import thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Chọn các cột quan trọng
selected_features = ['Pclass', 'Sex', 'Age', 'Fare', 'SibSp', 'Parch']
target = 'Survived'

# Xử lý dữ liệu bị thiếu
data['Age'].fillna(data['Age'].median(), inplace=True)
data['Fare'].fillna(data['Fare'].median(), inplace=True)

# Mã hóa biến 'Sex'
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Chia dữ liệu
X = data[selected_features]
y = data[target]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
```

## 2. Huấn luyện mô hình Random Forest

```python
# Khởi tạo mô hình Random Forest
rf_model = RandomForestClassifier(n_estimators=100, max_depth=10, random_state=42)

# Huấn luyện mô hình
rf_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = rf_model.predict(X_test)
```

## 3. Đánh giá mô hình

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

## 4. Phân tích tầm quan trọng của đặc trưng

```python
# Đánh giá tầm quan trọng của các đặc trưng
feature_importances = pd.DataFrame({
    'Feature': selected_features,
    'Importance': rf_model.feature_importances_
}).sort_values(by='Importance', ascending=False)

print("Tầm quan trọng của các đặc trưng:")
print(feature_importances)
```

## 5. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách:**
   - Random Forest có khả năng dự đoán chính xác khả năng sống sót dựa trên các đặc điểm:
     - Pclass: Hạng vé, một yếu tố quyết định lớn đến cơ hội sống sót.
     - Sex: Giới tính, phụ nữ thường được ưu tiên cứu hộ.
     - Age: Tuổi, trẻ em thường được ưu tiên cứu hộ.

2. **Phân tích tầm quan trọng của đặc trưng:**
   - Random Forest cho phép đánh giá tầm quan trọng của từng đặc trưng:
     - Ứng dụng thực tế: Có thể tập trung vào các yếu tố quan trọng nhất như giới tính hoặc hạng vé khi thiết kế chiến lược cứu hộ.

3. **Phát hiện các mối quan hệ phi tuyến:**
   - Random Forest không yêu cầu mối quan hệ tuyến tính giữa biến đầu vào và biến đầu ra.
     - Ứng dụng thực tế: Giải quyết các vấn đề phức tạp, chẳng hạn các hành khách có vé hạng thấp nhưng đi cùng gia đình có thể có cơ hội sống sót cao hơn.

4. **Giảm thiểu overfitting:**
   - Nhờ việc sử dụng nhiều cây quyết định và trung bình kết quả, Random Forest giúp giảm nguy cơ overfitting so với một cây quyết định đơn lẻ.

5. **Hỗ trợ xây dựng mô hình cứu hộ:**
   - Random Forest có thể được tích hợp vào hệ thống cứu hộ thực tế:
     - Ví dụ: Một hệ thống có thể sử dụng mô hình để xác định hành khách có nguy cơ cao nhất và đưa ra quyết định ưu tiên trong các tình huống khẩn cấp.

## 6. Kết luận

Random Forest là một công cụ mạnh mẽ, không chỉ dự đoán chính xác mà còn cung cấp thông tin quan trọng về đặc trưng. Trong bài toán Titanic, Random Forest không chỉ giúp dự đoán khả năng sống sót mà còn hỗ trợ việc hiểu rõ các yếu tố ảnh hưởng, từ đó đưa ra các chiến lược ứng phó tốt hơn trong thực tế.

