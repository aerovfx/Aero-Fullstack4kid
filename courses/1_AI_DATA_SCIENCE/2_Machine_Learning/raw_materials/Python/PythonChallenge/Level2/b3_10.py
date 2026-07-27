n=int(input('Nhap n:'))
for i in range(2,n): 
    ok = True
    for j in range(2,i-1):
        if i%j == 0:ok = False
    if ok : print(i)
    