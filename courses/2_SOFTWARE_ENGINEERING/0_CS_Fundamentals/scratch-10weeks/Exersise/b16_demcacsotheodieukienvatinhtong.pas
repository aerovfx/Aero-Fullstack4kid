{Bài 16: Đếm các số theo điều kiện và tính tổng
Nhập số N bất kỳ. Đếm các số lớn hơn 10 và nhỏ hơn 20 rồi tính tổng của chúng. Sau đó, đưa ra màn hình "So cac so >10 va <20 la:" và "Tong cua chung la:".}

Var Tong, So: Real; I, N, Dem: Integer;
  BEGIN
    Write ('Ban muon nhap bao nhieu so: '); Readln (N);
    Tong:= 0; Dem:= 0;
    For I:= 1 To N Do
      Begin
         Write ('So = '); Readln (So);
         If (So > 10) and (So < 20) Then
           Begin
             Tong:= Tong + So;
             Dem:= Dem + 1;
           End;
      End;
    Writeln ('So cac so >10 va <20 la: ', Dem);
    Writeln ('Tong cua chung la:', Tong);
    Readln;
END.
