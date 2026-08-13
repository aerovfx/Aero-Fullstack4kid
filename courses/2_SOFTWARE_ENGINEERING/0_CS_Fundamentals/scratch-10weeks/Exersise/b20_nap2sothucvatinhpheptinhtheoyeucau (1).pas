{Bài 20: Nhập 2 số thực và tính phép tính theo yêu cầu
Viết chương trình nhập hai số thực. Sau đó hỏi phép tính muốn thực hiện và in kết quả của phép tính đó.

Nếu là "+", in tổng hai số lên màn hình.
Nếu là "-", in hiệu hai số lên màn hình.
Nếu là "/", in thương hai số lên màn hình.
Nếu là "*", in tích hai số lên màn hình.}

Uses Crt;   
Var a, b, kq: Real; Pt: Char; 
  BEGIN
    Clrscr; 
    Write ('a ='); Readln(a); 
    Write ('b ='); Readln(b); 
    Write ('Phep tinh thuc hien la (+ - * /): '); 
    Readln(Pt); 
    If Pt = '+’ Then kq := a + b; 
    If Pt = '-’ Then kq :=  a - b; 
    If Pt = '*’ Then kq := a * b; 
    If Pt = '/’  Then kq := a / b; 
    Write (a, pt, b, '=', kq); 
    Readln;   
END.

