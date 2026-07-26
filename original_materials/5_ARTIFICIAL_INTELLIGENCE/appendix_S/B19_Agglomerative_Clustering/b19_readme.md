# Agglomerative Clustering

Agglomerative Clustering là một phương pháp phân cụm phân cấp (hierarchical clustering) dựa trên chiến lược "bottom-up". Điều này có nghĩa là thuật toán bắt đầu với mỗi điểm dữ liệu là một cụm riêng biệt và dần dần kết hợp chúng lại thành các cụm lớn hơn cho đến khi tất cả các điểm dữ liệu thuộc về một cụm lớn hoặc đạt được điều kiện dừng.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết nếu chưa có:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, bạn cần xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa dữ liệu.

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

## 3. Áp dụng Agglomerative Clustering

Bây giờ chúng ta sẽ áp dụng Agglomerative Clustering để phân nhóm dữ liệu. Phương pháp này sử dụng chiến lược "bottom-up" để kết hợp các cụm.

```python
# Khởi tạo và áp dụng Agglomerative Clustering
agglomerative = AgglomerativeClustering(n_clusters=3, affinity='euclidean', linkage='ward')
clusters = agglomerative.fit_predict(X_scaled)

# Thêm nhãn phân cụm vào dữ liệu
data['Cluster'] = clusters
```

## 4. Trực quan hóa kết quả phân cụm

Giống như các phương pháp phân cụm khác, bạn có thể sử dụng PCA hoặc t-SNE để giảm chiều dữ liệu xuống còn 2 chiều và vẽ biểu đồ phân cụm.

```python
from sklearn.decomposition import PCA

# Sử dụng PCA để giảm chiều dữ liệu về 2D
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Vẽ biểu đồ phân cụm
plt.figure(figsize=(10, 6))
sns.scatterplot(x=pca_components[:, 0], y=pca_components[:, 1], hue=data['Cluster'], palette='viridis', s=100)
plt.title("Agglomerative Clustering (PCA Reduction)")
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.legend()
plt.show()
```

## 5. Đánh giá và phân tích

Sau khi phân cụm, bạn có thể phân tích các đặc điểm của từng nhóm hành khách trong dataset.

```python
# Phân tích mô hình phân cụm
cluster_analysis = data.groupby('Cluster').mean()
print(cluster_analysis)
```

## 6. Ứng dụng thực tế trong bài toán Titanic

### 1. Phân nhóm hành khách theo các đặc điểm chung

Agglomerative Clustering có thể phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch). Phương pháp này sử dụng chiến lược kết hợp cụm từ các điểm dữ liệu giống nhau.

**Ứng dụng thực tế:** Phân nhóm này có thể giúp xác định các nhóm hành khách có đặc điểm chung như nhóm hành khách giàu có, nhóm hành khách có khả năng sống sót cao hoặc nhóm hành khách có đặc điểm giống nhau về hành vi tiêu dùng.

### 2. Xác định các hành khách có nguy cơ sống sót thấp

Bằng cách sử dụng Agglomerative Clustering, bạn có thể phân nhóm hành khách theo các đặc điểm để tìm ra các nhóm có đặc điểm chung, chẳng hạn như những người có khả năng sống sót thấp (ví dụ nhóm nam giới, người già hoặc nhóm hành khách hạng thấp).

**Ứng dụng trong phân tích sống sót:** Phương pháp này có thể giúp nhận diện nhóm hành khách có khả năng sống sót thấp, từ đó hỗ trợ trong việc xây dựng các chiến lược an toàn và cứu hộ.

### 3. Phát hiện các mối quan hệ không rõ ràng

Agglomerative Clustering giúp phát hiện các mối quan hệ không rõ ràng hoặc phân tách giữa các nhóm hành khách, những người có thể có đặc điểm tương tự nhưng không thể phân loại bằng các phương pháp phân cụm khác.

**Ứng dụng trong nghiên cứu hành vi:** Điều này có thể giúp phát hiện các nhóm hành khách đặc biệt hoặc các yếu tố phức tạp ảnh hưởng đến khả năng sống sót hoặc hành vi của hành khách.

### 4. Tìm các nhóm tiềm ẩn trong dữ liệu

Phương pháp này có thể tìm thấy các nhóm mà các phương pháp phân cụm khác như K-means có thể bỏ qua, đặc biệt khi các nhóm này không phân tách rõ ràng.

**Ứng dụng trong phân tích sâu:** Nó có thể giúp phát hiện các nhóm hành khách mà các phương pháp phân nhóm khác không thể nhận diện, từ đó hỗ trợ nghiên cứu thêm về các yếu tố ảnh hưởng đến sự sống sót của hành khách.

## 7. Kết luận

Agglomerative Clustering là một phương pháp phân cụm mạnh mẽ, giúp phát hiện các nhóm tiềm ẩn trong dữ liệu bằng cách sử dụng chiến lược "bottom-up". Phương pháp này đặc biệt hữu ích khi dữ liệu có cấu trúc phân cấp và không yêu cầu số lượng cụm phải được xác định trước.

Trong bài toán Titanic, Agglomerative Clustering có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu mà không cần xác định số nhóm cụ thể. Phương pháp này giúp phát hiện các nhóm hành khách có đặc điểm chung, hỗ trợ phân tích hành vi tiêu dùng và xác định các yếu tố ảnh hưởng đến khả năng sống sót.

