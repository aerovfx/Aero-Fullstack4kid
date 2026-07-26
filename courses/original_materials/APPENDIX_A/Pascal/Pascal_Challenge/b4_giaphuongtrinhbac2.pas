{Bài 4: Giải phương trình bậc 2
Viết chương trình để giải phương trình bậc 2.}

uses crt;
var a,b,c,x1,x2,d:real;
BEGIN
 clrscr;
 write('Nhap a: ');readln(a);
 write('Nhap b: ');readln(b);
 write('Nhap c: ');readln(c);
 d:=b*b-4*a*c;
 if d>0 then
  begin
   x1:=(-b+sqrt(d))/(2*a);
   x2:=(-b-sqrt(d))/(2*a);
   writeln('2 nghiem PT la: ',x1:0:2,' va: ',x2:0:2);
  end
 else if d=0 then
  begin
   x1:=(-b)/(2*a);
   writeln('PT co nghiem kep la: ',x1:0:2);
  end
 else writeln('PT vo nghiem');
 readln
END.