```markdown
# Data Preprocessing

Data preprocessing là một bước quan trọng trong quy trình làm việc của data science nhằm chuẩn bị và chuyển đổi dữ liệu thô thành dữ liệu sạch, có thể sử dụng để phân tích và xây dựng mô hình. Dưới đây là các bước phổ biến trong quy trình data preprocessing:

## Table of contents
- [1. Hiểu và khám phá dữ liệu (Data Understanding)](#1-hiểu-và-khám-phá-dữ-liệu-data-understanding)
  - [1.1. Thu thập và kiểm tra dữ liệu ban đầu](#11-thu-thập-và-kiểm-tra-dữ-liệu-ban-đầu)
  - [1.2. Hiểu các biến trong dữ liệu](#12-hiểu-các-biến-trong-dữ-liệu)
  - [1.3. Phân tích thống kê cơ bản](#13-phân-tích-thống-kê-cơ-bản)
  - [1.4. Phát hiện dữ liệu thiếu và dữ liệu không hợp lệ](#14-phát-hiện-dữ-liệu-thiếu-và-dữ-liệu-không-hợp-lệ)
  - [1.5. Phân tích mối quan hệ giữa các biến](#15-phân-tích-mối-quan-hệ-giữa-các-biến)
  - [1.6. Trực quan hóa dữ liệu](#16-trực-quan-hóa-dữ-liệu)
- [2. Làm sạch dữ liệu (Data Cleaning)](#2-làm-sạch-dữ-liệu-data-cleaning)
- [3. Biến đổi dữ liệu (Data Transformation)](#3-biến-đổi-dữ-liệu-data-transformation)
- [4. Xử lý ngoại lệ (Outlier Handling)](#4-xử-lý-ngoại-lệ-outlier-handling)
- [5. Giảm chiều dữ liệu (Dimensionality Reduction)](#5-giảm-chiều-dữ-liệu-dimensionality-reduction)
- [6. Chia dữ liệu (Splitting Data)](#6-chia-dữ-liệu-splitting-data)
- [7. Tạo dữ liệu tổng hợp (Data Augmentation)](#7-tạo-dữ-liệu-tổng-hợp-data-augmentation)

# A. DATA PROCESSING

## 1. Hiểu và khám phá dữ liệu (Data Understanding)

### 1.1. Thu thập và kiểm tra dữ liệu ban đầu
- Nguồn dữ liệu: Dữ liệu có thể đến từ nhiều nguồn khác nhau như:
  - Tệp tin (CSV, Excel, JSON, XML).
  - Cơ sở dữ liệu (SQL, NoSQL).
  - APIs hoặc web scraping.
  - Dữ liệu thời gian thực (real-time data) từ IoT, logs, hoặc sensors.
- Kiểm tra kích thước và cấu trúc dữ liệu:
  - Xác định số hàng (rows) và số cột (columns).
  - Xem dữ liệu có thiếu thông tin hoặc không đồng nhất hay không.

Ví dụ với Python:
```python
import pandas as pd

data = pd.read_csv('dataset.csv')
print(data.shape)  # Kích thước của dữ liệu
print(data.head()) # 5 dòng đầu tiên
print(data.info()) # Thông tin cơ bản về kiểu dữ liệu
```

### 1.2. Hiểu các biến trong dữ liệu
- Xác định loại dữ liệu (Data Types):
  - Dữ liệu định lượng (Quantitative):
    - Liên tục (Continuous): Chiều cao, cân nặng, nhiệt độ.
    - Rời rạc (Discrete): Số lượng sản phẩm, số lượng khách hàng.
  - Dữ liệu định tính (Qualitative):
    - Danh mục (Categorical): Loại sản phẩm, màu sắc.
    - Thứ tự (Ordinal): Đánh giá sản phẩm (tốt, khá, trung bình).
- Tìm hiểu ý nghĩa của từng biến:
  - Đọc tài liệu hoặc metadata nếu có.
  - Thảo luận với chuyên gia trong lĩnh vực (SME - Subject Matter Expert).

### 1.3. Phân tích thống kê cơ bản
- Thống kê mô tả (Descriptive Statistics):
  - Tính các giá trị cơ bản: trung bình (mean), trung vị (median), phương sai (variance), độ lệch chuẩn (standard deviation), min/max.
  - Phân phối dữ liệu: đồng đều, lệch phải/trái, tập trung.

Ví dụ với Python:
```python
print(data.describe())  # Thống kê cơ bản cho các cột số
```

### 1.4. Phát hiện dữ liệu thiếu và dữ liệu không hợp lệ
- Dữ liệu thiếu (Missing Data):
  - Kiểm tra giá trị null hoặc không xác định.
  - Tìm hiểu lý do vì sao dữ liệu bị thiếu: do lỗi hệ thống, không đo được, hay không liên quan.

Ví dụ:
```python
print(data.isnull().sum())  # Số lượng giá trị bị thiếu trên từng cột
```

- Dữ liệu không hợp lệ (Invalid Data):
  - Kiểm tra các giá trị không đúng (vd: tuổi âm, nhiệt độ > 1000 độ C).
  - Tìm các giá trị ngoài phạm vi logic.

### 1.5. Phân tích mối quan hệ giữa các biến
- Mối quan hệ giữa biến định lượng (Quantitative Variables):
  - Tính hệ số tương quan (Correlation).
  - Xác định các biến có liên hệ mạnh để tối ưu hóa dữ liệu đầu vào.

Ví dụ:
```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.heatmap(data.corr(), annot=True, cmap='coolwarm')  # Ma trận tương quan
plt.show()
```

- Mối quan hệ giữa biến định tính (Categorical Variables):
  - Sử dụng bảng chéo (Cross-tabulation).
  - Kiểm tra sự phân phối hoặc xu hướng giữa các nhóm.

### 1.6. Trực quan hóa dữ liệu
- Trực quan hóa giúp bạn hiểu rõ hơn về dữ liệu và phát hiện các mẫu (patterns) hoặc vấn đề tiềm ẩn:
  - Histogram: Phân phối của dữ liệu.
  - Boxplot: Xác định giá trị ngoại lệ (outliers).
  - Scatter plot: Tìm mối quan hệ giữa hai biến.
  - Bar chart: Tần suất của các biến danh mục.

Ví dụ với Python:
```python
import matplotlib.pyplot as plt

data['column_name'].hist(bins=30)
plt.title('Histogram of Column Name')
plt.show()
```

## 2. Làm sạch dữ liệu (Data Cleaning)
- Xử lý giá trị thiếu (Missing Values):
  - Loại bỏ hàng hoặc cột chứa nhiều giá trị bị thiếu.
  - Điền giá trị thay thế (mean, median, mode) hoặc sử dụng mô hình dự đoán.
- Loại bỏ dữ liệu bị nhiễu (Noise):
  - Sử dụng các phương pháp như lọc dữ liệu hoặc smoothing.
- Xử lý dữ liệu bị trùng lặp:
  - Loại bỏ các bản ghi trùng lặp để giảm nhiễu trong phân tích.
- Chuẩn hóa dữ liệu (Standardization/Normalization):
  - Chuyển đổi dữ liệu về cùng một thang đo hoặc chuẩn hóa giá trị (0-1).

## 3. Biến đổi dữ liệu (Data Transformation)
- Mã hóa dữ liệu phân loại (Encoding):
  - Dùng One-hot encoding hoặc Label encoding cho dữ liệu dạng phân loại (categorical data).
- Chuyển đổi dữ liệu thời gian:
  - Tách ngày, tháng, năm, giờ thành các cột riêng biệt.
- Log Transformation:
  - Dùng để làm giảm ảnh hưởng của các giá trị ngoại lai (outliers) hoặc để biến đổi dữ liệu không tuyến tính.
- Xử lý dữ liệu phân phối không chuẩn:
  - Sử dụng các kỹ thuật như Box-Cox Transformation hoặc Yeo-Johnson Transformation.

## 4. Xử lý ngoại lệ (Outlier Handling)
- Xác định giá trị ngoại lệ:
  - Sử dụng các phương pháp như IQR (Interquartile Range), Z-score, hoặc các biểu đồ (Boxplot).
- Xử lý giá trị ngoại lệ:
  - Loại bỏ giá trị ngoại lệ hoặc thay thế chúng bằng các giá trị gần đúng.

## 5. Giảm chiều dữ liệu (Dimensionality Reduction)
- Chọn đặc trưng (Feature Selection):
  - Sử dụng các phương pháp như lọc (Filter), Wrapper, hoặc thuật toán nhúng (Embedded).
- Trích xuất đặc trưng (Feature Extraction):
  - Sử dụng PCA (Principal Component Analysis), t-SNE hoặc Autoencoder để giảm số chiều.

## 6. Chia dữ liệu (Splitting Data)
- Chia dữ liệu thành các tập:
  - Training set: Để huấn luyện mô hình.
  - Validation set: Để tinh chỉnh tham số.
  - Test set: Để kiểm tra độ chính xác của mô hình.
- Phân chia theo tỷ lệ phổ biến như 70-20-10 hoặc 80-20.

## 7. Tạo dữ liệu tổng hợp (Data Augmentation)
- Đặc biệt hữu ích cho các bài toán như xử lý ảnh, xử lý văn bản.
- Các kỹ thuật phổ biến:
  - Xoay, phóng to/thu nhỏ (cho dữ liệu hình ảnh).
  - Sinh dữ liệu bằng thuật toán (SMOTE cho dữ liệu mất cân bằng).

## Công cụ và thư viện hỗ trợ:
- Python: Pandas, NumPy, Scikit-learn, PySpark.
- R: dplyr, tidyr.
- Visualization: Matplotlib, Seaborn, Plotly.

## Lợi ích của data preprocessing:
- Cải thiện độ chính xác của mô hình.
- Tăng hiệu quả tính toán.
- Giảm nguy cơ xảy ra lỗi do dữ liệu bẩn hoặc bị thiếu.

(Back to top)
```