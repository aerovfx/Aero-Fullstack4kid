{Bài 1: In số chẵn ra màn hình
Viết chương trình nhập vào 1 số N nguyên dương và in ra màn hình các số chẵn từ 0 đến N, sao cho mỗi số chiếm 4 vị trí và 1 dòng có 15 số.
}


uses crt; {khai bao' thu vien crt}
var n,i,dem:integer;
BEGIN
    clrscr;{ cau lenh xoa man hinh};
    write('Nhap n: ');readln(n);
    dem:=0;
    for i:=1 to n do
     begin
      if i mod 2=0 then
       begin
        write(i:4);
        dem:=dem+1;
       end;
      if dem=15 then
       begin
        dem:=0;
        writeln;{in duoc 15 so thi xuong dong};
       end;
     end;
    readln
END.