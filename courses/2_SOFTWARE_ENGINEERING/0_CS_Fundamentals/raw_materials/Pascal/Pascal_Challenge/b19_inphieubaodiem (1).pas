{Bài 19: In phiếu báo điểm
Viết chương trình: Nhập số báo danh, nhập điểm văn, toán, Anh. In ra màn hình dưới dạng:

Phiếu Báo điểm:

Số báo danh:

Điểm văn:

Điểm toán:

Điểm ngoại ngữ:

Tổng số điểm:

Bạn đã trúng tuyển: Nếu Tổng số điểm >=20.

Bạn không trúng tuyển: Nếu Tổng số điểm <20.}

Uses Crt;  Var SBD: Integer; 
     Van, Toan, Anh, Tongdiem: Real; 
  BEGIN
    Clrscr; 
    Write ('So bao danh: '); Readln(SBD); 
    Write ('Diem toan: '); Readln(Toan); 
    Write ('Diem ngoai ngu: '); Readln(Anh); 
    Write ('Diem van: '); Readln (Van); 
    Tongdiem:= Toan + Van + Anh; 
    Clrscr; 
    Writeln ('Phieu Bao Diem ') ; 
    Writeln ('So bao danh        : ', SBD); 
    Writeln ('Diem van           : ', Van); 
    Writeln ('Diem toan          : ', Toan); 
    Writeln ('Diem ngoai ngu     : ', Anh) ; 
    Writeln ('Tong diem          : ', Tongdiem); 
    If Tongdiem >= 15 Then 
      Writeln(' Ban da trung tuyen ');
    Else 
      Writeln(' Ban khong trung tuyen ');
    Readln;     
END.
