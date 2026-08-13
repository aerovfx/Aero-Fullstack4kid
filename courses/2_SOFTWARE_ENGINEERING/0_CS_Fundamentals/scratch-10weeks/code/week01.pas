program Week01InputOutput;
var
  name: string;
  birthYear, age: integer;
begin
  write('Ten cua ban: '); readln(name);
  write('Nam sinh: '); readln(birthYear);
  age := 2026 - birthYear;
  writeln('Xin chao ', name, '! Ban khoang ', age, ' tuoi.');
end.
