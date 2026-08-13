{bt1.6_tinh trung binh cong 4 so chi duoc dung 2 bien}
uses crt;
var s,a:real;
begin
clrscr;
s:=0;
write('nhap so thu nhat ');readln(a);
s:=s+a;
write('nhap so thu hai ');readln(a);
s:=s+a;
write('nhap so thu ba ');readln(a);
s:=s+a;
write('nhap so thu bon ');readln(a);
s:=s+a;
writeln('trung binh cong cua 4 so la ',s/4);
readln;
end.