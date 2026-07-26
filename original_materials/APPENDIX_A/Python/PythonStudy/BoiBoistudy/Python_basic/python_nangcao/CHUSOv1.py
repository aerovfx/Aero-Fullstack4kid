with open("CHUSO.INP", "r") as file:
    lines = file.readlines()
def chuso(m,n,k): 
    kq = m
    for i in range(n-1):
        kq *= m
        temp = str(kq)
        if len(temp) > k:
            kq = int(temp[-k:])
    return kq
s = []
for line in lines:
    data = line.split()
    m, n, k = map(int, data)
    modulo = 10 ** k
    kq = chuso(m,n,k)
    s.append(str(kq).zfill(k) + '\n')


with open('CHUSO.OUT','w') as file:
    file.writelines(s)
