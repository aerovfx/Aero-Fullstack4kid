from math import sqrt
a = input('nhap canh a:')
b = input('nhap canh b:')
c = input('nhap canh c:')
p = (int(a)+int(b)+int(c))/2
print('dien tich la:', sqrt(int(p)*(int(p)-int(a))*(int(p)-int(b))*(int(p)-int(c))))
