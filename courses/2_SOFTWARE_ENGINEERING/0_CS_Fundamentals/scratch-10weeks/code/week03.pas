program Week03Conditions;
var
  a, b, c: real;
begin
  write('Nhap ba canh: '); readln(a, b, c);
  if (a <= 0) or (b <= 0) or (c <= 0) or
     (a + b <= c) or (a + c <= b) or (b + c <= a) then
    writeln('Khong phai tam giac')
  else if (a = b) and (b = c) then
    writeln('Tam giac deu')
  else if (a = b) or (a = c) or (b = c) then
    writeln('Tam giac can')
  else
    writeln('Tam giac thuong');
end.
