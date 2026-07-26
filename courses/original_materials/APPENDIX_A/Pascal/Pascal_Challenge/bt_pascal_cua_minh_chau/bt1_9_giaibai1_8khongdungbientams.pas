{bt1.9_giai bai 1.8 nhung khong dung bien tam s}
uses crt;
var a,b:real;
begin
clrscr;
write('nhap vao gia tri a ');readln(a);
write('nhap vao gia tri b ');readln(b);
writeln('gia tri a la ',a,'gia tri b la ',b);
writeln('minh bat dau doi ');
a:=a+b;
b:=a-b;

a:=a-b;

writeln('gia tri cua a la ',a ,'gia tri b la ',b);
readln;
end.