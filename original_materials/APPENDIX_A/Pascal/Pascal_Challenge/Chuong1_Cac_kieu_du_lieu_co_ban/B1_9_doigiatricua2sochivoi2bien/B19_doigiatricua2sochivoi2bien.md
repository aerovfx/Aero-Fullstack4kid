Bài tập 1.9

            Giải bài tập 1.8 mà chỉ được sử dụng hai biến (Tức không được dùng thêm biến tạm).

Hướng dẫn:
– Cộng thêm b vào a. (Giá trị hai biến sau lệnh này là: a+b, b)

– Gán b bằng tổng trừ đi b (Sau lệnh này b có giá trị bằng a);

– Gán giá trị a bằng tổng trừ đi b mới (Sau lệnh này a có giá trị bằng b).

Mã chương trình:
Program Doi_Gia_Tri;

uses crt;

var a, b:real;

Begin

    clrscr;

    write(‘nhap a: ‘); readln(a);

    write(‘nhap b: ‘); readln(b);

    writeln(‘Truoc khi doi a =’,a,’ va b= ‘,b);

    readln;

    a:=a+b;

    b:=a-b;

    a:=a-b;

    writeln(‘Sau khi doi a =’,a,’ va b= ‘,b);

    readln

end.

 

Nhận xét:Giống sang dầu giữa hai bình nhưng không giống hoàn toàn!!!Kỹ thuật đổi giá trị biến cho nhau sẽ được sử dụng nhiều trong phần sắp xếp.