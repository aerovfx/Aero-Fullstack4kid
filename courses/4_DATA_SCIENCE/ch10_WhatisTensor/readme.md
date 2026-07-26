# TENSOR
## Tensor là gì?
- là một cấu trúc dữ liệu quan trọng trong các thư viện học sâu (deep learning) như PyTorch và TensorFlow. Nó có thể được hiểu là một mảng n-dimensional (đa chiều) có thể lưu trữ dữ liệu. Tensor có thể là các giá trị số nguyên, thực hoặc các giá trị khác, và thường được sử dụng trong các phép toán toán học trong các mô hình học máy.

- Cấu trúc Tensor
	•	0D Tensor (Scalar): Là một giá trị duy nhất, không có chiều. Ví dụ: tensor(5)
	•	1D Tensor (Vector): Là một chuỗi các giá trị. Ví dụ: tensor([1, 2, 3])
	•	2D Tensor (Matrix): Là một mảng 2 chiều với các hàng và cột. Ví dụ: tensor([[1, 2], [3, 4]])
	•	3D Tensor: Là mảng 3 chiều, có thể hình dung như một tập hợp của nhiều ma trận. Ví dụ: tensor([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
	•	N-Dimensional Tensor: Là một tensor có nhiều hơn 3 chiều, tùy thuộc vào bài toán cụ thể.

## Tính năng của Tensor:
	•	Khả năng tính toán nhanh: Tensor có thể thực hiện các phép toán toán học một cách nhanh chóng và hiệu quả, đặc biệt khi được thực hiện trên GPU.
	•	Dễ dàng tích hợp trong các mô hình học sâu: Các mô hình học máy và học sâu thường sử dụng tensor để biểu diễn dữ liệu, trọng số (weights) và các tham số khác trong quá trình huấn luyện.

# TRỌNG SỐ

Trong bối cảnh học máy và học sâu (deep learning), **trọng số (weights)** là các giá trị mà mô hình học máy học được trong quá trình huấn luyện để tối ưu hóa và dự đoán đầu ra chính xác. Trọng số có thể được coi là các tham số điều chỉnh trong mô hình, giúp xác định mức độ ảnh hưởng của mỗi đầu vào đối với kết quả dự đoán.

### Ý nghĩa của trọng số (weights) trong tensor:
1. **Chỉ định tầm quan trọng của các đầu vào:**
   - Mỗi trọng số gắn liền với một đầu vào trong mô hình. Ví dụ, trong một mạng nơ-ron nhân tạo (neural network), mỗi kết nối giữa các nơ-ron có một trọng số, cho biết mức độ ảnh hưởng của đầu vào đó đến đầu ra.
   
2. **Học từ dữ liệu:**
   - Trong quá trình huấn luyện, mô hình sẽ học cách điều chỉnh trọng số sao cho kết quả dự đoán ngày càng chính xác hơn. Thông qua việc tối ưu hóa hàm mất mát (loss function), trọng số được cập nhật liên tục.

3. **Thực hiện phép toán với tensor:**
   - Trọng số trong các mô hình học sâu thường được biểu diễn dưới dạng tensor. Các phép toán với tensor (như cộng, nhân, v.v.) được sử dụng để tính toán các giá trị đầu ra của mô hình, với trọng số là một yếu tố quyết định trong quá trình tính toán đó.

### Ví dụ trong mạng nơ-ron (Neural Network):

Giả sử bạn có một mạng nơ-ron đơn giản với một lớp đầu vào và một lớp đầu ra. Mỗi kết nối giữa các nơ-ron sẽ có một trọng số (weight).
1. **Mô hình đơn giản:**
   - Đầu vào: `X = [x1, x2, x3]`
   - Trọng số: `w = [w1, w2, w3]`
   - Đầu ra: `y_pred = w1 * x1 + w2 * x2 + w3 * x3 + b` (với `b` là độ lệch, bias)

Trong ví dụ trên, tensor `weights` đại diện cho các trọng số của mô hình, và khi tính toán `y_pred`, các giá trị trọng số này sẽ ảnh hưởng đến kết quả đầu ra.

### Vai trò quan trọng của trọng số:
- **Điều chỉnh mô hình**: Trọng số giúp mô hình điều chỉnh cách thức mà nó xử lý và hiểu dữ liệu đầu vào.
- **Cải thiện dự đoán**: Qua các lần cập nhật trọng số trong quá trình huấn luyện, mô hình học được cách dự đoán chính xác hơn.
- **Công cụ tối ưu hóa**: Các thuật toán như Gradient Descent sẽ tối ưu hóa các trọng số bằng cách tính toán độ dốc của hàm mất mát (loss function) và điều chỉnh trọng số theo hướng giảm thiểu sai số.

Tóm lại, trọng số trong tensor là một phần thiết yếu trong việc huấn luyện và tối ưu hóa mô hình học máy, giúp mô hình học cách dự đoán từ dữ liệu đầu vào một cách chính xác.
### Ví dụ: Dự đoán giá nhà

Giả sử bạn đang xây dựng một mô hình học máy để dự đoán giá nhà. Các yếu tố như diện tích nhà (`X1`), số phòng ngủ (`X2`), và độ tuổi của nhà (`X3`) sẽ được sử dụng làm đầu vào. Trọng số của mỗi yếu tố (tức là các tham số `w1`, `w2`, và `w3`) quyết định mức độ ảnh hưởng của từng yếu tố đến giá nhà.

#### Mô hình:
Giá nhà (`y_pred`) được tính như sau:

$$
y_{\text{pred}} = w1 \times X1 + w2 \times X2 + w3 \times X3 + b
$$

- `X1`: Diện tích nhà (ví dụ: 100m²)
- `X2`: Số phòng ngủ (ví dụ: 3 phòng ngủ)
- `X3`: Độ tuổi của nhà (ví dụ: 5 năm)
- `w1`, `w2`, `w3`: Trọng số tương ứng với diện tích, số phòng ngủ, và độ tuổi của nhà.
- `b`: Độ lệch (bias) của mô hình.

### Tầm quan trọng của trọng số:

1. **Điều chỉnh mức độ ảnh hưởng**: 
   - Nếu trọng số `w1` (diện tích nhà) lớn hơn trọng số `w2` (số phòng ngủ), điều này có nghĩa là diện tích nhà có ảnh hưởng lớn hơn đến giá nhà so với số phòng ngủ. Trọng số giúp mô hình hiểu được yếu tố nào quan trọng hơn trong việc dự đoán giá nhà.
   - Ví dụ: `w1 = 2.0`, `w2 = 1.0`, `w3 = 0.5`. Điều này có nghĩa là mỗi đơn vị diện tích (m²) sẽ có ảnh hưởng gấp đôi so với mỗi phòng ngủ đối với giá nhà.

2. **Cải thiện độ chính xác của mô hình**:
   - Trong quá trình huấn luyện, mô hình học được cách điều chỉnh các trọng số sao cho khi kết hợp với các đầu vào (diện tích, số phòng ngủ, độ tuổi nhà), giá nhà dự đoán (`y_pred`) càng gần với giá thực tế hơn.
   - Khi mô hình học từ dữ liệu, các trọng số được cập nhật liên tục để giảm thiểu sai số giữa dự đoán và giá trị thực tế.

3. **Tối ưu hóa dựa trên trọng số**:
   - Nếu mô hình bắt đầu với các trọng số ngẫu nhiên, giá trị dự đoán ban đầu có thể sẽ sai lệch nhiều so với giá thực tế. Tuy nhiên, qua quá trình huấn luyện (thông qua thuật toán như Gradient Descent), trọng số được điều chỉnh dần để giảm thiểu sai số.
   - Ví dụ: Trọng số `w1` có thể tăng lên nếu mô hình nhận thấy rằng diện tích nhà có ảnh hưởng lớn hơn đến giá hơn so với các yếu tố khác.

### Kết luận:
Trọng số trong mô hình học máy là cực kỳ quan trọng vì chúng xác định mức độ ảnh hưởng của các đầu vào khác nhau đối với kết quả dự đoán. Thông qua việc tối ưu hóa trọng số, mô hình có thể cải thiện độ chính xác của dự đoán và học cách đưa ra các kết luận chính xác hơn từ dữ liệu đầu vào.

## BIAS VÀ VARIANCE 
**Độ lệch chuẩn (Bias) và Độ phân tán (Variance) trong Mạng Neuron**
===========================================================

### Ví dụ đơn giản

Suppose chúng ta đang xây dựng một mô hình dự đoán giá trị của một biến số dựa trên dữ liệu nhập vào. Dữ liệu mà chúng ta có bao gồm:

* **Biến đầu vào (Input Feature):** Giá trị của một sản phẩm
* **Biến mục tiêu (Target Variable):** Giá trị bán được của sản phẩm

Mục tiêu là dự đoán giá trị bán được dựa trên giá trị của sản phẩm.

### Mô hình học máy

Chúng ta sử dụng mô hình hồi quy tuyến tính để dự đoán giá trị bán được. Mô hình có thể được viết như sau:

Giá trị bán được = A * Giá trị sản phẩm + B

Trên thực tế, chúng ta không biết giá trị của A và B nên chúng ta sẽ cần phải học hỏi từ dữ liệu.

### Bias

Nếu mô hình hồi quy tuyến tính trên chỉ sử dụng một vài điểm dữ liệu để huấn luyện, thì mô hình có thể sẽ bị "lệch" do sự lựa chọn điểm dữ liệu đó. Ví dụ:

* Nếu tất cả các điểm dữ liệu đều nằm gần với đường thẳng y = 2x, thì mô hình sẽ học hỏi được giá trị của A là 2 và B là 0.
* Tuy nhiên, nếu chúng ta thêm một số điểm dữ liệu mới vào mô hình huấn luyện, ví dụ như y = 3x + 1, thì mô hình sẽ không thể dự đoán đúng giá trị bán được.

Lý do là vì mô hình hồi quy tuyến tính quá đơn giản và không thể học hỏi các mối quan hệ phức tạp giữa biến đầu vào và biến mục tiêu.

### Variance

Nếu chúng ta thêm nhiều điểm dữ liệu mới vào mô hình huấn luyện, ví dụ như y = 2x + 3, thì mô hình có thể sẽ bị "lệch" do sự lựa chọn điểm dữ liệu đó. Tuy nhiên, nếu chúng ta sử dụng mô hình hồi quy tuyến tính với các tham số A và B được huấn luyện từ nhiều điểm dữ liệu khác nhau, thì mô hình có thể sẽ dự đoán chính xác giá trị bán được.

### Kết luận

* **Bias:** Là sự "lệch" của mô hình do sự lựa chọn điểm dữ liệu huấn luyện. Nếu mô hình quá đơn giản, nó có thể sẽ bị "lệch".
* **Variance:** Là sự "lệch" của mô hình do sự lựa chọn điểm dữ liệu huấn luyện. Nếu mô hình sử dụng nhiều điểm dữ liệu khác nhau để huấn luyện, nó có thể sẽ dự đoán chính xác.

Hy vọng ví dụ trên giúp bạn hiểu rõ hơn về concept của Bias và Variance trong học máy!

# MATIX IN TENSOR

**Ma Trận (Matrix) trong Tensor**
==============================

Một ma trận là một phần tử đặc biệt của tensor, được biểu diễn bởi các số hoặc giá trị khác nhau được sắp xếp theo hàng và cột.

### Ví dụ đơn giản về Ma Trận 2x3

Suppose chúng ta có một ma trận 2x3 như sau:

```markdown
| 1 | 2 | 3 |
|---|---|---|
| 4 | 5 | 6 |
```

Trong ví dụ trên, ma trận này có 2 hàng và 3 cột. Mỗi phần tử trong ma trận được xác định bởi vị trí của nó.

* **Phần tử ở hàng đầu tiên, cột đầu tiên:** 1
* **Phần tử ở hàng đầu tiên, cột thứ hai:** 2
* **Phần tử ở hàng đầu tiên, cột thứ ba:** 3
* **Phần tử ở hàng thứ hai, cột đầu tiên:** 4
* **Phần tử ở hàng thứ hai, cột thứ hai:** 5
* **Phần tử ở hàng thứ hai, cột thứ ba:** 6

### Tính toán Ma Trận

Chúng ta có thể thực hiện các phép tính trên ma trận như sau:

```markdown
| 1 | 2 | 3 |
|---|---|---|
| 4 | 5 | 6 |

* **Trả về ma trận con:** 
  * `A[0:1, :]` trả về ma trận `[1 2; 4 5]`
  * `A[:, 0:2]` trả về ma trận `[1 2; 4 5]`

* **Tính toán phép nhân:** 
  * `A * [3; 6] = [9; 36]`
```

Hy vọng ví dụ trên giúp bạn hiểu rõ hơn về concept của Ma Trận trong Tensor!

# TẠO MODEL
**Tạo mô hình (Model)**
=====================

Để tạo một mô hình, chúng ta cần thực hiện các bước sau:

### 1. Xác định loại mô hình

Trước tiên, chúng ta cần xác định loại mô hình mà mình muốn tạo. Ví dụ: mô hình hồi quy tuyến tính, mô hình phân loại, mô hình tự động mã hóa v.v.

### 2. Lựa chọn library và framework

Sau đó, chúng ta cần lựa chọn library và framework phù hợp để xây dựng mô hình. Ví dụ: PyTorch, TensorFlow, Keras v.v.

### 3. Thiết kế cấu trúc mô hình

Tiếp theo, chúng ta cần thiết kế cấu trúc mô hình. Điều này bao gồm việc quyết định số lượng các lớp ẩn (hidden layers), số lượng các đơn vị trong mỗi lớp ẩn (number of units in each hidden layer) và kiểu kết nối giữa các lớp (type of connection between layers).

### 4. Chọn kích thước dữ liệu

Chúng ta cần chọn kích thước dữ liệu phù hợp với mô hình của mình. Điều này bao gồm việc quyết định kích thước của tập dữ liệu huấn luyện (training dataset), kích thước của tập dữ liệu kiểm tra (testing dataset) và kích thước của tập dữ liệu thử nghiệm (validation dataset).

### 5. Huấn luyện mô hình

Sau đó, chúng ta cần huấn luyện mô hình bằng cách sử dụng dữ liệu huấn luyện. Điều này bao gồm việc quyết định thuật toán học máy phù hợp (đối với mô hình hồi quy tuyến tính, chúng ta có thể sử dụng thuật toán Gradient Descent), tham số học máy phù hợp (tỷ lệ học tập alpha, tỷ lệ giảm dần beta v.v.) và các hyperparameter khác.

### 6. Đánh giá mô hình

Cuối cùng, chúng ta cần đánh giá mô hình bằng cách sử dụng dữ liệu kiểm tra hoặc dữ liệu thử nghiệm. Điều này bao gồm việc quyết định chỉ số đánh giá phù hợp (đối với mô hình hồi quy tuyến tính, chúng ta có thể sử dụng chỉ số Mean Squared Error MSE) và so sánh kết quả với các mức độ dự đoán tốt nhất.


Hy vọng ví dụ trên giúp bạn hiểu rõ hơn về cách tạo mô hình bằng PyTorch!