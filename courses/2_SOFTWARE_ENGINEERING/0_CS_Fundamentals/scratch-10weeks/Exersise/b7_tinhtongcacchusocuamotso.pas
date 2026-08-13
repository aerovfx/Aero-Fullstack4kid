{Bài 7: Tỉnh tổng các chữ số của một số
Nhập số bất kỳ có 3 chữ số rồi tính tổng các chữ số của số đó.}

uses crt;
var a:integer;tong:byte;
BEGIN
 clrscr;
 write('Nhap 1 so co 3 chu so: ');readln(a);
 tong:= a mod 10;
 a:=a div 10;
 tong:=tong+a mod 10;
 a:=a div 10;
 tong:=tong+a mod 10;
 writeln('Tong cac chu so do la: ',tong);
 readln
END.