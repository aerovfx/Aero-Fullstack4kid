BÀI TẬP TURBO PASCAL

Làm quen với chương trình Pascal – Khai báo, sử dụng biến – Các thủ tục vào ra.
Bài tập 1.1:

            Viết chương trình tính chu vi và diện tích của hình chữ nhật có chiều dài hai cạnh là a, b (được nhập từ bàn phím).

Hướng dẫn:
– Nhập hai cạnh vào hai biến a, b.

– Chu vi hình chữ nhật bằng 2*(a+b); Diện tích hình chữ nhật bằng a*b.

Mã chương trình:
 

Program Chu_nhat;

uses crt;

Var a, b, S, CV: real;

Begin

     Write(‘Nhap chieu dai:’); readln(a);

     Write(‘Nhap chieu rong:’); readln(b);

     S := a*b;

     CV := (a+b)*2;

     Writeln(‘Dien tich hinh chu nhat la:’,S);

     Writeln(‘Chu vi hinh chu nhat la:’,CV:10:2);

     readln

end.

 

Nhận xét: Lệnh write cho phép in ra màn hình một hoặc nhiều mục. Có thể định dạng được số in ra bằng cách qui định khoảng dành cho phần nguyên, khoảng dành cho phần thập phân.
Bài tập 1.2:

Viết chương trình tính chu vi, diện tích hình vuông có cạnh a (được nhập từ bàn phím).

Hướng dẫn:
– Nhập cạnh vào biến canh.

– Chu vi hình vuông bằng 4*canh; Diện tích hình vuông bằng canh*canh.

Mã chương trình:
 

 

Program HINH_VUONG;

uses crt;

Var canh: real;

Begin

     clrscr;

     Write(‘Nhap do dai canh:’);readln(canh);

     Writeln(‘Chu vi hinh vuong la:’,4*canh:10:2);

     Writeln(‘Dien tich hinh vuong la:’,canh*canh:10:2);

     readln

end.

 

Nhận xét: Bài tập 1.2 tiết kiệm được hai biến là CV và S vì lệnh write cho phép in một biểu thức. Trong lập trình việc tiết kiệm biến là cần thiết nhưng đôi lúc gây khó hiểu khi đọc, kiểm tra chương trình.
Bài tập 1.3:

            Viết chương trình tính chu vi và diện tích hình tròn có bán kính r (được nhập từ bàn phím).

Hướng dẫn:
– Nhập bán kính vào biến r.

– Chu vi đường tròn bằng 2*p*r.

– Diện tích hình tròn bằng p*r*r.

Mã chương trình:
 

Program HINH_TRON;

uses crt;

Var r: real;

Begin

     clrscr;

     Write(‘Nhap ban kinh:’); readln(r);

     Writeln(‘Chu vi duong tron la:’,2*pi*r:10:2);

     Writeln(‘Dien tich hinh tron la:’,pi*r*r:10:2);

     readln

end.

 

Nhận xét: pi là hằng số. Một hằng số có thể được người dùng khai báo hoặc do Pascal tự tạo. Pi là hằng do Pascal tự tạo nên người dùng không cần khai báo.
Bài tập 1.4:

            Viết chương trình tính diện tích của tam giác có ba cạnh là a,b,c (được nhập từ bàn phím)

Hướng dẫn:
– Nhập ba cạnh của tam giác vào ba biến a,b,c.

– Nửa chu vi của tam giác p = (a+b+c)/2.

– Diện tích của tam giác: s =.

Mã chương trình:
Program TAM_GIAC;

uses crt;

Var a,b,c,p,S: real;

Begin

     clrscr;

     Write(‘Nhap canh a:’);readln(a);

     Write(‘Nhap canh b:’);readln(b);

     Write(‘Nhap canh c:’);readln(c);

     p:=(a+b+c)/2;

     S:= sqrt(p*(p-a)*(p-b)*(p-c));

     Write(‘Dien tich tam giac la:’,s:10:2);

     readln

end.

 

Nhận xét: Ở đây ta lại hai lần dùng biến trung gian p, s để chương trình sáng sủa, dễ theo dõi.
 

 

Bài tập 1.5:

            Viết chương trình cho phép tính trung bình cộng của bốn số.

Hướng dẫn:
– Nhập bốn số vào bốn biến a, b, c, d

– Trung bình cộng của a, b, c, d bằng (a + b + c + d)/4.

Mã chương trình:
 

Program TB_Cong_4_So;

uses crt;

Var a, b, c, d: real;

Begin

     Clrscr;

     Write(‘Nhap so thu nhat:’);readln(a);

     Write(‘Nhap so thu hai:’);readln(b);

     Write(‘Nhap so thu ba:’);readln(c);

     Write(‘Nhap so thu tu:’);readln(d);

     Writeln(‘Trung binh cong: ‘,(a+b+c+d)/4):10:2;

     Readln

end.

 

 

Bài tập 1.6:

            Viết chương trình cho phép tính trung bình cộng của bốn số với điều kiện chỉ được sử dụng hai biến.

Hướng dẫn:
– Dùng một biến S có giá trị ban đầu bằng 0.

– Dùng một biến để nhập số.

– Sau khi nhập một số cộng ngay vào biến S.

Mã chương trình:
Program TB_Cong_4_So;

uses crt;

Var s,a: real;

Begin

     Clrscr;

     S:=0;

     Write(‘Nhap so thu nhat:’);readln(a); S:=S+a;

     Write(‘Nhap so thu hai:’);readln(a); S:= S+a;

     Write(‘Nhap so thu ba:’);readln(a); S:=S+a;

     Write(‘Nhap so thu tu:’);readln(a); S:=S+a;

     Writeln(‘Trung binh cong: ‘,S/4:10:2);

     readln

end.

 

 

Nhận xét: Câu lệnh gán S:= S+a thực hiện việc cộng thêm a vào biến S. Thực chất là thực hiện các bước: lấy giá trị của S cộng với a rồi ghi đè vào lại biến S. Ở đây ta cũng đã sử dụng biến a như là một biến tạm để chứa tạm thời giá trị được nhập từ bàn phím.
 

Bài tập 1.7:

            Viết chương trình cho phép tính trung bình nhân của bốn số với điều kiện chỉ được sử dụng hai biến.

Hướng dẫn:
– Dùng một biến S có giá trị ban đầu bằng 1.

– Dùng một biến để nhập số.

– Sau khi nhập một số nhân ngay vào biến S.

– Trung bình nhân bốn số là căn bậc 4 tích của chúng (Dùng hai lần căn bậc hai).

Mã chương trình:
Program TB_nhan;

uses crt;

Var a, S: real;

Begin

    clrscr;

    S:=1;

    Write(‘Nhap so thu nhat: ‘); readln(a); S:=S*a;

    Write(‘Nhap so thu hai: ‘); readln(a); S:=S*a;

    Write(‘Nhap so thu ba: ‘); readln(a); S:=S*a;

    Write(‘Nhap so thu tu: ‘); readln(a); S:=S*a;

    Write(‘Trung binh nhan cua bon so la:’,sqrt(sqrt(s)));

    readln

End.

Nhận xét: Ta đã dùng hai lần khai phương để lấy căn bậc 4 của một số. Để cộng dồn giá trị vào một biến thì biến đó có giá trị ban đầu là 0. Để nhân dồn giá trị ban đầu vào biến thì biến đó cần có giá trị ban đầu là 1.
Bài tập 1.8:

            Viết chương trình nhập hai số, đổi giá trị hai số rồi in ra hai số.

Hướng dẫn:
– Dùng các biến a, b để lưu hai số được nhập từ bàn phím;

– Gán cho biến tam giá trị của a.

– Gán giá trị của b cho a. (Sau lệnh  này a có giá trị của b).

– Gán giá trị của tạm cho cho b (Sau lệnh này b có giá trị của tam = a).

Mã chương trình:
Program Doi_Gia_Tri;

uses crt;

var a, b, tam:real;

Begin

    clrscr;

    write(‘nhap a: ‘); readln(a);

    write(‘nhap b: ‘); readln(b);

    writeln(‘Truoc khi doi a =’,a,’ va b= ‘,b);

    readln;

    tam:=a;

    a:=b;

    b:=tam;

    writeln(‘Sau khi doi a =’,a,’ va b= ‘,b);

    readln

end.

Nhận xét:Nếu thực hiện hai lệnh a:= b; b:=a để đổi giá trị hai biến thì sau hai lệnh này hai biến có giá trị bằng nhauvà bằng b. Thực chất sau lệnh thứ nhất hai biến đã có giá trị bằng nhau và bằng b rồi! Trong thực tế để đổi chỗ số dầu ở hai bình cho nhau ta phải dùng thêm một bình phụ.

Bài tập 1.9

            Giải bài tập 1.8 mà chỉ được sử dụng hai biến (Tức không được dùng thêm biến tạm).

Hướng dẫn:
– Cộng thêm b vào a. (Giá trị hai biến sau lệnh này là: a+b, b)

– Gán b bằng tổng trừ đi b (Sau lệnh này b có giá trị bằng a);

– Gán giá trị a bằng tổng trừ đi b mới (Sau lệnh này a có giá trị bằng b).

Mã chương trình:
Program Doi_Gia_Tri;

uses crt;

var a, b:real;

Begin

    clrscr;

    write(‘nhap a: ‘); readln(a);

    write(‘nhap b: ‘); readln(b);

    writeln(‘Truoc khi doi a =’,a,’ va b= ‘,b);

    readln;

    a:=a+b;

    b:=a-b;

    a:=a-b;

    writeln(‘Sau khi doi a =’,a,’ va b= ‘,b);

    readln

end.

 

Nhận xét:Giống sang dầu giữa hai bình nhưng không giống hoàn toàn!!!Kỹ thuật đổi giá trị biến cho nhau sẽ được sử dụng nhiều trong phần sắp xếp.

Bài tập 1.10:

            Viết chương trình cho biết chữ số hàng trăm, hàng chục, hàng đơn vị của một số có ba chữ số. Ví dụ khi nhập số 357 thì máy in ra:

– Chữ số hàng trăm: 3.

– Chữ số hàng chục: 5.

– Chữ số hàng đơn vị: 7.

Hướng dẫn:
            Sử dụng hàm mov để lấy số dư. Khi chia cho 10 để lấy số dư ta được chữ số hàng đơn vị. Sử dụng DIV để lấy phần nguyên. Khi chia cho 10 để lấy phần nguyên ta đã bỏ đi chữ số hàng đơn vị để số có ba chữ số còn số có hai chữ số.

Mã chương trình:
Program CHU_SO;

uses crt;

var n:integer;

begin

     clrscr;

     write(‘Nhap so n: ‘);readln(n);

     writeln(‘Chu so hang don vi: ‘,n mod 10);

     n:=n div 10;

     writeln(‘Chu so hang chuc: ‘,n mod 10);

     n:=n div 10;

     writeln(‘Chu so hang tram: ‘,n mod 10);

     readln

end.

 

Nhận xét:
            Hãy sửa chương trình để có kết quả là hàng trăm, hàng chục, hàng đơn vị.

Mã chương trình:

Program CHU_SO;

uses crt;

var n:integer;

begin

     clrscr;

     write(‘Nhap so n: ‘);readln(n);

     writeln(‘Chu so hang trm: ‘,n div 100);

     n:=n mov 100;

     writeln(‘Chu so hang chuc: ‘,n div 10);

     n:=n div 10;

     writeln(‘Chu so hang tram: ‘,n);

     readln

end.

 

 

 

 

 

 

II.Cấu trúc lựa chọn:  if … then … else

Case … of …

 

Bài tập 2.1:

            Viết chương trình in ra số lớn hơn trong hai số (được nhập từ bàn phím).

Hướng dẫn:
Nhập hai số vào hai biến a, b.
Nếu a > b thì in a. Nếu a <= b thì in b.
– Hoặc: Nếu a > b thì in a. Ngược lại thì in b.

Mã chương trình:
 

Program SO_SANH1;

uses crt;

var a,b: real;

begin

     clrscr;

     write(‘nhap so thu nhat: ‘); readln(a);

     write(‘nhap so thu hai: ‘); readln(b);

     if a> b then writeln(‘ So lon la:’,a);

     if a<= b then writeln(‘ So lon la:’,b:10:2);

     readln

end.

 

Hoặc:

Program SO_SANH2;

uses crt;

var a,b: real;

begin

     clrscr;

     write(‘nhap so thu nhat: ‘); readln(a);

     write(‘nhap so thu hai: ‘); readln(b);

     if a> b then writeln(‘ So lon la:’,a:10:2)

     else writeln(‘ So lon la:’,b:10:2);

     readln

end.

 

 

Bài tập 2.2:

Viết chương trình in ra số lớn nhất trong bốn số nhập từ bàn phím.

Hướng dẫn:
            Nếu a³ b và a³ c và a³ d thì a là số lớn nhất.

            Tương tự như thế xét các trường hợp còn lại để tìm số lớn nhất.

Mã chương trình:
Program So_Lon_Nhat_1;

Uses crt;

Var a,b,c,d: real;

Begin

     Clrscr;

     Write(‘Nhap so thu nhat:’);readln(a);

     Write(‘Nhap so thu hai:’);readln(b);

     Write(‘Nhap so thu ba:’);readln(c);

     Write(‘Nhap so thu tu:’);readln(d);

     if (a>=b) and (a>=c) and (a>= d) then writeln(‘So lon nhat la:’,a:10:2);

     if (b>=a) and (b>=c) and (b>= d) then writeln(‘So lon nhat la:’,b:10:2);

     if (c>=a) and (c>=b) and (c>= d) then writeln(‘So lon nhat la:’,c:10:2);

     if (d>=a) and (d>=b) and (d>= c) then writeln(‘So lon nhat la:’,d:10:2);

     readln

end.

 

 

Bài tập 2.3:

Viết chương trình in ra số lớn nhất trong bốn số nhập từ bàn phím với điều kiện chỉ được dùng hai biến.

Hướng dẫn:
            Sử dụng một biến max và một biến a để chứa số vừa nhập. Cho max bằng số đầu tiên. Sau khi nhập một số thực hiện so sánh nếu số vừa nhập lớn hơn max thì lưu số vừa nhập vào max. Sau khi nhập xong ta có max là số lơn nhất

(Giải thuật này gọi là kỹ thuật lính canh).

Mã chương trình:
Program So_Lon_Nhat_2;

Uses crt;

Var a,max: real;

Begin

     Clrscr;

     Write(‘Nhap so thu nhat:’);readln(a);Max:=a;

     Write(‘Nhap so thu hai:’);readln(a);if a>=Max then Max:=a;

     Write(‘Nhap so thu ba:’);readln(a);if a>=Max then Max:=a;

     Write(‘Nhap so thu tu:’);readln(a);if a>=Max then Max:=a;

     Write(‘So lon nhat la:’,Max:10:2);

     readln

end.

 

 

Bài tập 2. 4

            Viết chương trình xét xem một tam giác có là tam giác đều hay không khi biết ba cạnh của tam giác.

Hướng dẫn:
Nhập ba cạnh của tam giác vào ba biến a,b,c.
Nếu a = b và b = c thì tam giác là tam giác đều và ngược lại tam giác không là tam giác đều.
 

 

Mã chương trình:
Program Tam_giac_deu;

uses crt;

var a,b,c: real;

begin

     clrscr;

     write(‘Nhap a = ‘); readln(a);

     write(‘Nhap b = ‘); readln(b);

     write(‘Nhap c = ‘); readln(c);

     if (a = b) and (b = c) then writeln(‘La tam giac deu’)

     else

     writeln(‘Khong phai la tam giac deu’);

     readln

end.

Bài tập 2. 5

            Viết chương trình xét xem một tam giác có là tam giác cân hay không khi biết ba cạnh của tam giác.

a.Hướng dẫn:

Nhập ba cạnh của tam giác vào ba biến a,b,c.
Nếu a = b hoặc b = c hoặc a = c thì tam giác là tam giác cân và ngược lại tam giác không là tam giác cân.
b.Mã chương trình:

Program Tam_giac_can;

uses crt;

var a,b,c: real;

begin

     clrscr;

     write(‘Nhap a = ‘); readln(a);

     write(‘Nhap b = ‘); readln(b);

     write(‘Nhap c = ‘); readln(c);

     if (a = b) or (b = c) or (a = c) then writeln(‘La tam giac can’)

     else

     writeln(‘Khong phai la tam giac can’);

     readln

end.

 

Bài tập 2. 6

            Viết chương trình xét xem một tam giác có là tam giác vuông hay không khi biết ba cạnh của tam giác.

a.Hướng dẫn:

Nhập ba cạnh của tam giác vào ba biến a,b,c.
Nếu a2 = b2 + c2 hoặc b2 = c2 + a2 hoặc c2 = a2+b2 thì tam giác là tam giác vuông và ngược lại tam giác không là tam giác vuông.
 

b.Mã chương trình:

Program Tam_giac_can;

uses crt;

var a,b,c: real;

begin

     clrscr;

     write(‘Nhap a = ‘); readln(a);

     write(‘Nhap b = ‘); readln(b);

     write(‘Nhap c = ‘); readln(c);

     if (a*a = b*b+c*c) or (b*b = c*c+a*a) or (c*c= a*a+b*b) then writeln(‘La tam giac vuong’)

     else

     writeln(‘Khong phai la tam giac vuong’);

     readln

end.

 

Bài tập 2.7:

            Viết chương trình giải phương trình ax + b = 0 (Các hệ số a, b được nhập từ bàn phím).

a.Hướng dẫn:

Nếu a ¹ 0 thì phương trình có nghiệm x =
Nếu a = 0 và b = 0 thì phương trình có vô số nghiệm
Nếu a = 0 và b ¹ 0 thì phương trình vô nghiệm
 

Hoặc:

Nếu a = 0 thì xét b. Nếu b = 0 thì phương trình có vô số nghiệm ngược lại (b ¹0) thì phương trình vô nghiệm ngược lại (a ¹0) phương trình có nghiệm x = .
Mã chương trình:
Program Phuong_trinh_2;

uses crt;

var a,b:real;

begin

     clrscr;

     Writeln(‘          CHUONG TRINH GIAI PT ax + b = 0’);

     Write(‘Nhap he so a = ‘);readln(a);

     Write(‘Nhap he so b = ‘);readln(b);

     if (a<>0) then writeln(‘phuong trinh’,a:10:2,’x + ‘,b:10:2,’= 0′,’ co nghiem x =;’,-b/a:10:2);

     if (a=0) and (b=0) then writeln(‘Phuong trinh co vo so nghiem’);

     if (a=0) and (b<>0) then writeln(‘Phuong trinh vo nghiem’);

     readln

 

end.

 

 

Hoặc:

Program Phuong_trinh_2;

uses crt;

var a,b:real;

begin

     clrscr;

     Writeln(‘         CHUONG TRINH GIAI PT ax + b = 0’);

     Write(‘Nhap he so a = ‘);readln(a);

     Write(‘Nhap he so b = ‘);readln(b);

     if (a<>0) then writeln(‘phuong trinh’,a:10:2,’x + ‘,b:10:2,’= 0′,’ co nghiem x =;’,-b/a:10:2)

     else

     if (b=0) then writeln(‘Phuong trinh co vo so nghiem’)

     else

     writeln(‘Phuong trinh vo nghiem’);

     readln

 

end.

 

Bài tập 2.8:

            Viết chương trình giải phương trình ax2 + bx + c = 0 Với các hệ số a,b,c được nhập từ bàn phím.

Hướng dẫn:
– Nhập các số các hệ số vào các biến a,b,c.

– Tính delta = b2 – 4ac.

– Nếu delta > 0 thì phương trình có hai nghiệm   x1 = (-b + sqrt(delta))/(2a)

                                                                                    x2 = (-b – sqrt(delta))/(2a)

– Nếu delta = 0 thì phương trình co nghiệm kép x = -b/(2a)

– Nếu delta < 0 thì phương trình vô nghiệm.

Mã chương trình:
Program Phuong_trinh_Bac_hai;

uses crt;

var a,b,c,delta,x1,x2:real;

begin

    clrscr;

    write(‘Nhap a = ‘); readln(a);

    write(‘Nhap b = ‘); readln(b);

    write(‘Nhap c = ‘); readln(c);

    delta:=b*b-4*a*c;

    if delta > 0 then

    begin

        x1:= -b+sqrt(delta)/(2*a);

        x2:= -b-sqrt(delta)/(2*a);

        writeln(‘Phuong trinh co hai nghiem phan biet’);

        writeln(‘x1=’,x1:10:2);

        writeln(‘x2=’,x2:10:2);

    end;

    if delta = 0 then

    begin

        x1:= -b/(2*a);

        writeln(‘Phuong trinh co nghiem kep’);

        writeln(‘x1=x2=’,x1:10:2);

    end;

    if delta <0 then write(‘Phuong trinh vo nghiem’);

    readln

end.

 

 

Bài tập 2.9:

            Viết chương trình dịch các ngày trong tuần sang tiếng anh

2

3

4

5

6

7

8

Monday

Tuesday

Wednesday

Thursday

Friday

Saturday

Sunday

 

Hướng dẫn:
Dùng biến a kiểu byte để chứa thứ (2 đến 8)
Trường hợp a = 2: Monday
Trường hợp a = 3: Thursday
…
Trường hợp a = 8: Sunday
Ngoài ra không còn thứ nào.
Mã chương trình:
Program dich;

uses crt;

Var thu:byte;

begin

     clrscr;

     write(‘nhap thu can dich 2à8: ‘); readln(thu);

     case thu of

     2: Write(‘–> Monday’);

     3: Write(‘–> Tuesday’);

     4: Write(‘–> Wednesday’);

     5: Write(‘–> Thursday’);

     6: Write(‘–> Friday’);

     7: Write(‘–> Saturday’);

     8: Write(‘–> Sunday’);

     else

     Write(‘ Khong co thu nay’);

     end;

     readln

end.

 

 

 

Bài tập 2.10

            Viết chương trình cho phép tính diện tích các hình: Hình vuông; Hình chữ nhật; Hình tròn; Tam giác; Hình thang. Người dùng chọn hình cần tính diện tích từ bảng chọn, sau đó khai báo các thông số liên quan và nhận được diện tích của hình:

MOI BAN CHON HINH CAN TINH  DIEN TICH

 

Hình vuông.
Hình chữ nhật.
Hình tròn
Tam giác
Hình thang.
Muốn tình diện tích tam giác, người dùng gõ D và khai báo đường cao, đáy. Chương trình tính và thông diện tích đến người dùng.

Hướng dẫn:
            – Dùng cấu trúc chọn Case  chon of  với chon có kiểu Char để tạo bảng chọn.

            – Dùng 3 biến a,b,c để lưu các thông số của hình; Biến S để lưu diện tích của hình.

            – Thực hiện chung câu thông báo diện tích (Nằm ngoài Case . . . of) để gọn chưong trình.

Mã chương trình:
Program Dien_Tich_cac_hinh;

uses crt;

var chon: byte;

    a,b,c,S: real;

Begin

     clrscr;

     writeln(‘CHUONG TRINH TINH DIEN TICH CAC HINH’);

     Writeln(‘          ————‘);

     writeln(‘1.   DIEN TICH HINH TAM GIAC’);

     writeln(‘2.   DIEN TICH HINH VUONG’);

     writeln(‘3.   DIEN TICH HINH CHU NHAT’);

     writeln(‘4.   DIEN TICH HINH THANG’);

     writeln(‘5.   DIEN TICH HINH TRON’);

     write(‘Moi ban chon hinh can tinh dien tich: ‘);readln(chon);

     (case upcase chon) of

     1 : Begin

          Write(‘Cho biet canh day: ‘); readln(a);

          Write(‘Cho biet chieu cao: ‘); readln(b);

          S:=(a*b)/2;

          end;

     2:Begin

         Write(‘Cho biet chieu dai canh: ‘); readln(a);

         S:=a*a;

         end;

     3:Begin

         Write(‘Cho biet chieu dai: ‘); readln(a);

         Write(‘Cho biet chieu rong: ‘); readln(b);

         S:=a*b;

         end;

     4:Begin

              Write(‘Cho biet day lon: ‘); readln(a);

              Write(‘Cho biet day nho: ‘); readln(b);

              Write(‘Cho biet chieu cao: ‘); readln(c);

              S:=(a+b)*c/2;

        End;

     5:Begin

              Write(‘Cho biet ban kinh: ‘); readln(a);

              S:=a*a*pi;

         End;

     else

        Writeln(‘Chon sai roi!!!’);

     end;

     Writeln(‘Dien tich cua hinh la: ‘,S:8:2);

     readln

end.

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

III. Cấu trúc lặp với số lần lặp đã biết: For … to … do

Bài tập 3.1:

            Viết chương trình in ra các số chẵn nhỏ hơn hoặc bằng n ( Với n được nhập).

Hướng dẫn:
– Cho biến i chạy từ 1 đến n.

–  Nếu i chẵn ( i chia 2 dư 0) thì in ra số n.

Mã chương trình:
 

Program In_So_Le;

Uses crt;

var i,n: integer;

Begin

     Clrscr;

     Write(‘Nhap so n =’); readln(n);

     For i:=1 to n do if i mod 2 =1 then Write(i:3,’,’);

     readln

end.

 

 

 

Bài tập 3.2:

            Viết chương trình in ra các số lẻ nhỏ hơn hoặc bằng n ( Với n được nhập). Sao cho 15 số lẻ được in trên một dòng.

Hướng dẫn:
– Cho j =0.

– Cho biến I chạy từ 1 đến n.

–  Nếu I chẵn ( I chia 2 dư 0) thì in ra số n và tăng j lên 1

– Nếu j chia hết cho 15 thì thực hiện xuống dòng (Dùng Writeln).

Mã chương trình:
Program In_So_Le;

Uses crt;

var Dem,i,n: integer;

Begin

     Clrscr;

     Write(‘Nhap so n =’); readln(n);

     Dem:= 0;

     For i:=1 to n do if i mod 2 =1 then

     Begin Write(i:3,’,’);

     Dem:= Dem + 1;

     if Dem mod 15 = 0 then Writeln;

     end;

     readln

end.

 

 

 

Bài tập 3.3:

            Viết chương trình in ra tổng các số lẻ nhỏ hơn hoặc bằng n ( Với n được nhập).

Hướng dẫn:
            – Cho S = 0.

– Cho biến i chạy từ 1 đến n.

–  Nếu i chẵn ( I chia 2 dư 0) thì cộng thêm I vào S.

            – In ra S.

Mã chương trình:
Program In_So_Le;

Uses crt;

var S,i,n: integer;

Begin

     Clrscr;

     Write(‘Nhap so n =’); readln(n);

     For i:=1 to n do if i mod 2 =1 then S:= S+i;

     Writeln(‘Tong cac so le nho hon ‘,n,’ la: ‘,S);

     readln

end.

 

 

Bài tập 3.4:

            Viết chương trình in ra tất cả các ước của một số n (Với n được nhập từ bàn phím)

Hướng dẫn:
– Cho biến i chạy từ 1 đến n.Nếu n chia hết cho i thì in ra i.

Mã chương trình:
Program Tim_uoc;

uses crt;

Var n, i: integer;

Begin

    clrscr;

    Write(‘Nhap so n =’); readln(n);

    For i:=1 to n do if n mod i = 0 then write(i:3,’,’);

    readln

end.

 

 

Bài tập 3.5:

            Một số có tổng các ước nhỏ hơn nó bằng chính nó được gọi là số hoàn chỉnh.

Ví dụ: 6 có các ước nhỏ hơn nó là 1, 2, 3. Tổng là 1 + 2 + 3 = 6.

            Viết chương trình xét xem một số n được nhập từ bàn phím có phải là số hoàn chỉnh không.

Hướng dẫn:
            – Dùng biến n lưu số cần xét.

– Biến S có giá trị ban đầu bằng 0.

– Cho i chạy từ 1 đến n-1. nếu i là ước của n thì cộng thêm i vào S.

– Nếu S = n thì S là số hoàn chỉnh.

 

Mã chương trình:
 

Program So_Hoan_Chinh;

uses crt;

var n, i, s: integer;

begin

     write(‘nhap so n: ‘);readln(n);

     s:=0;

     for i:= 1 to n -1 do if n mod i = 0 then s:=s+i;

     if s = n then write(n, ‘ la so hoan chinh’)

     else writeln(n, ‘ khong phai la so hoan chinh’);

     readln

end.

 

 

Bài tập 3.6:

            Viết chương trình tìm các số hoàn chỉnh nhỏ hơn n (Với n được nhập từ bàn phím).

Hướng dẫn:
            Cho biến i chạy từ 1 đến n. Xét i. Nếu nó là số hoàn chỉnh thì in ra.

Mã chương trình:
Program Tim_uoc_2;

uses crt;

Var S, n, i,j: longint;

Begin

    clrscr;

    Write(‘Nhap so n =’); readln(n);

    For i:=1 to n do

    Begin

      S:=0;

      For j:=1 to i do if i mod j = 0 then S:=S+j;

      if S = 2*i then write(i:6,’,’);

    end;

    readln

end.

 

 

 

Bài tập 3.7

            In bảng cửu chương n (Với n nhập từ bàn phím)

a.Hướng dẫn :

Mã chương trình:
Program Cuu_Chuong_1;

uses crt;

var  n, i : integer;

begin

    clrscr;

    write(‘Nhap n: ‘); readln(n);

    for i:= 1 to 9 do writeln(n,’ x ‘, i, ‘ = ‘, n*i);

    readln

end.

 

Bài tập 3.8

            Lần lượt in các bảng cửu chương.

a.Hướng dẫn :

            – Cho biến i chạy từ 2 đến 9

            – In bảng cửu chương i.

Mã chương trình:
Program Cuu_Chuong_1;

uses crt;

var  i,j : integer;

begin

    clrscr;

    for i:= 2 to 9 do

    Begin

    Writeln(‘Bang cuu chuong ‘,i);

    For j := 1 to 9 do writeln(i,’ x ‘, j, ‘ = ‘, j*i);

    readln

    end;

    readln

end.

 

 

 

Bài tập 3.9

            Viết chương trình xét xem một số n có phải là số nguyên tố không?

a.Hướng dẫn:

– Cho biến i chạy từ 2 đến n – 1 nếu n không chia hết mọi số i thì thì n là số nguyên tố.

– Sử dụng biến ok có kiểu boolean và có giá trị ban đầu là true. Cứ mỗi lần xét phép chia n cho i thì

b.Mã chương trình:

 

Program Nguyen_to_1;

uses crt;

var n, i: integer;

    ok: boolean;

begin

   ok:=true;

   write(‘Nhap n: ‘);readln(n);

   for i:= 2 to n – 1 do if n mod i = 0 then ok :=ok and false;

   if ok then write(n,’ la so nguyen to’)

   else write(n, ‘ khong la so nguyen to’);

   readln

end.

 

Bài tập 3.10

            Viết chương trình in ra tất cả các số nguyên tố bé hơn hoặc bằng n?

Hướng dẫn:
 

Mã chương trình:
Program Nguyen_to_1;

uses crt;

var n, i, j: integer;

    ok: boolean;

begin

   clrscr;

   write(‘Nhap n: ‘); readln(n);

   for i := 2 to n do

   begin

   ok:=true;

   for j:= 2 to i – 1 do if i mod j = 0 then ok :=ok and false;

   if ok then write(i,’;’)

   end;

   readln

end.

 

 

 

 

Cấu trúc lặp với số lần lặp chưa biết
Bài tập 4.1:

            Viết chương trình in ra các số lẻ nhỏ hơn hoặc bằng n ( Với n được nhập).

Hướng dẫn:
– Sử dụng kiến thức số lẻ đầu tiên bằng 1. Số lẻ sau bằng số trước cộng với 2.

–  Cho biến i có giá trị ban đầu bằng 1.

–  Dùng vòng lặp while do với điều kiện i < n và công việc bên trong là in i và tăng i lên 2.

Mã chương trình:
Program In_So_Le;

uses crt;

var i,n:integer;

begin

      clrscr;

      write(‘Nhap so n: ‘);readln(n);

      i:=1;

      while i<=n do

      begin

           write(i:3,’, ‘);

           i:=i+2;

      end;

      readln

end.

 

Nhận xét:

– Mọi vòng lặp For … to … do đều có thể thay thế bằng vòng lặp while … do.

– Trong vòng lặp while nhất thiết phải có một câu lệnh làm thay đổi điều kiện lặp. Ở đây là i:=i+2. Nếu không có sẽ dẫn đến trường hợp lặp vô hạn. Chương trình chạy mãi mà không có lối ra (Không thoát ra khỏi vòng lặp được).

 

Bài tập 4.2:

            Viết chương trình tính n! với n! được định nghĩa như sau:

– n! = 1 với n = 0

– n! = 1.2.3…n (Tích của n số từ 1 đến n).

Yêu cầu: Sử dụng vòng lặp với số lần chưa biết trước:

Hướng dẫn:
– Có thể viết lại: n! = n.(n-1)… 3.2.1.

– Lặp gt = gt*n; n = n-1 với điều kiện n>0.

Mã chương trình:
Program Giai_Thua_while;

uses crt;

var n, gt:longint;

begin

     clrscr;

     write(‘Nhap n: ‘);readln(n);

     gt:=1;

     while n>0 do

     begin

     gt:=gt*n;

     n:=n-1;

     end;

     writeln(‘Giai thua cua n la: ‘,gt);

     readln

end.

 

Nhận xét: Tiết kiệm được một biến i để chạy nhưng làm thay đổi n nên khi xuất ra chỉ có thể xuất một câu chung chung “Giai thua cua n la:”
 

Bài tập 4.3:

            Viết chương trình tính n! với n! được định nghĩa như sau:

– n!! = 1 với n = 0

– n!! = 1.3.5..n với n lẻ.

– n!! = 2.4.6..n với n chẵn.

Yêu cầu: Sử dụng vòng lặp với số lần chưa biết trước:

Hướng dẫn:
– Hai số chẵn liên tiếp hơn kém nhau 2. Hai số lẻ liên tiếp cũng vậy.

– Thực hiện tính như giai thừa đơn nhưng với bước nhảy là 2.

Mã chương trình:
Program  Giai_thua_kep;

uses crt;

var n,gt:longint;

begin

    write(‘Nhap n: ‘);readln(n);

    gt:=1;

    while n>0 do

    begin

    gt:=gt*n;

    n:=n-2;

    end;

    write(‘Giai thua la: ‘,gt);

    readln

end.

 

Nhận xét:
– Với thuật toán trên ta không cần xét n là chẵn hay lẻ.

 

Bài tập 4.4:

            Viết chương trình cho phép tính tổng của nhiều số (Chưa biết bao nhiêu số). Nhập số 0 để kết thúc quá trình nhập.

Hướng dẫn:
Mã chương trình:
Program Tong_Repeat;

uses crt;

var i: byte;

    so, tong: real;

begin

     write(‘NHAP CAC SO – NHAP 0 DE NGUNG ‘);

     readln;

     repeat

     clrscr;

     write(‘Nhap so thu ‘,i,’: ‘);

     readln(so);

     tong:=tong+so;

     i:=i+1;

     until so=0;

     write(‘Tong la: ‘,tong:6:1);

     readln

end.

 

 

Bài tập 4.5

            Viết chương trình tìm ước chung lớn nhất (UCLN) của hai số với yêu cầu sử dụng thuật toán Euclid.

Thuật toán Euclid:  Nếu a chia hết cho b (a chia b dư 0) thì UCLN(a,b) bằng b

                                Nếu a chia b dư r thì UCLN(a,b) = UCLN(b,r)

a.Hướng dẫn:

            – Nhập a, b và gán r = a mod b.

            – Lặp với điều kiện r <> 0: b = r, a = b, r = a mod b.

b.Mã chương trình:

Program UCLN;

uses crt;

var a,b,r:byte;

begin

     clrscr;

     writeln(‘CHUONG TRINH TIM UCLN CUA HAI SO’);

     write(‘Nhap a: ‘);readln(a);

     write(‘Nhap b: ‘);readln(b);

     r:=a mod b;

     while r<> 0 do

     begin

         b:=r;

         a:=b;

         r:=a mod b;

     end;

     write(‘UCLN cua hai so la: ‘,b);

     readln

end.

 

 

Bài tập 4.6

            Dãy Fibonacy có hai phần tử đầu là 1, 1. Các phần tử sau bằng tổng hai phần tử đứng ngay trước nó: 1, 1, 2, 3, 5, 8, 13, 21, …

            Viết chương trình in ra dãy Fibonacy có phần tử lớn nhất nhỏ hơn n?

a.Hướng dẫn:

 

 

b.Mã chương trình:

 

 

 

V.DỮ LIỆU KIỂU MẢNG

Bài tập 5.1

            Viết chương trình cho phép nhập n số và in ra theo thứ tự ngược lại. Ví dụ nhập 3, 5, 7 thì in ra 7, 5, 3.

a.Hướng dẫn:

Dùng biến n để lưu lượng số cần nhập.
Dùng mảng để lưu các số vừa nhập.
Cho i chạy từ n về 1 để in các số vừa nhập.
b.Mã chương trình:

Program mang_1;

uses crt;

var n, i: integer;

    M: array[1..100] of real;

Begin

    write(‘Nhap so n: ‘);readln(n);

    for i:=1 to n do

    Begin

        write(‘M[‘,i,’]=’); readln(M[i]);

    end;

    for i:= n downto 1 do write(m[i],’ ,’);

    readln

end.

 

Bài tập 5.2

            Viết chương trình nhập dãy n số và in ra tổng các số lẻ trong dãy số vừa nhập.

Hướng dẫn:
 

Mã chương trình:
Program Mang_Tong_Le;

uses crt;

var i,n:byte;

    M:array[1..100] of integer;

    tong:longint;

begin

    write(‘Nhap so phan tu cua day: ‘);readln(n);

    for i:=1 to n do

    begin

         write(‘M[‘,i,’]’); readln(M[i]);

    end;

    tong:=0;

    for i:=1 to n do if M[i] mod 2 =1 then    

    tong:=tong+M[i];

    write(‘Tong cac so le trong day la: ‘,tong);

    readln

end.

 

 

Bài tập 5.3

            Viết chương trình nhập n số, xoá số thứ k trong n số vừa nhập.In ra n-1 số còn lại.

n= 10 (Nhập 10 phần tử)

Ví dụ: Nhập 2, 3, 4, 5, 6, 8, 7, 6, 5, 4.

k= 8 (Xoá phần tử thứ 8).

In ra: 2, 3, 4, 5, 6, 8, 7,  5, 4.

Hướng dẫn:
            Xoá phần tử k bằng cách ghi đè phần tử thứ k+1 lên nó.

Mã chương trình:
Program Xoa_mang;

uses crt;

var m:array[1..100] of integer;

    n,i,k:byte;

begin

     Write(‘So phan tu cua day: ‘);readln(n);

     for i:=1 to n do

     Begin

          write(‘M[‘,i,’]=’);

          readln(M[i]);

     end;

     write(‘Nhap phan tu can xoa: ‘);readln(k);

     for i:=k to n-1 do m[i]:=m[i+1];

     for i:=1 to n-1 do write(m[i],’, ‘);

     readln

end.

 

Bài tập 5.4

            Viết chương trình cho phép nhập nhập một dãy gồm n số nguyên. Nhập thêm một số và chèn thêm vào dãy sau phần tử k.

Hướng dẫn:
– Dời các phần tử từ vị trí k về sau một bước.

– Nhập giá trị cần chèn vào vị trí k.

Mã chương trình:
Program Mang_chen;

uses crt;

var M: array[1..100] of integer;

    i,n,k:integer;

begin

     clrscr;

     write(‘Nhap : ‘);readln(n);

     for i:=1 to n do

     begin

         write(‘M[‘,i,’]=’); readln(M[i]);

     end;

     write(‘Vi tri chen: ‘);readln(k);

     for i:=n+1 downto k+1 do M[i]:=M[i-1];

     write(‘Nhap so can chen: ‘); readln(M[k]);

     for i:=1 to n+1 do write(M[i],’, ‘);

     readln

end.

 

Bài tập 5.5

            Viết chương trình cho phép nhập n số và cho biết số nhỏ nhất trong các số vừa nhập là số thứ mấy.

a.Hướng dẫn:

Dùng biến n để lưu lượng số cần nhập.
Dùng mảng để lưu các số vừa nhập.
Cho Min = M[1], j = 1 (Xem phần tử đầu tiên là bé nhất)
So sánh Min với n-1 số còn lại. Trong quá trình so sánh nếu Min > M[i] thì gán Min = M[i], j=i và tiếp tục so sánh .
b.Mã chương trình:

Program TIM_NHO_NHAT;

uses crt;

var n,i,nhonhat:integer;

    m: array[1..100] of real;

    min:real;

begin

     write(‘Nhap n: ‘); readln(n);

     for i:=1 to n do

     begin

          write(‘M[‘,i,’]=’);

          readln(m[i]);

     end;

     min:=m[1];

     nhonhat:=1;

     for i:=2 to n do if m[i]  < min then

     begin

          min:=m[i];

          nhonhat:=i;

     end;

     writeln(‘phan tu nho nhat la phan tu thu’,nhonhat);

     readln

end.

 

 

Bài tập 5.6

            Viết chương trình cho phép nhập n số sắp xếp và in ra các số đã nhập theo thứ tự tăng dần.

Hướng dẫn:
 

Mã chương trình:
Program Sap_xep_1;

uses crt;

var n,i,k,nhonhat:integer;

    m: array[1..100] of integer;

    min,tam:integer;

begin

{— Nhap mang co n phan tu——}

     write(‘Nhap n: ‘); readln(n);

     for i:=1 to n do

     begin

          write(‘M[‘,i,’]=’);

          readln(m[i]);

     end;

{—Tim so be nhat ——–}

     for k:=1 to n do

     begin

     min:=m[k];

     nhonhat:=k;

     for i:=k+1 to n do if m[i]  < min then

     begin

          min:=m[i];

          nhonhat:=i;

     end;

{—-Doi cho m[k] voi m[j] vi m[j] nho nhat ———–}

     tam:=m[k];

     m[k]:=m[nhonhat]

     m[nhonhat]:=tam;

     end;

{—-In mang sau khi sap xep –}

     for i:=1 to n do write(m[i],’, ‘);

     readln

end.

 

 

Bài tập 5.7:

            Viết chương trình in dãy n số fibonacy.

a.Hướng dẫn:

– Sử dụng mảng M để chứa dãy n số fibonacy. Tạo lập hai phần tử đầu tiên là 1, 1.

– Cho i chạy từ 3 đến n. M [i] = M[i-1]+M[i-2].

– In n phần tử đầu tiên của mảng.

b.Mã chương trình:

Program Fibonacy_mang;

uses crt;

var i,n: integer;

    m:array[1..100] of longint;

begin

     write(‘Nhap so phan tu can in:’); readln(n);

     m[1]:=1;

     m[2]:=1;

     for i:=3 to n do m[i]:=m[i-1]+m[i-2];

     for i:=1 to n do write(m[i],’ ,’);

     readln

end.

 

Bài tập 5.8

            Để xác định hệ số cho đa thứ khai triển (a+b)n người ta sử dụng tam giác Pascal.

1

1 1

1 2 1

1 3 3 1

1 4 6 4 1

… Hàng thứ n được xác định từ hàng n-1:

– Phần tử đầu tiên và phần tử cuối cùng đều bằng 1.

– Phần tử thứ 2 là tổng của phần tử thứ nhất và thứ 2 của hàng n-1

– Phần tử thứ k của hàng thứ n là tổng cảu phần tử thứ k-1 và k của hàng thứ n-1.

Hướng dẫn :
– Dùng hai mảng: Tam, và m để tạo và in các hàng của tam giác.

– Khởi động cho mảng m[1]=1; m[2]:=1

– Lập mảng tam cho dòng i.

– Chuyển mảng tạm cho mảng m.

– In ra dòng i.

Mã chương trình:
Program Tam_giac_Pascal;

uses crt;

var n,i,j:integer;

    m,tam: array[1..100] of integer;

begin

     write(‘Nhap bac cua tam giac: ‘);readln(n);

     m[1]:=1;

     m[2]:=1;

     for i:=1 to n do

     begin

     {Phan tu dau bang 1}

     tam[1]:=1;

     for j:=2 to i-1 do tam[j]:=m[j-1]+m[j];

     {Phan tu cuoi bang 1}

     tam[i]:=1;

     {Chuyen cac phan tu tu mang tam sang mang m}

     for j:=1 to i do m[j]:=tam[j];

     {in ra hang thu i}

     for j:=1 to i do write(m[j]:3); writeln;

     end;

     readln

end.

 

 

Bài tập 5.9

            Viết chương trình cho phép nhập.

Hướng dẫn:
Mã chương trình:
 

 

Bài tập 5.10

            Viết chương trình cho phép nhập.

Hướng dẫn:
Mã chương trình:
 

Chương trình con
Bài tập 6.1:

            Viết chương trình giải phương trình bậc hai với yêu cầu sử dụng các chương trình con để giải quyết các trường hợp xãy ra của delta.

Hướng dẫn:
Mã chương trình:
Program Giai_PT_bac_hai;

uses crt;

var a,b,c,delta:real;

{———————-}

Procedure delta_duong;

begin

write(‘Phuong trinh co hai nghiem x1=’,(-b+sqrt(delta))/(2*a),’x2=’,(-b+sqrt(delta))/(2*a));

end;

{———————}

Procedure delta_khong;

begin

write(‘Phuong trinh co nghiem kep x=’,-b/(2*a):3:1);

end;

{——————–}

Procedure delta_am;

begin

writeln(‘Phuong trinh vo nghiem’);

end;

{Chuong trinh chinh}

Begin

clrscr;

write(‘Nhap a: ‘);readln(a);

write(‘Nhap b: ‘);readln(b);

write(‘Nhap c: ‘);readln(c);

delta:=b*b-4*a*c;

if delta>0 then delta_duong

else if delta = 0 then delta_khong

else delta_am;

readln

end.

 

Nhận xét: Chương trình con cho phép chia nhỏ công việc nhằm đơn giản hoá. Ngoài ra lập trình đòi hỏi kỹ năng lập trình theo nhóm.Mỗi người thực hiện một mô-đun riêng, sau đó thự hiện ghép nối để có chương trình hoàn chỉnh.
Bài tập 6.2:

            Viết chương trình cho phép nhập hai số vào hai biến, thực hiện đổi giá trị của hai biến cho nhau. Yêu cầu dùng chương trình con để thực hiện chức năng đổi giá trị.

Hướng dẫn:
Mã chương trình:
Program CTC_1;

uses crt;

var a,b: real;

{—-CTC doi gia tri—-}

Procedure swap(var x,y:real);

var tam:real;

begin

tam:=x;

x:=y;

y:=tam;

end;

{—–Ket thuc CTC—–}

begin

clrscr;

write(‘Nhap so a: ‘);readln(a);

write(‘Nhap so b: ‘);readln(b);

swap(a,b);

write(‘Sau khi doi a =’,a:3:1);

write(‘Sau khi doi b =’,b:3:1);

readln

end.

 

Nhận xét:
– Nếu bỏ từ var ở khai báo var x,y:real thì chương trình vẫn không báo lỗi nhưng chức năng đổi giá trị của hai biến không thực hiện được.

Bài tập 6.3:

            Viết chương trình tính giai thừa của số n (Viết là n!). Với yêu cầu:

– Nếu người dùng nhập số n < 0 thì yêu cầu nhập lại.

– Sử dụng chương trình con để tính giai thừa của một số.

            n! = 1 nếu n = 0;

            n! = 1.2.3.4.5…n (Tích của n thừa số).

Hướng dẫn:
Mã chương trình:
Program CTC_2;

uses crt;

var n:integer;x:longint;

Procedure Giai_Thua(var GT:longint; n:byte);

begin

    GT:=1;

    while n>0 do

    begin

    GT:=GT*n;

    n:=n-1;

    end;

end;

begin

   repeat

   clrscr;

   write(‘Nhap so n: ‘);readln(n);

   if n < 0 then begin write(‘Nhap so n >=0’);readln; end;

   until n>=0;

   Giai_Thua(x,n);

   writeln(‘Giai thua cua ‘,n,’la:’,x);

   readln

end.

 

 

Bài tập 6.4:

            Viết chương trình tính n! với yêu cầu sử dụng hàm để tính giai thừa.

Hướng dẫn:
Mã chương trình:
Program Giai_thua_Ham;

uses crt;

var n: longint;

Function Giai_Thua(n:longint):longint;

Var GT:Longint;

begin

     GT:=1;

     while n > 0 do

     begin

     GT:=GT * n;

     n:=n-1;

     end;

     Giai_thua:=GT;

end;

begin

    clrscr;

    write(‘Nhap n: ‘); readln(n);

    write(n,’!=’,Giai_thua(n));

    readln

end.

 

 

Bài tập 6.5:

            Viết chương trình cho phép thực hiện rút gọn phân số.

Hướng dẫn:
– Tìm UCLN của tử số và mẫu số.

– Chia tử và mẫu của phân số cho UCLN vừa tìm được.

Mã chương trình:
Program Rut_gon_phan_so;

uses crt;

var tu,mau:integer;

Function UCLN(a,b:integer):integer;

var r: integer;

begin

     r:= a mod b;

     while r <> 0 do

     begin

         a:= b;

         b:= r;

         r:=a mod b;

     end;

     UCLN:=b;

end;

begin

   clrscr;

   write(‘Nhap tu: ‘); readln(tu);

   write(‘Nhap mau: ‘); readln(mau);

   write(‘Ket qua rut gon: ‘,tu,’/’,mau,’=’,tu div UCLN(tu,mau),’/’,mau div UCLN(tu,mau));

   readln

end.

 

 

Bài tập 6.6:

            Viết chương trình cho phép trộn hai dãy số A và B cùng có số phần tử là k để được dãy số C theo yêu cầu sau:

A = a1, a2 … ak

B = b1, b2 … bk

Được C = a1, b1, a2, b2 … ak, bk.

 

Hướng dẫn:
Mã chương trình:
Program Tron_day;

uses crt;

type kieu_mang =  array[1..100] of integer;

var A, B, C: Kieu_mang;

    n,i,j: integer;

Procedure Nhap_Mang(Var X: Kieu_mang; n:byte);

var i:integer;

begin

    for i:=1 to n do

    begin

        write(‘M[‘,i,’]=’);readln(X[i]);

    end;

end;

Procedure In_Mang(X:kieu_mang; n:byte);

var i: byte;

begin

     for i:=1 to n do write(x[i],’, ‘);

end;

{———–}

begin

   clrscr;

   write(‘Nhap so phan tu cua day: ‘);read(n);

   Nhap_mang(A,n);

   Nhap_mang(B,n);

   i:=1;

   j:=1;

   while i<= n do

   begin

        C[j]:=  A[i];

        C[j+1]:=B[i];

        j:=j+2;

        i:=i+1;

   end;

   in_mang(C,2*n);

   readln

end.

 

 

Bài tập 6.7:

Viết chương trình in ra các số nguyên tố nhỏ hơn n với yêu cầu dùng hàm để kiểm tra một số có phải là số nguyên tố hay không.

Hướng dẫn:
           

Mã chương trình:
Program In_so_nguyen_to;

uses crt;

var  n, i: integer;

{——Ham kiem tra——-}

Function kiem_tra(n:integer):boolean;

var i: integer;

begin

    kiem_tra:=true;

    for i:=2 to n-1 do if (n mod i) = 0 then kiem_tra:=false;

end;

{——CTC—————-}

begin

    clrscr;

    write(‘Nhap n: ‘); readln(n);

    for i:=2 to n do if kiem_tra(i) then write(i:3, ‘, ‘);

    readln;

end.

 

 

Bài tập 6.8:

            Viết chương trình cho phép sắp xếp một dãy số với yêu cầu sử dụng các chương trình con: Nhập mảng, in mảng, đổi giá trị của hai số.

Hướng dẫn:
Mã chương trình:
Program Sap_xep_day;

uses crt;

type kieu_mang =array[1..100] of integer;

Var A: kieu_mang;

    n,i,j:byte;

{———————}

Procedure Nhap_mang(var M:Kieu_Mang;n:byte);

Var i:byte;

begin

    for i:=1 to n do

    begin

        write(‘M[‘,i,’]=’);readln(M[i]);

    end;

end;

{———————}

Procedure In_mang(var M:Kieu_Mang;n:byte);

Var i:byte;

begin

    for i:=1 to n do write(M[i]:3,’, ‘)

end;

 

{———————}

Procedure swap(var a,b:integer);

var tam:integer;

begin

    tam:=b;

    b:=a;

    a:=tam;

end;

{———————}

 

Begin

    Clrscr;

    write(‘Cho biet so phan tu cua day: ‘);readln(n);

    nhap_mang(A,n);

    for i:=1 to n-1 do

       for j:= i to n do if A[i]>A[j] then swap(A[i],A[j]);

    In_mang(A,n);

    readln

end.

 

 

Bài tập 6.9:

            Viết chương trình tính n! bằng kỹ thuật đệ qui.

Hướng dẫn:
Nếu = 0 thì n! = 1 ngược lại n! = n*(n-1)!

Mã chương trình:
Program Giai_thua_de_qui;

uses crt;

var n: longint;

function Giai_thua(n:longint):longint;

begin

    if n=0 then giai_thua:=1

    else Giai_thua:=n*Giai_thua(n-1);

end;

begin

    clrscr;

    write(‘Nhap n: ‘); readln(n);

    write(n,’!=’,Giai_thua(n));

    readln

end.

 

Nhận xét:
            Dãy số fibonacy được định nghĩa: F(1) = 1; F(2) = 1; F(n) = F(n-1) + F(n-2).

Dựa vào định nghĩa này ta  có thể viết Fi(n) để tính số hạng thứ n của dãy.

Bài tập 6.10:

            Viết chương trình cho phép tìm ước chung lớn nhất của hai số bằng kỹ thuật đệ qui.

Hướng dẫn:
– Nếu a chia b dư 0 thì UCLN(a,b)=b ngược lại UCLN(a,b)=UCLN(b, a mod b)

 

Mã chương trình:
Program UCLN_de_qui;

uses crt;

var a,b: integer;

Function UCLN(a,b:integer):integer;

begin

   if a mod b = 0 then UCLN:=b

   else UCLN:=UCLN(b,(a mod b));

end;

begin

     clrscr;

     write(‘Nhap a: ‘);readln(a);

     write(‘Nhap b: ‘);readln(b);

     write(‘UCLN(‘,a,’,’,b,’)=’,UCLN(a,b));

     readln

end.

 

 

 

 

 

 

 

 

 

 

 

 

VII. Dữ liệu kiểu xâu ký tự:

Bài 7.1:

            Viết đoạn chương trình cho phép đọc một xâu ký tự và kiểm tra xâu này có đối xứng không.

Ví dụ: Xâu “abcddcba” là xâu đối xứng. Xâu “abcdabcd” không đối xứng.

a.Hướng dẫn:

Mã chương trình:
Program xau_doi_xung;

var st:string;

    doi_xung: boolean;

    i,n:byte;

begin

     write(‘Nhap xau can kiem tra: ‘); readln(st);

     doi_xung:= true;

     n:=length(st);

     for i:=1 to n div 2 do

     if st[i]<> st[n-i+1] then doi_xung:=false;

     if doi_xung then write(‘Xau doi xung’) else write(‘Khong doi xung’);

     readln

end.

 

Nhận xét:
            – Dùng thêm biến n để chương trình rõ ràng, dễ theo dõi. Có thể thay n bằng length(st);

– Có thể thay for i:=1 to n div 2 bằng for i:=1 to n nhưng lúc đó chương trình phải xét n trường hợp thay vì chỉ cần xét n/2 trường hợp.

            – Thuật toán của bài này giống với thuật toán xét xem một số có phải là số nguyên tố không (Thuật toán lính canh).

Bài 7.2:

            Viết chương trình cho phép viết hoa ký tự đầu từ trong một xâu.

Ví dụ: le nho duyet -> Le Nho Duyet

Hướng dẫn:
Mã chương trình:
Program Doi_chu;

uses crt;

var st: string;

    i:byte;

begin

    clrscr;

    write(‘Nhap xau can doi:’); readln(st);

    for i:= 1 to length(st) do if (st[i]=’ ‘) then st[i+1]:=upcase(st[i+1]);

    st[1]:=upcase(st[1]);

    write(st);

    readln

end.

 

Nhận xét:
Bài 7.3:

            Viết chương trình xoá các dấu cách thừa trong một xâu ký tự (Giữa hai từ chỉ có một dấu cách.

Ví dụ: Le   nho        Duyet -> Le Nho Duyet

a.Hướng dẫn:

– Thực hiện lặp cho đến khi không tìm thấy hai ký tự trắng liên tiếp trong xâu: Thay thế xâu hai ký tự trắng bằng xâu một ký tự trắng.

Mã chương trình:
Program Xoa_trang;

uses crt;

var st: string;

     n:byte;

begin

     clrscr;

     write(‘Nhap xau can chuan hoa: ‘); readln(st);

     n:= Pos(‘  ‘,st);

     while n<>0 do

     begin

     delete(st,n,1);

     n:=Pos(‘  ‘,st);

     end;

     write(st);

     readln

end.

 

Nhận xét: Không dùng biến n chương trình tuy khó theo dõi hơn nhưng đơn giản hơn nhiều:
Thay: n:= Pos(‘  ‘,st);

     while n<>0 do

     begin

     delete(st,n,1);

     n:=Pos(‘  ‘,st);

     end;

Bằng :  while (‘  ‘,st) <>0 do delete(st, Pos(‘  ‘,st),1)

Bài 7.4:

            Viết chương trình cho phép tách phần tên ra khỏi xâu gồm họ và tên. Theo qui ước cách ghi tên của Tiếng việt, tên là từ cuối cùng trong xâu.

Ví dụ: Le Nho Duyet -> Duyet.

a.Hướng dẫn:

Mã chương trình:
Program Tach_Ten;

uses crt;

var st,ten: string;

     vitri,dai,i: byte;

begin

    clrscr;

    write(‘Nhap xau: ‘); readln(st);

    for i:=1 to length(st) do if st[i]=’ ‘ then vitri:=i+1;

    writeln(vitri);

    dai:=length(st) – vitri + 1;

    ten:=Copy(st,vitri,dai);

    write(ten);

    readln

end.

 

Nhận xét: Chương trình trên sẽ chạy sau nếu xâu có ký tự trắng ở cuối xâu (Lúc đó việc xác định vị trí của tên sẽ sai). Để khắc phục lỗi này ta cần thực hiện xoá ký tự trắng ở cuối xâu trước.
Bài 7.5:

            Viết chương trình cho phép dich xâu sang mã moocxo.

a.Hướng dẫn:

Mã chương trình:
Program Mooc_xo;

uses crt;

var st,mooc :string;

    i: byte;

begin

    write(‘Nhap cau bach van: ‘); readln(st);

    for i:=1 to length(st) do

    case st[i] of

    ‘a’: mooc:=mooc + ‘  ‘+’._’;

    ‘b’: mooc:=mooc + ‘  ‘+’_.’;

    end;

    write(mooc);

    readln

end.

 

Nhận xét:
– Đoạn chương trình chỉ mới mã hoá được hai ký tự a, b. Để có thể sử dụng cần khai báo cho các trường hợp còn lại.

– Thực tế không cần phân biệt chữ hoa hay chữ thường nên ta qui về một kiểu. Để qui về kiểu chữ hoa ta dùng case upcase(st[i]) of thay cho case st[i] of…

 

Bài 7.6:

            Viết phần mềm cho phép mã hoá và giải mã một xâu ký tự theo ý riêng. Để mã hoá mỗi người dùng các khoá khác nhau. Ví dụ Khoá a: = succ(a) cho phép mã hoá xâu abc thành bcd.

a.Hướng dẫn:

Mã chương trình:
Program Ma_hoa;

uses crt;

var st: string;

    i: byte;

begin

   clrscr;

   write(‘Nhap xau can ma hoa: ‘);readln(st);

   for i:= 1 to length(st) do st[i]:=succ(st[i]);

   write(‘Sau ma hoa: ‘,st);

   readln;

   for i:= 1 to length(st) do st[i]:=pred(st[i]);

   write(‘Sau giai ma: ‘,st);

   readln;

end.

 

 

Nhận xét: Để mã hoá theo khoá a ->b ta dùng hàm succ, và pred. Nếu khoá là a ->d lúc đó ta dùng đến các hàm cho biết mã ascii của ký tự (ORD) và ký tự có mã (CHR) .
Bài 7.7:

            Viết chương trình cho phép đổi một số hệ thập phân sang số nhị phân.

a.Hướng dẫn:

Mã chương trình:
Program Doi_Ra_Nhi_Phan;

uses crt;

var st,st1: string;

    so: longint;i:byte;

begin

    clrscr;

    write(‘Nhap so can doi: ‘); readln(so);

    st:=”;

    while so > 0 do

    begin

    str(so mod 2,st1);

    st:=st+st1;

    so:=so div 2;

    end;

    for i:=length(st) downto 1 do write(st[i]);

    readln

end.

 

Nhận xét:Chúng ta hoàn toàn có thể thay str(so mod 2,st1);bằng lệnh if so mod 2 = 1 then st:=st+’1’ else st:=st+’0’. Lúc này ta không phải dùng thêm biến phụ st1.
Bài 7.8:

            Viết chương trình rã chữ: Khi cắt khẩu hiệu người ta thường có nhu cầu được biết mỗi ký tự xuất hiện bao nhiêu lần trong câu khẩu hiệu. Hãy viết chương trình thực hiện điều đó.

Ví dụ nhập: LE NHO DUYET

                    Cho biết D: 1; E: 2…

a.Hướng dẫn:

Mã chương trình:
Program Ra_chu;

uses crt;

var st:string;

    M: array[‘A’..’Z’] of byte;

    ch:Char;

    i:byte;

begin

    clrscr;

    writeln(‘CHUONG TRINH RA CHU DE CAT KHAU HIEU’);

    write(‘Nhap cau: ‘);readln(st);

    for i:=1 to length(st) do st[i]:=upcase(st[i]);

    for ch:=’A’ to ‘Z’ do M[ch]:=0;

    for i:=1 to length(st) do

    begin

       ch:=st[i];

       M[ch]:= M[ch]+1;

    end;

    for ch:=’A’ to ‘Z’ do if M[ch]>0 then write(ch,’:’,M[ch],’   ‘);

    readln

end.

 

 

Nhận xét:
Bài 7.9:

            Khi cộng hai số có giá trị quá lớn ta không thể thực hiện được do gới hạn giá trị của biến. Bằng cách sử dụng xâu ký tự, ta có thể lập chương trình cộng hai số rất lớn (255 chữ số). Hãy viết chương trình này.

a.Hướng dẫn:

Mã chương trình:
Program Cong_so_lon;

uses crt;

var so1, so2, tong, st1: string;

    nho, i, chuso1, chuso2, chusoc: byte;

    m:integer;

Procedure Doi_chieu(var so:string);

var i:byte;

    tam: string;

begin

    tam:=”;

    for i:=length(so) downto 1 do tam:=tam+so[i];

    so:=tam;

end;

 

begin

    write(‘Nhap so thu nhat: ‘);readln(so1);

    write(‘Nhap so thu hai: ‘);readln(so2);

    doi_chieu(so1);

    doi_chieu(so2);

    {-Lam cho hai so co do dai giong nhau}

    if length(so1)>length(so2) then

    for i:=1 to length(so1)-length(so2) do so2:=so2 +’0′

    else

    for i:=1 to length(so2)-length(so1) do so1:=so1 +’0′;

    {–Bat dau cong———–}

    nho:=0;

    for i:=1 to length(so1) do

    begin

        val(so1[i],chuso1,m);

        val(so2[i],chuso2,m);   {Doi thanh so de cong}

        chusoc:= (chuso1+chuso2+nho) mod 10;

        nho:= (chuso1+chuso2+nho) div 10;

        str(chusoc,st1);  {Doi thanh ky tu de dua vao tong}

        tong:=tong+st1

    end;

    {Cong them nho cuoi cung}

    if nho>0 then

    begin

         str(nho,st1);

         tong:=tong+st1

    end;

    {—————}

    doi_chieu(tong);

    write(tong);

    readln

end.

 

 

Nhận xét:
Bài 7.10:

            Viết chương trình cho phép ghi bằng chữ một số. Ví dụ: 123.456.789 đọc Một trăm hai mươi ba triệu, bốn trăm năm mươi sáu ngàn, bảy trăm tám mươi chín.

Hướng dẫn:
Mã chương trình:
Program Doc_so;

var n:longint;

Function Dich_1so(n:byte):string;

begin

    case n of

    1: Dich_1so:=’mot’;

    2: Dich_1so:=’hai’;

    3: Dich_1so:=’ba’;

    4: Dich_1so:=’bon’;

    5: Dich_1so:=’nam’;

    6: Dich_1so:=’sau’;

    7: Dich_1so:=’bay’;

    8: Dich_1so:=’tam’;

    9: Dich_1so:=’chin’;

    0: Dich_1so:=’khong’;

    end;

end;

 

Function Dich_3so(n:integer):string;

var Ket_qua: string;

begin

    Ket_qua:=Dich_1so(n div 100) + ‘ tram ‘;

    n:= (n mod 100);

    Ket_qua:=Ket_qua + Dich_1so(n div 10) +’ muoi ‘;

    n:=n mod 10;

    Ket_qua:=Ket_qua + Dich_1so(n);

    Dich_3so:=Ket_qua;

end;

Function Dich_9so(n:longint):string;

var ket_qua: string;

begin

     ket_qua:=”;

     if n div 1000000000 > 0 then  ket_qua:=dich_3so(n div 1000000000) +’ ty, ‘;

     n:=n mod 1000000000;

     if n div 1000000 > 0 then ket_qua:=ket_qua + dich_3so(n div 1000000)+’ trieu, ‘;

     n:=n mod 1000000;

     if n div 1000 > 0 then ket_qua:=ket_qua + dich_3so(n div 1000)+’ ngan, ‘;

     n:=n mod 1000;

     ket_qua:=ket_qua + dich_3so(n);

     Dich_9so:=ket_qua;

end;

{———————-}

begin

     write(‘Nhap so n: ‘); readln(n);

     write(Dich_9so(n));

     readln

end.

 

Nhận xét: Còn rất nhiều trường hợp riêng cần xử lý để đưa đoạn chương trình trên vào sử dụng trong thực tế.
VIII. Dữ liệu kiểu record:

Bài tập 8.1

            Viết chương trình cho phép nhập và in ra một phân số với yêu cầu phân số được lưu trữ trong một biến record.

Hướng dẫn:
            – Khai báo biến Phan_so là một record.

                                                        Phan_so = Record

                                                                                    Tu: Integer.

                                                                                    Mau:Integer;

                                                                              End;

Mã chương trình:
Program Phan_So_1;

uses crt;

var x: record

       Tu: Integer;

       Mau: Integer;

       end;

Begin

    clrscr;

    Write(‘Nhap tu so: ‘);readln(x.Tu);

    Write(‘Nhap mau so: ‘); readln(x.Mau);

    with x do

    begin

    Write(‘Phan so vua nhap la:’,Tu,’/’,Mau);

    end;

    readln

end.

 

 

Nhận xét:
            Khi nhập và khi in phân số ta đã có hai cách truy cập thành phần của record (Ở đây là tử và mầu) khác nhau. Một truy cập trực tiếp, một thông qua lệnh with … do

Bài tập 8.2

            Thực hiện 8.1 với yêu cầu viết hai thủ tục nhập và in phân số.

Hướng dẫn:
Mã chương trình:
Program Phan_So_2;

uses crt;

Type Phan_so = record

                     Tu: Integer;

                     Mau: Integer;

                end;

var x: Phan_so;

Procedure Nhap_Phan_so(Var a:Phan_so);

begin

     with a do

            begin

                 Write(‘Nhap tu so: ‘);readln(Tu);

                 Write(‘Nhap mau so: ‘); readln(Mau);

            end;

end;

{——————-}

Procedure In_Phan_so(a:Phan_so);

Begin

    with x do

    Write(‘Phan so vua nhap la:’,Tu,’/’,Mau);

end;

{——————-}

begin

     clrscr;

     Nhap_Phan_so(x);

     In_Phan_so(x);

     Readln

end.

 

Nhận xét:
            Ở 8.1 ta khai báo một biến có kiểu record. Ở 8.2 ta khai báo một kiểu Phan_so bằng lệnh Type rồi sau đó mới khai báo biến x có kiểu Phan_so.

Bài tập 8.3

            Thực hiện 8.2 với yêu cầu phân số được nhập dạng a/b.

Hướng dẫn:
Mã chương trình:
Program Phan_So_2;

uses crt;

Type Phan_so = record

                     Tu: Integer;

                     Mau: Integer;

                end;

var x: Phan_so;

Procedure Nhap_Phan_so(Var a:Phan_so);

var st,st1:string;

    n,m:integer;

begin

     write(‘Nhap phan so a/b: ‘);readln(st);

     n:= Pos(st,’/’);

     with a do

            begin

                 st1:= copy(st,1,n-1);

                 val(st1,tu,m);

                 st1:= copy(st,n+1,length(st)-n);

                 val(st1,Mau,n);

            end;

end;

{——————-}

Procedure In_Phan_so(a:Phan_so);

Begin

    with x do

    Write(‘Phan so vua nhap la:’,Tu,’/’,Mau);

end;

{——————-}

begin

     clrscr;

     Nhap_Phan_so(x);

     In_Phan_so(x);

     Readln

end.

 

 

Nhận xét:
            Ở đây ta lại được một ứng dụng của kiểu string. Với việc dùng string làm bộ đệm việc nhập phân số dễ, gần với thực tế hơn. Tất nhiên, phải xủ lý nhiều mới được phân số cần nhập.

Bài tập 8.4

            Thực hiện 8.1 với yêu cầu sau khi nhập thực hiện rút gọn rối mới in phân số.

Hướng dẫn:
Mã chương trình:
Program Phan_So_2;

uses crt;

Type Phan_so = record

                     Tu: Integer;

                     Mau: Integer;

                end;

var x: Phan_so;

{———————-}

Function UCLN(a,b:integer):integer;

begin

   if a mod b = 0 then UCLN:=b

   else UCLN:=UCLN(b,(a mod b));

end;

{———————-}

Procedure Nhap_Phan_so(Var a:Phan_so);

var st,st1:string;

    n,m:integer;

begin

     repeat

     write(‘Nhap phan so : ‘);readln(st);

     n:= Pos(‘/’,st);

     until n>0;

     with a do

            begin

                 st1:= copy(st,1,n-1);

                 val(st1,tu,m);

                 st1:= copy(st,n+1,length(st)-n);

                 val(st1,Mau,n);

            end;

end;

{——————-}

Procedure In_Phan_so(a:Phan_so);

Begin

    if a.Tu=a.Mau then write(1)

    else

    with a do

    Write(Tu,’/’,Mau);

end;

{——————-}

Procedure Rut_Gon_Phan_so(var a:Phan_so);

var tam: integer;

begin

     tam:=UCLN(a.Tu,a.Mau);

     with a do

          begin

              Tu:=Tu div tam;

              mau:=Mau div tam;

          end;

end;

{——————–}

begin

     clrscr;

     Nhap_Phan_so(x);

     Rut_gon_phan_so(x);

     write(‘Phan so sau khi rut gon: ‘);

     In_Phan_so(x);

     Readln

 

Nhận xét:
Bài tập 8.5

Viết chương trình cho phép cộng hai phân số với yêu cầu: Mỗi phân số được lưu trong một biến kiểu record.

Hướng dẫn:
Mã chương trình:
Program Phan_So_2;

uses crt;

Type Phan_so = record

                     Tu: Integer;

                     Mau: Integer;

                end;

var x,y,z: Phan_so;

{———————-}

Function UCLN(a,b:integer):integer;

begin

   if a mod b = 0 then UCLN:=b

   else UCLN:=UCLN(b,(a mod b));

end;

{———————-}

Procedure Nhap_Phan_so(Var a:Phan_so);

var st,st1:string;

    n,m:integer;

begin

     repeat

     write(‘Nhap phan so : ‘);readln(st);

     n:= Pos(‘/’,st);

     until n>0;

     with a do

            begin

                 st1:= copy(st,1,n-1);

                 val(st1,tu,m);

                 st1:= copy(st,n+1,length(st)-n);

                 val(st1,Mau,n);

            end;

end;

{——————-}

Procedure In_Phan_so(a:Phan_so);

Begin

    if a.Tu=a.Mau then write(1)

    else

    with a do

    Write(Tu,’/’,Mau);

end;

{——————-}

Procedure Rut_Gon_Phan_so(var a:Phan_so);

var tam: integer;

begin

     tam:=UCLN(a.Tu,a.Mau);

     with a do

          begin

              Tu:=Tu div tam;

              mau:=Mau div tam;

          end;

end;

{——————–}

Procedure Cong_Phan_so(a,b:Phan_so; Var c:Phan_so);

begin

    with c do

         begin

             Tu:=a.Tu*b.Mau + a.Mau*b.Tu;

             Mau:= a.Mau * b.Mau

         end;

    Rut_gon_phan_so(c);

end;

{——————–}

begin

     clrscr;

     Nhap_Phan_so(x);

     Nhap_Phan_so(y);

     Cong_phan_so(x,y,z);

     In_Phan_so(z);

     Readln

end.

 

 

Nhận xét:
Bài tập 8.6

            Viết chương trình cho phép nhập danh sách học viên. Sau khi nhập một học viên chương trình yêu cầu trả lời có nhập tiếp (Y/N). Ấn Y để tiếp tục nhập, ấn N để thôi nhập. Hồ sơ mỗi học viên được quản lý như sau:

Hoso = record

                 Holot: string[20];

                 Ten: string[10];

                 Gioitinh:boolean;

                 Ngaysinh: string[10];

                 SDD: longint;

                 Donvi: string[15];

             end;

 

0

Hướng dẫn:
Mã chương trình:
Program Nhan_su;

uses crt;

type Hoso = record

                 Holot: string[20];

                 Ten: string[10];

                 Gioitinh:boolean;

                 Ngaysinh: string[10];

                 SDD: longint;

                 Donvi: string[15];

             end;

var danhsach: array[1..100] of Hoso;

    nhap:Char;

    gt: string;

    i:byte;

Begin

    nhap:=’Y’;

    i:=0;

    while nhap=’Y’ do

    begin

        clrscr;

        window(10,10,60,40);

        writeln(‘—— NHAP HO SO NHAN SU——-‘);

        writeln;

        i:=i+1;

        writeln(‘Nhap ho so nguoi thu ‘,i,’:’);

        write(‘Ho lot:’);readln(danhsach[i].Holot);

        write(‘Ten:’);readln(danhsach[i].Ten);

        write(‘Gioi tinh (Nam/Nu):’);readln(gt);

        if gt = ‘Nu’ then danhsach[i].Gioitinh:= true;

        write(‘Ngay sinh:’);readln(danhsach[i].Ngaysinh);

        write(‘So dien thoai:’);readln(danhsach[i].SDD);

        write(‘Don vi:’);readln(danhsach[i].Donvi);

        write(‘Nhap tiep Y/N’);readln(nhap);

        nhap:=upcase(nhap);

    end;

end.

 

 

Nhận xét:
Bài tập 8.7

            Viết chương trình cho phép nhập và in danh sách danh sách nữ của lớp với yêu cầu: Sử dụng chương trình con nhập danh sách và chương trình con in một hồ sơ.

Hướng dẫn:
Mã chương trình:
Program Nhan_su;

uses crt;

type Hoso = record

                 Holot: string[20];

                 Ten: string[10];

                 Gioitinh:boolean;

                 Ngaysinh: string[10];

                 SDD: longint;

                 Donvi: string[15];

             end;

Type danhsach = array[1..100] of Hoso;

Var ds: danhsach;

     i:integer;

 

Procedure Nhap_ho_so(Var ds:danhsach);

var nhap:Char;

    i:byte;

    gt: string;

begin

    nhap:=’Y’;

    i:=0;

    while nhap=’Y’ do

    begin

        clrscr;

        writeln(‘—— NHAP HO SO NHAN SU——-‘);

        writeln;

        i:=i+1;

        writeln(‘Nhap ho so nguoi thu ‘,i,’:’);

        write(‘Ho lot:’);readln(ds[i].Holot);

        write(‘Ten:’);readln(ds[i].Ten);

        write(‘Gioi tinh (Nam/Nu):’);readln(gt);

        if gt = ‘Nu’ then ds[i].gioitinh:= true;

        write(‘Ngay sinh:’);readln(ds[i].ngaysinh);

        write(‘So dien thoai:’);readln(ds[i].SDD);

        write(‘Don vi:’);readln(ds[i].Donvi);

        write(‘Nhap tiep Y/N: ‘);readln(nhap);

        nhap:=upcase(nhap);

    end;

 

end;

Procedure In_ho_so(HVien:Hoso);

begin

    with Hvien do

    writeln(‘|’,Holot:20,Ten:10,’|’,Ngaysinh:10,’|’,SDD:10,’|’,Donvi:20,’|’);

end;

 

begin

    nhap_ho_so(ds);

    writeln(‘DANH SACH HOC VIEN NU’);

    writeln;

    i:=1;

    while ds[i].holot<>” do

    begin

        if ds[i].gioitinh then in_ho_so(ds[i]);

        i:=i+1;

    end;

    readln

end.

 

 

Nhận xét:
Bài tập 8.8

            Phát triển thêm chức năng sắp xếp (Theo tên) để chương trình cho phép nhập, sắp xếp, in danh sách.

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 8.9

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 8.10

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
 

 

 

Dữ liệu kiểu tệp:
Bài tập 9.1

            Viết chương trình cho phép ghi các số lẻ xuống đĩa với tên so_le.dat sau đó đọc và xuất ra màn hình nội dung file này.

Hướng dẫn:
– Thủ tục chuẩn bị ghi file xuống đĩa ( assign, rewrite).

– Kiểm tra nếu là số lẻ if i mod 2 = 1 thì ghi xuống đĩa.

– Thủ tục chuẩn bị đọc file từ đĩa ( assign, reset).

– Đọc và in nội dung.

– Đóng file.

Mã chương trình:
Program File_So_le;

uses crt;

var sole: file of integer;

    i,n,so:integer;

begin

    write(‘Nhap n: ‘);readln(n);

    { Thu tuc chuan bi ghi xuong dia}

    assign(sole,’sole.dat’);

    rewrite(Sole);

    {Thuc hien ghi cac so le xuong file sole = sole.dat }

    for i:= 1 to n do if i mod 2 = 1 then write(sole,i);

    close(sole);

    writeln(‘Da ghi xuong file sole.dat’);

    readln;

    {Thu tuc chuan bi doc duw lieu tu file tren dia}

    assign(sole,’sole.dat’);

    reset(sole);

    {Thuc hien do va in ra man hinh}

    while not eof(sole) do

    begin

         read(sole,so);

         write(so,’,  ‘);

    end;

    close(sole);

    readln

end.

 

 

Nhận xét:
Bài tập 9.2.

            Viết chương trình tìm các số nguyên tố nhỏ hơn hoặc bằng n ( nhập từ bàn phím) và ghi các số này xuống đĩa.

Hướng dẫn:
– Hàm nguyen_to để kiểm tra một số a có phải là số nguyên tố không.

– Thực hiện như 9.1 thay if i mod 2 = 1 bằng nguyen_to(n)

Mã chương trình:
Program File_Nguyen_to;

uses crt;

var nguyento: file of integer;

    i,n,so:integer;

{——————–}

Function nguyen_to(a:integer):boolean;

var i: integer;

begin

    nguyen_to:=true;

    for i:=2 to a-1 do if a mod i = 0 then nguyen_to:=false;

end;

{——————–}

begin

    write(‘Nhap n: ‘);readln(n);

    assign(nguyento,’nguyento.dat’);

    rewrite(nguyento);

    for i:= 2 to n do if nguyen_to(i) then write(nguyento,i);

    close(nguyento);

    writeln(‘Da ghi xuong file nguyento.dat’);

    readln;

    assign(nguyento,’nguyento.dat’);

    reset(nguyento);

    while not eof(nguyento) do

    begin

         read(nguyento,so);

         write(so,’,  ‘);

    end;

    readln

end.

 

 

Nhận xét:
Bài tập 9.3

            Viết chương trình thực hiện việc cấp số xe mô tô với yêu cầu:

– Cấp số ngẫu nhiên có 4 chữ số.

– Số đã cấp được lưu lại trên đĩa để quản lý.

Hướng dẫn:
– Dùng hàm random để tạo số ngẫu nhiên.

– Lưu số vừa cấp thêm vào file so_xe.dat.

Mã chương trình:
 

 

Nhận xét:
Bài tập 9.4

– Đọc file so_xe.dat để xét xem số vừa tạo có trong file này không. Nếu đã có thì quay lại tạo số ngẫu nhiên khác. Lặp cho đến khi tạo được số không có trong file này (chưa cấp ) thì cấp số này.

 

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.5

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.6

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.7

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.8

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.9

Hướng dẫn:
Mã chương trình:
 

 

Nhận xét:
Bài tập 9.10

Hướng dẫn:
Mã chương trình: