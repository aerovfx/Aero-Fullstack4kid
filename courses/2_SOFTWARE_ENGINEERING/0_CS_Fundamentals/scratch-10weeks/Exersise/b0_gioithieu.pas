Cấu tạo của một chương trình trong Pascal.

Phần chính của mọi chương trình Pascal là khối lệnh (main). Một khối lệnh bắt đầu bằng từ khoá Begin và kết thúc bằng End. Trước chương trình chính sẽ là các khai báo thư viện, biến, thủ tục, hàm,... Các câu lệnh trong Pascal được ngăn cách bằng dấu chấm phẩy (";"). Câu lệnh cuối cùng của một khối lệnh có thể giản lược đi một dấu chấm phẩy. Cuối chương trình luôn có một dấu chấm sau end (end.).

begin
    writeln('Hello World');
end.
Pascal, nguyên thể đơn thuần là ngôn ngữ lập trình thủ tục với một loạt các từ khóa chuẩn if, while, for, và các thành phần khác. Pascal là một ngôn ngữ hỗ trợ cả lập trình có cấu trúc lẫn lập trình hướng đối tượng. Hướng đối tượng bắt đầu được đưa vào Turbo Pascal ở phiên bản 5.5. Free Pascal cũng đưa hướng đối tượng vào từ rất sớm.

while a <> b do WriteLn('Xin chao');
 
if a > b then
    writeln('Thoa man dieu kien')
else
    writeln('Khong thoa man dieu kien');
 
for i:= 1 to 10 do writeln('La(.p: ', i:1);
 
repeat a:= a + 1 until a = 10;
Pascal cấu trúc các chương trình thành các thủ tục và hàm.

program mine(output);
 
    procedure print(var i: integer);
 
        function next(i: integer): integer;
        begin
            next:= i + 1
        end;
 
    begin
        writeln('Tong la: ', i);
        i:= next(i)
    end;
 
begin
    i:= 1;
    while i <= 10 do print(i)
end.
Các thủ tục và hàm có thể lồng vào nhau theo nhiều cấp, và từ program là khối cấu trúc ngoài cùng nhất. Trước mỗi khối là phần khai báo. Ta có thể khai báo các hằng, các biến, các kiểu, hoặc các nhãn. Các từ khoá var (biến), type (kiểu), const (hằng), label (nhãn) được đặt trước các khai báo có cùng thể loại. Chú thích của Pascal được đặt trong ngoặc nhọn, ví dụ { comment }, hoặc là ngoặc đơn với sao, ví dụ (* comment *), trong Free Pascal, kí hiệu // chỉ ra rằng các kí tự sau đó (ở cùng dòng với nó) là chú thích, ví dụ // comment. Chú thích không ảnh hưởng đến các lệnh của chương trình. Mọi chú thích sẽ tự động bỏ qua trong tiến trình dịch.

  { đây là chú thích }
  begin
    writeln('Viet Nam');
  end.

  Kiểu dữ liệu
Pascal gồm các kiểu đơn lẻ như integer, char, boolean, kiểu đoạn con,... Ngoài ra còn kiểu cấu trúc như array, string, record, object, class,... Cuối cùng là kiểu số thực: real.

Các kiểu số nguyên
Tên kiểu	Khoảng cách	Dung lượng theo bytes
Byte	0.. 255	1
Shortint	-128.. 127	1
Smallint	-32768.. 32767	2
Word	0.. 65535	2
Integer	-32768.. 32767	2 [1]
Longint	-2147483648.. 2147483647	4
Longword	0.. 4294967295	4
int64	-9223372036854775808.. 9223372036854775807	8 [2]
QWord	0.. 18446744073709551615	8 [3]
Cardinal,
Dword

Tương đương với longword	
Các kiểu số thực
Tên kiểu	Khoảng cách	Số chữ số có nghĩa	Dung lượng theo bytes
Real	2,9x10^-38...1,7x10^38	Không rõ	8
Single	1,5*10−45.. 3,4*1038	7-8	4
Double	5,0*10−324.. 1,7*10308	15-16	8
Extended	1,9*10−4932.. 1,1*104932	19-20	10
Comp	-2*1064+1.. 2*1063-1	19-20	8
Currency	-922337203685477.5808.. 922337203685477.5807	19-20	8
Kiểu chữ
Tất cả các kiểu chữ đều có thể lưu được các kí tự trong bảng mã ASCII

Tên	Số kí tự lưu được	Dung lượng theo bytes
Char	1	1
Widechar	 ?	2
String	255	 ?
Shortstring	Tương tự String (255)	 ?
Ansistring	Tùy thuộc vào bộ nhớ (càng nhiều bộ nhớ thì lưu được càng nhiều)	 ?