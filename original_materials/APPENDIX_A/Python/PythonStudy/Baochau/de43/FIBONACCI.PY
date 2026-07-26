from array import *
n = input('nhập vào số nguyên dương n:')
n = int(n)

fibo = array('i', [1,1])
i = 2
a = 1
while a<n:
    a = fibo[i-2] + fibo[i-1]
    print(a)
    fibo.append(a)
    i += 1
    
if fibo[i-1] == n:
    print('YES')
else:
    print('NO')