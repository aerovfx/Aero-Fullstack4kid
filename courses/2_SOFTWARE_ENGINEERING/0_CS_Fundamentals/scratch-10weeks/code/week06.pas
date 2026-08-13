program Week06Arrays;
const
  MaxN = 100;
var
  numbers: array[1..MaxN] of integer;
  n, index, maximum, total: integer;
begin
  write('So phan tu (1..100): '); readln(n);
  if (n < 1) or (n > MaxN) then halt(1);
  for index := 1 to n do read(numbers[index]);
  maximum := numbers[1]; total := 0;
  for index := 1 to n do
  begin
    total := total + numbers[index];
    if numbers[index] > maximum then maximum := numbers[index];
  end;
  writeln('Lon nhat = ', maximum);
  writeln('Trung binh = ', total / n:0:2);
end.
