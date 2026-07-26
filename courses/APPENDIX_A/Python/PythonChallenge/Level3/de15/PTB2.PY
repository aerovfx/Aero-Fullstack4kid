import math #de su dung sqrt
#ham giai phuong trinh bac 2 voi 3 tham so a, b, c
def ptb2(a, b, c):
    delta = b ** 2 - 4 * a * c
    if delta < 0:
        return None
    elif delta == 0:
        x = -b / (2 * a)
        return [x]
    else:
        x1 = (-b + math.sqrt(delta)) / (2 * a)
        x2 = (-b - math.sqrt(delta)) / (2 * a)
        return [x1, x2]


# Đọc dữ liệu từ tệp PTB2.INP
with open('PTB2.INP', 'r') as file:
    lines = file.readlines()

# Giải từng phương trình bậc 2 và ghi kết quả vào tệp PTB2.OUT
with open('PTB2.OUT', 'w') as file:
    for line in lines:
        a, b, c = map(int, line.strip().split())
        solutions = ptb2(a, b, c)
        if solutions is None:
            file.write('PTVN\n')
        else:
            file.write('x ')
            for solution in solutions:
                file.write(str(solution) + ' ')
            file.write('\n')
