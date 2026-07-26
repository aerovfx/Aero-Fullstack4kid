{Bài 3: Kiểm tra xem tam giác có cân, vuông không
Viết chương trình nhập vào độ dài các cạnh của tam giác rồi tính chu vi, diện tích, 3 đường cao của tam giác. Kiểm tra xem tam giác đó có phải là tam giác cân hay tam giác vuông không.}
uses crt;
var a,b,c,cv,dt,p:real;
BEGIN
 clrscr;
 write('Nhap do dai canh a: ');readln(a);
 write('Nhap do dai canh b: ');readln(b);
 write('Nhap do dai canh c: ');readln(c);
 cv:=a+b+c;
 p:=(a+b+c)/2;
 dt:=sqrt(p*(p-a)*(p-b)*(p-c));
 writeln('Chu vi tam giac la: ',cv:0:4);
 writeln('Dien tich tam giac la: ',dt:0:4);
 writeln('Duong cao canh thu 1 la: ',dt*2/a:0:4);
 writeln('Duong cao canh thu 2 la: ',dt*2/b:0:4);
 writeln('Duong cao canh thu 3 la: ',dt*2/c:0:4);
 if (a=b) or (a=c) or(b=c) then writeln('Tam giac can');
 if (a*a=b*b+c*c) or (b*b=a*a+c*c) or (c*c=b*b+a*a)then
  writeln('Tam giac vuong');
 readln
END.