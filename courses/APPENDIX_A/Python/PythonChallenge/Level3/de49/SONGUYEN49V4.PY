with open('SONGUYEN49.INP','r') as file:
    n,k = map(int, file.readline().split())
def tinh_tong(n):   
    s = n
    temp = n
    for i in range(k):
           temp = temp * 10
           s += temp
    return s
s = tinh_tong(n)
sum = 0
s = str(s)
for i in range(len(s)):
    sum += int(s[i])
tong = tinh_tong(s)
with open('SONGUYEN49.OUT','w') as file:
    file.write(str(sum))