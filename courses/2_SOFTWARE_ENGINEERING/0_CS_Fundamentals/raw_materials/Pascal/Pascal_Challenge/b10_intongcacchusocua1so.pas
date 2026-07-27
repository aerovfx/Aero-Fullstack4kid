{Bài 10: In tổng các chữ số của một số
Nhập n bất kỳ sau đó in ra tổng các chữ số của n.}

uses crt;
var n,m:longint;tong:byte;
BEGIN
 clrscr;
 write('Nhap n: ');readln(n);
 tong:=0;m:=n;
 while m>0 do
  begin
   tong:=tong+m mod 10;
   m:=m div 10;
  end;
 writeln('Tong cac chu so cua ',n,' la: ',tong);
 readln
END

