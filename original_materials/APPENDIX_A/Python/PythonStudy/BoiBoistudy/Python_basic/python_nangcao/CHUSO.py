file = open('CHUSO.INP')
file2 = open('CHUSO.OUT','w')
for test in range(10):
    data = file.readline()
    data = data.split()
    m = int(data[0])
    n = int(data[1])
    k = int(data[2])
    kq = m
    for i in range(n-1):
        kq *= m
        temp =str(kq)
        if len(temp) > k:
            kq = temp[len(temp)-k:]
            kq = int(kq)
    print(kq)
    if test < 9:
        file2.write(str(kq) + '\n')
    else:
        file2.write(str(kq))
file.close()
file2.close()