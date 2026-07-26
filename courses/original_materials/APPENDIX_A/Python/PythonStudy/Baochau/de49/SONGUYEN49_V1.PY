with open('SONGUYEN49.INP', 'r') as file:
    n, k = map(int, file.readline().split())

s = n
temp = n # gán temp = giá trị n
for i in range(k): # lặp i từ 1 đến k
    temp = temp*10 # biến temp = temp*10 theo k
    s += temp # biến s cộng dồn temp
sum = 0  
s = str(s)
for i in range(len(s)):
    sum += int(s[i])
with open('SONGUYEN49.OUT', 'w') as file:
    file.write(str(sum))  
    