# Tạo hàm tìm ước số chung lớn nhất
def find_gcd(a, b):
    while b != 0:
        a, b = b, a % b # Phép gán a cho b và b cho phần dư của a chia b
    return a

# Nhập giá trị của a và b từ bàn phím
a = int(input("Nhập số nguyên a: "))
b = int(input("Nhập số nguyên b: "))

# Tìm ước số chung lớn nhất của a và b
gcd = find_gcd(abs(a), abs(b))

# In kết quả
print("Ước số chung lớn nhất của", a, "và", b, "là:", gcd)
