{bt1.8_viet chuong trinh nhap vao 2 so hoan doi gia tri 2 so roi in ra}
uses crt;
var a,b,s:real;
begin
s:=0;
write('nhap vao gia tri a ');readln(a);
write('nhap vao gia tri b ');readln(b);
writeln('gia tri cua a la ',a ,'gia tri b la ',b);
s:=b;
b:=a;
a:=s;
writeln('gia tri cua a la ',a ,'gia tri b la ',b);
readln;
end.