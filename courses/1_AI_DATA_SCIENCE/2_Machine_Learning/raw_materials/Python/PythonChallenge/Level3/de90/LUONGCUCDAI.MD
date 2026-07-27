I. Bài toán 
Xét bài toán: 

Trong đó aij thuộc {0,1} 
pi nguyên dương 
i = 1,2,...,m;
j = 1,2,...,n 
Bài toán trên là mô hình toán học của nhiều bài toán tối ưu tổ hợp trong thực tế. Ví dụ: 

II. Ví dụ 
1. Bài toán phân nhóm sinh hoạt: 
Có m sinh viên và n nhóm sinh hoạt chuyên đề.Với mỗi sinh viên i biết: 
- aij =1, nếu sinh viên i có nguyện vọng tham gia vào nhóm j 
- aij =0, nếu ngược lại 
- pi là số lượng nhóm chuyên đề mà sinh viên i phải tham dự 
i=1,2,...,m; j=1,2,...,n 
Trong số các cách phân các sinh viên vào nhóm chuyên đề mà họ có nguyện vọng tham gia và đảm bảo mỗi sinh viên i phải tham gia đúng pi nhóm, hãy tìm cách phân phối với số người trong nhóm có nhiều sinh viên tham gia nhất là nhỏ nhất có thể được. 
Đưa vào các biến số: 
xij =1, nếu sinh viên i tham gia vào nhóm j 
xij = 0, nếu ngược lại 
i=1, 2,...,m ; j=1, 2,...,n, khi đó dễ thấy mô hình toán học cho bài toán đặt ra chính là bài toán (1)-(2). 
2. Bài toán lập lịch cho hội nghị: 
Một hội nghị có m tiểu ban, mỗi tiểu ban cần sinh hoạt trong một ngày tại phòng họp phù hợp với nó. Có n phòng họp dành cho việc sinh hoạt của các tiểu ban. Biết: 
- aij =1, nếu phòng họp i là thích hợp với tiểu ban j 
- aij =0, nếu ngược lại 
i=1, 2,...,m, j=1, 2,...,n. Hãy bố trí các phòng họp cho các tiểu ban sao cho hội nghị kết thúc sau ít ngày làm việc nhất. 
Đưa vào các biến số : 
xij = 1, nếu bố trí tiểu ban i làm việc ở phòng j 
xij = 0, nếu ngược lại 
i=1, 2,...,m ; j=1, 2,...,n, khi đó dễ thấy mô hình toán học cho bài toán đặt ra chính là bài toán (1)-(2), 
trong đó pi =1, i=1, 2,...,m. 

III. Cơ sở thuật toán 
Bổ đề 1: 
Bài toán (1)-(2) có nghiệm tối ưu khi và chỉ khi: 
 
Chứng minh: 
Điều kiện cần là hiển nhiên vì sự tồn tại phương án của bài toán suy ra bất đẳng thức trong (3) được thực hiện ít nhất dưới dạng dấu đẳng thức. 
Điều kiện đủ: Chỉ cần chỉ ra rằng nếu có (3) thì luôn có phương án. 
Giả sử (3) đúng, gọi: 
 
Do (3) là điều kiện để (1)-(2) có nghiệm nên trong phần tiếp theo ta luôn giả thiết rằng điều kiện được thực hiên. 
Bây giờ ta chỉ ra rằng bài toán (1)-(2) có thể chuyển về giải một số hữu hạn bài toán luồng cực đại trong mạng. Trước hết với mỗi k nguyên dương ta xây dựng mạng G(k) = (V,E) với
 
e thuộc E: khả năng thông qua c(e) 
c(s,ui) = pi 
c(ui,vj) = aij 
c(vj,t) = k 
 

Bổ đề 2: Giả sử với k nào đó luồng cực đại trong mạng G(k) có giá trị Δ thì x* với x*ij = F (ui,vj) là phương án của bài toán (1)-(2) trong đó F (ui,vj) là luồng qua (ui,vj) 
Chứng minh: Thật vậy, do luồng cực đại trong mạng có giá trị Δ và là nguyên nên F(s,ui) = pi và F(ui,vj) thuộc {0,1} với i=1,2,...,m;j=1,2,...,n 
 
Vậy x* là phương án của bài toán (1)-(2) (đpcm). 
Bổ đề 3: 
Giả sử x* là phương án tối ưu và k* là giá trị tối ưu của bài toán (1)-(2) thì luồng cực đại trong G(k*) có giá trị Δ 
Chứng minh: Do giá trị của luồng cực đại trong mạng G(k*) không vượt qu Δ, nên để chứng minh bổ đề ta chỉ cần chỉ ra luồng với giá trị Δ trong mạng G(k*). 
Ta xây dựng luồng F như sau: 
 
Dễ dàng chứng minh F là luồng trong mạng G(m) có giá trị Δ.(đpcm) 
Bổ đề 4: 
Nếu k=m thì luồng cực đại trong mạng G(m) có giá trị Δ. 
Chứng minh: 
Lập luận tương tự bổ đề 3 ta chỉ cần chỉ ra luồng với giá trị Δ trong mạng G(m). 
Thật vậy, giả sử x* là nghiệm bài toán (1)-(2) được xây dựng theo công thức như bổ đề 1, xây dựng F theo bổ đề 3 ta có luồng giá trị Δ.(đpcm) 

IV. Thuật toán: 
Từ nhận xét 2 và 3 suy ra việc giải bài toán (1)-(2) là tìm k* nguyên dương nhỏ nhất sao cho luồng cực đại trong mạng G(k*) có giá trị Δ. Nhận xét 4 giới hạn giá trị k* thuộc [1,m]. 
Từ đây rút ra thuật toán: áp dụng phương pháp chia nhị phân trên đoạn [1,m] tìm k* trong mỗi bước giải bài toán tìm luồng cực đại trong. 
V. Chương trình 
Input: file văn bản INPUT.TXT 
- Dòng 1: Chứa 2 số m,n (m,n <= 100) 
- Dòng 2: Chứa n số nguyên p1,p2,..,pn 
- Trong m dòng tiếp theo mô tả mảng a 
 
Output: file văn bản OUTPUT.TXT 
- Dòng 1 chứa giá trị tối ưu tìm được 
- Các dòng sau mô tả mảng x 
 

VI. Độ phức tạp tính toán Bài toán (1)-(2) giải được nhờ thuật toán đa thức có độ phức tạp tính toán là O(log2m.OFN) trong đó OFN là độ phức tạp tính toán tìm luồng cực đại. 

