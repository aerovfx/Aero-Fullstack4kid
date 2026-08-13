Đề thi Tin học trẻ Thành phố Hà Nội năm 2016
Khối Trung học Cơ sở
Thời gian làm bài: 120 phút.

Tên tệp chương trình: “HOANVI.PY”
Một hoán vị P của dãy số 1, 2, 3,…, n là một cách sắp xếp các số ấy theo một trật tự nào đó. Ví dụ với n=9 thì P=(5, 9, 1, 8, 2, 6, 4, 7, 3) là một hoán vị.
Cho một hoán vị P=(a1, a2, a3,…, an) của dãy 1,2,…,n. Khi đó người ta xây dựng dãy nghịch thế T= (t1, t2, t3…,tn) như sau trong đó ti bằng số các phần tử của hoán vị P nằm bên trái i và lớn hơn i.
Ví dụ : P = (5, 9, 1, 8, 2, 6, 4, 7, 3)  thì T = (2, 3, 6, 4, 0, 2, 2, 1, 0)
Giải thích: 
T[0] = 2 vì trong hoán vị P, số 1 ở vị trí P[2] có 2 giá trị bên trái nó mà lớn hơn nó là 5 và 9; <br/>
T[1] = 3 vì trong hoán vị P, số 2 ở vị trí P[4] có 3 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8;
T[2] = 6 vì trong hoán vị P, số 3 ở vị trí P[4] có 6 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8, 6, 4, 7;
T[3] = 4 vì trong hoán vị P, số 4 ở vị trí P[4] có 4 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8, 6;
T[4] = 0 vì trong hoán vị P, số 5 ở vị trí P[4] có 0 giá trị bên trái nó mà lớn hơn nó;
T[5] = 2 vì trong hoán vị P, số 6 ở vị trí P[4] có 2 giá trị bên trái nó mà lớn hơn nó là 9, 8;
T[6] = 2 vì trong hoán vị P, số 7 ở vị trí P[4] có 2 giá trị bên trái nó mà lớn hơn nó là 9, 8;
T[7] = 1 vì trong hoán vị P, số 8 ở vị trí P[4] có 1 giá trị bên trái nó mà lớn hơn nó là 9;
T[8] = 0 vì trong hoán vị P, số 9 ở vị trí P[4] có 0 giá trị bên trái nó mà lớn hơn nó;

Lập trình thực hiện yêu cầu sau:
Nhập vào từ bàn phím một số n và một hoán vị của 1,2,…,n. Tìm và in ra màn hình nghịch thế của hoán vị đó.
Đầu vào:  P = (5, 9, 1, 8, 2, 6, 4, 7, 3)  
Đầu ra là: T = (2, 3, 6, 4, 0, 2, 2, 1, 0)