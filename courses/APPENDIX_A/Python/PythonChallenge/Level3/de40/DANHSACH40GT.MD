Giải thuật cho bài toán:

Định nghĩa hàm remove_dup(danhsach) nhận vào một danh sách danhsach.
Trong hàm remove_dup:
a. Sử dụng hàm set() để tạo một tập hợp (set) chứa các phần tử duy nhất từ danh sách danhsach.
b. Chuyển đổi tập hợp thành danh sách bằng cách sử dụng hàm list().
c. Trả về danh sách duy nhất đã loại bỏ các phần tử trùng nhau.
Nhập danh sách từ người dùng và gán vào biến danhsach.
Xoá khoảng trắng ở đầu và cuối mỗi phần tử trong danh sách danhsach bằng cách sử dụng list comprehension.
Gọi hàm remove_dup(danhsach) để loại bỏ các phần tử trùng nhau và gán kết quả vào biến unique_lst.
In danh sách sau khi đã loại bỏ phần tử trùng nhau.

Mã giả:
1. Hàm loại bỏ phần tử trùng nhau remove_dup(danhsach):
    Trả về danh sách chứa các phần tử duy nhất từ danh sách danhsach

2. Nhập danh sách từ người dùng và gán vào biến danhsach

3. Xoá khoảng trắng ở đầu và cuối mỗi phần tử trong danh sách danhsach

4. Gán unique_lst = remove_dup(danhsach)

5. In danh sách sau khi đã loại bỏ phần tử trùng nhau unique_lst


Đọc giá trị n từ bàn phím
Đọc n phần tử của dãy số A từ bàn phím

Tạo bảng DP kích thước nxn
Khởi tạo DP[i][i] = 1 cho mọi i từ 0 đến n-1

Khởi tạo max_len = 1
Khởi tạo start = 0, end = 0

Duyệt i từ n-1 đến 0 và j từ i+1 đến n-1:
    Nếu A[i] == A[j] và j-i+1 > DP[i+1][j-1]:
        Gán DP[i][j] = DP[i+1][j-1] + 2
        Nếu DP[i][j] > max_len:
            Gán max_len = DP[i][j], start = i, end = j
    Ngược lại, DP[i][j] = 0

In dãy số con đối xứng dài nhất từ start đến end trong dãy A


