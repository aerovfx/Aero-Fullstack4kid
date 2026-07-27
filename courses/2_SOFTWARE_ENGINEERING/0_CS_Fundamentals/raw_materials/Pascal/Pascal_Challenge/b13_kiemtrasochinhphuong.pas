{Bài 13: Kiểm tra số chính phương
Nhập một số nguyên dương n bất kỳ và kiểm tra xem n có phải là số chính phương không.}

uses crt;
var n:longint;
BEGIN
 clrscr;
 write('Nhap so nguyen duong n: ');readln(n);
 if sqrt(n)=trunc(sqrt(n)) then writeln(n,' la so chinh phuong')
  else writeln(n,' khong la so chinh phuong');
 readln
END.