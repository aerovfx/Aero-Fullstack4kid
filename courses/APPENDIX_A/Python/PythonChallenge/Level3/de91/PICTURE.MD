Cho n bức tranh mã số từ 1..n (n ≤ 50). Người ta cần chọn ra một bức để đặt ở cửa phòng tranh, số còn lại được treo thẳng hàng trong phòng trên m vị trí định sẵn có mã số 1..m từ trái qua phải. Các bức tranh phải được treo theo trật tự nghiêm ngặt sau đây: tranh có số hiệu nhỏ phải treo ở trên tranh có số hiệu lớn. 
Biết các thông tin sau về mỗi bức tranh: 
- Tranh thứ i treo tại cửa sẽ đạt trị thẩm mỹ c[i]; 
- Tranh thứ i treo tại vị trí j sẽ đạt trị thẩm mỹ v[i,j]. 
- m+1≥n. 
- Các giá trị thẩm mỹ là những số tự nhiên không vượt quá 50. 
Yêu cầu: Hãy xác định một phương án treo tranh để có tổng trị thẩm mỹ là lớn nhất. 
Dữ liệu vào: Tệp văn bản ′ PICTURE.INP ′ 
- Dòng thứ nhất ghi n, m (cách nhau 1 dấu cách) 
- Dòng tiếp theo là n giá trị c. 
- Tiếp đến là n dòng, dòng i gồm m vị trí v[i,1], v[i,2],..v[i,m]. 
Dữ liệu ra: Tệp văn bản ′ PICTURE.OUT′ 
- Dòng thứ nhất ghi giá trị thẩm mỹ lớn nhất tìm được 
- Dòng thứ hai: ghi mã số hiệu bức tranh treo ở cửa phòng tranh. 
- Dòng thứ 3 ghi n-1 số tự nhiên sắp tăng chặt cho biết mã số các vị trí được chọn để treo tranh 
Ví dụ:
-------------------------------------------
| PICTURE.INP         | PICTURE.OUT       | 
| 3 4                 | 40                |   
| 1 20 1              | 2                 |   
| 1 10 1 3            | 2 4               |   
| 2 1 2 2             |                   |   
| 1 3 0 10            |                   | 
------------------------------------------
Để giải bài toán này, chúng ta có thể sử dụng thuật toán Quy hoạch động