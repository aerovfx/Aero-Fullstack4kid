"Use strict" được sử dụng để bật chế độ nghiêm ngặt (strict mode) trong JavaScript. Khi chỉ thị này được thêm vào đầu tệp JavaScript hoặc trong một hàm, nó yêu cầu trình duyệt hoặc trình thông dịch JavaScript thực thi mã trong chế độ nghiêm ngặt. <br/>
Chế độ nghiêm ngặt áp dụng các quy tắc nghiêm ngặt hơn và kích hoạt các kiểm tra thời gian chạy JavaScript bổ sung, giúp xử lý lỗi tốt hơn và ngăn ngừa một số hành vi gây khó khăn.<br/>

CODE: <br/>
"use strict";<br/>

// Chế độ nghiêm ngặt được bật cho đoạn mã dưới đây<br/>
function lamDieuGiDo() {<br/>
  // ...<br/>
}<br/>

Trong chế độ nghiêm ngặt, mã JavaScript được thực thi với những thay đổi sau:<br/>

Các biến phải được khai báo trước khi sử dụng. Điều này ngăn ngừa việc tạo ra các biến toàn cục một cách không cố ý.<br/>
Gán giá trị cho biến chưa được khai báo hoặc gán giá trị cho thuộc tính chỉ đọc sẽ gây ra lỗi.<br/>
Số hệ cơ số tám (ví dụ: 0123) không được phép. Các số hệ cơ số tám sẽ được coi là lỗi cú pháp.<br/>
Xóa biến, hàm hoặc tham số hàm không được phép.<br/>
Giá trị "this" trong các hàm không phải là phương thức hoặc hàm tạo sẽ là undefined, thay vì tham chiếu đến đối tượng toàn cục.<br/>
Tên tham số trùng lặp trong khai báo hàm không được phép.<br/>
Việc sử dụng hàm "eval" để tạo ra biến hoặc hàm không được phép.<br/>
Sử dụng chế độ nghiêm ngặt được coi là một phương pháp tốt để phát hiện lỗi và ngăn ngừa các hành vi mã tiềm ẩn vấn đề. Nó khuyến khích việc sử dụng các phong cách mã sạch hơn và an toàn hơn, dẫn đến mã JavaScript mạnh mẽ và dễ bảo trì hơn.<br/>

Chế độ nghiêm ngặt (Strict Mode) trong JavaScript - Tăng cường an toàn và độ chính xác của mã lập trình <br/>

Chào mọi người! Trong video này, chúng ta sẽ tìm hiểu về chế độ nghiêm ngặt (Strict Mode) trong JavaScript và tại sao nó là một công cụ hữu ích để tăng cường an toàn và độ chính xác của mã lập trình. Chế độ nghiêm ngặt yêu cầu mã JavaScript tuân thủ các quy tắc nghiêm ngặt hơn và áp dụng các kiểm tra thời gian chạy để phát hiện và ngăn chặn các lỗi phổ biến.<br/>

Giới thiệu về chế độ nghiêm ngặt:<br/>
Chế độ nghiêm ngặt (Strict Mode) là một tính năng của JavaScript cho phép chúng ta thực thi mã lập trình trong một môi trường chặt chẽ hơn. Khi chế độ nghiêm ngặt được kích hoạt, các quy tắc nghiêm ngặt hơn sẽ áp dụng và các lỗi phổ biến sẽ được phát hiện và báo cáo.<br/>
Cách kích hoạt chế độ nghiêm ngặt:<br/>
Để kích hoạt chế độ nghiêm ngặt, chúng ta thêm chỉ thị "use strict" ở đầu tệp JavaScript hoặc trong một hàm. Điều này cho biết trình duyệt hoặc trình thông dịch JavaScript rằng mã lập trình cần được thực thi theo quy tắc nghiêm ngặt.<br/>

Lợi ích của chế độ nghiêm ngặt:<br/>
Phát hiện lỗi sớm hơn: Chế độ nghiêm ngặt giúp phát hiện các lỗi như việc sử dụng biến chưa được khai báo, gán giá trị cho thuộc tính chỉ đọc, xóa biến và nhiều hơn nữa. Điều này giúp chúng ta tìm ra lỗi ngay từ thời điểm phát triển, tránh các vấn đề tiềm ẩn trong mã lập trình. <br/>
Ngăn chặn hành vi không an toàn: Chế độ nghiêm ngặt giới hạn một số hành vi không an toàn trong JavaScript như sử dụng biến toàn cục không được khai báo và sử dụng "this" trong các hàm không phải là phương thức hoặc hàm tạo. Điều này giúp ngăn chặn các lỗi logic và tăng cường an toàn của ứng dụng.<br/>
Khắc phục các tính năng quá cũ: Chế độ nghiêm ngặt loại bỏ một số tính năng quá cũ và không an toàn của JavaScript như sử dụng số hệ cơ số tám và việc tạo biến bằng cách sử dụng hàm "eval". Điều này giúp đảm bảo rằng mã lập trình sử dụng các phong cách hiện đại và an toàn hơn.<br/>

