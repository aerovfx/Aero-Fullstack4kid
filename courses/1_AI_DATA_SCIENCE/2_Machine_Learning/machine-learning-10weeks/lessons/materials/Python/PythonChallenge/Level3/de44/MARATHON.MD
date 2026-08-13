Đề thi tin học trẻ năm học 2021-2022
Bảng B THCS
Huyện Hoa Lư


Trong cuộc chạy bộ dã ngoại chào hè năm 2022, có n đoàn viên tham gia được đánh số từ 1 đến n, đoàn viên thứ i có thời gian chạy về đích là a. Ban tổ chức quy định về cách thức chọn các đoàn viên để trao giải như sau:
-Phải có ít nhất một đoàn viên được chọn để trao thưởng.
-Nếu có một đoàn viên nào đó được chọn để trao thưởng thì tất cả các đoàn viên có thời gian chạy bằng bằng hoặc thấp hơn thời gian chạy của đoàn viên được chọn cũng phải được trao thưởng.
Yêu cầu: 
Với mỗi đoàn viên, hãy giúp ban tổ chức tính toán xem nếu chọn đoàn viên đó để trao thưởng thì tổng số đoàn viên dược trao thưởng là bao nhiêu bạn?
Dữ liệu vào từ luồng vào chuẩn gồm
-Dòng thứ nhất ghi số nguyên dương n là số đoàn viên tham gia chạy.
-Dòng thứ hai ghi n số nguyên a_1, a_2, a_3,...,a_n (1 <= a_i <= 10^9), giữa các số cách nhau một khoảng cách.
Kết quả: 
Ghi ra luồng ra chuẩn n số trên n dòng, dòng thứ i tương ứng với tổng số bạn được trao thưởng nếu đoàn viên thứ i được chọn.

Ví dụ
MARATHON.INP
4
2 3 3 1

MARATHON.OUT
2
4
4
1

Giải thích: 
-nếu chọn đoàn viên thứ nhất có thời gian chạy là 2 để trao thưởng thì có đoàn viên thứ 1 có thời gian chạy là 2 và thứ 4 có thời gian chạy là 1 để trao giải, tức có 2 giải thưởng, in ra số 2 <br/>
-nếu cho đoàn viên thứ 2 có thời gian chạy là 3 để trao thưởng thì có 4 đoàn viên có thời gian chạy nhỏ hơn hay bằng 3 nên có 4 giải thưởng, in ra số 4 <br/>
-nếu cho đoàn viên thứ 3 có thời gian chạy là 3 để trao thưởng thì có 4 đoàn viên có thời gian chạy nhỏ hơn hay bằng 3 nên có 4 giải thưởng, in ra số 4 <br/>
-nếu cho đoàn viên thứ 4 có thời gian chạy là 1 để trao thưởng thì có 1 đoàn viên có thời gian chạy nhỏ hơn hay bằng 1 nên có 1 giải thưởng, in ra số 1 <br/>


Giới hạn
-Có 70% số test tương ứng với số điểm có giá trị n <= 10^3
-Có 30% số test tương ứng với số điểm có giá trị n <= 10^6
