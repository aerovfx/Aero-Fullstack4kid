TÍNH TOÁN SONG SONG

Biểu thức đủ là một dãy ký tự gồm các biến ký hiệu bằng chữ cái thường tiếng Anh: a..z, các phép toán cộng ký hiệu +, nhân ký hiệu * và các dấu ngoặc (,). Được định nghĩa như sau:
i)	Mỗi biến a,b,...,z là một biểu thức đủ
ii)	Nếu X và Y là biểu thức đủ thì (X+Y) và (X*Y) cũng là biểu thức đủ.
iii)	Những biểu thức nào không xây dựng được theo 2 nguyên tắc trên không là biểu thức đủ.
VD: Theo cách định nghĩa trên thì (a+(b+(c+d))) hoặc ((a+b)+(c*d)) là các biểu thức đủ.
Cho biết thời gian tính phép + là P, thời gian tính phép * là Q, người ta định nghĩa thời gian tính toán một biểu thức đủ như sau:
•	Nếu biểu thức đủ chỉ gồm 1 biến (a..z) thì thời gian tính toán là 0
•	Nếu X và Y là 2 biểu thức đủ; thời gian tính X là TX thời gian tính Y là TY thì thời gian tính (X+Y) là max(TX,TY)+P thời gian tính (X*Y) là max(TX,TY)+Q
Từ 1 biểu thức đủ người ta có thể biến đổi về một biểu thức tương đương bằng các luật:
•	Giao hoán: 
(X+Y) tương đương (Y+X);
(X*Y) tương đương (Y*X)
•	Kết hợp: 
(X+(Y+Z)) tương đương  ((X+Y)+Z); 
(X*(Y*Z)) tương đương ((X*Y)*Z)
Yêu cầu: Cho trước một biểu thức đủ E dưới dạng xâu ký tự hãy viết chương trình:
1.	Tìm thời gian tính toán biểu thức E
2.	Hãy biến đổi biểu thức E thành biểu thức E' tương đương với nó sao cho thời gian tính E' là ít nhất có thể.
Dữ liệu vào được đặt trong file văn bản PO.INP như sau:
•	Dòng thứ nhất ghi 2 số P, Q cách nhau 1 dấu cách (P, Q <100)
•	Tiếp theo là một số dòng, mỗi dòng ghi 1 biểu thức đủ.
Kết quả ra đặt trong file văn bản PO.OUT như sau:
Với mỗi biểu thức E trong file PO.INP ghi ra file PO.OUT 3 dòng
•	Dòng thứ nhất: Ghi thời gian tính toán E
•	Dòng thứ hai: Ghi biểu thức E'
•	Dòng thứ ba: Ghi thời gian tính toán E'
Chú ý: Để cho gọn, mỗi biểu thức đủ trong input/output file có thể viết mà không cần đến cặp dấu ngoặc ngoài cùng, dữ liệu vào được coi là đúng đắn và không cần kiểm tra
Ví dụ:
PO.INP
1  1
a+(a+(a+(a+(a+(a+(a+a)))))) 
(((a+(b+(c+d)))*e)*f)
 (((((a*b)*c)*d)+e)+(f*g))
file kết quả
PO.OUT
7
((a+a)+(a+a))+((a+a)+(a+a)) 
3
5
(e*f)*((a+b)+(c+d)) 
3
5
((a*b)*(c*d))+(e+(f*g)) 
3