{bt2.7_giai pt bac nhat}
uses crt;
var a,b:integer;
begin
    clrscr;
    write('nhap vao he so a ');readln(a);
    write('nhap vao he so b ');readln(b);
    if a<>0 then write('thi nghiem x la',-b/a);
    if (a =0) and (b=0) then write('co vo so nghiem');
    if (a=0) and (b<>0) then write('co vo nghiem');
    readln;
end.