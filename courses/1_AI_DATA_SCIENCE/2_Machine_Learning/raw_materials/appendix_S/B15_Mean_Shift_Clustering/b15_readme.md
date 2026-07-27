# Mean Shift Clustering

Mean Shift Clustering là một thuật toán phân cụm không giám sát, dựa trên ý tưởng tìm kiếm các "đỉnh mật độ cao" trong không gian dữ liệu, nơi các điểm dữ liệu có xu hướng hội tụ về các trung tâm mật độ cao này. Khác với các thuật toán phân cụm như K-Means, Mean Shift không yêu cầu chỉ định số lượng cụm trước mà tự động xác định số cụm dựa trên mật độ của các điểm dữ liệu.

Dưới đây là cách áp dụng Mean Shift Clustering cho bài toán Titanic, sử dụng thư viện Scikit-learn.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân cụm khác, ta cần chuẩn bị dữ liệu đầu vào trước khi áp dụng Mean Shift. Dưới đây là các bước xử lý dữ liệu:

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import MeanShift
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

## 3. Áp dụng Mean Shift Clustering

Giờ ta sẽ áp dụng Mean Shift để phân nhóm dữ liệu:

```python
# Khởi tạo và áp dụng Mean Shift Clustering
mean_shift = MeanShift()
clusters = mean_shift.fit_predict(X_scaled)

# Thêm nhãn phân cụm vào dữ liệu
data['Cluster'] = clusters
```

## 4. Trực quan hóa kết quả phân cụm

Chúng ta có thể sử dụng PCA hoặc t-SNE để giảm chiều dữ liệu xuống còn 2 chiều, từ đó vẽ biểu đồ phân cụm.

```python
from sklearn.decomposition import PCA

# Sử dụng PCA để giảm chiều dữ liệu về 2D
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Vẽ biểu đồ phân cụm
plt.figure(figsize=(10, 6))
sns.scatterplot(x=pca_components[:, 0], y=pca_components[:, 1], hue=data['Cluster'], palette='viridis', s=100)
plt.title("Mean Shift Clustering (PCA Reduction)")
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

1. **Phân nhóm hành khách theo đặc trưng chung**  
   Mean Shift có thể giúp phân nhóm các hành khách Titanic dựa trên các đặc trưng như giới tính, tuổi, hạng vé, và mức chi tiêu (Fare).  
   Ứng dụng thực tế: Phân nhóm này có thể giúp xác định các nhóm hành khách có đặc trưng chung, ví dụ hành khách có khả năng sống sót cao có thể có đặc điểm như phụ nữ và trẻ em, trong khi những hành khách có mức chi tiêu cao có thể có hạng vé cao và khả năng sống sót tốt hơn.

2. **Nhận diện nhóm hành khách có đặc trưng tương đồng**  
   Mean Shift tự động xác định các cụm dựa trên mật độ, điều này giúp nhóm các hành khách có đặc trưng tương tự mà không cần xác định số cụm trước.  
   Ứng dụng trong phân tích hành vi: Các nhóm hành khách có mức chi tiêu cao hoặc thấp, hoặc hành khách từ các quốc gia khác nhau có thể được phân tích để tìm ra xu hướng hành vi.

3. **Tự động tìm ra nhóm hành khách có nguy cơ sống sót khác nhau**  
   Dựa vào phân cụm, Mean Shift có thể phát hiện các nhóm hành khách có khả năng sống sót tương tự, từ đó giúp xây dựng các chiến lược cứu hộ hiệu quả.  
   Ứng dụng trong cứu hộ: Các hành khách trong các cụm mật độ cao có thể đại diện cho các nhóm có khả năng sống sót cao hoặc thấp, từ đó phân bổ các nguồn lực cứu hộ phù hợp.

4. **Phát hiện hành khách "outliers"**  
   Một trong những ưu điểm của Mean Shift là nó có thể giúp phát hiện các điểm dữ liệu không phù hợp với các nhóm chính (outliers).  
   Ứng dụng trong kiểm tra chất lượng dữ liệu: Các hành khách không thể được phân vào bất kỳ cụm nào có thể là các điểm nhiễu (outliers) hoặc hành khách có đặc trưng rất khác biệt. Các outliers này có thể cần được kiểm tra lại để đảm bảo tính chính xác của dữ liệu.

## 7. Kết luận

Mean Shift Clustering là một thuật toán phân cụm mạnh mẽ và linh hoạt, giúp phát hiện các nhóm tự động mà không yêu cầu xác định số cụm trước. Điều này rất hữu ích khi bạn không biết trước số lượng cụm trong dữ liệu.

Trong bài toán Titanic, Mean Shift có thể giúp phân nhóm hành khách dựa trên các đặc trưng như giới tính, tuổi, hạng vé và mức chi tiêu, từ đó phân tích các hành vi của hành khách và đưa ra các chiến lược cứu hộ và tiếp thị hiệu quả.

