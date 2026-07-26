# Principal Component Analysis (PCA)

Principal Component Analysis (PCA) là một phương pháp giảm chiều dữ liệu (dimensionality reduction) phổ biến trong học máy, được sử dụng để giảm số lượng biến trong dữ liệu, trong khi vẫn giữ được các đặc trưng quan trọng nhất. PCA giúp chuyển dữ liệu sang một hệ tọa độ mới, trong đó các thành phần chính (principal components) là các phương hướng mà dữ liệu thay đổi mạnh nhất.

## 1. Cài đặt thư viện

Đảm bảo bạn đã cài đặt các thư viện cần thiết:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Giống như các phương pháp phân tích khác, bạn cần xử lý dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
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

## 3. Áp dụng PCA

Sau khi chuẩn bị xong dữ liệu, chúng ta sẽ sử dụng PCA để giảm chiều dữ liệu xuống còn 2 chiều để có thể trực quan hóa dữ liệu.

```python
# Áp dụng PCA để giảm chiều dữ liệu
pca = PCA(n_components=2)
pca_components = pca.fit_transform(X_scaled)

# Tạo một DataFrame với các thành phần chính (principal components)
pca_df = pd.DataFrame(data=pca_components, columns=['PC1', 'PC2'])

# Thêm nhãn phân lớp (Survived) vào DataFrame
pca_df['Survived'] = data['Survived']

# Vẽ biểu đồ phân tích PCA
plt.figure(figsize=(10, 6))
sns.scatterplot(x='PC1', y='PC2', hue='Survived', palette='viridis', data=pca_df, s=100)
plt.title('PCA - Titanic Survival Analysis')
plt.xlabel('Principal Component 1')
plt.ylabel('Principal Component 2')
plt.legend()
plt.show()
```

## 4. Đánh giá kết quả

Sau khi thực hiện PCA, bạn có thể kiểm tra tỉ lệ phương sai mà mỗi thành phần chính giải thích trong dữ liệu.

```python
# Tỉ lệ phương sai giải thích
explained_variance = pca.explained_variance_ratio_
print(f"Explained variance by each component: {explained_variance}")
```

## 5. Ứng dụng thực tế trong bài toán Titanic

### 1. Giảm chiều dữ liệu

PCA có thể giúp giảm số lượng đặc trưng trong dữ liệu mà không làm mất quá nhiều thông tin quan trọng. Việc này giúp giảm độ phức tạp tính toán và có thể cải thiện hiệu suất của các mô hình học máy khi có nhiều đặc trưng.

Ứng dụng thực tế: Trong bài toán Titanic, PCA giúp giảm số lượng đặc trưng như "Pclass", "Sex", "Age", "Fare", "SibSp", "Parch" xuống còn hai thành phần chính, giúp phân tích và trực quan hóa dữ liệu một cách đơn giản và hiệu quả hơn.

### 2. Phân nhóm hành khách theo các thành phần chính

PCA có thể giúp xác định các nhóm hành khách tương tự nhau dựa trên các đặc trưng quan trọng. Thông qua giảm chiều dữ liệu, PCA giúp tìm ra các thành phần chính thể hiện sự biến động mạnh nhất trong dữ liệu, từ đó giúp phân nhóm hành khách sống sót và không sống sót.

Ứng dụng trong phân tích sự sống sót: PCA có thể giúp phát hiện mối quan hệ giữa các đặc trưng như "Fare", "Age", và "Pclass", qua đó giúp xây dựng các chiến lược cứu hộ hoặc phân tích xác suất sống sót.

### 3. Trực quan hóa dữ liệu

PCA rất hữu ích trong việc trực quan hóa dữ liệu trong không gian 2 chiều, giúp bạn nhìn thấy sự phân bố của các hành khách sống sót và không sống sót trong không gian các thành phần chính.

Ứng dụng trong phân tích sự sống sót: Dữ liệu phân tách rõ ràng giữa những hành khách sống sót và không sống sót có thể giúp các nhà phân tích hoặc quản lý tàu thuyền phát triển các chiến lược cứu hộ cho những hành khách có đặc điểm tương tự.

### 4. Phát hiện các mối quan hệ ẩn

PCA có thể giúp phát hiện những mối quan hệ ẩn giữa các đặc trưng trong dữ liệu mà không thể nhận diện ngay lập tức. Ví dụ, có thể tìm ra rằng các hành khách thuộc hạng nhất, có mức chi tiêu cao và tuổi lớn có xu hướng sống sót cao hơn.

Ứng dụng trong phân tích hành vi hành khách: PCA có thể giúp hiểu rõ hơn về hành vi của hành khách và mối quan hệ giữa các yếu tố như hạng vé, mức chi tiêu, và số lượng hành khách đi cùng trong quyết định sống sót hay không.

## 6. Kết luận

PCA là một công cụ mạnh mẽ trong việc giảm chiều dữ liệu, giúp trực quan hóa và phân tích dữ liệu với ít đặc trưng hơn mà không mất đi quá nhiều thông tin quan trọng.

Trong bài toán Titanic, PCA có thể giúp bạn phân tích các mối quan hệ giữa các đặc trưng như "Age", "Fare", "Pclass", và "Sex", và từ đó phát hiện các nhóm hành khách có đặc điểm tương tự nhau về xác suất sống sót.

PCA cũng có thể giúp giảm độ phức tạp của mô hình, làm cho quá trình phân tích và dự báo trở nên nhanh chóng và dễ dàng hơn.

