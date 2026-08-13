program Week09SortAndSearch;
const
  N = 8;
var
  values: array[1..N] of integer = (9, 2, 7, 1, 5, 3, 8, 4);
  left, right, middle, index, pass, temp, target: integer;
begin
  for pass := 1 to N - 1 do
    for index := 1 to N - pass do
      if values[index] > values[index + 1] then
      begin
        temp := values[index];
        values[index] := values[index + 1];
        values[index + 1] := temp;
      end;
  for index := 1 to N do write(values[index], ' '); writeln;
  target := 7; left := 1; right := N;
  while left <= right do
  begin
    middle := (left + right) div 2;
    if values[middle] = target then begin writeln('Tim thay tai ', middle); halt; end;
    if values[middle] < target then left := middle + 1 else right := middle - 1;
  end;
  writeln('Khong tim thay');
end.
