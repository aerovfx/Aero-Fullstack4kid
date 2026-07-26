fibo = array('i', [1,1])
i = 2
a = 1

while a<n:
    a = fibo[i-1] + fibo[i-2]
    fibo.append(a)
    i += 1