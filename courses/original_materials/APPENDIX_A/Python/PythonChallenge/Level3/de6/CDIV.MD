Cho một mảng A gồm N số nguyên dương n_1, n_2,....,n_N
Yêu cầu: Hãy tìm hai số nguyên trong mảng A sao cho ước chung lớn nhất của 2 số đó là nhỏ nhất.
Dữ liệu: đọc vào từ file CDIV.INP
-Dòng đầu tiên chứa số nguyên N (2 <= N <= 2x10^5)
-Dòng thứ hai chứa N số nguyên a_i, mỗi số cách nhau 1 ký tự trắng (1 < = ai < = 10^6)
Kết quả: ghi ra file CDIV.OUT một số nguyên duy nhất là ước chung lớn nhất tìm được
Ví dụ:
CDIV.INP
6
12 5 6 4 7 10

CDIV.OUT
6

THUẬT TOÁN:
Để giải quyết bài toán trên, ta có thể sử dụng thuật toán Brute Force (vét cạn) để kiểm tra tất cả các cặp số trong mảng A và tìm ước chung lớn nhất nhỏ nhất.