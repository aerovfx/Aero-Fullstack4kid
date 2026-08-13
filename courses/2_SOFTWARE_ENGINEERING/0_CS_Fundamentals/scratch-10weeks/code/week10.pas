program Week10StudentManager;
const
  MaxStudents = 50;
type
  Student = record
    name: string;
    score: real;
  end;
var
  students: array[1..MaxStudents] of Student;
  count, index, bestIndex: integer;
  total: real;
begin
  write('So hoc sinh: '); readln(count);
  if (count < 1) or (count > MaxStudents) then halt(1);
  total := 0; bestIndex := 1;
  for index := 1 to count do
  begin
    write('Ten ', index, ': '); readln(students[index].name);
    write('Diem: '); readln(students[index].score);
    total := total + students[index].score;
    if students[index].score > students[bestIndex].score then bestIndex := index;
  end;
  writeln('Diem trung binh: ', total / count:0:2);
  writeln('Cao nhat: ', students[bestIndex].name, ' - ', students[bestIndex].score:0:2);
end.
