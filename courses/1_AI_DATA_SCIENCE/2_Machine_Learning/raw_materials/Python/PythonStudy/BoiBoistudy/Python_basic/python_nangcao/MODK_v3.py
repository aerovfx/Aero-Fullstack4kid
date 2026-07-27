with open('MODK.INP','r') as file:
    n,k,m = map(int, file.readline().split())

dsbandau =  list(range(1, n + 1))
# print(dsbandau)
kq = []
for x in range(0, n-1):
    for i in dsbandau:
        if i % k == x:
            kq.append(i)
            # print(kq)
            

with open('MODK.OUT','w') as file:
    # print(kq[5])
    file.write(str(kq) + '\n')
    file.write(str(kq[m-1]))
