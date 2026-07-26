{Bài 11: Kiểm tra số nguyên tố
Nhập vào một số n bất kỳ và kiểm tra xem n có phải là số nguyên tố không.}

uses crt;
var n,i:integer;
BEGIN
 clrscr;
 write('Nhap so nguyen duong n: ');
 readln(n);
 if n<2 then writeln(n,' khong la so nguyen to')
 else
  begin
   i:=2;
   while ((i<=trunc(sqrt(n))) and (n mod i<>0)) do
    i:=i+1;
   if i>trunc(sqrt(n)) then writeln(n,' la so nguyen to')
    else writeln(n,' khong la so nguyen to');
   end;
 readln
END.