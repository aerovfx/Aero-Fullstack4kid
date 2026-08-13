# Affinity Propagation

Affinity Propagation là một phương pháp phân cụm không yêu cầu bạn phải xác định số lượng cụm trước. Thay vào đó, thuật toán này tìm kiếm các điểm "trung tâm" (exemplars) trong dữ liệu và phân nhóm các điểm khác theo những exemplars này. Một điểm mạnh của Affinity Propagation là khả năng xử lý các dữ liệu có cấu trúc phức tạp và không đều.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết nếu chưa có:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, bạn sẽ cần chuẩn bị dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import AffinityPropagation
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

## 3. Áp dụng Affinity Propagation

Bây giờ chúng ta sẽ áp dụng Affinity Propagation để phân nhóm dữ liệu. Phương pháp này tự động tìm ra số lượng cụm mà không cần xác định trước.

```python
# Khởi tạo và áp dụng Affinity Propagation
affinity_propagation = AffinityPropagation(random_state=42)
clusters = affinity_propagation.fit_predict(X_scaled)

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
plt.title("Affinity Propagation Clustering (PCA Reduction)")
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

1. **Phân nhóm hành khách tự động mà không cần xác định số nhóm trước**  
   Affinity Propagation có thể phân nhóm hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, mức chi tiêu (Fare), và số người đi cùng (SibSp, Parch), mà không cần xác định số nhóm (cụm) trước. Đây là một ưu điểm lớn trong việc khám phá các nhóm tiềm ẩn trong dữ liệu.  
   Ứng dụng thực tế: Phương pháp này có thể giúp phân nhóm hành khách vào các nhóm không giống nhau dựa trên những đặc điểm phức tạp mà không cần phải xác định số nhóm trước. Điều này rất hữu ích trong các tình huống mà bạn không biết trước dữ liệu có thể phân nhóm như thế nào.

2. **Phát hiện hành khách có đặc điểm chung**  
   Affinity Propagation sẽ tự động chọn các điểm trung tâm (exemplars), từ đó các hành khách khác sẽ được phân vào nhóm dựa trên sự tương đồng với các exemplars này. Các nhóm này có thể là các nhóm hành khách có đặc điểm chung, chẳng hạn như nhóm hành khách có khả năng sống sót cao hoặc nhóm hành khách có mức chi tiêu cao.  
   Ứng dụng trong phân tích hành vi: Các nhóm hành khách có thể được phân loại để phân tích các yếu tố ảnh hưởng đến khả năng sống sót hoặc các chiến lược tiếp thị đặc biệt.

3. **Phát hiện các mối quan hệ không tuyến tính**  
   Affinity Propagation có thể phát hiện các mối quan hệ không tuyến tính giữa các điểm dữ liệu. Điều này rất hữu ích trong các bài toán phức tạp như Titanic, nơi các nhóm hành khách không được phân tách rõ ràng bởi các đường thẳng.  
   Ứng dụng trong phân tích dữ liệu: Phương pháp này có thể giúp tìm ra các nhóm hành khách mà các phương pháp phân cụm khác có thể bỏ qua, chẳng hạn như nhóm hành khách có các yếu tố không tương đồng.

4. **Phát triển các chiến lược tiếp thị mục tiêu**  
   Các nhóm hành khách được phân cụm bởi Affinity Propagation có thể được sử dụng để phát triển các chiến lược tiếp thị dựa trên các đặc điểm chung của mỗi nhóm, chẳng hạn như mức chi tiêu, tuổi tác, và hạng vé.  
   Ứng dụng trong tiếp thị: Các nhóm hành khách có hạng vé cao hoặc có đặc điểm giống nhau có thể nhận các chiến dịch tiếp thị tùy chỉnh, chẳng hạn như các ưu đãi đặc biệt cho những hành khách thuộc nhóm có khả năng sống sót cao hoặc hành khách đi cùng gia đình.

## 7. Kết luận

Affinity Propagation là một phương pháp phân cụm mạnh mẽ, tự động xác định số lượng cụm mà không yêu cầu xác định trước, giúp phát hiện các nhóm tiềm ẩn trong dữ liệu. Phương pháp này rất hữu ích trong các bài toán như Titanic, nơi các đặc trưng phức tạp có thể tạo ra các nhóm không rõ ràng.

Trong bài toán Titanic, Affinity Propagation có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu mà không cần xác định số nhóm cụ thể. Phương pháp này giúp phát hiện các nhóm hành khách có đặc điểm chung, phân tích hành vi tiêu dùng và phát triển các chiến lược tiếp thị tùy chỉnh.

