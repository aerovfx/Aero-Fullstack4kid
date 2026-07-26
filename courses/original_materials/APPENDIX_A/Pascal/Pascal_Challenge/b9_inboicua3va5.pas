{Bài 9: In các bội của 3 và 5
Nhập số nguyên dương n, in ra tổng các số nguyên dương từ 1 đến n là bội của 3 hoặc 5.}
uses crt;
var n,tong,i:integer;
BEGIN
 clrscr;
 write('Nhap so nguyen duong n: ');readln(n);
 tong:=0;
 for i:=1 to n do
  if (i mod 3=0) or (i mod 5=0) then
   tong:=tong+i;
 writeln('Tong cac so chia het cho 3 hoac 5 tu 0--> ',n,' la: ',tong);
 readln
END.