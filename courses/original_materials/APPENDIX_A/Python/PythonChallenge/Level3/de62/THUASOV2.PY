import math

# Hàm tính số lượng ước của n trong đoạn [A, B]
def count_divisors_in_range(n, A, B):
    count = 0
    for x in range(A, B + 1):
        if n % x == 0:
            count += 1
    return count

# Đọc dữ liệu từ file input
with open("THUASO.INP", "r") as file:
    m = int(file.readline().strip())
    prime_factors = []

    for _ in range(m):
        p, k = map(int, file.readline().strip().split())
        prime_factors.append((p, k))

    A1, B1 = map(int, file.readline().strip().split())
    A2, B2 = map(int, file.readline().strip().split())
    A3, B3 = map(int, file.readline().strip().split())

# Tính ước số của n cho mỗi câu hỏi
result1 = count_divisors_in_range(math.prod([p ** k for p, k in prime_factors]), A1, B1)
result2 = count_divisors_in_range(math.prod([p ** k for p, k in prime_factors]), A2, B2)
result3 = count_divisors_in_range(math.prod([p ** k for p, k in prime_factors]), A3, B3)

# Ghi kết quả ra file output
with open("THUASO.OUT", "w") as file:
    file.write(str(result1) + "\n")
    file.write(str(result2) + "\n")
    file.write(str(result3) + "\n")
