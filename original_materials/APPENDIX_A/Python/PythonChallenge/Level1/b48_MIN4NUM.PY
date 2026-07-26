# Tìm giá trị nhỏ nhất trong 4 số
a,b,c,d=map(float,input('Nhập a, b, c, d: ').split())
min=a
if b<min: min=b
if c<min: min=c
if d<min: min=d
print('Số nhỏ nhất= {0}'.format(min))