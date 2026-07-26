Bài tập 1.1:

            Viết chương trình tính chu vi và diện tích của hình chữ nhật có chiều dài hai cạnh là a, b (được nhập từ bàn phím).

Hướng dẫn:
– Nhập hai cạnh vào hai biến a, b.

– Chu vi hình chữ nhật bằng 2*(a+b); Diện tích hình chữ nhật bằng a*b.

Mã chương trình:
 

Program Chu_nhat;

uses crt;

Var a, b, S, CV: real;

Begin

     Write(‘Nhap chieu dai:’); readln(a);

     Write(‘Nhap chieu rong:’); readln(b);

     S := a*b;

     CV := (a+b)*2;

     Writeln(‘Dien tich hinh chu nhat la:’,S);

     Writeln(‘Chu vi hinh chu nhat la:’,CV:10:2);

     readln

end.

 

Nhận xét: Lệnh write cho phép in ra màn hình một hoặc nhiều mục. Có thể định dạng được số in ra bằng cách qui định khoảng dành cho phần nguyên, khoảng dành cho phần thập phân.