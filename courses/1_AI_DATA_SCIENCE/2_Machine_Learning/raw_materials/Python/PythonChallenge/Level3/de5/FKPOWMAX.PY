# Hàm tính giai thừa của số n
def factorial(n):
    result = 1
    for i in range(2, n+1):
        result *= i
    return result
# hàm tìm số n! % m^k, trả về kết quả của k.
def find_max_k(n, m):
    k = 0
    while factorial(n) % (m**k) == 0:
        k += 1
    return k - 1

# Đọc dữ liệu từ file input
with open("FKPOWMAX.INP", "r") as file:
    n, m = map(int, file.readline().split())

# Tìm số k lớn nhất
max_k = find_max_k(n, m)

# Ghi kết quả vào file output
with open("FKPOWMAX.OUT", "w") as file:
    file.write(str(max_k))
