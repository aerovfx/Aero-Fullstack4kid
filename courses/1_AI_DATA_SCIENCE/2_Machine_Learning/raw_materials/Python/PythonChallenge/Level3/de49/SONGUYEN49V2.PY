with open('SONGUYEN49.INP','r') as file:
    n, k = map(int, file.readline().split())
    s = n
    temp = n
    for i in range(k): 
        temp = temp * 10
        s += temp
    sum = 0
    s = str(s)
    for i in range(len(s)):
        sum += int(s[i])
with open('SONGUYEN49.OUT','w') as file:
    file.write(str(sum))