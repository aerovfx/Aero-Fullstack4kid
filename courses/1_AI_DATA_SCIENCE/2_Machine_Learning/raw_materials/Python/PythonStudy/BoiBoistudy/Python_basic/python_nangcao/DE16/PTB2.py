import math
#Hàm giải pt bậc 2:
def ptb2(a,b,c):
    delta = b**2-4*a*c
    if delta<0:
        return "pt nay vo nghiem"
    elif delta==0:
        x = -b/(2*a)
        return [x]
    else:
        x1 = (-b + math.sqrt(delta)) / (2 * a)
        x2 = (-b - math.sqrt(delta)) / (2 * a)
        return[x1,x2]
    
# Đọc dữ liệu từ file INPUT
with open("PTB2.INP", "r") as file:
    lines = file.readlines()

# Giải từng phương trình bậc 2 và ghi kết quả vào tệp PTB2.OUT
with open('ptb2.out', 'w') as file:
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