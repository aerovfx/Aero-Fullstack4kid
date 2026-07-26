Trong trường hợp sử dụng K-means clustering để phân tích dữ liệu của bài toán Titanic: Machine Learning from Disaster, bạn có thể áp dụng thuật toán này để thực hiện phân cụm các hành khách thành những nhóm dựa trên các đặc điểm như tuổi, giới tính, giá vé, và hạng vé. Điều này có thể giúp tìm ra các nhóm hành khách có đặc điểm tương đồng, qua đó hỗ trợ trong việc hiểu rõ hơn về dữ liệu và các yếu tố liên quan đến khả năng sống sót.

## 1. Chuẩn bị dữ liệu Titanic
Trước tiên, bạn cần tải và chuẩn bị dữ liệu.

```python
# Import thư viện
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Xem qua dữ liệu
data.head()
```

## 2. Tiền xử lý dữ liệu
Lựa chọn các cột quan trọng và xử lý dữ liệu bị thiếu.

```python
# Chọn các cột quan trọng
selected_features = ['Age', 'Fare', 'Pclass', 'Sex']
titanic_data = data[selected_features]

# Xử lý dữ liệu bị thiếu
titanic_data['Age'].fillna(titanic_data['Age'].median(), inplace=True)

# Mã hóa biến 'Sex'
titanic_data['Sex'] = titanic_data['Sex'].map({'male': 0, 'female': 1})

# Chuẩn hóa dữ liệu
scaler = StandardScaler()
scaled_data = scaler.fit_transform(titanic_data)

# Xem dữ liệu sau khi chuẩn hóa
print(pd.DataFrame(scaled_data, columns=selected_features).head())
```

## 3. Áp dụng K-means
Thực hiện phân cụm và hiển thị kết quả.

```python
# Áp dụng K-means
k = 3  # Số cụm tùy chọn (dựa trên phân tích)
kmeans = KMeans(n_clusters=k, random_state=42)
clusters = kmeans.fit_predict(scaled_data)

# Thêm nhãn cụm vào dữ liệu gốc
titanic_data['Cluster'] = clusters

# Xem kết quả phân cụm
print(titanic_data.head())
```

## 4. Hiển thị kết quả phân cụm
Vẽ đồ thị để xem các cụm hành khách.

```python
plt.figure(figsize=(8, 6))
plt.scatter(scaled_data[:, 0], scaled_data[:, 1], c=clusters, cmap='viridis', s=30)
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], 
            c='red', marker='X', s=200, label='Tâm cụm')
plt.title('Phân cụm hành khách Titanic')
plt.xlabel('Tuổi (scaled)')
plt.ylabel('Giá vé (scaled)')
plt.legend()
plt.show()
```

## 5. Ứng dụng cụ thể
Ứng dụng của K-means trong bài toán Titanic:
- Xác định các nhóm hành khách dựa trên đặc điểm:
  - Nhóm hành khách giàu, trẻ, có vé hạng nhất.
  - Nhóm hành khách trung niên, vé giá trung bình.
  - Nhóm hành khách nghèo, vé hạng thấp.
- Điều này giúp tìm hiểu cách các yếu tố này ảnh hưởng đến khả năng sống sót.
- Gợi ý chiến lược cứu hộ:
  - Các nhóm hành khách dễ bị tổn thương (ví dụ: vé hạng 3, trẻ em, người già) có thể được xác định để ưu tiên cứu hộ.
- Tối ưu hóa mô hình dự đoán:
  - Sử dụng cụm như một tính năng bổ sung trong mô hình machine learning để cải thiện độ chính xác.

### Tích hợp cụm vào mô hình dự đoán:

```python
# Thêm cụm như một tính năng mới
data['Cluster'] = titanic_data['Cluster']

# Tiếp tục xây dựng mô hình dự đoán sống sót (ví dụ: logistic regression)
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

# Chọn các cột bao gồm 'Cluster'
features = ['Pclass', 'Age', 'Fare', 'Sex', 'Cluster']
X = data[features]
y = data['Survived']

# Tách dữ liệu train/test
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)

# Huấn luyện mô hình
model = LogisticRegression()
model.fit(X_train, y_train)

# Dự đoán và đánh giá
y_pred = model.predict(X_test)
print(f"Độ chính xác của mô hình: {accuracy_score(y_test, y_pred):.2f}")
```

## Kết luận
Sử dụng K-means trong bài toán Titanic giúp:
- Tìm ra các nhóm hành khách quan trọng.
- Tăng cường hiểu biết về dữ liệu.
- Cải thiện hiệu quả dự đoán khi tích hợp cụm vào mô hình học máy.

