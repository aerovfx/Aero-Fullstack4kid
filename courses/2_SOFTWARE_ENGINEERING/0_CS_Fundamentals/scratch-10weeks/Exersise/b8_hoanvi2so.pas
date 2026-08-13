{Bài 8: Hoán vị 2 số
Nhập 2 số nguyên a, b, hoán vị 2 số khi a>b.}

uses crt;
var a,b,tg:integer;
BEGIN
 clrscr;
 write('Nhap a: ');readln(a);
 write('Nhap b: ');readln(b);
 if a>b then
  begin
   tg:=a;
   a:=b;
   b:=tg;
  end;
 writeln(a,' ',b);
 readln
END.