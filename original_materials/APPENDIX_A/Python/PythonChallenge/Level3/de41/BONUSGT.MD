Dựa vào dữ liệu trên, ta có các bước thực hiện như sau:<br/>
1. Đọc dữ liệu từ file "BONUS.INP". <br/>
2. Khởi tạo ma trận dp với kích thước (m+1) x (n+1) và giá trị ban đầu là 0.<br/>
3. Duyệt qua từng ô của ma trận dp:<br/>
   4. Duyệt qua từng hàng và cột của ma trận dp (từ 1 đến m và từ 1 đến n):<br/>
      5. Khởi tạo biến total = 0. <br/>
      6. Duyệt qua các hàng và cột của bảng con kích thước wxh, có gốc tại ô (i, j): <br/>
         7. Kiểm tra xem hàng và cột nằm trong phạm vi của ma trận ban đầu (x <= m và y <= n).<br/>
         8. Tính tổng giá trị của các ô trong bảng con và cập nhật vào biến total.<br/>
      9. Cập nhật giá trị tối đa cho ô (i, j) trong ma trận dp.<br/>
10. Lấy giá trị tại ô cuối cùng dp[m][n] là kết quả tổng giá trị lớn nhất mà An có thể nhận được.<br/>
11. Ghi kết quả vào file "BONUS.OUT".<br/>


Khởi tạo ma trận dp với kích thước (m+1)x(n+1) và giá trị ban đầu là 0:<br/>

dp = [<br/>
  [0, 0, 0, 0, 0],<br/>
  [0, 0, 0, 0, 0],<br/>
  [0, 0, 0, 0, 0],<br/>
  [0, 0, 0, 0, 0]<br/>
]<br/>
Duyệt qua từng ô của ma trận dp:<br/>
Với i = 1 và j = 1:<br/>
Tính tổng giá trị của bảng con kích thước 2x2, có gốc tại ô (1, 1):<br/>
total = a[0] + b[0] + a[1] + b[1] = 1 + 1 + (-1) + 1 = 2<br/>
Cập nhật giá trị tối đa cho ô (1, 1):<br/>
dp[1][1] = max(dp[1][0], dp[0][1], dp[0][0] + total) = max(0, 0, 0 + 2) = 2<br/>
Tiếp tục duyệt qua các ô còn lại trong ma trận dp và thực hiện các bước tương tự.<br/>
Kết quả cuối cùng sẽ là giá trị tại ô cuối cùng dp[m][n]:<br/>

Với i = 3 và j = 4:<br/>

result = dp[3][4] = 6<br/>
Vậy, với các giá trị cụ thể của vòng lặp i và j trong ví dụ này, kết quả là 6.<br/>
