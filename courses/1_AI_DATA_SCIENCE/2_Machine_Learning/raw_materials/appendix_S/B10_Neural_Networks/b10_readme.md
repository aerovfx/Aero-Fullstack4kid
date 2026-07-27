Neural Networks (Mạng Nơ-ron), đặc biệt là Deep Learning (Học sâu), là một phương pháp mạnh mẽ trong học máy, đặc biệt hữu ích khi có một lượng lớn dữ liệu và mối quan hệ phức tạp giữa các đặc trưng. Trong bài toán Titanic: Machine Learning from Disaster, chúng ta có thể áp dụng Deep Learning để dự đoán khả năng sống sót của hành khách, với khả năng tự động học các đặc trưng quan trọng từ dữ liệu mà không cần phải thiết kế thủ công.

Dưới đây là cách áp dụng Neural Networks cho dataset Titanic, sử dụng Keras (thư viện Deep Learning của TensorFlow).

## 1. Cài đặt thư viện

Trước tiên, bạn cần cài đặt các thư viện cần thiết:

```bash
pip install tensorflow pandas scikit-learn
```

## 2. Chuẩn bị dữ liệu

```python
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
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

# Chuẩn hóa dữ liệu (Standardize)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
```

## 3. Xây dựng mô hình Neural Network (Deep Learning)

```python
# Xây dựng mô hình Neural Network
model = Sequential()

# Thêm lớp ẩn đầu tiên
model.add(Dense(64, input_dim=X_train.shape[1], activation='relu'))

# Thêm lớp ẩn thứ hai
model.add(Dense(32, activation='relu'))

# Lớp đầu ra với 1 neuron, vì chúng ta dự đoán 1 biến nhị phân (sống sót hay không)
model.add(Dense(1, activation='sigmoid'))

# Biên dịch mô hình với thuật toán tối ưu Adam và hàm mất mát binary_crossentropy (vì là bài toán phân loại nhị phân)
model.compile(optimizer=Adam(learning_rate=0.001), loss='binary_crossentropy', metrics=['accuracy'])

# Huấn luyện mô hình
history = model.fit(X_train, y_train, epochs=50, batch_size=32, validation_data=(X_test, y_test), verbose=1)
```

## 4. Đánh giá mô hình

```python
# Dự đoán trên tập test
y_pred = (model.predict(X_test) > 0.5).astype("int32")

# Đánh giá độ chính xác
accuracy = accuracy_score(y_test, y_pred)
print(f"Độ chính xác của mô hình Neural Network: {accuracy:.2f}")

# Ma trận nhầm lẫn
conf_matrix = confusion_matrix(y_test, y_pred)
print("Ma trận nhầm lẫn:")
print(conf_matrix)

# Báo cáo phân loại
print("Báo cáo phân loại:")
print(classification_report(y_test, y_pred))
```

## 5. Trực quan hóa quá trình huấn luyện (Optional)

```python
import matplotlib.pyplot as plt

# Trực quan hóa sự thay đổi độ chính xác trong quá trình huấn luyện
plt.plot(history.history['accuracy'], label='Độ chính xác trên tập huấn luyện')
plt.plot(history.history['val_accuracy'], label='Độ chính xác trên tập kiểm tra')
plt.title('Độ chính xác trong quá trình huấn luyện')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend()
plt.show()

# Trực quan hóa sự thay đổi hàm mất mát trong quá trình huấn luyện
plt.plot(history.history['loss'], label='Hàm mất mát trên tập huấn luyện')
plt.plot(history.history['val_loss'], label='Hàm mất mát trên tập kiểm tra')
plt.title('Hàm mất mát trong quá trình huấn luyện')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
```

## 6. Ứng dụng thực tế trong bài toán Titanic

1. **Dự đoán khả năng sống sót của hành khách**:
   Neural Networks có thể học được các mối quan hệ phức tạp và phi tuyến tính giữa các đặc trưng (ví dụ: giới tính, hạng vé, tuổi, giá vé) để dự đoán khả năng sống sót của hành khách.
   Ứng dụng thực tế: Điều này có thể giúp các tổ chức hoặc các cơ quan cứu hộ xác định các nhóm hành khách có khả năng sống sót cao hơn trong các tình huống khẩn cấp và đưa ra các quyết định cứu hộ kịp thời.

2. **Tự động phân loại các hành khách vào nhóm ưu tiên cứu hộ**:
   Ứng dụng trong tình huống khẩn cấp: Neural Networks có thể phân loại hành khách dựa trên các đặc trưng như giới tính, tuổi, và số người đi cùng vào các nhóm ưu tiên cứu hộ (ví dụ, phụ nữ và trẻ em có thể có khả năng sống sót cao hơn).
   Hệ thống này có thể giúp giảm thời gian ra quyết định trong các tình huống cấp bách.

3. **Xử lý mối quan hệ phức tạp giữa các đặc trưng**:
   Neural Networks có thể tự động học các đặc trưng quan trọng mà không cần phải thiết kế thủ công, điều này rất hữu ích khi các mối quan hệ giữa các đặc trưng có tính phi tuyến tính và phức tạp.
   Ví dụ, các mối quan hệ giữa Fare (giá vé) và Pclass (hạng vé) có thể phức tạp, và mạng nơ-ron có khả năng học được các mối quan hệ này mà các mô hình học máy khác không thể.

4. **Cải thiện độ chính xác so với các mô hình truyền thống**:
   Deep Learning có thể cải thiện độ chính xác của mô hình so với các thuật toán truyền thống như Logistic Regression hoặc Decision Trees, đặc biệt khi xử lý các mối quan hệ phức tạp hoặc dữ liệu có độ nhiễu cao.

5. **Hệ thống hỗ trợ quyết định trong các tình huống khẩn cấp**:
   Ứng dụng trong cứu hộ và bảo hiểm: Neural Networks có thể giúp tạo ra các hệ thống dự đoán có độ chính xác cao, hỗ trợ ra quyết định trong các tình huống khẩn cấp, ví dụ, lựa chọn hành khách có nguy cơ cao hoặc thấp để cứu.

## 7. Kết luận

Neural Networks là một công cụ mạnh mẽ trong học máy, đặc biệt hữu ích trong các bài toán có dữ liệu phức tạp và mối quan hệ phi tuyến tính. Trong bài toán Titanic, Deep Learning có thể dự đoán khả năng sống sót của hành khách với độ chính xác cao hơn, đồng thời ứng dụng trong các hệ thống quyết định, phân loại ưu tiên cứu hộ và phân tích bảo hiểm.

