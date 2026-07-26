with open('CHUSO.INP', 'r') as file:
    for list in range(10):
        data = file.readline()
        data = data.split()
        m = int(data[0])
        n = int(data[1])
        k = int(data[2])
    
    
result = m
def tim_so(m,n,k):
    for i in range(n-1):
        result = result * m
        temp = str(result)
        if len(temp) > k:
            result = int(temp[-k:])
            result = int(result)
        return result
    
a = tim_so(m,n,k)
with open('CHUSO.OUT', 'w') as file:
    if list < 9:
        file.write(str(a) + '\n')
    else:
        file.write(str(a))