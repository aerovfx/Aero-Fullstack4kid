# Hàm tìm ước số chung lớn nhất của hai số a,b
"""def uscln(a,b):
    if (b == 0):
        return a
    return uscln(b, a%b)
"""
import math
# Đọc dữ liệu từ file
with open("CHINHPHUONG.INP","r") as input_file:
    N = int(input_file.readline())
    A = list(map(int, input_file.readline().split()))

# xử lí số P
P = 1
for i in range(N):
    P = P*A[i]//math.gcd(P, A[i])
# Tính phần dư của phép chi P cho 10^9 + 7
result = P ** 2 % (10**9 + 7)

# Ghi dữ liệu ra file
with open("CHINHPHUONG.OUT","w") as output_file:
    output_file.write(str(result))
