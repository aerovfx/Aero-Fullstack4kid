{bt2.2_viet chuong trinh in ra 4 so lon nhat trong 4 so nhap tu ban phim}
uses crt;
var a,b,c,d:integer;
begin
    clrscr;
    write('nhap vao so a:');readln(a);
    write('nhap vao so b:');readln(b);
    write('nhap vao so c:');readln(c);
    write('nhap vao so d:');readln(d);
    if (a>=b) and (a>=c) and (a>=d) then writeln('a la so lon nhat trong 4 so');
    if (b>=a) and (b>=) and (b>=d) then writeln('b la so lon nhat trong 4 so');
    if (c>=b) and (c>=d) and (c>=a) then writeln('c la so lon nhat trong 4 so');
    if (d>=b) and (d>=c) and (d>=a) then writeln('d la so lon nhat trong 4 so');
    readln;
end.
    
