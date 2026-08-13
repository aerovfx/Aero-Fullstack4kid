{Bài 12: Kiểm tra số hoàn hảo
Nhập 1 số nguyên dương n và kiểm tra xem n có phải là số hoàn hảo không.

Lời giải:

Số hoàn hảo là số có tổng các ước (ngoại trừ nó) bằng chính nó. Ví dụ, số 6 có các ước là 1, 2, 3; số 28, 496 cũng là các số hoàn hảo.}
uses crt;
var n:longint;tong,i:integer;
BEGIN
 clrscr;
 write('Nhap so nguyen duong n: ');readln(n);
 tong:=0;
 for i:=1 to n div 2 do
  if n mod i=0 then tong:=tong+i;
 if tong=n then writeln(n,' la so hoan hao')
  else writeln(n,'khong la so hoan hao');
 readln
END.