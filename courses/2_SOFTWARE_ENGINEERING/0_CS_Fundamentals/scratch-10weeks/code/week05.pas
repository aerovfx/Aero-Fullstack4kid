program Week05NumberAlgorithms;
var
  a, b, temp: longint;
begin
  write('Nhap hai so nguyen duong: '); readln(a, b);
  a := abs(a); b := abs(b);
  while b <> 0 do
  begin
    temp := a mod b;
    a := b;
    b := temp;
  end;
  writeln('UCLN = ', a);
end.
