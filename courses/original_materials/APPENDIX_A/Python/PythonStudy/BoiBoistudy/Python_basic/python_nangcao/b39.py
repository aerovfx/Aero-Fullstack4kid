ok = True
n=int(input('Nhap n:'))
for i in range(2,n-1):
    if n%i == 0: ok = False
if ok:print(n,' La so nguyen to')
else :print(n,'Khong la so nguyen to')
