# BIRCH (Balanced Iterative Reducing and Clustering using Hierarchies)

BIRCH là một phương pháp phân cụm hiệu quả đối với dữ liệu lớn, nhắm đến việc phân cụm dữ liệu theo dạng cây phân cấp. BIRCH thực hiện phân cụm trong nhiều bước, với mục đích giảm thiểu lượng dữ liệu ban đầu thông qua một cấu trúc gọi là CF Tree (Clustering Feature Tree). Điều này giúp xử lý nhanh các tập dữ liệu lớn mà không yêu cầu phải duy trì toàn bộ dữ liệu trong bộ nhớ.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt thư viện cần thiết nếu chưa có:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Cũng giống như các phương pháp phân cụm khác, bạn cần chuẩn bị dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import Birch
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

## 3. Áp dụng BIRCH

Bây giờ chúng ta sẽ áp dụng BIRCH để phân nhóm dữ liệu. Phương pháp này yêu cầu bạn chỉ định một số tham số như `n_clusters` (số cụm mong muốn) và `threshold` (giới hạn tối đa để các điểm dữ liệu có thể thuộc vào cùng một cụm trong một bước).

```python
# Áp dụng BIRCH
birch_model = Birch(n_clusters=3, threshold=0.5)
clusters = birch_model.fit_predict(X_scaled)

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
plt.title("BIRCH Clustering (PCA Reduction)")
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

### 1. Phân nhóm hành khách dựa trên các đặc điểm chung

BIRCH có thể phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch). Phương pháp này sẽ giúp nhóm các hành khách có đặc điểm tương đồng lại với nhau.

Ứng dụng thực tế: Việc phân nhóm này có thể hỗ trợ các chiến lược tiếp thị hoặc chăm sóc khách hàng đặc biệt cho từng nhóm hành khách, chẳng hạn như nhóm hành khách hạng nhất, nhóm người lớn tuổi, hoặc nhóm gia đình đi cùng nhau.

### 2. Xử lý dữ liệu lớn

BIRCH là một phương pháp rất hiệu quả khi xử lý dữ liệu lớn vì nó sử dụng cây phân cấp để giảm bớt lượng dữ liệu cần phải xử lý. Điều này giúp tiết kiệm bộ nhớ và thời gian tính toán.

Ứng dụng trong phân tích dữ liệu lớn: Trong trường hợp bạn có một dataset rất lớn hoặc dữ liệu có thể được phân tách nhiều lần, BIRCH có thể giúp giảm thiểu bộ nhớ cần thiết mà vẫn duy trì khả năng phân tích.

### 3. Phát hiện các nhóm với sự phân chia rõ ràng

BIRCH có thể giúp nhận diện các nhóm hành khách với đặc điểm rõ ràng. Nhờ vào cấu trúc cây phân cấp, BIRCH có thể phân nhóm hành khách dựa trên các đặc điểm mật độ, giúp phát hiện các nhóm có sự phân chia rõ ràng.

Ứng dụng trong phân tích sự sống sót: Phân nhóm hành khách theo những đặc điểm rõ ràng có thể giúp xây dựng các chiến lược cứu hộ hoặc đánh giá xác suất sống sót của hành khách dựa trên nhóm họ thuộc về.

### 4. Tăng cường hiệu quả phân cụm với dữ liệu phức tạp

BIRCH có thể phân cụm hiệu quả với dữ liệu có cấu trúc phức tạp, nơi các cụm có thể có kích thước khác nhau hoặc không phân tách rõ ràng.

Ứng dụng trong phân tích hành vi: Phương pháp này có thể giúp phân tích hành vi tiêu dùng của hành khách, nhóm những hành khách có đặc điểm mua sắm tương tự hoặc hành vi chi tiêu giống nhau.

## 7. Kết luận

BIRCH là một phương pháp phân cụm hiệu quả khi xử lý dữ liệu lớn, đặc biệt là khi dữ liệu có sự phân tách rõ ràng giữa các nhóm. Phương pháp này sử dụng một cấu trúc cây phân cấp để giảm thiểu lượng dữ liệu cần phải xử lý và tìm kiếm các nhóm dữ liệu có tính chất mật độ khác nhau.

Trong bài toán Titanic, BIRCH có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu, đồng thời giúp phân tích hành vi của hành khách và hỗ trợ các chiến lược tiếp thị hoặc cứu hộ hiệu quả. Phương pháp này cũng rất hữu ích khi xử lý các tập dữ liệu lớn mà không cần phải duy trì toàn bộ dữ liệu trong bộ nhớ.
