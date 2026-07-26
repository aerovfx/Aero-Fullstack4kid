file = open('CHUSO.INP')
file2 = open('CHUSO.OUT', 'w')
for list in range(10):
    data = file.readline()
    data = data.split()
    m = int(data[0])
    n = int(data[1])
    k = int(data[2])
    result = m
    for i in range(n-1):
        result = result * m
        temp = str(result)
        if len(temp) > k:
            result = temp[len(temp)-k:]
            result = int(result)
    if list < 9:
        file2.write(str(result) + '\n')
    else:
        file2.write(str(result))
file.close()
file2.close()