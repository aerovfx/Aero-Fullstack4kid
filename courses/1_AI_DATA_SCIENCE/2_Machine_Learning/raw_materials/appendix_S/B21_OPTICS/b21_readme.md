# OPTICS (Ordering Points To Identify the Clustering Structure)

OPTICS là một phương pháp phân cụm mật độ, giống như DBSCAN, nhưng cải tiến hơn ở khả năng xử lý các nhóm có mật độ khác nhau và không yêu cầu xác định số lượng cụm trước. OPTICS tạo ra một cấu trúc phân cụm theo thứ tự, giúp phát hiện các cụm có mật độ khác nhau và các điểm nhiễu trong dữ liệu.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt thư viện cần thiết nếu chưa có:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, bạn cần xử lý dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import OPTICS
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

## 3. Áp dụng OPTICS

Bây giờ chúng ta sẽ áp dụng OPTICS để phân nhóm dữ liệu. OPTICS không yêu cầu số lượng cụm phải xác định trước, mà thay vào đó sử dụng các tham số `min_samples` (số lượng điểm tối thiểu trong một cụm) và `xi` (chỉ số độ rộng của cụm).

```python
# Áp dụng OPTICS
optics = OPTICS(min_samples=5, xi=0.05, min_cluster_size=0.1)
clusters = optics.fit_predict(X_scaled)

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
plt.title("OPTICS Clustering (PCA Reduction)")
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

### 1. Phân nhóm hành khách theo mật độ

OPTICS có thể phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch). OPTICS có khả năng nhận diện các nhóm có mật độ khác nhau, và không yêu cầu số nhóm phải được xác định trước.

**Ứng dụng thực tế:** Điều này giúp phân nhóm các hành khách có đặc điểm tương đồng nhưng có thể không phân tách rõ ràng giữa các nhóm, ví dụ như nhóm hành khách có chi tiêu thấp nhưng số lượng hành khách cùng đi lớn.

### 2. Phát hiện các nhóm có mật độ khác nhau

OPTICS có thể phát hiện các nhóm có mật độ khác nhau mà các phương pháp như K-means không thể nhận diện, ví dụ như nhóm hành khách sống sót có mật độ cao và nhóm hành khách không sống sót với mật độ thấp hơn.

**Ứng dụng trong phân tích sống sót:** OPTICS có thể giúp nhận diện các nhóm hành khách sống sót không đồng đều về mật độ, từ đó phát triển các chiến lược cứu hộ hiệu quả hơn dựa trên các nhóm này.

### 3. Phân cụm tự động mà không cần xác định số nhóm

Một điểm mạnh của OPTICS là khả năng phân nhóm mà không cần biết trước số lượng nhóm. Điều này giúp ứng dụng trong các trường hợp mà không có sự phân chia rõ ràng giữa các nhóm.

**Ứng dụng trong phân tích hành vi:** Phương pháp này có thể giúp nhận diện các hành khách có đặc điểm hành vi phức tạp hoặc khó phân nhóm bằng các phương pháp phân cụm khác.

### 4. Phát hiện nhiễu

OPTICS cũng giúp phát hiện các điểm nhiễu (outliers) trong dữ liệu, những điểm không thuộc về bất kỳ nhóm nào hoặc chỉ thuộc vào nhóm nhỏ.

**Ứng dụng trong phân tích dữ liệu:** Điều này có thể giúp loại bỏ các dữ liệu không quan trọng hoặc dữ liệu nhiễu trong quá trình phân tích, đảm bảo các mô hình phân tích có độ chính xác cao hơn.

## 7. Kết luận

OPTICS là một phương pháp phân cụm mạnh mẽ, có thể phát hiện các nhóm dữ liệu có mật độ khác nhau mà không yêu cầu xác định số lượng nhóm trước. Điều này rất hữu ích trong các bài toán phân cụm có dữ liệu không phân tách rõ ràng hoặc có mật độ phân phối không đồng đều.

Trong bài toán Titanic, OPTICS có thể giúp phân nhóm hành khách theo các đặc trưng như giới tính, tuổi, hạng vé, và mức chi tiêu mà không cần xác định số nhóm trước. Phương pháp này giúp phát hiện các nhóm hành khách có tính chất phức tạp, phân nhóm theo mật độ và phát hiện các điểm nhiễu trong dữ liệu.

