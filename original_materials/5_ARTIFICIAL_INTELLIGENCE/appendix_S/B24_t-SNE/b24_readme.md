# t-SNE (t-Distributed Stochastic Neighbor Embedding)

t-SNE là một kỹ thuật giảm chiều dữ liệu mạnh mẽ được sử dụng để trực quan hóa các bộ dữ liệu có nhiều chiều, đặc biệt hữu ích trong việc phân tích dữ liệu phức tạp với nhiều biến số. t-SNE có khả năng duy trì cấu trúc của các điểm dữ liệu gần nhau trong không gian thấp chiều, giúp trực quan hóa mối quan hệ giữa các điểm dữ liệu trong không gian 2D hoặc 3D.

## 1. Cài đặt thư viện

Trước tiên, bạn cần đảm bảo rằng các thư viện cần thiết đã được cài đặt:

```bash
pip install scikit-learn pandas matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Cũng như các phương pháp phân tích khác, bạn cần xử lý dữ liệu bằng cách xử lý các giá trị thiếu, mã hóa các đặc trưng không phải số và chuẩn hóa.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.manifold import TSNE
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

## 3. Áp dụng t-SNE

Bây giờ, bạn có thể áp dụng t-SNE để giảm chiều dữ liệu xuống còn 2 chiều, sau đó trực quan hóa kết quả.

```python
# Áp dụng t-SNE để giảm chiều dữ liệu
tsne = TSNE(n_components=2, random_state=42)
X_tsne = tsne.fit_transform(X_scaled)

# Tạo một DataFrame với các thành phần t-SNE
tsne_df = pd.DataFrame(data=X_tsne, columns=['TSNE1', 'TSNE2'])

# Thêm nhãn phân lớp (Survived) vào DataFrame
tsne_df['Survived'] = data['Survived']

# Vẽ biểu đồ phân tích t-SNE
plt.figure(figsize=(10, 6))
sns.scatterplot(x='TSNE1', y='TSNE2', hue='Survived', palette='viridis', data=tsne_df, s=100)
plt.title('t-SNE - Titanic Survival Analysis')
plt.xlabel('t-SNE Component 1')
plt.ylabel('t-SNE Component 2')
plt.legend()
plt.show()
```

## 4. Đánh giá kết quả

Kết quả của t-SNE sẽ cho phép bạn quan sát mối quan hệ giữa các điểm dữ liệu trong không gian 2D. Trong biểu đồ, các điểm dữ liệu được phân biệt bởi màu sắc (ví dụ: hành khách sống sót có màu khác với hành khách không sống sót), và bạn sẽ có thể quan sát xem các điểm dữ liệu tương tự (có đặc điểm gần nhau) có xu hướng nằm gần nhau trong không gian này hay không.

## 5. Ứng dụng thực tế trong bài toán Titanic

### 1. Trực quan hóa dữ liệu phức tạp

t-SNE giúp giảm chiều dữ liệu, khiến các mô hình dữ liệu với nhiều biến số dễ dàng được trực quan hóa hơn trong không gian hai chiều. Với dataset Titanic, t-SNE có thể giúp bạn hiểu rõ hơn về sự phân bố của hành khách và các mối quan hệ giữa các đặc trưng như "Age", "Fare", "Pclass" và "Sex".

**Ứng dụng thực tế:** Trực quan hóa này có thể giúp các nhà phân tích dễ dàng nhận diện các nhóm hành khách có đặc điểm tương đồng về xác suất sống sót. Điều này có thể hỗ trợ các chiến lược phân tích, tiếp thị và phân bổ tài nguyên trong trường hợp khẩn cấp.

### 2. Phân nhóm hành khách

t-SNE có thể giúp phân nhóm hành khách dựa trên các đặc trưng quan trọng, như hạng vé, tuổi tác và mức chi tiêu. Các điểm dữ liệu gần nhau trong biểu đồ có thể tương ứng với các hành khách có các đặc điểm tương tự nhau.

**Ứng dụng thực tế:** Ví dụ, bạn có thể phát hiện rằng hành khách hạng nhất, những người có mức chi tiêu cao và tuổi lớn có xu hướng sống sót cao hơn. Điều này có thể giúp xây dựng các chiến lược cứu hộ và phân tích dữ liệu chi tiết hơn.

### 3. Khám phá các mối quan hệ ẩn

t-SNE có thể giúp phát hiện các mối quan hệ ẩn giữa các đặc trưng mà trước đây có thể khó nhận diện. Ví dụ, t-SNE có thể giúp bạn phát hiện rằng nhóm hành khách sống sót có các đặc điểm chung, chẳng hạn như hạng vé cao, mức chi tiêu lớn và có gia đình đi cùng.

**Ứng dụng trong phân tích sự sống sót:** Việc phân tách hành khách sống sót và không sống sót trong không gian 2D của t-SNE có thể giúp hiểu rõ hơn về các yếu tố ảnh hưởng đến khả năng sống sót, từ đó có thể tối ưu hóa các chiến lược cứu hộ.

### 4. Giảm độ phức tạp khi phân tích dữ liệu

t-SNE rất hữu ích khi bạn có dữ liệu phức tạp và muốn giảm độ phức tạp để dễ dàng phân tích. Việc giảm chiều dữ liệu có thể giúp bạn dễ dàng hơn trong việc phát hiện các mẫu và mối quan hệ giữa các điểm dữ liệu.

**Ứng dụng trong phân tích hành vi hành khách:** Việc giảm chiều dữ liệu và phân tích các cụm hành khách có thể giúp bạn hiểu hành vi chi tiêu hoặc hành vi lựa chọn hạng vé, từ đó áp dụng vào các chiến lược tiếp thị hoặc các nghiên cứu hành vi người tiêu dùng.

## 6. Kết luận

t-SNE là một công cụ mạnh mẽ trong việc trực quan hóa dữ liệu phức tạp và giúp phát hiện các nhóm hoặc mối quan hệ ẩn giữa các điểm dữ liệu. Trong bài toán Titanic, t-SNE giúp bạn phân tích và trực quan hóa sự phân bố của các hành khách sống sót và không sống sót, đồng thời giúp phát hiện các mẫu hành khách có đặc điểm tương đồng. t-SNE có thể hỗ trợ việc xây dựng các chiến lược cứu hộ, phân tích hành vi hành khách, và giảm độ phức tạp trong việc phân tích dữ liệu có nhiều chiều.

