{Bài 15: Kiểm tra 3 số có là độ dài cạnh tam giác không
Nhập 3 số a, b, c bất kỳ. Kiểm tra xem 3 số có thể là độ dài 3 cạnh của một tam giác hay không và thông báo ra màn hình.}

Var a, b, c: Real;
  BEGIN
    Writeln ('Nhap do dai 3 canh cua tam giac:');
    Write ('a ='); Readln (a);
    Write ('b ='); Readln (b);
    Write ('c ='); Readln (c);
  If (a + b > c) and (b + c > a) and (c + a > b) 
    and (a > 0) and (b > 0) and (c > 0)  Then
      Writeln ('Thoa man: Day la 3 canh cua mot tam giac') 
    Else
      Writeln ('Khong thoa man!');
    Readln;  
END.