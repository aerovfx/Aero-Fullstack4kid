 Năm 1973, nhà Toán học Neil Sloan đưa ra khái niệm độ bền của một số nguyên không âm N như sau:

Nếu N có một chữ số thì độ bền của N bằng 0.
Nếu N có từ hai chữ số trở lên thì độ bền của N bằng độ bền của số nguyên là tích các chữ số của N cộng 1.
Cho N từ 0  đến 2.000.000.000, tìm số bé hơn N có độ bền lớn nhất.
Ví dụ:
---------------------------------------
| PERSIT.INP        | PERSIT.OUT      | 
| 100               | 7 7             |   
|                   |                 | 
---------------------------------------
Giải thích:
Doben(77)=Doben(49)+1=Doben(36)+1+1=Doben(18)+1+1+1=Doben(8)+1+1+1+1=0+1+1+1+1=4
