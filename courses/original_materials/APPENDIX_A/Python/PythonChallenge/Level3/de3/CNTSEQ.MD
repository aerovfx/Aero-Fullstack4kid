ĐẾM DÃY CON LIÊN TIẾP (7 điểm)
Cho dãy số A có n số nguyên a_1, a_2,..,a_n. 
Một dãy con liên tiếp các số hạng của dãy A là dãy các số hạng a_i đến số hạng a_j (1 < = i <= j <= n ).
Yêu cầu hãy cho biết dãy A có bao nhiêu dãy con liên tiếp mà mà giá trị tuyệt đối của tổng các số hạng trong dãy con đó lớn hơn một số nguyên dương S cho trước.
Dữ liệu: Vào từ file văn bản CNTSEQ.INP
Dòng thứ 1 chứa hai số nguyên dược n và S ( n < = 10^5, S < = 10^(14))
Dòng thứ 2 chứa n số nguyên a_1, a_2, ...,a_n (|a_n| < = 10^9 )
Kết qủa: Ghi ra file văn bản CNTSEQ.OUT trên một dòng, một số nguyên duy nhất là số dãy con liên tiếp thoã mãn yêu cầu cảu bài toán trên.

Ví dụ:
CNTSEQ.INP
4 4
5 -2 8 -6

CNTSEQ.OUT
6


Chú ý trị tuyệt đối của các chuỗi con của chuỗi [5, -2, 8, -6] có gía trị là:

[5] = 5
[-2] = 2
[8] = 8
[-6] = 6
[5, -2] = 3
[-2, 8] = 6
[8, -6] = 2
[5, -2, 8] = 11
[-2, 8, -6] = 0
[5, -2, 8, -6] = 5
nên có tất cả 6 chuỗi con thoả mãn có tổng lớn hơn 4

Đây là tất cả các chuỗi con có thể được tạo ra từ chuỗi ban đầu.

Giải thích: 
Trong ví dụ có 6 dãy con thoả mãn yêu cầu là [5], [8], [-6], [-2;8], [5;-2;8] và [5;-2;8;-6]
Ràng buộc:
có 50% số test tương ứng với 50% số điểm của bài có n <= 100
có 30% số test tương ứng với 30% số điểm của bài có n <= 1000
có 20% số test tương ứng với 20% số điểm của bài có n <= 10^5