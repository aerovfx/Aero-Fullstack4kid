Bài toán chúc Tết
Một người quyết định dành một ngày Tết để đến chúc Tết các bạn của mình. Để chắc chắn, hôm trước anh ta đã điện thoại đến từng người để hỏi khoảng thời gian mà người đó có thể tiếp mình. Giả sử có N người được hỏi (đánh số từ 1 đến N), người thứ i cho biết thời gian có thể tiếp trong ngày là từ Ai đến Bi (i = 1, 2,..., N). Giả thiết rằng, khoảng thời gian cần thiết cho mỗi cuộc gặp là H và khoảng thời gian chuẩn bị từ một cuộc gặp đến một cuộc gặp kế tiếp là T. Bạn hãy xây dựng giúp một lịch chúc Tết để anh ta có thể chúc Tết được nhiều người nhất.
File dữ liệu vào trong file CHUCTET.INP gồm dòng đầu ghi số N, dòng thứ i trong số N dòng tiếp theo ghi khoảng thời gian có thể tiếp khách của người i gồm 2 số thực Ai và Bi (cách nhau ít nhất một dấu trắng). Dòng tiếp theo ghi giá trị H (số thực) và dòng cuối cùng ghi giá trị T (số thực). Giả thiết rằng các giá trị thời gian đều được viết dưới dạng thập phân theo đơn vị giờ, tính đến 1 số lẻ (thí dụ 10.5 có nghĩa là mười giờ rưỡi) và đều nằm trong khoảng từ 8 đến 21 (từ 8 giờ sáng đến 9 giờ tối). Số khách tối đa không quá 30.
Kết quả ghi ra file CHUCTET.OUT gồm dòng đầu ghi K là số người được thăm, K dòng tiếp theo ghi trình tự đi thăm, mỗi dòng gồm 2 số (ghi cách nhau ít nhất một dấu trắng): số đầu là số hiệu người được thăm, số tiếp theo là thời điểm gặp tương ứng.
Ví dụ
CHUCTET.INP 
20
10.5 12.6
15.5 16.6
14.0 14.1
17.5 21.0
15.0 16.1
19.0 21.0
10.5 13.6
12.5 12.6
11.5 13.6
12.5 15.6
16.0 18.1
13.5 14.6
12.5 17.6
13.0 13.1
18.5 21.0
9.0 13.1
10.5 11.6
10.5 12.6
18.0 21.0
0.5
0.1
CHUCTET.OUT 
16
17 9.0
1 10.5
18 11.1
19 11.7
8 12.3
10 12.9
11 13.5
13 14.1
5 15.0
2 15.6
12 16.2
14 16.8
4 17.5
7 19.0
16 19.6
20 20.2
