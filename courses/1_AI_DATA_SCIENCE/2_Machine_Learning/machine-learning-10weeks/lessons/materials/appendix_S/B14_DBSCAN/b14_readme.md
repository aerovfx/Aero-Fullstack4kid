# DBSCAN (Density-Based Spatial Clustering of Applications with Noise)

DBSCAN là một thuật toán phân cụm không giám sát rất mạnh mẽ, đặc biệt hiệu quả khi xử lý dữ liệu có dạng không đều và có nhiễu (outliers). DBSCAN nhóm các điểm dữ liệu lại với nhau nếu chúng nằm trong một khu vực có mật độ cao, và các điểm không thuộc nhóm nào sẽ bị coi là nhiễu. Một trong những ưu điểm của DBSCAN là không cần xác định số lượng cụm trước, giúp phân nhóm dữ liệu một cách tự động.

Dưới đây là cách áp dụng DBSCAN cho bài toán Titanic sử dụng thư viện Scikit-learn.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, chúng ta cần chuẩn bị dữ liệu đầu vào trước khi áp dụng DBSCAN. Sau đây là cách xử lý dữ liệu:

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import DBSCAN
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

## 3. Áp dụng DBSCAN

DBSCAN yêu cầu hai tham số quan trọng:
- `eps` (epsilon): Khoảng cách tối đa giữa hai điểm để chúng có thể được xem là một phần của cùng một nhóm.
- `min_samples`: Số lượng điểm tối thiểu để tạo thành một nhóm.

```python
# Khởi tạo và áp dụng DBSCAN
dbscan = DBSCAN(eps=0.5, min_samples=5)
clusters = dbscan.fit_predict(X_scaled)

# Thêm nhãn phân cụm vào dữ liệu
data['Cluster'] = clusters
```

## 4. Trực quan hóa kết quả phân cụm

Chúng ta có thể sử dụng PCA hoặc t-SNE để giảm chiều dữ liệu xuống còn 2 chiều, sau đó vẽ biểu đồ phân cụm.

```python
from sklearn.decomposition import PCA

# Sử dụng PCA để giảm chiều dữ liệu về 2D
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Vẽ biểu đồ phân cụm
plt.figure(figsize=(10, 6))
sns.scatterplot(x=pca_components[:, 0], y=pca_components[:, 1], hue=data['Cluster'], palette='viridis', s=100)
plt.title("DBSCAN Clustering (PCA Reduction)")
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.legend()
plt.show()
```

## 5. Đánh giá và phân tích

DBSCAN phân các điểm thành các cụm và xác định các điểm nhiễu (outliers). Các điểm không thuộc bất kỳ cụm nào sẽ được gán nhãn là -1.

```python
# Phân tích mô hình phân cụm
cluster_analysis = data.groupby('Cluster').mean()
print(cluster_analysis)

# Kiểm tra các điểm nhiễu (outliers)
outliers = data[data['Cluster'] == -1]
print("Số lượng điểm nhiễu:", len(outliers))
```

## 6. Ứng dụng thực tế trong bài toán Titanic

1. **Phân nhóm hành khách dựa trên đặc trưng chung**  
DBSCAN có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé, và số người đi cùng. Các hành khách có các đặc trưng tương tự có thể được phân vào cùng một nhóm.  
Ứng dụng thực tế: Điều này giúp phân nhóm hành khách với các đặc điểm chung, ví dụ, hành khách trong cùng một hạng vé có thể có những yêu cầu và hành vi tương tự. Dữ liệu này có thể được sử dụng để tối ưu hóa các chiến lược tiếp thị hoặc các chương trình bảo hiểm.

2. **Tìm kiếm các nhóm hành khách có khả năng sống sót tương tự**  
DBSCAN có thể được sử dụng để nhóm các hành khách có khả năng sống sót tương tự nhau. Ví dụ, những hành khách có cùng giới tính, tuổi, hạng vé có thể có khả năng sống sót tương tự nhau.  
Ứng dụng trong cứu hộ: Các nhóm hành khách với các đặc trưng giống nhau có thể giúp xác định các chiến lược cứu hộ, chẳng hạn như ưu tiên cứu hành khách trong nhóm có khả năng sống sót cao.

3. **Phát hiện hành khách không điển hình (outliers)**  
Một trong những ưu điểm của DBSCAN là khả năng phát hiện các điểm nhiễu (outliers). Những hành khách không thể được phân vào bất kỳ nhóm nào sẽ được gán nhãn là -1. Điều này giúp phát hiện các hành khách có đặc trưng đặc biệt hoặc không phù hợp với các nhóm thông thường.  
Ứng dụng trong phân tích dữ liệu: Các hành khách là outliers có thể đại diện cho những trường hợp đặc biệt (chẳng hạn, hành khách có đặc trưng không giống ai, có thể cần phải được xem xét kỹ lưỡng hơn trong các tình huống cứu hộ hoặc bảo hiểm).

4. **Phân tích hành vi của hành khách**  
DBSCAN có thể nhóm các hành khách dựa trên hành vi và đặc trưng của họ. Ví dụ, những hành khách có mức chi tiêu (Fare) cao và đi theo nhóm (SibSp hoặc Parch) có thể tạo thành một nhóm hành khách đặc biệt cần được quan tâm trong các chiến lược tiếp thị.  
Ứng dụng trong tiếp thị: Các công ty có thể sử dụng phân cụm này để hiểu rõ hơn về các nhóm hành khách khác nhau, từ đó phát triển các chương trình khuyến mãi hoặc chiến lược dịch vụ phù hợp.

## 7. Kết luận

DBSCAN là một thuật toán phân cụm mạnh mẽ và linh hoạt, đặc biệt hữu ích khi dữ liệu có dạng không đều và có nhiễu. Trong bài toán Titanic, DBSCAN có thể giúp phân nhóm hành khách dựa trên các đặc trưng quan trọng như giới tính, tuổi, hạng vé, và mức chi tiêu, cũng như phát hiện các điểm nhiễu và các nhóm hành khách không điển hình. Phân tích này có thể hỗ trợ trong việc phát triển các chiến lược cứu hộ, bảo hiểm, và tiếp thị cho hành khách trên tàu Titanic.

