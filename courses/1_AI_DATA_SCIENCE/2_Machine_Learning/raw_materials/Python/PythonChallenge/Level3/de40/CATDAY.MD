Đề thành phố Đà Năng năm 2021
Tý muốn cắt một sợi dây có chiều dài N (mét) thành 3 đoạn dây có chiều dài mỗi đoạn là số nguyên dương (đơn vị mét) sao cho 3 đoạn dây này là 3 cạnh của một tam giac cân có cạnh đáy lớn hơn cạnh bện
Lưu ý: Tam giác cân là tam giác có hai cạnh bằng nhau, hai cạnh bằng nhau gọi là hai cạnh bên, cạnh còn lại là cạnh đáy.
Yêu cầu: Em hãy giúp Tý tính có bao nhiêu cách cắt đoạn dây này.
Dữ liệu vào: Đọc từ file văn bản CATDAY.INP số nguyên dương N
Dữ liệu ra: Ghi ra file văn bản CATDAY.OUT số M là số cách cắt dây theo yêu cầu
Ví dụ:
-----------------------------------------------
| CATDAY.INP              | CATDAY.OUT        |
| 19                      | 2                 |
|                         |                   |
|                         |                   |
-----------------------------------------------
Giải thích:
Có 2 cách cắt sợi dây thành 3 đoạn thoả mãn đề là: (5m, 5m, 9m) và (6m, 6m , 7m)
Lưu ý:
Các cách cắt sợi dây thành 3 đoạn (x mét, x mét, y mét) và các hoán vị của bộ 3 số (x, x, y) chỉ được tính là 1 cách cắt. Chẳng hạn: Cách cắt thành các đoạn (5,5,9) và các hoán vị của nó là (5,9,5) hoặc (9,5,5) chỉ được tính là 1 cách cắt.
Chiều dài đáy phải lớn hơn cạnh bên và tổng 2 cạnh bên phải lớn hơn dáy.

Giải thuật:

Đọc giá trị N từ file văn bản CATDAY.INP.
Tạo biến count và gán giá trị ban đầu là 0.
Duyệt giá trị của x từ 1 đến N/2.
Tính giá trị của y = N - 2 * x.
Kiểm tra điều kiện: x + x > y và y > x.
Nếu điều kiện đúng, tăng biến count lên 1.
Ghi giá trị của count vào file văn bản CATDAY.OUT.

Mã giả:
Đọc giá trị N từ file văn bản CATDAY.INP
Tạo biến count và gán giá trị ban đầu là 0

Với x chạy từ 1 đến N/2:
    Tính giá trị y = N - 2 * x
    Kiểm tra điều kiện: x + x > y và y > x
    Nếu điều kiện đúng, tăng biến count lên 1

Ghi giá trị của count vào file văn bản CATDAY.OUT

Bước 1: Soạn đề
Bước 2: Đọc hiểu kết qủa 19 và 2, ý nghĩa của nó
Bước 3: Load dữ liệu 19 từ file
Bước 4: Lập hàm tính toán
Bước 5: gọi hàm gán cho biến result
Bước 6: Ghi result ra file
-----
Mở rộng, tạo file v2
Bước 7: In ra kết quả x và y

Mở rộng, tạo file v3
Bước 8: Tạo nhiều dữ liệu đầu vào
19
17
25
49
4
Ghi kết quả tương ứng nhiều dòng