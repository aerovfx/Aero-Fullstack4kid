câu 3 đề 44 Đề thi Tin học trẻ Thành phố Hà Nội năm 2016
Khối Trung học Cơ sở
Thời gian làm bài: 120 phút.

Tên tệp chương trình: “HOANVI.PY”
Một hoán vị P của dãy số 1, 2, 3,…, n là một cách sắp xếp các số ấy theo một trật tự nào đó. Ví dụ với n=9 thì P=(5, 9, 1, 8, 2, 6, 4, 7, 3) là một hoán vị.
Cho một hoán vị P=(a1, a2, a3,…, an) của dãy 1,2,…,n. Khi đó người ta xây dựng dãy nghịch thế T= (t1, t2, t3…,tn) như sau trong đó ti bằng số các phần tử của hoán vị P nằm bên trái i và lớn hơn i.
Ví dụ : P = (5, 9, 1, 8, 2, 6, 4, 7, 3)  thì T = (2, 3, 6, 4, 0, 2, 2, 1, 0)
Giải thích: 
t_1=2 vì trong hoán vị P, số 1 có 2 giá trị bên trái nó mà lớn hơn nó là 5 và 9; 
t_2=3 vì trong hoán vị P, số 2 có 3 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8;
t_3=6 vì trong hoán vị P, số 3 có 6 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8, 6, 4, 7;
t_4=4 vì trong hoán vị P, số 4 có 4 giá trị bên trái nó mà lớn hơn nó là 5, 9, 8, 6;
t_5=0 vì trong hoán vị P, số 5 có 0 giá trị bên trái nó mà lớn hơn nó;
t_6=2 vì trong hoán vị P, số 6 có 2 giá trị bên trái nó mà lớn hơn nó là 9, 8;
t_7=2 vì trong hoán vị P, số 7 có 2 giá trị bên trái nó mà lớn hơn nó là 9, 8;
t_8=1 vì trong hoán vị P, số 8 có 1 giá trị bên trái nó mà lớn hơn nó là 9;
t_9=0 vì trong hoán vị P, số 9 có 0 giá trị bên trái nó mà lớn hơn nó;

Lập trình thực hiện yêu cầu sau:
Nhập vào từ bàn phím một số n và một hoán vị của 1,2,…,n. Tìm và in ra màn hình nghịch thế của hoán vị đó.
