# Support Vector Machine (SVM)

Support Vector Machine (SVM) là một thuật toán học máy mạnh mẽ dùng để phân loại và hồi quy, nổi bật với khả năng xử lý tốt các vấn đề phân loại phi tuyến tính thông qua việc sử dụng nhân (kernel). SVM tìm kiếm một "siêu phẳng" tối ưu để phân tách các lớp trong không gian đặc trưng sao cho khoảng cách giữa các điểm dữ liệu và siêu phẳng này là lớn nhất.

## Ứng dụng trong bài toán Titanic

SVM có thể được sử dụng để phân loại khả năng sống sót của hành khách (biến mục tiêu Survived). Dựa trên các đặc trưng như giới tính, hạng vé, tuổi, fare, SVM sẽ học được một siêu phẳng phân tách các hành khách sống sót và không sống sót.

### 1. Chuẩn bị dữ liệu

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
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

### 2. Huấn luyện mô hình Support Vector Machine

```python
# Khởi tạo mô hình Support Vector Machine (SVM)
svm_model = SVC(kernel='linear', random_state=42)  # Dùng kernel tuyến tính

# Huấn luyện mô hình
svm_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = svm_model.predict(X_test)
```

### 3. Đánh giá mô hình

```python
# Đánh giá độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình SVM: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

### 4. Trực quan hóa siêu phẳng SVM (nếu sử dụng 2 đặc trưng)

Nếu bạn chỉ sử dụng hai đặc trưng (ví dụ: Fare và Age), bạn có thể trực quan hóa siêu phẳng phân tách trong không gian 2D.

```python
import numpy as np
import matplotlib.pyplot as plt

# Chọn 2 đặc trưng để trực quan hóa
X_train_2D = X_train[['Fare', 'Age']]
svm_model.fit(X_train_2D, y_train)

# Vẽ biểu đồ phân tách
x_min, x_max = X_train_2D['Fare'].min() - 1, X_train_2D['Fare'].max() + 1
y_min, y_max = X_train_2D['Age'].min() - 1, X_train_2D['Age'].max() + 1

xx, yy = np.meshgrid(np.linspace(x_min, x_max, 100),
                     np.linspace(y_min, y_max, 100))

Z = svm_model.predict(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

plt.contourf(xx, yy, Z, alpha=0.8)
plt.scatter(X_train_2D['Fare'], X_train_2D['Age'], c=y_train, edgecolors='k', marker='o', s=50)
plt.title("SVM với Kernel Tuyến Tính - Siêu Phẳng Phân Tách")
plt.xlabel('Fare')
plt.ylabel('Age')
plt.show()
```

### 5. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   - SVM có thể được sử dụng để phân loại khả năng sống sót của hành khách dựa trên các đặc điểm như:
     - Pclass: Hành khách hạng cao hơn (1st class) có khả năng sống sót cao hơn.
     - Sex: Phụ nữ thường có tỷ lệ sống sót cao hơn.
     - Age: Trẻ em và người già có khả năng sống sót cao hơn.
     - Fare: Hành khách trả giá vé cao hơn có thể có cơ hội sống sót cao hơn.

2. **Xử lý các vấn đề phi tuyến tính**:
   - SVM có thể dễ dàng xử lý các mối quan hệ phi tuyến giữa các đặc trưng và biến mục tiêu. Nếu có sự phân bố phi tuyến tính giữa các lớp (sống sót và không sống sót), SVM vẫn có thể phân tách chúng một cách hiệu quả.

3. **Chọn lựa siêu phẳng tối ưu**:
   - SVM không chỉ tìm ra siêu phẳng phân tách mà còn tối ưu hóa khoảng cách giữa các điểm dữ liệu và siêu phẳng, giúp tạo ra mô hình phân loại chính xác.

4. **Xây dựng hệ thống dự đoán rủi ro**:
   - Ứng dụng thực tế: Dựa trên mô hình SVM, có thể xây dựng một hệ thống dự đoán nguy cơ tử vong cho hành khách trong các tình huống khẩn cấp. Ví dụ, một hệ thống có thể sử dụng thông tin về hành khách để xác định mức độ ưu tiên trong các tình huống cứu hộ.

5. **Hỗ trợ ra quyết định trong tình huống khẩn cấp**:
   - SVM có thể được áp dụng để phân loại hành khách thành các nhóm có mức độ nguy hiểm hoặc khả năng sống sót cao, từ đó hỗ trợ các nhà quản lý hoặc nhân viên cứu hộ trong việc đưa ra quyết định cứu hộ hiệu quả.

### 6. Kết luận

SVM là một công cụ mạnh mẽ để giải quyết các bài toán phân loại, đặc biệt khi dữ liệu có sự phân tách phi tuyến. Trong bài toán Titanic, SVM giúp phân loại khả năng sống sót của hành khách dựa trên các đặc điểm khác nhau và có thể hỗ trợ xây dựng các hệ thống ra quyết định trong các tình huống khẩn cấp.

