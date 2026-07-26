n=input('Nhap so n=')
s=0
for i in range(int(n)):
    for j in range(i): 
        if i %j ==0:s=s+j
        if s == 2*i :print(i)