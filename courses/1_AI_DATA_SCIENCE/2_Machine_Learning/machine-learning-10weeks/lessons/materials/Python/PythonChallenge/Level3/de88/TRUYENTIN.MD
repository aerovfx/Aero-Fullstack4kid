Trong một mạng gồm n máy tính đánh số từ 1 đến N. Sơ đồ nối mạng đựơc cho bởi hệ thống gồm M kênh nối trực tiếp giữa một số cặp máy tính trong mạng. Biết chi phí truyền một đơn vị thông tin theo mỗi kênh nối của mạng. 
Người ta cần chuyển một bức thông điệp từ máy S đến T. Để đảm bảo an toàn, người ta muốn chuyển bức thông điệp này theo K đường truyền tin khác nhau. Hai đường truyền tin được gọi là khác nhau nếu không có bất cứ kênh nối trực tiêp nào được dùng chung trên cả hai đường truyền tin. Chi phí của một đường truyền tin được hiểu là chi phí trên các kênh của nó. 
Yêu cầu : Giả sử bức thông điệp có độ dài là 1 đơn vị thông tin, hãy tìm cách chuyển thông tin từ S đến T sao cho tổng chi phí chuyển thông tin (bằng tổng chi phí theo cả K đường truyền tin) là nhỏ nhất. 

Dữ liệu: Vào từ file văn bản Ttin.INP: 
- Dòng đầu tiên ghi năm số N,M,S,T,K cách nhau bởi dấu cách (N≤100). 
- M dòng sau mỗi dòng ghi ba số di, ci, gi: trong đó di, ci là chỉ số của hai máy tương ứng có kênh nỗi và gi (nguyên dương) là chi phí để truyền một đơn vị thông tin từ máy di đến máy ci và ngựơc lại (i=1..n). 

Kết quả: Ghi ra file văn bản TTIN.OUT: 
- Dòng đầu tiên ghi chi phí truyền thông điệp theo cách tìm đựơc 
- K dòng tiếp theo, mỗi dòng ghi đường truyền tin dưới dạng dãy có thứ tự các máy bắt đầu từ máy S và kết thúc ở máy T. 
- Nếu không tìm đủ K đường đưa ra một dòng duy nhất: NO SOLUTION. 

Ví dụ:
-------------------------------------------
| TUYENTIN.INP        | TUYENTIN.OUT      | 
| 5 7 1 5 2           | 24                |   
| 1 2 3               | 1 2 3 5           |   
| 1 4 8               | 1 4 5             |   
| 2 3 5               |                   |   
| 2 4 4               |                   | 
| 3 5 5               |                   | 
| 4 3 8               |                   | 
| 4 5 3               |                   | 
|                     |                   |  
------------------------------------------
