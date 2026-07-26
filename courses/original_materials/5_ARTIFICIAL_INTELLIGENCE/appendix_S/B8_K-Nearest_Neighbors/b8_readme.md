# K-Nearest Neighbors (KNN)

K-Nearest Neighbors (KNN) là một thuật toán học máy đơn giản nhưng hiệu quả, hoạt động dựa trên nguyên lý tìm kiếm các điểm dữ liệu gần nhất (neighbors) trong không gian đặc trưng và phân loại hoặc hồi quy dựa trên các điểm này. Đặc biệt, KNN không cần quá trình huấn luyện rõ ràng, mà dựa vào sự so sánh trực tiếp các điểm dữ liệu trong quá trình phân loại.

## Ứng dụng trong bài toán Titanic

KNN có thể được sử dụng để phân loại khả năng sống sót của hành khách dựa trên các đặc trưng như giới tính, hạng vé, tuổi, fare và số lượng anh chị em/cặp vợ chồng (SibSp). Bằng cách tìm kiếm k hành khách gần nhất (dựa trên khoảng cách Euclid giữa các đặc trưng), thuật toán sẽ phân loại hành khách vào nhóm sống sót hoặc không sống sót.

### 1. Chuẩn bị dữ liệu

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
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

### 2. Huấn luyện mô hình K-Nearest Neighbors (KNN)

```python
# Khởi tạo mô hình KNN với k = 5
knn_model = KNeighborsClassifier(n_neighbors=5)

# Huấn luyện mô hình
knn_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = knn_model.predict(X_test)
```

### 3. Đánh giá mô hình

```python
# Đánh giá độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình KNN: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

### 4. Trực quan hóa kết quả (nếu cần thiết, với 2 đặc trưng)

Nếu bạn muốn trực quan hóa kết quả của KNN trong không gian 2D (ví dụ, chỉ sử dụng hai đặc trưng như Fare và Age):

```python
import numpy as np
import matplotlib.pyplot as plt

# Chọn 2 đặc trưng để trực quan hóa
X_train_2D = X_train[['Fare', 'Age']]
knn_model.fit(X_train_2D, y_train)

# Vẽ biểu đồ phân tách
x_min, x_max = X_train_2D['Fare'].min() - 1, X_train_2D['Fare'].max() + 1
y_min, y_max = X_train_2D['Age'].min() - 1, X_train_2D['Age'].max() + 1

xx, yy = np.meshgrid(np.linspace(x_min, x_max, 100),
                     np.linspace(y_min, y_max, 100))

Z = knn_model.predict(np.c_[xx.ravel(), yy.ravel()])
Z = Z.reshape(xx.shape)

plt.contourf(xx, yy, Z, alpha=0.8)
plt.scatter(X_train_2D['Fare'], X_train_2D['Age'], c=y_train, edgecolors='k', marker='o', s=50)
plt.title("KNN - Phân loại với K=5")
plt.xlabel('Fare')
plt.ylabel('Age')
plt.show()
```

### 5. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách:**
   KNN có thể được sử dụng để phân loại khả năng sống sót của hành khách dựa trên các đặc điểm sau:
   - Pclass (hạng vé): Hành khách hạng 1 có thể có tỷ lệ sống sót cao hơn so với hạng 3.
   - Sex (giới tính): Phụ nữ thường có tỷ lệ sống sót cao hơn nam giới.
   - Age (tuổi): Trẻ em và người già có thể có tỷ lệ sống sót cao hơn.
   - Fare (giá vé): Hành khách trả vé cao hơn có thể có cơ hội sống sót cao hơn.
   - SibSp (số lượng anh chị em/cặp vợ chồng): Hành khách đi cùng gia đình có thể có cơ hội sống sót cao hơn vì họ có thể được cứu hộ cùng nhau.

2. **Xử lý các dữ liệu có mối quan hệ phức tạp giữa các đặc trưng:**
   KNN có thể xử lý mối quan hệ phi tuyến tính giữa các đặc trưng và biến mục tiêu mà không cần giả định về kiểu phân phối của dữ liệu. Nếu có sự tương tác phức tạp giữa các đặc trưng, KNN vẫn có thể tìm ra mẫu tương tự trong không gian đặc trưng.

3. **Dự đoán khả năng sống sót nhanh chóng và đơn giản:**
   Ứng dụng thực tế: KNN có thể giúp các tổ chức phân loại hành khách vào nhóm sống sót hoặc không sống sót mà không cần huấn luyện mô hình phức tạp, đặc biệt khi các dữ liệu về hành khách đã được chuẩn bị sẵn.

4. **Phân loại hành khách vào các nhóm ưu tiên cứu hộ:**
   Ứng dụng trong tình huống khẩn cấp: Dựa trên các đặc trưng như giới tính, tuổi, hạng vé và số người đi cùng, mô hình KNN có thể phân loại hành khách vào các nhóm ưu tiên cứu hộ, giúp các nhân viên cứu hộ đưa ra quyết định nhanh chóng và hợp lý.

5. **Hệ thống phân loại hành khách theo các đặc trưng tương tự:**
   Ví dụ: Một hệ thống tự động có thể sử dụng KNN để phân loại hành khách theo các đặc trưng tương tự, ví dụ, nhóm hành khách có đặc trưng gần gũi sẽ có khả năng sống sót tương tự nhau.

### 6. Kết luận

KNN là một thuật toán đơn giản và hiệu quả trong việc phân loại dựa trên sự tương đồng giữa các điểm dữ liệu, đặc biệt khi dữ liệu không có sự phân phối rõ ràng. Trong bài toán Titanic, KNN giúp phân loại khả năng sống sót của hành khách dựa trên các đặc điểm cơ bản, và có thể ứng dụng trong các tình huống khẩn cấp để hỗ trợ quyết định cứu hộ.

