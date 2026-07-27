{bt2.3_giong bai 2.2 chi dung 2 bien a va max}
uses crt;
var a,max:integer;
begin
    clrscr;
    write('nhap vao so thu nhat la: ');readln(a);
    max:=a;
    write('nhap vao so thu hai: ');readln(a);
    if a >= max then max:=a;
    write('nhap vao so thu ba: ');readln(a);
    if a >= max then max:=a;
    write('nhap vao so thu tu: ');readln(a);
    if a >= max then max:=a;
    write('so lon nhat: ',max);
    readln;
end.
