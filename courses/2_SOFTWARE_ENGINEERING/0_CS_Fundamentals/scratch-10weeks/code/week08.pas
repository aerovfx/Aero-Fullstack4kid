program Week08FunctionsAndRecursion;
function GCD(a, b: longint): longint;
begin
  if b = 0 then GCD := abs(a)
  else GCD := GCD(b, a mod b);
end;

function Fibonacci(n: integer): int64;
var
  previous, current, next: int64;
  index: integer;
begin
  previous := 0; current := 1;
  for index := 1 to n do
  begin
    next := previous + current;
    previous := current; current := next;
  end;
  Fibonacci := previous;
end;

begin
  writeln('GCD(84, 30) = ', GCD(84, 30));
  writeln('Fibonacci(20) = ', Fibonacci(20));
end.
