with open('MODK.INP', 'r') as file:
    n,k,m = map(int, file.readline().strip().split())
    print(n,k,m)
    

danhsach1to12 = list(range(1, n+1))
print(danhsach1to12) # [1,2,3,4,5,6,7,8,9,10,11,12]
result = []

for i in range(0, n+1):
    for x in danhsach1to12:
        if x % k == i:
            result.append(x)
    print(result)
        
        
with open('MODK.OUT', 'w') as file:
    file.write(str(result))