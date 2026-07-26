{bt1.7_tinh trung binh nhan cua 4 so chi duoc dung 2 bien s va a}
uses crt;
var B,C,A:byte;
begin
clrscr;
randomize;
writeln('Go phim de nhan ket qua');readln();
A:=random(10); {A:=A mod 2;}
B:=random(10); {B:=B mod 2;}
C:=random(10); {C:=C mod 2;}
writeln('Gia tri cua A,B,C la ',A,B,C);
readln;
end.
