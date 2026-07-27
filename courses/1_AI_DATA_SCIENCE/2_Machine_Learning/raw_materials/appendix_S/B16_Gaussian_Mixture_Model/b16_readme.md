# Gaussian Mixture Model (GMM)

Gaussian Mixture Model (GMM) là một mô hình xác suất dựa trên việc giả định rằng dữ liệu có thể được mô tả dưới dạng một hỗn hợp các phân phối chuẩn (Gaussian). GMM là một phương pháp phân cụm mềm, nghĩa là nó phân loại mỗi điểm dữ liệu vào mỗi cụm với một xác suất nhất định, thay vì chỉ gán điểm dữ liệu vào một cụm duy nhất như các phương pháp phân cụm khác.

Dưới đây là cách áp dụng GMM cho bài toán Titanic, sử dụng thư viện Scikit-learn.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, ta cần chuẩn bị dữ liệu đầu vào trước khi áp dụng GMM. Sau đây là cách xử lý dữ liệu:

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.mixture import GaussianMixture
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

# Chuẩn hóa dữ liệu (StandardScaler)
scaler = StandardScaler()
X = data[selected_features]
X_scaled = scaler.fit_transform(X)
```

## 3. Áp dụng Gaussian Mixture Model (GMM)

Giờ ta sẽ áp dụng GMM để phân nhóm dữ liệu. Bạn cần chỉ định số cụm (k) mà bạn muốn GMM tìm ra. Trong ví dụ này, tôi sẽ chọn 3 cụm, nhưng bạn có thể thay đổi số lượng cụm tùy theo kết quả phân tích.

```python
# Khởi tạo và áp dụng Gaussian Mixture Model (GMM)
gmm = GaussianMixture(n_components=3, random_state=42)
gmm.fit(X_scaled)

# Dự đoán nhãn phân cụm cho mỗi điểm dữ liệu
clusters = gmm.predict(X_scaled)

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
plt.title("Gaussian Mixture Model Clustering (PCA Reduction)")
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.legend()
plt.show()
```

## 5. Đánh giá và phân tích

Sau khi phân cụm, bạn có thể phân tích các đặc điểm của từng nhóm:

```python
# Phân tích mô hình phân cụm
cluster_analysis = data.groupby('Cluster').mean()
print(cluster_analysis)
```

## 6. Ứng dụng thực tế trong bài toán Titanic

### 1. Phân nhóm hành khách theo đặc trưng chung

Gaussian Mixture Model (GMM) có thể giúp phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare) và số người đi cùng (SibSp, Parch). GMM có thể nhận diện những nhóm có đặc điểm giống nhau nhưng không giới hạn số lượng cụm.

**Ứng dụng thực tế:** Phân nhóm này có thể giúp xác định các nhóm hành khách có đặc trưng chung, ví dụ nhóm hành khách sống sót hoặc nhóm hành khách có mức chi tiêu cao.

### 2. Phát hiện hành khách có khả năng sống sót tương tự

Dựa vào phân cụm, các hành khách có đặc trưng giống nhau sẽ được nhóm lại với nhau. GMM có thể giúp phát hiện các nhóm hành khách có khả năng sống sót tương tự nhau, như nhóm phụ nữ và trẻ em hoặc nhóm hành khách có hạng vé cao.

**Ứng dụng trong cứu hộ:** Các nhóm hành khách có khả năng sống sót cao có thể được ưu tiên trong các tình huống cứu hộ. GMM giúp phân nhóm này tự động mà không cần phải định trước số nhóm.

### 3. Phát hiện nhóm hành khách có đặc điểm khác biệt

Một điểm mạnh của GMM là nó không yêu cầu số lượng cụm phải xác định trước, giúp phát hiện những nhóm hành khách có đặc điểm đặc biệt mà các phương pháp phân cụm khác có thể bỏ qua. Ví dụ, hành khách có mức chi tiêu cực kỳ thấp hoặc rất cao có thể nằm ngoài các nhóm lớn.

**Ứng dụng trong phân tích dữ liệu:** Các nhóm hành khách này có thể là các điểm bất thường (outliers), giúp kiểm tra lại dữ liệu hoặc đưa ra các chiến lược phân tích sâu hơn.

### 4. Tối ưu hóa các chiến lược tiếp thị và chăm sóc khách hàng

GMM có thể phân nhóm hành khách dựa trên các đặc trưng tiêu dùng như hạng vé, mức chi tiêu và hành vi khác. Các nhóm này có thể được sử dụng để phát triển các chiến lược tiếp thị, như các chương trình khuyến mãi đặc biệt dành cho hành khách trong các nhóm cụ thể.

**Ứng dụng trong tiếp thị:** Các nhóm có mức chi tiêu cao hoặc hành khách có các đặc trưng tương tự có thể nhận các chiến dịch tiếp thị tùy chỉnh, nhằm tối ưu hóa tỷ lệ chuyển đổi.

## 7. Kết luận

Gaussian Mixture Model (GMM) là một phương pháp phân cụm mạnh mẽ, có thể tự động xác định số lượng cụm và phân nhóm dữ liệu theo xác suất.

Trong bài toán Titanic, GMM có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu và số người đi cùng. GMM có thể phát hiện các nhóm hành khách có khả năng sống sót tương tự, cũng như các nhóm hành khách có đặc điểm khác biệt. Phân tích này có thể hỗ trợ trong việc xây dựng các chiến lược cứu hộ, tiếp thị và phân tích hành vi khách hàng.

