file = open('MODK.INP')
file2 = open('MODK.OUT','w')
data = file.readline()
data = data.split()
n = int(data[0])
k = int(data[1])
m = int(data[2])

kq = []
du = 0
i = 0

while i < m + 1:
    num = 0
    while (num * k + du) <= n:
        temp = num * k + du
        kq.append(temp)
        i += 1
        num += 1
        if i > m:
            break
    du += 1

print(kq[-1])
file2.write(str(kq[-1]))

file.close()
file2.close()