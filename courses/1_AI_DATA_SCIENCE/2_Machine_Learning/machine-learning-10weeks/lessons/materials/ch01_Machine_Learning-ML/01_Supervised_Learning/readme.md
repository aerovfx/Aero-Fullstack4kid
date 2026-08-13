# Học Máy Giám Sát (Supervised Learning)

## Giới Thiệu

Học máy giám sát (Supervised Learning) là một nhánh của học máy (Machine Learning) trong đó mô hình được huấn luyện trên một tập dữ liệu đã được gán nhãn. Điều này có nghĩa là mỗi mẫu dữ liệu trong tập huấn luyện đi kèm với một nhãn hoặc giá trị mục tiêu mà mô hình cần dự đoán. Mục tiêu của học máy giám sát là học từ dữ liệu huấn luyện để có thể dự đoán chính xác nhãn hoặc giá trị mục tiêu cho các mẫu dữ liệu mới chưa từng thấy trước đó.

## Các Thành Phần Chính

### Dữ Liệu Đầu Vào (Input Data)

Dữ liệu đầu vào trong học máy giám sát bao gồm các đặc trưng (features) và nhãn (labels). Các đặc trưng là các thuộc tính hoặc biến số được sử dụng để dự đoán nhãn. Ví dụ, trong bài toán phân loại email, các đặc trưng có thể là từ ngữ xuất hiện trong email, và nhãn có thể là "spam" hoặc "không spam".

### Mô Hình (Model)

Mô hình trong học máy giám sát là một hàm toán học hoặc thuật toán được huấn luyện để dự đoán nhãn từ các đặc trưng. Có nhiều loại mô hình khác nhau, bao gồm hồi quy tuyến tính (linear regression), cây quyết định (decision tree), và mạng nơ-ron (neural network).

### Hàm Mất Mát (Loss Function)

Hàm mất mát đo lường sự khác biệt giữa dự đoán của mô hình và nhãn thực tế. Mục tiêu của quá trình huấn luyện là tối ưu hóa mô hình để giảm thiểu hàm mất mát. Các hàm mất mát phổ biến bao gồm hàm mất mát bình phương (mean squared error) cho các bài toán hồi quy và hàm mất mát chéo (cross-entropy loss) cho các bài toán phân loại.

### Thuật Toán Tối Ưu (Optimization Algorithm)

Thuật toán tối ưu được sử dụng để điều chỉnh các tham số của mô hình nhằm giảm thiểu hàm mất mát. Một trong những thuật toán tối ưu phổ biến nhất là gradient descent, trong đó các tham số của mô hình được cập nhật theo hướng ngược lại với gradient của hàm mất mát.

## Các Loại Bài Toán

### Hồi Quy (Regression)

Trong bài toán hồi quy, mục tiêu là dự đoán một giá trị số liên tục. Ví dụ, dự đoán giá nhà dựa trên các đặc trưng như diện tích, số phòng, và vị trí.

### Phân Loại (Classification)

Trong bài toán phân loại, mục tiêu là dự đoán một nhãn thuộc một trong các lớp rời rạc. Ví dụ, phân loại email thành "spam" hoặc "không spam", hoặc phân loại hình ảnh thành các loại động vật khác nhau.

## Quy Trình Huấn Luyện Mô Hình

1. **Thu Thập Dữ Liệu**: Thu thập một tập dữ liệu lớn và đa dạng, bao gồm các đặc trưng và nhãn tương ứng.
2. **Tiền Xử Lý Dữ Liệu**: Làm sạch và chuẩn hóa dữ liệu, xử lý các giá trị thiếu, và chuyển đổi các đặc trưng thành dạng phù hợp cho mô hình.
3. **Chia Tập Dữ Liệu**: Chia tập dữ liệu thành tập huấn luyện (training set) và tập kiểm tra (test set). Tập huấn luyện được sử dụng để huấn luyện mô hình, trong khi tập kiểm tra được sử dụng để đánh giá hiệu suất của mô hình.
4. **Chọn Mô Hình**: Chọn một mô hình phù hợp với bài toán và dữ liệu.
5. **Huấn Luyện Mô Hình**: Sử dụng tập huấn luyện để huấn luyện mô hình, điều chỉnh các tham số để giảm thiểu hàm mất mát.
6. **Đánh Giá Mô Hình**: Sử dụng tập kiểm tra để đánh giá hiệu suất của mô hình, sử dụng các chỉ số như độ chính xác (accuracy), độ nhạy (recall), và độ đặc hiệu (precision).
7. **Triển Khai Mô Hình**: Sau khi mô hình đạt được hiệu suất mong muốn, triển khai mô hình để dự đoán trên dữ liệu mới.

## Các Thách Thức

### Overfitting và Underfitting

- **Overfitting**: Xảy ra khi mô hình học quá kỹ các chi tiết và nhiễu trong tập huấn luyện, dẫn đến hiệu suất kém trên dữ liệu mới. Điều này thường xảy ra khi mô hình quá phức tạp so với lượng dữ liệu huấn luyện.
- **Underfitting**: Xảy ra khi mô hình quá đơn giản để nắm bắt các mẫu trong dữ liệu huấn luyện, dẫn đến hiệu suất kém cả trên tập huấn luyện và tập kiểm tra.

### Chọn Đặc Trưng

Chọn đặc trưng là một bước quan trọng trong học máy giám sát. Các đặc trưng không liên quan hoặc nhiễu có thể làm giảm hiệu suất của mô hình. Kỹ thuật chọn đặc trưng bao gồm loại bỏ các đặc trưng không liên quan, sử dụng các phương pháp giảm chiều (dimensionality reduction) như PCA, và chọn các đặc trưng quan trọng dựa trên các thuật toán học máy.

### Đánh Giá Mô Hình

Đánh giá mô hình là một bước quan trọng để đảm bảo rằng mô hình hoạt động tốt trên dữ liệu mới. Các phương pháp đánh giá bao gồm chia tập dữ liệu thành các tập huấn luyện và kiểm tra, sử dụng k-fold cross-validation, và theo dõi các chỉ số hiệu suất như độ chính xác, độ nhạy, và độ đặc hiệu.

## Kết Luận

Học máy giám sát là một công cụ mạnh mẽ trong việc giải quyết các bài toán dự đoán và phân loại. Bằng cách sử dụng các kỹ thuật và thuật toán phù hợp, chúng ta có thể xây dựng các mô hình chính xác và hiệu quả để dự đoán nhãn hoặc giá trị mục tiêu từ các đặc trưng của dữ liệu. Tuy nhiên, việc chọn mô hình, chọn đặc trưng, và đánh giá mô hình đều là những bước quan trọng và cần được thực hiện cẩn thận để đảm bảo hiệu suất tốt nhất.
