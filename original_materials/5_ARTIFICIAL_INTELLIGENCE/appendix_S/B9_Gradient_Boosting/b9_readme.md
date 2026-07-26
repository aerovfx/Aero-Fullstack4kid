Gradient Boosting là một kỹ thuật học máy mạnh mẽ và phổ biến, sử dụng các cây quyết định yếu (weak decision trees) để xây dựng một mô hình mạnh mẽ thông qua quá trình lặp đi lặp lại, trong đó mỗi mô hình mới cố gắng cải thiện lỗi của mô hình trước đó. Một số thư viện phổ biến triển khai Gradient Boosting bao gồm XGBoost, LightGBM, và CatBoost. Các thuật toán này rất hiệu quả trong việc phân loại và hồi quy, đặc biệt là khi xử lý dữ liệu phức tạp với nhiều đặc trưng.

Dưới đây là cách áp dụng Gradient Boosting cho bài toán Titanic, sử dụng thư viện XGBoost.

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt thư viện XGBoost (nếu chưa cài đặt):

```bash
pip install xgboost
```

## 2. Chuẩn bị dữ liệu

```python
# Import các thư viện cần thiết
import pandas as pd
from sklearn.model_selection import train_test_split
from xgboost import XGBClassifier
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report

# Tải dữ liệu Titanic
url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
data = pd.read_csv(url)

# Chọn các cột quan trọng
selected_features = ['Pclass', 'Sex', 'Age', 'Fare', 'SibSp', 'Parch']
target = 'Survived'

# Xử lý dữ liệu bị thiếu
data['Age'].fillna(data['Age'].median(), inplace=True)
data['Fare'].fillna(data['Fare'].median(), inplace=True)

# Mã hóa biến 'Sex'
data['Sex'] = data['Sex'].map({'male': 0, 'female': 1})

# Chia dữ liệu
X = data[selected_features]
y = data[target]
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
```

## 3. Huấn luyện mô hình Gradient Boosting (XGBoost)

```python
# Khởi tạo mô hình XGBoost
xgb_model = XGBClassifier(n_estimators=100, learning_rate=0.1, max_depth=5)

# Huấn luyện mô hình
xgb_model.fit(X_train, y_train)

# Dự đoán trên tập test
y_pred = xgb_model.predict(X_test)
```

## 4. Đánh giá mô hình

```python
# Đánh giá độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình XGBoost: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

## 5. Trực quan hóa kết quả (nếu cần thiết)

Nếu bạn muốn trực quan hóa tầm quan trọng của các đặc trưng (feature importance) trong mô hình XGBoost:

```python
import matplotlib.pyplot as plt

# Vẽ đồ thị tầm quan trọng của các đặc trưng
plt.figure(figsize=(10, 6))
xgb_model.plot_importance(max_num_features=10)
plt.title('Tầm quan trọng của các đặc trưng trong mô hình XGBoost')
plt.show()
```

## 6. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   Gradient Boosting như XGBoost có thể dự đoán khả năng sống sót của hành khách dựa trên các đặc điểm như giới tính, hạng vé, tuổi, fare, số lượng anh chị em/cặp vợ chồng (SibSp).
   Ứng dụng thực tế: XGBoost có thể giúp phân loại nhanh chóng hành khách vào nhóm có khả năng sống sót hoặc không, giúp các tổ chức cứu hộ hoặc bảo hiểm đánh giá và phân tích dữ liệu hành khách.

2. **Phân tích và ra quyết định trong các tình huống khẩn cấp**:
   Ứng dụng trong tình huống khẩn cấp: Trong các thảm họa như vụ đắm tàu Titanic, XGBoost có thể giúp phân loại hành khách theo nhóm sống sót dựa trên các đặc điểm, từ đó giúp các nhân viên cứu hộ đưa ra quyết định tối ưu về việc ưu tiên cứu ai.

3. **Xử lý dữ liệu lớn và phức tạp**:
   Gradient Boosting rất hiệu quả trong việc xử lý các dữ liệu lớn và phức tạp mà các mô hình học máy khác có thể gặp khó khăn. Ví dụ, khi có nhiều đặc trưng và dữ liệu không hoàn hảo, XGBoost có thể cung cấp một mô hình mạnh mẽ và chính xác.

4. **Cải thiện độ chính xác so với các mô hình đơn giản**:
   XGBoost có thể vượt trội so với các mô hình như Logistic Regression hoặc KNN, đặc biệt trong các bài toán có mối quan hệ phức tạp giữa các đặc trưng và biến mục tiêu. Điều này giúp đạt được độ chính xác cao hơn trong dự đoán.

5. **Ứng dụng trong bảo hiểm và quản lý rủi ro**:
   Ứng dụng trong bảo hiểm: Các công ty bảo hiểm có thể sử dụng mô hình XGBoost để dự đoán tỷ lệ sống sót của các hành khách và từ đó đưa ra các quyết định về bảo hiểm, phân bổ chi phí, và tính toán rủi ro.

## 7. Kết luận

Gradient Boosting (cụ thể là XGBoost) là một trong những thuật toán mạnh mẽ nhất hiện nay trong học máy, rất hiệu quả trong việc phân loại và dự đoán. Trong bài toán Titanic, XGBoost giúp dự đoán khả năng sống sót của hành khách dựa trên các đặc trưng và có thể ứng dụng trong các tình huống khẩn cấp để hỗ trợ quyết định cứu hộ, phân tích rủi ro bảo hiểm, và cải thiện các mô hình dự đoán trong các lĩnh vực khác.
