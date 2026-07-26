def tinh_tong_chu_so(n):
    sum = 0
    n_str = str(n)
    for digit in n_str:
        sum += int(digit)
    return sum

with open('SONGUYEN49.INP', 'r') as file:
    n, k = map(int, file.readline().split())

s = n
temp = n
for i in range(k):
    temp = temp * 10
    s += temp
sum_of_digits = tinh_tong_chu_so(s)


        
    
with open('SONGUYEN49.OUT', 'w') as file:
    file.write(str(sum_of_digits))