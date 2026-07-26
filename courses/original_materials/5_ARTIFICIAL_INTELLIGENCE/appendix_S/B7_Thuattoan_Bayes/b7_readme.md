Naïve Bayes là một thuật toán phân loại dựa trên định lý Bayes và giả định rằng các đặc trưng là độc lập với nhau (tính chất "naïve" hay ngây thơ). Đây là một mô hình học máy đơn giản nhưng hiệu quả, đặc biệt trong các bài toán phân loại văn bản, và cũng có thể áp dụng tốt trong nhiều bài toán phân loại khác như dự đoán khả năng sống sót trong bài toán Titanic.

## Ứng dụng trong bài toán Titanic

Naïve Bayes có thể được sử dụng để dự đoán khả năng sống sót của hành khách dựa trên các đặc điểm như giới tính, hạng vé, tuổi, fare và số lượng anh chị em/cặp vợ chồng (SibSp). Naïve Bayes dựa trên giả định rằng các đặc trưng này là độc lập, mặc dù trong thực tế chúng có thể có sự tương tác.

### 1. Chuẩn bị dữ liệu

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
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

### 2. Huấn luyện mô hình Naïve Bayes

```python
# Khởi tạo mô hình Naïve Bayes
nb_model = GaussianNB()

# Huấn luyện mô hình
nb_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = nb_model.predict(X_test)
```

### 3. Đánh giá mô hình

```python
# Đánh giá độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình Naïve Bayes: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

### 4. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   Naïve Bayes có thể giúp dự đoán khả năng sống sót của hành khách dựa trên các đặc điểm sau:
   - **Pclass (hạng vé)**: Hành khách hạng 1 có thể có cơ hội sống sót cao hơn so với hạng 3.
   - **Sex (giới tính)**: Phụ nữ có khả năng sống sót cao hơn nam giới.
   - **Age (tuổi)**: Trẻ em và người già có thể có cơ hội sống sót cao hơn.
   - **Fare (giá vé)**: Hành khách trả vé cao có thể có cơ hội sống sót cao hơn, vì họ có thể ở gần các khu vực an toàn hơn.
   - **SibSp (số lượng anh chị em/cặp vợ chồng)**: Hành khách đi cùng gia đình có thể có cơ hội sống sót cao hơn vì họ có thể được cứu hộ cùng nhau.

2. **Dự đoán nhanh và dễ dàng**:
   Naïve Bayes rất nhanh và có thể xử lý tốt các dữ liệu lớn với ít tài nguyên tính toán, vì vậy nó phù hợp cho các dự đoán nhanh trong các ứng dụng thực tế như phân loại hành khách sống sót trong các tình huống khẩn cấp.

3. **Phân tích dữ liệu và ra quyết định**:
   Ứng dụng thực tế: Naïve Bayes có thể giúp các tổ chức (như các công ty bảo hiểm) phân tích thông tin về các hành khách và dự đoán tỷ lệ sống sót của họ trong các tình huống khẩn cấp. Ví dụ, hệ thống cứu hộ có thể sử dụng mô hình Naïve Bayes để phân loại các hành khách vào các nhóm ưu tiên theo khả năng sống sót của họ.

4. **Hỗ trợ việc xây dựng các hệ thống ra quyết định trong tình huống khẩn cấp**:
   Ví dụ: Một hệ thống hỗ trợ ra quyết định có thể sử dụng Naïve Bayes để phân tích dữ liệu hành khách và xác định nhóm hành khách nào nên được ưu tiên cứu trong các tình huống khẩn cấp (chẳng hạn như trong một vụ tai nạn tàu hoặc thảm họa tự nhiên).

5. **Mặc dù mô hình đơn giản nhưng rất hiệu quả với dữ liệu nhỏ và ít tính toán**:
   Naïve Bayes có thể hoạt động tốt trong các trường hợp mà các mô hình phức tạp hơn như SVM hoặc Random Forest có thể bị chậm hoặc đòi hỏi nhiều tài nguyên tính toán hơn.

### 5. Kết luận

Naïve Bayes là một mô hình phân loại đơn giản nhưng rất hiệu quả khi dữ liệu có ít sự tương tác giữa các đặc trưng, hoặc khi chúng độc lập với nhau. Trong bài toán Titanic, Naïve Bayes có thể giúp dự đoán khả năng sống sót của hành khách dựa trên các đặc điểm và hỗ trợ xây dựng các chiến lược cứu hộ và phân tích rủi ro trong các tình huống khẩn cấp.

