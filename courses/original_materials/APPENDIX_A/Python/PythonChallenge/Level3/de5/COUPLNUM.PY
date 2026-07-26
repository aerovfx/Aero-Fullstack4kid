# Lập hàm tìm ước số chung lớn nhất của 2 số.
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a
#lập hàm tìm cặp ước số chung có giá trị nhỏ nhất.
def find_couple_numbers(n):
    max_gcd = 0
    min_a = 0
    for a in range(1, n//2 + 1):
        if n % a == 0:
            b = n - a
            if gcd(a, b) > max_gcd:
                max_gcd = gcd(a, b)
                min_a = a
    return min_a, n - min_a

# Đọc dữ liệu từ file input
with open("COUPLNUM.INP", "r") as file:
    n = int(file.readline())

# Tìm cặp số (a, b)
a, b = find_couple_numbers(n)

# Ghi kết quả vào file output
with open("COUPLNUM.OUT", "w") as file:
    file.write(str(a) + " " + str(b))
