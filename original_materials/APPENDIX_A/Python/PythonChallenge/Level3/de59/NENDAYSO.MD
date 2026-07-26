Cho dãy số nguyên dương N, ta có dãy số A gồm các số nguyên từ 1 đến N, Phép nén dãy số là tạo ra dãy số mới mà các phần tử được tạo ra bằng cách lần lượt cộng 2 só cạnh nhau của dãy số ban đầu.

Mỗi lần nén dãy số, dãy số mới sẽ ít hơn dãy số trước 1 phần tử. Ta nén dãy số đến khi còn 1 phần tử, phần tử đó là giá trị nén của dãy số.

Yêu cầu: in ra giá trị nén dãy số. Vì kết quả có thể lớn, nên chỉ cần in ra số dư của phép chia giá trị nén dãy số cho 10^9

Ví dụ các phép nén dãy trong trường hợp N = 4, ta có kết quả cuối cùng là 20.
Quá trình nén như sau
N = 4
ta có dãy tự nhiên 
1 2 3 4
nén lần 1: 1 + 2 và 2 + 3 và 3 + 4 dãy còn lại là 3 5 7
nén lần 2: 3 + 5 và 5 + 7 dãy còn lại là 8 12
nén lần 3: 8 + 12 ta có kết quả 20
