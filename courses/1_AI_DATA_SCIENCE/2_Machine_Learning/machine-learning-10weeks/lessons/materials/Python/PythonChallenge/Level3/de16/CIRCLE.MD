Viết chương trình nhập vào tọa độ tâm I(a;b) và bán kính r của một đường tròn (a, b, r là các số nguyên). Sau đó nhập vào một điểm A(x, y) bất kì và kiểm tra xem nó có thuộc đường tròn hay không?
Dữ liệu vào từ file CIRCLE.INP với 
Kết quả đầu ra là file LISTSUM.OUT là tổng của các phần tử của danh sách

Ví dụ:
-------------------------------------------------
| CIRCLE.INP       | CIRCLE.OUT                |
| 0 0 5            |                           |
| 3 3              | A(3,3) thuộc đường tròn.  |
| 2 4              | A(2,4) thuộc đường tròn.  |
| 1 1              | A(1,1) thuộc đường tròn.  |
| 9 1              | A(9,1) ko thuộc đường tròn|
------------------------------------------------


Hàm kiem_tra_thuoc_duong_tron nhận các tham số là tọa độ tâm a và b, bán kính r, và tọa độ điểm x và y. Nó tính toán khoảng cách từ điểm A đến tâm I của đường tròn sử dụng công thức khoảng cách Euclid và kiểm tra xem khoảng cách đó có nhỏ hơn hoặc bằng bán kính r hay không. Nếu có, nó trả về True, ngược lại trả về False.
Chương trình yêu cầu người dùng nhập tọa độ tâm I và bán kính r của đường tròn.
Tiếp theo, người dùng sẽ được yêu cầu nhập tọa độ điểm A.
Sau đó, chương trình gọi hàm kiem_tra_thuoc_duong_tron để kiểm tra xem điểm A có thuộc đường tròn hay không.
Cuối cùng, chương trình in ra thông báo tương ứng với kết quả kiểm tra.
Kết quả sẽ hiển thị nếu điểm A thuộc đường tròn hoặc không thuộc đường tròn.