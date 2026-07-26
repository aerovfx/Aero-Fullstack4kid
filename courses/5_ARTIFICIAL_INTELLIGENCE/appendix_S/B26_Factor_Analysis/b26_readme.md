# Factor Analysis (FA)

Factor Analysis (FA) là một kỹ thuật thống kê được sử dụng để mô hình hóa mối quan hệ giữa các biến quan sát bằng cách giảm số lượng biến thông qua việc tạo ra một số ít các "yếu tố" (factors) tiềm ẩn. Mục đích là để phân tích sự biến động chung giữa các biến và giảm chiều dữ liệu mà không làm mất quá nhiều thông tin.

Khi áp dụng Factor Analysis cho bộ dữ liệu Titanic, chúng ta có thể phân tích sự biến động giữa các đặc trưng như tuổi tác, hạng vé, giới tính và sự sống sót, từ đó tìm ra những yếu tố ẩn tiềm có thể giải thích sự sống sót của hành khách.

Dưới đây là cách thực hiện Factor Analysis trên Titanic dataset và các ứng dụng cụ thể của nó trong trường hợp này.

## 1. Cài đặt thư viện cần thiết

Đảm bảo bạn đã cài đặt các thư viện cần thiết:

```bash
pip install pandas scikit-learn matplotlib seaborn
```

## 2. Chuẩn bị dữ liệu

Tải dữ liệu Titanic và tiền xử lý các giá trị thiếu, mã hóa biến phân loại, và chuẩn hóa dữ liệu.

```python
import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import FactorAnalysis
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

## 3. Áp dụng Factor Analysis

Áp dụng Factor Analysis để giảm chiều dữ liệu và phát hiện các yếu tố tiềm ẩn.

```python
# Áp dụng Factor Analysis
n_factors = 2  # Số lượng yếu tố tiềm ẩn
factor = FactorAnalysis(n_components=n_factors)
X_factors = factor.fit_transform(X_scaled)

# Tạo DataFrame với các yếu tố
factor_df = pd.DataFrame(X_factors, columns=[f'Factor{i+1}' for i in range(n_factors)])

# Thêm nhãn phân lớp (Survived) vào DataFrame
factor_df['Survived'] = data['Survived']

# Trực quan hóa các yếu tố
plt.figure(figsize=(10, 6))
sns.scatterplot(x='Factor1', y='Factor2', hue='Survived', palette='viridis', data=factor_df, s=100)
plt.title('Factor Analysis - Titanic Survival Analysis')
plt.xlabel('Factor 1')
plt.ylabel('Factor 2')
plt.legend()
plt.show()
```

## 4. Ứng dụng thực tế trong bài toán Titanic

### 1. Phát hiện các yếu tố tiềm ẩn ảnh hưởng đến sự sống sót

Factor Analysis có thể giúp phát hiện các yếu tố tiềm ẩn (ẩn sau các biến quan sát như tuổi, hạng vé, giới tính) ảnh hưởng đến khả năng sống sót của hành khách.

**Ứng dụng thực tế:** Ví dụ, có thể thấy rằng các yếu tố tiềm ẩn như "hạng vé" và "tuổi tác" có thể tạo thành một yếu tố ảnh hưởng mạnh đến sự sống sót. Các yếu tố này có thể chỉ ra rằng những hành khách trẻ tuổi hoặc đi vé hạng cao có nhiều khả năng sống sót hơn.

### 2. Giảm chiều dữ liệu và làm đơn giản hóa mô hình

Factor Analysis giúp giảm số lượng biến mà không làm mất quá nhiều thông tin. Sau khi giảm chiều dữ liệu, bạn có thể sử dụng dữ liệu đã được giảm chiều này trong các mô hình học máy khác như hồi quy logistic hoặc các mô hình cây quyết định.

**Ứng dụng thực tế:** Giảm chiều dữ liệu giúp giảm thiểu sự phức tạp của mô hình, giúp các mô hình học máy dễ dàng hơn trong việc dự đoán sự sống sót.

### 3. Tái cấu trúc dữ liệu

Các yếu tố tiềm ẩn do Factor Analysis tạo ra có thể được sử dụng để tái cấu trúc dữ liệu, giúp chúng ta hiểu rõ hơn về các nhóm hành khách với các đặc điểm chung.

**Ứng dụng thực tế:** Nhờ phân tích các yếu tố tiềm ẩn, chúng ta có thể phân nhóm hành khách theo những yếu tố ẩn mà không phải sử dụng trực tiếp các biến ban đầu. Điều này giúp xác định các đặc điểm chung của các nhóm hành khách sống sót và không sống sót.

### 4. Giảm thiểu nhiễu

Factor Analysis có thể giúp giảm thiểu nhiễu trong dữ liệu bằng cách tập trung vào các yếu tố quan trọng nhất và loại bỏ các yếu tố không đáng kể.

**Ứng dụng thực tế:** Khi áp dụng vào bài toán Titanic, giảm nhiễu có thể giúp làm sạch dữ liệu và tăng độ chính xác của mô hình dự đoán sự sống sót.

## Kết luận

Factor Analysis giúp phát hiện các yếu tố tiềm ẩn ảnh hưởng đến sự sống sót của hành khách trong bộ dữ liệu Titanic.

**Ứng dụng thực tế:** Nó giúp phân tích sự biến động giữa các đặc trưng và giảm chiều dữ liệu để dễ dàng sử dụng trong các mô hình học máy khác. Factor Analysis không chỉ giảm sự phức tạp của dữ liệu mà còn cung cấp cái nhìn sâu sắc về các yếu tố tiềm ẩn có thể ảnh hưởng đến sự sống sót của hành khách trong thảm họa Titanic.

