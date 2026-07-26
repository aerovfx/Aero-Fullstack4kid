with open('SO45.INP', 'r') as file:
    n,k = map(int, file.read().strip().split())

a = ''   
for i in range(1, n+1): 
    a += str(i)
    
with open('SO45.OUT', 'w') as file:
    file.write(str(a) + '\n')
    if k <= len(a):
        file.write(a[k-1] + '\n')
    else:
        file.write('-1\n')