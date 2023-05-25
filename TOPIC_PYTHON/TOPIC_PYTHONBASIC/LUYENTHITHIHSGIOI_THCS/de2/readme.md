

CÂU 1:
Hãy viết mã lệnh python giải quyết bài toán số học sau:
Cho dãy gồm số nguyên dương a_1, a_2,...,a_n
Dãy số b_1, b_2, ...,b_n được gọi là dãy cấp số nhân công bội khi và chỉ khi b_(i+1)với mọi 1 <= i < k
Yêu cầu: Cho số nguyên q, với mỗi k (1 <k <= n), hãy đếm số dãy con (không nhất thiết liên tiếp) độ dài k của dãy a_1, a_2, ...,a_n là dãy cấp số nhân công bội q.
Dữ liệu: Vào từ thiết bị vào chuẩn có khuôn dạng:
 Dòng đầu tiên gồm hai số nguyên n, q 
 Dòng thứ hai chứa n số nguyên a_1, a_2,...,a_n
Ràng buộc:
Kết quả: Ghi ra thiết bị ra chuẩn một dòng gồm n - 1 số nguyên, số thứ s (1 <= s < n ) là số dãy con độ dài  (s +1)là dãy cấp số nhân công bội chia dư cho (10^9 +7).
 Có 25% số test ứng với 25% số điểm của bài thỏa mãn:
 25% số test khác ứng với 25% số điểm của bài thỏa mãn:
 25% số test khác ứng với 25% số điểm của bài thỏa mãn:
 25% số test còn lại ứng với 25% số điểm của bài không có ràng buộc gì thêm.
dữ liệu vào trong file b2c1_DATA.INP là: 
5 2
1 2 8 4 2
dữ liệu ra ghi vào file b2c1_DATA.OUT có giá trị là: 3 1 0 0


CÂU 2:
Cho bảng chữ kích thước m x n , mỗi ô chứa một kí tự  'A' hoặc 'B' . Một hình chữ nhật con của
bảng được gọi là bảng đẹp bậc k nếu số lượng kí tự  'A' và số lượng kí tự 'B' trong bảng con chênh
lệch không quá k .
Yêu cầu: Cho bảng chữ kích thước m x n và số nguyên , hãy tìm bảng con là bảng đẹp lớn nhất.
Dữ liệu: Vào từ thiết bị vào chuẩn có khuôn dạng:
- Dòng đầu chứa số nguyên T (T <= 5) là số bộ dữ liệu;
- T nhóm dòng sau, mỗi dòng mô tả một bộ dữ liệu có dạng:
o Dòng đầu chứa ba số nguyên m, n ,k ;
o m dòng tiếp theo, mỗi dòng chứa một xâu kí tự độ dài chỉ gồm kí tự A hoặc B.
Kết quả: Ghi ra thiết bị ra chuẩn T dòng, mỗi dòng chứa một số là số lượng ô trong bảng tìm được
tương ứng với dữ liệu vào.
Ràng buộc:
 Có 25% số test ứng với 25% số điểm của bài có m x n <= 100;
 Có 25% số test khác ứng với 25% số điểm của bài có m x n <= 2000;
 Có 25% số test khác ứng với 25% số điểm của bài có m x n <= 4000; k = 0;
 Có 25% số test còn lại ứng với 25% số điểm của bài có m x n < = 60000
Ví dụ:

Dữ liệu vào 
2
3 4 0
AAAA
BBBB
BAAA
3 4 1
AAAA
BBBB
BAAA

Kết qủa ra:
8
9

Hướng giải:
Để giải quyết bài toán này, chúng ta có thể sử dụng một thuật toán quy hoạch động. Dưới đây là một phương pháp để tìm bảng đẹp lớn nhất.

Đọc dữ liệu từ input:
Đọc số bộ dữ liệu T.
Đọc thông tin về mỗi bộ dữ liệu, bao gồm kích thước bảng m x n và số nguyên k.
Đọc bảng từ input và lưu vào một ma trận.
Xử lý từng bộ dữ liệu:
Đọc kích thước bảng m x n và số nguyên k cho bộ dữ liệu hiện tại.
Đọc bảng từ input và lưu vào một ma trận.
Tìm bảng đẹp lớn nhất:
Khởi tạo biến max_area = 0 để lưu kích thước bảng đẹp lớn nhất.
Với mỗi hàng i từ 0 đến m - 1:
Khởi tạo một mảng prefix_row_sum với số phần tử bằng n và giá trị ban đầu là 0.
Với mỗi hàng j từ i đến m - 1:
Khởi tạo biến count_A = 0 và count_B = 0 để lưu số lượng kí tự 'A' và 'B' tại mỗi cột.
Với mỗi cột k từ 0 đến n - 1:
Cộng thêm giá trị của ma trận tại ô (j, k) vào prefix_row_sum[k].
Nếu giá trị tại ô (i, k) trong prefix_row_sum không chênh lệch quá k so với giá trị tại ô (j, k), thì tăng count_A lên 1.
Nếu giá trị tại ô (i, k) trong prefix_row_sum chênh lệch quá k so với giá trị tại ô (j, k), thì tăng count_B lên 1.
Nếu count_A và count_B không vượt quá k, cập nhật max_area bằng giá trị lớn nhất giữa max_area và (j - i + 1) * (k + 1).
In kết quả:
In ra T dòng, mỗi dòng chứa một số là kích thước bảng đẹp lớn nhất tương ứng với mỗi bộ dữ liệu.
Đây là một ứng dụng của thuật toán quy hoạch động để tìm bảng đẹp lớn nhất trong một ma trận.