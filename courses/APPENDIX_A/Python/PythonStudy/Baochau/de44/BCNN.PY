def ucln(a,b):
    while b != 0:
        a, b = b, a%b
    return a

def bcnn(a,b):
    return a * b // ucln(a,b)


with open('BCNN.INP', 'r') as file:
    a,b = map(int, file.readline().split())
    
bc = bcnn(a,b)
with open('BCNN.OUT', 'w') as file:
    file.write(str(bc) + '\n')
    
uc = ucln(a,b)
with open('BCNN.OUT', 'w') as file:
    file.write(f'{a // uc} {b // uc}')