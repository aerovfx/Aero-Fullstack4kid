n=int(input('Nhap so n='))
s=0
for i in range(1,n-1):
    if int(n)%i == 0: s = s + i
if s == n :print(n ,'La so hoan chinh')
else: print(n, 'Khong phai la so hoan chinh')