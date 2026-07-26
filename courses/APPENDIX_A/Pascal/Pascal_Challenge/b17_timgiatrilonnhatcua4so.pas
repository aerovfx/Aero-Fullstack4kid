{Bài 17: Tìm giá trị lớn nhất của 4 số
Nhập 4 số a, b, c, d. Hãy tìm giá trị lớn nhất của chúng và gán giá trị đó cho biến Max.}
Var Max, a, b, c, d: Real; 
  BEGIN
    Writeln ('Nhap gia tri cua 4 so: ');
    Write ('a = ') ; Readln (a);
    Write ('b = ') ; Readln (b);
    Write ('c = ') ; Readln (c);
    Write ('d = ') ; Readln (d);
    Max:= a;
    If Max < b Then Max:= b;
    If Max < c Then Max:= c;
    If Max < d Then Max:= d;
    Writeln ('Gia tri lon nhat la: ', Max);
    Readln;
END.