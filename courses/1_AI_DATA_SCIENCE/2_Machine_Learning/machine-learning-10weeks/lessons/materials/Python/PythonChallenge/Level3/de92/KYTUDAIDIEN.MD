Trong nhiều hệ điều hành người ta thường dùng ký tự đại diện * để thay thế cho một xâu ký tự bất kỳ (kể cả sâu rỗng) trong tên file. Ví dụ: *.PAS nghĩa là tên file bất kỳ có đuôi là PAS, A*B*C được hiểu là xâu ký tự bất kỳ bắt đầu bằng chữ A, kết thúc bằng chữ C và có chứa chữ B.
Một từ là một xâu ký tự không chứa dấu cách. Cho A và B là hai từ, ta nói A là đặc biệt hoá của B nếu A có thể nhận được từ B bằng cách thay mỗi ký tự * (nếu có) bằng một xâu ký tự thích hợp kể cả xâu rỗng hoặc xâu có chứa chính ký tự *. Khi đó ta cũng nói B là tổng quát hoá của A.
Hai từ nếu đã thừa nhận một từ là đặc biệt hoá chung thì cũng thừa nhận một từ đặc biệt hoá không chứa ký tự *. Hai từ bất kỳ bao giờ cũng thừa nhận một tổng quát hoá chung tầm thường là từ chỉ gồm 1 ký tự *. Một tổng quát hoá chung không tầm thường là một tổng quát hoá chứa ít nhất một ký tự khác với *. Ví dụ:
1. Từ AFX*18* và từ A*F*B cùng thừa nhận một đặc biệt hoá chung AFX18B. Hai từ này có tổng quát hoá chung không tầm thường, ví dụ: A*
2. Hai từ G3*R*P và từ G*1 sẽ không có đặc biệt hoá chung mặc dù có tổng quát hoá chung không tầm thường, ví dụ: G*
3. Hai từ A*B và B*A không có cả đặc biệt hoá chung cũng như không có tổng quát hoá chung không tầm thường.
Yêu cầu:
Cho N cặp từ bất kỳ, với mỗi cặp từ đó hãy xác định một đặc biệt hoá chung không chứa ký tự * nào và một tổng quát hoá chung không tầm thường nếu có.
Dữ liệu vào: trong file văn bản có tên là GROUP.INP có cấu trúc như sau:
- Dòng đầu tiên là một số N cho biết số lượng cặp từ phải xử lý.
- Dòng thứ i trong N dòng tiếp theo sau chứa cặp từ phải xét thứ i, hai cặp từ này phân cách nhau bởi một dấu cách.
Kết quả: Kết quả ghi ra file văn bản có tên là GROUP.OUT có N dòng.
- Dòng thứ i sẽ chứa kết quả tương ứng với cặp thứ i. Mỗi dòng này cũng gồm hai từ cách nhau bởi một dấu cách. Từ thứ nhất là một đặc biệt hoá chung không chứa ký tự * nếu có. Trong trường hợp không có thì ghi ký tự *. Từ thứ hai là một tổng quát hoá chung không tầm thường nếu có. Trong trường hợp không có tổng quát hoá chng thì cũng ghi ký tự *.
Ví dụ:
-------------------------------------------
| GROUP.INP           | GROUP.OUT         | 
| 3                   | AFX!*B AF*        |   
| AFX*18*A*F*B        | *G*               |   
| G3*R*P G*1          | * *               |   
| A*B B*A             |                   |   
| 1 3 0 10            |                   | 
------------------------------------------