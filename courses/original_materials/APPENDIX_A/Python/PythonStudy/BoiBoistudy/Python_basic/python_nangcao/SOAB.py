def find_pairs(N):
    ds = []
    for a in range(1,N):
            
        b = N - a
        if (a % b == 0) or (b % a == 0) and (a + b == N):
            ds.append([a,b])
    
    return ds
N = int(input('Nhập vào số n = '))
result = find_pairs(N)
print(result)