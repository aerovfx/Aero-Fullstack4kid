{Bài 18: Xem ngày là thứ mấy trong tuần
Đọc ngày tháng năm, sau đó viết ra màn hình đó là ngày thứ mấy trong tuần.}
Var Thu, Ngay, Thang: Byte; 
     	Nam: Integer; 
  BEGIN
    Write ('Doc Ngay Thang Nam: ');
    Readln ( Ngay, Thang, Nam );
    Nam:= 1900 + (Nam mod 1900);
    If Thang < 3 Then
      Begin
         Thang:= Thang + 12;
         Nam:= Nam - 1;
      End;
    Thu:= Abs (Ngay + Thang * 2 + (Thang + 1) * 3
        div 5 + Nam + Nam div 4) mod 7;
    Case Thu Of
        0: Writeln ('Chu Nhat');
        1: Writeln ('Thu Hai');
        2: Writeln ('Thu Ba');
        3: Writeln ('Thu Tu');
        4: Writeln ('Thu Nam');
        5: Writeln ('Thu Sau');
        6: Writeln ('Thu Bay');
     End;
     Readln;
  END.