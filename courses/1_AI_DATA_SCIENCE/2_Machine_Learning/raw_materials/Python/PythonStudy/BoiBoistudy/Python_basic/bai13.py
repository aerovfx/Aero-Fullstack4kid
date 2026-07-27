import math
s = 0
#Đọc dữ liệu từ file "BAI13.INP":
with open('BAI13.INP', 'r') as file:
    danh_sach = list(map(int, file.readline().split(",")))
for i in danh_sach:
    s += i
    
for i in range(len(danh_sach)):
    kq = s/len(danh_sach)
#Xuất dữ liệu ra file "BAI13.OUT":
with open('BAI13.OUT', 'w') as file:
    file.write(str(kq) + "\n")