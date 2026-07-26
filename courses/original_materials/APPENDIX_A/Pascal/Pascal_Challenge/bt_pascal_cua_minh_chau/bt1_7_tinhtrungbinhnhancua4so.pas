{bt1.7_tinh trung binh nhan cua 4 so chi duoc dung 2 bien s va a}
uses crt;
var s,a:real;
begin
clrscr;
s:=1;
write('nhap vao so thu nhat ');readln(a);
s:=s*a;
write('nhap vao so thu hai ');readln(a);
s:=s*a;
write('nhap vao so thu ba ');readln(a);
s:=s*a;
write('nhap vao so thu bon ');readln(a);
s:=s*a;
writeln('trung binh nhan cua 4 so la ',sqrt(s));
readln;
end.

