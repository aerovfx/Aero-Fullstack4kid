{bt2.6_viet chuong trinh xet co phai la mot tam giac vuong}
uses crt;
var a,b,c:integer;
begin
    clrscr;
    write('nhap vao canh thu nhat la ');readln(a);
    write('nhap vao canh thu hai la ');readln(b);
    write('nhap vao canh thu ba la ');readln(c);
    if (a*a=b*b+c*c) or (b*b=c*c+a*a) or (c*c=a*a+b*b) then write('day la mot tam giac vuong')
    else write('day khong phai la mot tam giac vuong');
    readln;
end.