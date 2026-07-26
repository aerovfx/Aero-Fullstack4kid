Đề sơ khảo quốc gia 2020 <br/>
An là người thắng cuộc trong cuộc thi "TÌm hiểu Đoàn thanh niên Cộng sản Hồ Chí Mình" và được nhận phần thưởng của Ban tổ chức. Ban tổ chức chuẩn bị một bảng kích thước mxn. Các dòng của bảng được đánh số từ 1 đến m, từ trên xuống dưới, dòng i ( 1<= i <= m) có trọng số là a. Các cột của hàng được đánh số từ 1 đến n, từ trái qua phải, cột j (1 <= j <= n) có trọng số là b. Ô nằm trên giao của dòng i và cột j được gọi là ô (i,j) và trên ô đó ghi một số nguyên có giá trị a + b.<br/>
Để nhận phần thưởng, An được phép chọn một bảng con kích thức wxh chiếm trong wxh ô của bảng và phần thưởng mà An nhận được sẽ có giá trị bằng tổng giá trị các ô nằm trong bảng con đó.<br/>

Yêu cầu: Hãy xác định tổng giá trị lớn nhất mà An có thể nhân được.<br/>
Dữ liệu: vào từ file văn bản BONUS.INP<br/>
+Dòng thứ nhất chứa bốn số nguyên dược m,n,ư,h (w <= n, h <= n);<br/>
+Dòng thứ hai chứa m số nguyên a_1, a_2, ....,a_n (|a| <= 10^6, i = 1,2,3,...,m);<br/>
+Dòng thứ ba chứa n số nguyên b_1, b_2,.....,b_n (|b| <= 10^6, i = 1,2,3,...,n);<br/>

Kết qủa: Ghi ra file văn bản BONUS.OUT một số nguyên duy nhất là tổng giá trị lớn nhất mà An có thể nhận được.<br/>
Ràng buộc:<br/>
+Có 20% số test ứng với m, n <= 10 và w = h = 1;<br/>
+Có 30% số test khác ứng với m, n <= 10;<br/>
+Có 20% số test khác ứng với m, n <= 10^3;<br/>
+Có 30% số test còn lại có m, n <=10^5;<br/>

Ví dụ: <br/>
BONUS.INP <br/>
3 4 2 2 <br/>
1 -1 2 <br/>
1 1 1 1<br/>

BONUS.OUT<br/>
6 <br/>

Giải thích<br/>
Bảng ma trận có kích thước 3x4, trọng số của các hàng và các cột đươcj ghi trong ngoặc ở hàng và cột tương ứng. Cách chọn bảng con kích thước 2x3 là hình được tô màu và có tổng giá trị là 6.<br/>
2 2 2 2<br/>
0 0 0 0<br/>
3 3 3 3<br/>
Bảng con mà An chọn<br/>
0 0<br/>
3 3<br/>

Xem hình <br/>
<img width="627" alt="Screenshot 2023-07-14 at 19 11 48" src="https://github.com/aerovfx/Fullstack4kid/assets/109997053/39a2826e-b188-4f13-8abc-d6b7d5532b8f">

