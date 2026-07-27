# Spectral Clustering

Spectral Clustering là một phương pháp phân cụm dựa trên phổ của ma trận kề của đồ thị. Nó sử dụng các giá trị riêng (eigenvalues) và vector riêng (eigenvectors) của ma trận kề để chuyển dữ liệu vào không gian có chiều thấp hơn và sau đó phân cụm chúng. Phương pháp này rất mạnh mẽ trong việc phân nhóm các dữ liệu phức tạp và có thể áp dụng cho các dữ liệu không tuyến tính hoặc dữ liệu có các mối quan hệ không rõ ràng giữa các điểm dữ liệu.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết nếu chưa có:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Chúng ta sẽ xử lý dữ liệu Titanic giống như các phương pháp phân cụm khác, bao gồm việc chuẩn bị dữ liệu, mã hóa các giá trị không số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import SpectralClustering
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

## 3. Áp dụng Spectral Clustering

Bây giờ, chúng ta sẽ áp dụng Spectral Clustering để phân nhóm dữ liệu. Bạn có thể thay đổi số cụm (n_clusters) nếu muốn.

```python
# Khởi tạo và áp dụng Spectral Clustering
spectral = SpectralClustering(n_clusters=3, affinity='nearest_neighbors', random_state=42)
clusters = spectral.fit_predict(X_scaled)

# Thêm nhãn phân cụm vào dữ liệu
data['Cluster'] = clusters
```

## 4. Trực quan hóa kết quả phân cụm

Giống như các phương pháp phân cụm khác, chúng ta có thể sử dụng PCA hoặc t-SNE để giảm chiều dữ liệu xuống còn 2 chiều và vẽ biểu đồ phân cụm.

```python
from sklearn.decomposition import PCA

# Sử dụng PCA để giảm chiều dữ liệu về 2D
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Vẽ biểu đồ phân cụm
plt.figure(figsize=(10, 6))
sns.scatterplot(x=pca_components[:, 0], y=pca_components[:, 1], hue=data['Cluster'], palette='viridis', s=100)
plt.title("Spectral Clustering (PCA Reduction)")
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

1. **Phân nhóm hành khách theo các đặc điểm chung**  
   Spectral Clustering có thể phân nhóm các hành khách Titanic theo các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch). Phương pháp này có thể nhận diện các mối quan hệ không tuyến tính giữa các điểm dữ liệu và phân nhóm chúng một cách chính xác.  
   Ứng dụng thực tế: Phân nhóm này có thể giúp xác định các nhóm hành khách có đặc điểm chung, ví dụ nhóm hành khách có khả năng sống sót cao có thể là phụ nữ và trẻ em, trong khi nhóm hành khách có mức chi tiêu cao có thể có hạng vé cao và khả năng sống sót tốt hơn.

2. **Tìm các mối quan hệ phức tạp trong dữ liệu**  
   Một trong những ưu điểm của Spectral Clustering là khả năng phát hiện các mối quan hệ phức tạp trong dữ liệu. Nếu dữ liệu có cấu trúc phức tạp, ví dụ các nhóm hành khách không phân tách rõ ràng theo các đường thẳng, Spectral Clustering vẫn có thể phân nhóm chính xác.  
   Ứng dụng trong phân tích hành vi: Phương pháp này có thể tìm ra các nhóm hành khách có hành vi tiêu dùng tương tự, giúp hiểu rõ hơn về các nhóm khách hàng có đặc điểm riêng biệt.

3. **Phát hiện nhóm hành khách không rõ ràng**  
   Spectral Clustering có thể tìm thấy các cụm mà các phương pháp phân cụm khác (như K-Means) có thể bỏ qua. Ví dụ, hành khách có mức chi tiêu thấp nhưng có các đặc điểm khác biệt có thể được phân thành một nhóm riêng biệt.  
   Ứng dụng trong kiểm tra dữ liệu: Phát hiện các nhóm hành khách không thể phân loại vào các nhóm chính. Điều này có thể giúp kiểm tra lại dữ liệu hoặc nhận diện các nhóm khách hàng có tiềm năng đặc biệt.

4. **Tạo các chiến lược tiếp thị dựa trên phân nhóm**  
   Các nhóm hành khách được phân cụm bởi Spectral Clustering có thể được sử dụng để phát triển các chiến lược tiếp thị, như các chiến dịch ưu đãi cho hành khách trong các nhóm cụ thể.  
   Ứng dụng trong tiếp thị: Ví dụ, các hành khách thuộc nhóm có hạng vé cao hoặc nhóm có đặc điểm giống nhau có thể nhận được các chương trình khuyến mãi đặc biệt.

## 7. Kết luận

Spectral Clustering là một phương pháp phân cụm mạnh mẽ, giúp phân nhóm các dữ liệu có cấu trúc phức tạp và không tuyến tính. Điều này rất hữu ích trong các bài toán phân cụm phức tạp như Titanic, nơi các đặc trưng của hành khách không phải lúc nào cũng phân tách rõ ràng.  
Trong bài toán Titanic, Spectral Clustering có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu. Phương pháp này không chỉ giúp phát hiện các nhóm hành khách có đặc điểm chung mà còn phát hiện các mối quan hệ phức tạp giữa các đặc trưng.

