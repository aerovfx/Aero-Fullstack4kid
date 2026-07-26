n = int(input('Nhap so n: '))

while n <= 0:
    n = int(input('Nhap so n: '))

gt = 1

while n > 0:
    gt = gt * n
    n = n - 2

print('Giai thua kep la:', gt)
