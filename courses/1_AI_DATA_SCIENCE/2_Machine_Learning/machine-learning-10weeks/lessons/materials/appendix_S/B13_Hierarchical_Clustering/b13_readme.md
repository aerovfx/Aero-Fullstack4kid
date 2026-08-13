# Hierarchical Clustering (Phân cụm phân cấp)

Hierarchical Clustering là một phương pháp phân cụm không giám sát, không yêu cầu chỉ định số lượng cụm trước, và có thể phân nhóm dữ liệu dựa trên các đặc điểm tương đồng của các điểm dữ liệu. Đây là một phương pháp mạnh mẽ khi bạn không biết trước số lượng nhóm cần phân chia và muốn có một cái nhìn trực quan về các mối quan hệ giữa các nhóm dữ liệu.

Dưới đây là cách áp dụng Hierarchical Clustering cho bài toán Titanic, sử dụng thư viện Scikit-learn.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt thư viện cần thiết:

```bash
pip install scikit-learn matplotlib pandas
```

## 2. Chuẩn bị dữ liệu

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import AgglomerativeClustering
import matplotlib.pyplot as plt
import seaborn as sns

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

# Chuẩn hóa dữ liệu
scaler = StandardScaler()
X = data[selected_features]
X_scaled = scaler.fit_transform(X)
```

## 3. Áp dụng Hierarchical Clustering

```python
# Khởi tạo mô hình Hierarchical Clustering (AgglomerativeClustering)
# Chúng ta sẽ chọn số cụm = 2 (Sống sót hoặc không)
model = AgglomerativeClustering(n_clusters=2)

# Dự đoán các cụm
clusters = model.fit_predict(X_scaled)

# Thêm nhãn phân cụm vào dữ liệu
data['Cluster'] = clusters
```

## 4. Trực quan hóa kết quả phân cụm

Để trực quan hóa kết quả phân cụm, chúng ta có thể sử dụng t-SNE hoặc PCA để giảm chiều dữ liệu xuống 2 chiều, từ đó vẽ đồ thị phân cụm.

```python
from sklearn.decomposition import PCA

# Sử dụng PCA để giảm chiều về 2D
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Vẽ biểu đồ phân cụm
plt.figure(figsize=(10, 6))
sns.scatterplot(x=pca_components[:, 0], y=pca_components[:, 1], hue=data['Cluster'], palette='viridis', s=100)
plt.title("Phân cụm Hierarchical Clustering (PCA Reduction)")
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.legend()
plt.show()
```

## 5. Đánh giá và phân tích

Sau khi phân cụm, bạn có thể phân tích các đặc điểm của mỗi nhóm phân cụm.

```python
# Phân tích mô hình phân cụm
cluster_analysis = data.groupby('Cluster').mean()
print(cluster_analysis)
```

## 6. Ứng dụng thực tế trong bài toán Titanic

1. **Phân nhóm hành khách**:
   Hierarchical Clustering có thể giúp phân nhóm các hành khách Titanic thành các nhóm tương đồng, ví dụ như hành khách có mức sống tương tự, hành khách từ cùng một hạng vé, hoặc hành khách có độ tuổi tương tự.
   - Ứng dụng thực tế: Sử dụng phân cụm này để phân nhóm hành khách theo các đặc điểm nhất định, ví dụ nhóm hành khách có khả năng sống sót cao (chẳng hạn như phụ nữ và trẻ em), nhóm hành khách có khả năng sống sót thấp (ví dụ, nam giới lớn tuổi).

2. **Tìm ra các nhóm hành khách có các đặc trưng giống nhau**:
   Mô hình phân cụm giúp phát hiện những hành khách có các đặc trưng tương tự nhau, chẳng hạn như hạng vé, tuổi, giới tính, và số người đi cùng. Điều này có thể giúp hiểu rõ hơn về các nhóm hành khách khác nhau trên tàu.
   - Ứng dụng trong bảo hiểm: Các công ty bảo hiểm có thể sử dụng phân cụm này để nhóm các hành khách tương tự, từ đó đưa ra các quyết định bảo hiểm khác nhau cho các nhóm có đặc trưng tương đồng.

3. **Hỗ trợ phân tích chiến lược cứu hộ**:
   - Ứng dụng trong tình huống khẩn cấp: Phân cụm có thể giúp các nhân viên cứu hộ phân loại hành khách vào các nhóm ưu tiên khác nhau, ví dụ nhóm có khả năng sống sót cao và nhóm có khả năng sống sót thấp.

4. **Phân tích và tối ưu hóa các chiến lược tiếp thị và dịch vụ**:
   - Ứng dụng trong tiếp thị: Các công ty có thể sử dụng phân cụm để phân tích các nhóm khách hàng tiềm năng với các đặc điểm chung, từ đó tối ưu hóa các chiến dịch quảng cáo hoặc dịch vụ dành riêng cho từng nhóm khách hàng.

## 7. Kết luận

Hierarchical Clustering là một công cụ hữu ích trong việc phân nhóm dữ liệu không giám sát, giúp phát hiện các mẫu và cấu trúc tiềm ẩn trong dữ liệu. Trong bài toán Titanic, Hierarchical Clustering có thể giúp phân nhóm hành khách theo các đặc trưng như giới tính, tuổi, hạng vé và mức fare, từ đó hỗ trợ phân tích, phân nhóm hành khách có khả năng sống sót cao hoặc thấp, cũng như hỗ trợ trong việc ra quyết định về cứu hộ và bảo hiểm.
