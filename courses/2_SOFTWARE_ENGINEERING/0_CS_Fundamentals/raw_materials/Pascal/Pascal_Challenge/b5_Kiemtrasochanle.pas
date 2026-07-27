{Bài 5: Kiểm tra số chẵn lẻ, nguyên tố, hoàn hảo
Nhập vào 1 số nguyên gồm 4 chữ số:

Kiểm tra tình chẵn lẻ
Kiểm tra xem có phải là số nguyên tố không
Kiểm tra xem có phải là số hoàn hảo không}

uses crt;
var n,i:integer;ok:boolean;
BEGIN
 clrscr;
 write('Nhap n: ');readln(n);
 if n mod 2=0 then writeln('So ',n,' la so chan')
  else writeln('So ',n,' la so le');
 if n<2 then write('So ',n,' khong la so nguyen to')
 else
  begin
   ok:=true;
   for i:=2 to trunc(sqrt(n)) do
    if n mod i=0 then ok:=false;
   if ok then writeln('So ',n,' la so nguyen to')
    else writeln('So ',n,' khong la so nguyen to');
  end;
 readln
END.