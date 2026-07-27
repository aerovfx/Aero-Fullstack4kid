Để tìm dãy số con đối xứng dài nhất của dãy số A, chúng ta có thể sử dụng thuật toán động programming.

Giải thuật:

Đọc giá trị n từ bàn phím là số lượng phần tử của dãy số A.
Đọc n phần tử của dãy số A từ bàn phím.
Tạo một bảng DP kích thước nxn, với DP[i][j] là độ dài của dãy số con đối xứng dài nhất kết thúc tại vị trí i trong dãy A và kết thúc tại vị trí j trong dãy A.
Khởi tạo DP[i][i] = 1 cho mọi i từ 0 đến n-1 (vì một phần tử đơn thì luôn là dãy số con đối xứng dài nhất).
Khởi tạo biến max_len là độ dài của dãy số con đối xứng dài nhất tìm được.
Khởi tạo biến start và end để lưu vị trí bắt đầu và kết thúc của dãy số con đối xứng dài nhất.
Duyệt i từ n-1 đến 0 và j từ i+1 đến n-1:
Nếu A[i] == A[j] và j-i+1 > DP[i+1][j-1] (độ dài dãy số con đối xứng trước đó):
Gán DP[i][j] = DP[i+1][j-1] + 2.
Nếu DP[i][j] > max_len, gán max_len = DP[i][j], start = i, end = j.
Ngược lại, DP[i][j] = 0.
In ra dãy số con đối xứng dài nhất bằng cách truy vết từ start đến end.
