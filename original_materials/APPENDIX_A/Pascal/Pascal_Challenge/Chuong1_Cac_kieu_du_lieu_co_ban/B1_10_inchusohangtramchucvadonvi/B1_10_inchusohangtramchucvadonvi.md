Bài tập 1.10:

            Viết chương trình cho biết chữ số hàng trăm, hàng chục, hàng đơn vị của một số có ba chữ số. Ví dụ khi nhập số 357 thì máy in ra:

– Chữ số hàng trăm: 3.

– Chữ số hàng chục: 5.

– Chữ số hàng đơn vị: 7.

Hướng dẫn:
            Sử dụng hàm mov để lấy số dư. Khi chia cho 10 để lấy số dư ta được chữ số hàng đơn vị. Sử dụng DIV để lấy phần nguyên. Khi chia cho 10 để lấy phần nguyên ta đã bỏ đi chữ số hàng đơn vị để số có ba chữ số còn số có hai chữ số.

Mã chương trình:
Program CHU_SO;

uses crt;

var n:integer;

begin

     clrscr;

     write(‘Nhap so n: ‘);readln(n);

     writeln(‘Chu so hang don vi: ‘,n mod 10);

     n:=n div 10;

     writeln(‘Chu so hang chuc: ‘,n mod 10);

     n:=n div 10;

     writeln(‘Chu so hang tram: ‘,n mod 10);

     readln

end.

 

Nhận xét:
            Hãy sửa chương trình để có kết quả là hàng trăm, hàng chục, hàng đơn vị.

Mã chương trình:

Program CHU_SO;

uses crt;

var n:integer;

begin

     clrscr;

     write(‘Nhap so n: ‘);readln(n);

     writeln(‘Chu so hang trm: ‘,n div 100);

     n:=n mov 100;

     writeln(‘Chu so hang chuc: ‘,n div 10);

     n:=n div 10;

     writeln(‘Chu so hang tram: ‘,n);

     readln

end.

 

 

 

 

