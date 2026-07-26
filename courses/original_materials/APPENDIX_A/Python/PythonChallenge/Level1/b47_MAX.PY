# Tìm giá trị lớn nhất trong 3 số
a,b,c=map(float,input('Nhập a, b, c: ').split())
max=a
if b>max: max=b
if c>max: max=c
print('So lon nhat= {0}'.format(max))