print('CHUONG TRINH TIM UCLN CUA HAI SO')
a=int(input('Nhap a:'))
b=int(input('Nhap b:'))
r=a%b
while r <0 or r>0 :
    b=r
    a=b
    r=a%b
print('UCLN CUA HAI SO LA:',b)