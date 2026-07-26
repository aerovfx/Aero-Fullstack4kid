{Bài 6: Tính ăn bậc n của một số
Nhập 2 số n, a. Hãy tính căn bậc n của a:}
uses crt;
var n:integer; a,s:real;
BEGIN
 clrscr;
 write('Nhap a: ');readln(a);
 repeat
 write('Nhap n: ');readln(n);
 until (n>0);
 if (n mod 2=0) and (a>=0) then
  begin
   s:=exp(1/n*ln(a));
   writeln('Ket qua la: ',s:0:4);
  end
 else if (n mod 2<>0) then
  begin
   s:=exp(1/n*ln(abs(a)));
   writeln('Ket qua la: ',s:0:4);
  end
 else writeln('Khong xac dinh');
 readln
END.
