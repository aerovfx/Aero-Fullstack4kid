{bt1.10_viet chuong trinh nhap vao chu so hang tram chuc va don vi}
uses crt;
var n:integer;
begin
    clrscr;
    write('nhap vao so n ');readln(n);
   writeln('chu so hang tram la ',n div 100);
   n:=n mod 100;
    writeln('chu so hang chuc la',n div 10);
    writeln('chu so hang don vi la',n mod 10);
    readln;

end.