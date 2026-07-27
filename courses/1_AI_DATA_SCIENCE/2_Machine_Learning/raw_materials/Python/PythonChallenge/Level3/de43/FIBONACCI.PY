def kiem_tra_so_fibonacci(n):
    a, b = 1, 1
    while a < n:
        a, b = b, a + b
    if a == n:
        return "YES"
    else:
        return "NO"

# Nhập số nguyên dương N từ bàn phím
N = int(input("Nhập số nguyên dương N: "))

# Kiểm tra N có phải là số Fibonacci hay không
ket_qua = kiem_tra_so_fibonacci(N)

# In kết quả
print(ket_qua)
