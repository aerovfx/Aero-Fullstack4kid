uses crt;
var a,b,c:integer;
begin
    clrscr;
    randomize;
    a:=random(10);a:=a mod 2;
    b:=random(10);b:=b mod 2;
    c:=random(10);c:=c mod 2;
    writeln('gia tri cua a= ',a,' gia tri cua b= ',b,'gia tri cua c= ',c);
    if (a=0) and (b=0) and (c=0) then write('thi 3 so hoa nhau');
    if (a=0) and (b=0 )and (c=1) then write('thi c thang');
    if (a=0) and (b=1) and (c=0) then write('thi b thang');
    if (a=1) and (b=0) and (c=0) then write('thi a thang');
    if (a=1) and (b=1) and (c=0) then write('thi c thang');
    if (a=1) and (b=0) and (c=1) then write('thi b thang');
    readln;
end.