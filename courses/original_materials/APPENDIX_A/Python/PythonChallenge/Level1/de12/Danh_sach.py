import math

def can_bac_hai(n):
    n = math.sqrt(n)
    return n

# Đọc dữ liệu từ file "BAI12.INP":
with open('BAI12.INP', 'r') as file:
    danh_sach = list(map(int, file.readline().split(",")))

# Tính căn bậc hai cho từng phần tử trong danh_sách:
for i in range(len(danh_sach)):
    danh_sach[i] = can_bac_hai(danh_sach[i])

# Xuất dữ liệu ra file "BAI12.OUT":
with open('BAI12.OUT', 'w') as file:
    for gia_tri in danh_sach:
        file.write(str(gia_tri) + "\n")
