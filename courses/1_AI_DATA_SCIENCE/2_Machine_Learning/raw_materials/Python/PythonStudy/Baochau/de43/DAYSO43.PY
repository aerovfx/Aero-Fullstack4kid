def chuoidoixung(n, dayso):# hàm kiểm tra có là chuỗi đối xứng ko
    for i in range(n):
        if dayso[i] == dayso[n-1-i]:
            return 1
        else:
            return 0
    
with open('DAYSO43.INP', 'r') as file:
    n = int(file.readline())
    dayso = list(map(int, file.readline().split()))

with open('DAYSO43.OUT', 'w') as file:
    file.write(str(chuoidoixung(n, dayso)))