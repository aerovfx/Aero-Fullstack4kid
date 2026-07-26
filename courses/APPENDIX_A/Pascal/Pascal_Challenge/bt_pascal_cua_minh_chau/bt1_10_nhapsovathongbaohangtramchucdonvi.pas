{BT1.10 nhap vao mot so nguyen hang tram, sau do chuong trinh se in ra thong bao hang tram hang chu c va hang don vi
Y tuong:
toan tu: div cho phan nguyen va toan tu mod cho phan du

}

uses crt;
var n: integer;

begin
    clrscr;
    write('nhap vao so nguyen hang tram '); readln(n);

    { check gia tri n}
    writeln('Gia tri hien tai cua n la ',n); readln;
    {ok}
    {thong bao so hang tram}
    writeln('Chu so hang tram la ', n div 100); readln;

    { check gia tri n}
    writeln('Gia tri hien tai cua n la ',n); readln;

    {chia mod lay phan du }
    n:=n mod 100;
   { check gia tri n}
    writeln('Gia tri hien tai cua n sau khi chia mod la ',n); readln;

    {tiep tuc chia phan nguyen de lay so 2 la hang chuc}
    n:=n div 10;
     { check gia tri n}
    writeln('Gia tri hien tai cua n sau khi chia div la ',n); readln;

    {ok y tuong la vay, 2 em tiep tuc nha}

    


end.