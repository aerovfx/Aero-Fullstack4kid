{bt2.4_viet chuong trinh xet co phai la tam giac can khong}
uses crt;
var a,b,c:integer;
begin
    clrscr;
    write('nhap vao canh thu nhat la ');readln(a);
    write('nhap vao canh thu hai la ');readln(b);
    write('nhap vao canh thu ba la ');readln(c);
    if (a=b) or (b=c) or (c=a) then write('day la mot tam giac can')
    else write('day khong phai la mot tam giac can');
    readln;
end.
