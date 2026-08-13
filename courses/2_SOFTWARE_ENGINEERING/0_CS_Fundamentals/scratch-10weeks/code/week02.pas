program Week02DataAndOperators;
const
  Pi = 3.1415926535;
var
  radius, area, circumference: real;
begin
  write('Ban kinh: '); readln(radius);
  if radius < 0 then
    writeln('Ban kinh khong hop le')
  else
  begin
    area := Pi * sqr(radius);
    circumference := 2 * Pi * radius;
    writeln('Dien tich: ', area:0:2);
    writeln('Chu vi: ', circumference:0:2);
  end;
end.
