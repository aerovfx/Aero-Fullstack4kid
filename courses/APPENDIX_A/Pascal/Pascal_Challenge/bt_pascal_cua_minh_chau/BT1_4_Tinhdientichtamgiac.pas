{bt1_4 tinh dien tich hinh tam giac}
uses crt;
var a,b,c,p:real;
begin
clrscr;
write('nhap vao canh a ');readln(a);
write('nhap vao canh b ');readln(b);
write('nhap vao canh c ');readln(c);
write('nhap vao canh p ');readln(p);
p:=(a+b+c)/2;
writeln('nua chu vi cua tam giac la ',p);
writeln('dien tich cua hinh tam giac la ',sqrt(p*(p-a)*(p-b)*(p-c)));
readln;
end.