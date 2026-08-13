{Bài 14: Đếm nguyên âm, số trong một chuỗi
Nhập vào một chuỗi ký tự và kiểm tra xem chuỗi có bao nhiêu nguyên âm, bao nhiêu số?}

uses crt;
var s:string;dem1,dem2,i:byte;
BEGIN
 clrscr;
 write('Nhap 1 chuoi: ');readln(s);
 dem1:=0;dem2:=0;
 for i:=1 to length(s) do
  begin
   if s[i] in ['a','e','i','o','u','y','A','E','I','O','U','Y'] then dem1:=dem1+1;
   if s[i] in ['0','1','2','3','4','5','6','7','8','9'] then dem2:=dem2+1;
  end;
 writeln('Trong chuoi ',s,' co ',dem1,' nguyen am va co ',dem2,' ki tu so');
 readln
END.