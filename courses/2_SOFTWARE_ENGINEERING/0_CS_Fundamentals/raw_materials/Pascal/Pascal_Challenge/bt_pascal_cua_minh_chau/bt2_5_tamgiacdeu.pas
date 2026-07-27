{bt2.5_viet chuong trinh xet co phai la mot tam giac deu}
uses crt;
var a,b,c:integer;
begin
    clrscr;
    write('nhap vao canh thu nhat la ');readln(a);
    write('nhap vao canh thu hai la ');readln(b);
    write('nhap vao canh thu ba la ');readln(c);
    if (a=b) and (b=c) and (c=a) then write('day la mot tam giac deu')
    else write('day khong phai la mot tam giac deu');
    readln;
end.