program Week07Strings;
uses SysUtils;
var
  text, reversed: string;
  index: integer;
begin
  write('Nhap chuoi: '); readln(text);
  reversed := '';
  for index := length(text) downto 1 do
    reversed := reversed + text[index];
  writeln('Dao nguoc: ', reversed);
  if lowercase(text) = lowercase(reversed) then
    writeln('Day la chuoi doi xung')
  else
    writeln('Khong phai chuoi doi xung');
end.
