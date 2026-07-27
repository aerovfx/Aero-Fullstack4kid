1. CÁC BƯỚC <br>
Importing the module – tkinter <br>
Create the main window (container) <br>
Add any number of widgets to the main window <br>
Apply the event Trigger on the widgets. <br>

Màu của nút lấy ở trang sau, color code. <br>
https://htmlcolorcodes.com <br>

2. QUÁ TRÌNH THỰC HIỆN CHI TIẾT <br>
Đoạn mã bắt đầu bằng việc nhập các module cần thiết. <br>
Module tkinter cung cấp tất cả các chức năng cơ bản để tạo giao diện người dùng đồ họa.<br>
Tiếp theo, chúng ta tạo một biến toàn cục có tên là "expression" sẽ lưu trữ kết quả của phép tính.<br>
Chúng ta cũng tạo hai hàm để cập nhật và đánh giá biểu thức.<br>
Cuối cùng, chúng ta viết mã lái để khởi tạo và quản lý cửa sổ GUI của chúng ta.<br>
Để tạo một máy tính đơn giản, chúng ta cần định nghĩa một biến biểu thức.<br>
Điều này được thực hiện bằng cách sử dụng từ khóa toàn cục và gán cho nó giá trị chuỗi trống ( "" ).<br>
Tiếp theo, chúng ta tạo hai hàm để cập nhật và đánh giá biểu thức.<br>
Hàm "press" cập nhật nội dung của hộp nhập văn bản trong khi hàm "equalpress" đánh giá kết quả cuối cùng của phép tính.<br>
Tiếp theo, chúng ta cần tạo một cấu trúc giống như bảng trong đó các widget của chúng ta sẽ được đặt.<br>
Chúng ta làm điều này bằng cách sử dụng phương thức "grid" có ba đối số: "columnspan", "ipadx" và "rowspan".<br>
Những tham số này chỉ định số cột rộng, số hàng cao và số cột trên mỗi hàng mà sẽ được sử dụng trong bố cục bảng của chúng ta.<br>
Chúng ta đặt "columnspan" thành 4, có nghĩa là sẽ có bốn cột trong bảng của chúng ta, độ rộng iPad chia đôi (70), nhân với 1 cho mỗi hàng trong bảng của chúng ta (chiều cao iPad chia).<br>
Đoạn mã tạo ra một máy tính đơn giản bằng module Tkinter.<br>
Đầu tiên, đoạn mã nhập tất cả mọi thứ từ module Tkinter.<br>
Tiếp theo, đoạn mã tạo hai biến toàn cục: "expression" và "total".<br>
Hàm "press()" được sử dụng để cập nhật biến "expression" trong hộp nhập văn bản.<br>
Hàm "equalpress()" được sử dụng để đánh giá biểu thức cuối cùng.<br>
Cuối cùng, hàm "clear()" được sử dụng để xóa nội dung của hộp nhập văn bản.<br>

Tiếp theo, chúng ta cần tạo ra một số nút bấm để thực hiện các phép tính toán cơ bản. Trong ví dụ này, chúng ta sẽ tạo ra 7 nút bấm: số từ 1 đến 6 và một nút bấm dấu bằng để tính toán kết quả.<br>

Mỗi nút bấm được tạo bằng đối tượng Button và có thuộc tính cho văn bản, phông chữ, màu nền và lệnh được gán cho nó. Lệnh này sẽ được thực thi khi người dùng nhấp vào nút tương ứng.<br>

Chúng ta sử dụng phương thức grid để định vị các nút bấm trong bảng của chúng ta. Đối với mỗi nút bấm, chúng ta chỉ định hàng và cột trong bảng sử dụng đối số row và column.<br>

Sau đó, chúng ta thêm các nút bấm vào bảng và sử dụng phương thức pack để hiển thị bảng trong cửa sổ.<br>

Cuối cùng, chúng ta sử dụng phương thức mainloop để duy trì hiển thị cửa sổ GUI và chờ đợi các sự kiện người dùng. Khi người dùng thực hiện một hành động, ví dụ như nhấp vào một nút bấm, phương thức liên quan đến hành động đó sẽ được thực thi.<br>
