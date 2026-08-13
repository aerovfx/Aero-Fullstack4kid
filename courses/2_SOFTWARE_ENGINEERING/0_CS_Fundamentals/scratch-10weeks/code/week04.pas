program Week04ForLoop;
var
  n, value, total: integer;
begin
  write('Nhap n: '); readln(n);
  total := 0;
  writeln('Cac so le:');
  for value := 1 to n do
    if value mod 2 <> 0 then
    begin
      write(value, ' ');
      total := total + value;
    end;
  writeln;
  writeln('Tong so le = ', total);
end.
