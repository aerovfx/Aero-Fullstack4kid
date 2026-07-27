Latent Dirichlet Allocation (LDA) là một phương pháp học máy không giám sát được sử dụng để phân tích chủ đề trong các tập dữ liệu văn bản. LDA giả định rằng các tài liệu (documents) trong một bộ dữ liệu là sự kết hợp của các chủ đề (topics) tiềm ẩn, và mỗi chủ đề có một phân phối xác suất của các từ. Mặc dù LDA thường được sử dụng cho dữ liệu văn bản, bạn cũng có thể sử dụng nó để phát hiện các chủ đề hoặc các nhóm tiềm ẩn trong dữ liệu không gian số khác, như bộ dữ liệu Titanic.

LDA có thể giúp phân tích và khám phá các nhóm tiềm ẩn hoặc các yếu tố liên quan đến sự sống sót của hành khách. Trong trường hợp Titanic, LDA có thể giúp phát hiện các nhóm hành khách dựa trên các đặc trưng như hạng vé, tuổi tác, giới tính, và các đặc điểm khác.

## 1. Cài đặt thư viện cần thiết

Đảm bảo bạn đã cài đặt các thư viện cần thiết:

```bash
pip install pandas scikit-learn matplotlib seaborn gensim
```

## 2. Chuẩn bị dữ liệu

LDA thường được sử dụng cho dữ liệu văn bản, nhưng bạn có thể áp dụng một số kỹ thuật trước khi sử dụng LDA trên dữ liệu không gian số. Trước tiên, bạn cần chuẩn bị dữ liệu Titanic và chuẩn bị các đặc trưng liên quan đến các hành khách.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import LatentDirichletAllocation
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

## 3. Áp dụng Latent Dirichlet Allocation (LDA)

LDA có thể được sử dụng để phát hiện các chủ đề hoặc nhóm trong dữ liệu. Dưới đây, ta sẽ áp dụng LDA và giảm chiều dữ liệu xuống hai chiều để dễ dàng trực quan hóa.

```python
# Áp dụng Latent Dirichlet Allocation (LDA)
n_topics = 3  # Số lượng chủ đề hoặc nhóm cần phân tích
lda = LatentDirichletAllocation(n_components=n_topics, random_state=42)
X_lda = lda.fit_transform(X_scaled)

# Tạo DataFrame với các chủ đề
lda_df = pd.DataFrame(X_lda, columns=[f'Topic{i+1}' for i in range(n_topics)])

# Thêm nhãn phân lớp (Survived) vào DataFrame
lda_df['Survived'] = data['Survived']

# Trực quan hóa các chủ đề
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Topic1', y='Topic2', hue='Survived', palette='viridis', data=lda_df, s=100)
plt.title('Latent Dirichlet Allocation (LDA) - Titanic Survival Analysis')
plt.xlabel('Topic 1')
plt.ylabel('Topic 2')
plt.legend()
plt.show()
```

## 4. Ứng dụng thực tế trong bài toán Titanic

### 1. Phát hiện các nhóm tiềm ẩn

Latent Dirichlet Allocation (LDA) giúp phân tích các nhóm tiềm ẩn trong dữ liệu mà không cần thông tin phân lớp (như "Survived" hoặc "Pclass"). Ví dụ, LDA có thể xác định các nhóm hành khách có các đặc điểm tương tự nhau (ví dụ: những hành khách có mức vé cao và tuổi trẻ có thể tạo thành một nhóm riêng biệt).

Ứng dụng thực tế: Dựa trên các nhóm tiềm ẩn này, bạn có thể nghiên cứu các mối liên hệ giữa các đặc trưng và sự sống sót. Các nhóm hành khách có thể có các đặc điểm đặc biệt giúp phân tích sự sống sót.

### 2. Khám phá các chủ đề tiềm ẩn

Trong trường hợp này, các chủ đề tiềm ẩn có thể liên quan đến các đặc điểm như giới tính, hạng vé, và độ tuổi. LDA có thể giúp phân nhóm hành khách thành các nhóm có đặc điểm chung mà bạn có thể sử dụng để phân tích thêm.

Ứng dụng thực tế: Ví dụ, một chủ đề có thể liên quan đến những hành khách đi tàu với mức vé cao và sống sót, trong khi một chủ đề khác có thể liên quan đến những hành khách có tuổi trẻ và tỉ lệ sống sót thấp. Những phân nhóm này có thể cung cấp thông tin hữu ích về các nhóm hành khách mà các mô hình dự đoán sự sống sót cần chú ý.

### 3. Tái cấu trúc và giảm chiều dữ liệu

LDA giúp giảm chiều dữ liệu mà vẫn giữ lại thông tin quan trọng từ các chủ đề tiềm ẩn. Sau khi giảm chiều dữ liệu, bạn có thể sử dụng dữ liệu này để cải thiện các mô hình học máy khác.

Ứng dụng thực tế: Giảm chiều dữ liệu giúp cải thiện hiệu suất của các mô hình học máy. Việc phân nhóm hành khách theo các chủ đề tiềm ẩn cũng giúp hiểu rõ hơn về dữ liệu, từ đó nâng cao độ chính xác của các mô hình dự đoán sự sống sót.

### 4. Phân tích các yếu tố ảnh hưởng đến sự sống sót

LDA có thể giúp phân tích và phân loại các hành khách vào các nhóm khác nhau dựa trên các đặc điểm chung của họ, từ đó nghiên cứu những yếu tố ảnh hưởng đến sự sống sót.

Ứng dụng thực tế: Ví dụ, bạn có thể nhận thấy rằng các hành khách thuộc nhóm có đặc điểm chủ yếu là giới tính nữ và mức vé cao có tỉ lệ sống sót cao. Những nhóm này có thể mang lại cái nhìn sâu sắc về các yếu tố quyết định sự sống sót trong thảm họa Titanic.

## Kết luận

Latent Dirichlet Allocation (LDA) là một phương pháp mạnh mẽ giúp phân tích các chủ đề hoặc nhóm tiềm ẩn trong dữ liệu mà không cần phải dựa vào nhãn phân loại.

Ứng dụng thực tế: Trong bộ dữ liệu Titanic, LDA có thể giúp phát hiện các nhóm hành khách có các đặc điểm chung, từ đó cung cấp thông tin về các yếu tố ảnh hưởng đến sự sống sót và giảm chiều dữ liệu cho các mô hình học máy khác.

Việc sử dụng LDA cho bài toán Titanic giúp phân tích các chủ đề tiềm ẩn, cải thiện sự hiểu biết về dữ liệu và hỗ trợ việc ra quyết định trong phân tích sự sống sót của hành khách.



