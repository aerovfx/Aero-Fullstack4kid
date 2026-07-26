# Fuzzy C-Means (FCM)

Fuzzy C-Means (FCM) là một phương pháp phân cụm mềm, khác biệt so với các phương pháp phân cụm cứng như K-Means. Trong FCM, mỗi điểm dữ liệu có thể thuộc về nhiều cụm với mức độ khác nhau, thay vì chỉ thuộc về một cụm duy nhất. Điều này giúp FCM xử lý các trường hợp mà dữ liệu không phân tách rõ ràng giữa các nhóm.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt thư viện cần thiết nếu chưa có:

```bash
pip install scikit-fuzzy scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, bạn cần chuẩn bị dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
import skfuzzy as fuzz
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

## 3. Áp dụng Fuzzy C-Means

Bây giờ chúng ta sẽ áp dụng Fuzzy C-Means (FCM) để phân nhóm dữ liệu. Phương pháp này yêu cầu chỉ định số cụm (c) và sử dụng một hệ số m (m > 1) để điều chỉnh mức độ mềm của phân cụm.

```python
# Chỉ định số cụm và hệ số m
c = 3  # Số cụm
m = 2  # Hệ số mềm

# Áp dụng FCM
cntr, u, _, _, _, _, _ = fuzz.cluster.cmeans(X_scaled.T, c, m, error=0.005, maxiter=1000)

# u: ma trận thành viên, mỗi điểm dữ liệu có thể thuộc về nhiều cụm với các mức độ khác nhau
clusters = np.argmax(u, axis=0)

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
plt.title("Fuzzy C-Means Clustering (PCA Reduction)")
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

Fuzzy C-Means (FCM) có thể phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch). Phương pháp này giúp mỗi hành khách có thể thuộc vào nhiều nhóm với các mức độ khác nhau.

**Ứng dụng thực tế:** Điều này rất hữu ích khi phân tích các hành khách không phân tách rõ ràng giữa các nhóm, ví dụ như nhóm hành khách vừa trẻ tuổi nhưng lại có mức chi tiêu cao.

### 2. Phân tích các hành khách có tính chất không rõ ràng

Với Fuzzy C-Means, mỗi hành khách có thể thuộc nhiều nhóm với mức độ khác nhau. Điều này có thể hữu ích trong việc phân tích các hành khách có đặc điểm không rõ ràng. Chẳng hạn, một hành khách có thể vừa có mức chi tiêu cao vừa có hạng vé thấp, thuộc vào hai nhóm với mức độ khác nhau.

**Ứng dụng trong phân tích sống sót:** Phương pháp này có thể giúp nhận diện những hành khách có thể có khả năng sống sót cao nhưng không phân biệt rõ ràng trong dữ liệu, chẳng hạn nhóm hành khách có thể sống sót vì nhóm phụ nữ và trẻ em nhưng lại có những đặc điểm của nhóm hành khách hạng thấp.

### 3. Phát hiện hành khách tiềm năng cho các chiến lược tiếp thị

Bằng cách sử dụng Fuzzy C-Means, bạn có thể phát hiện các nhóm hành khách có thể có đặc điểm chung nhưng không phải là những nhóm phân tách rõ ràng, từ đó xây dựng các chiến lược tiếp thị hoặc các dịch vụ phù hợp với từng nhóm tiềm năng.

**Ứng dụng trong tiếp thị:** Các nhóm hành khách có mức chi tiêu cao, dù thuộc nhiều nhóm khác nhau, có thể nhận các chiến lược tiếp thị đặc biệt, chẳng hạn như ưu đãi cho những người đi tàu hạng nhất hoặc nhóm phụ nữ có khả năng mua sắm cao.

### 4. Phân tích hành vi phức tạp

Fuzzy C-Means giúp nhận diện các nhóm hành khách có tính chất phức tạp hơn, mà các phương pháp phân cụm cứng như K-Means có thể bỏ qua. Điều này có thể cung cấp cái nhìn sâu sắc hơn về hành vi của hành khách và các yếu tố ảnh hưởng đến sự sống sót.

**Ứng dụng trong phân tích hành vi:** Các nhóm hành khách có thể được phân tích chi tiết hơn, chẳng hạn như nhóm có khả năng sống sót cao nhưng cũng có thể có các đặc điểm hành vi không giống nhau, như nhóm hành khách giàu có nhưng cũng có trẻ em đi kèm.

## 7. Kết luận

Fuzzy C-Means (FCM) là một phương pháp phân cụm mềm giúp phân nhóm dữ liệu mà không cần phải xác định rõ ràng sự phân biệt giữa các nhóm. Điều này rất hữu ích trong các trường hợp dữ liệu có tính chất mơ hồ hoặc không phân tách rõ ràng.

Trong bài toán Titanic, Fuzzy C-Means có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu. Phương pháp này giúp phân tích các hành khách có khả năng sống sót hoặc hành vi tiêu dùng phức tạp hơn, đồng thời phát hiện các nhóm hành khách có đặc điểm chung mà không bị phân tách cứng nhắc.

