import math

# Hàm kiểm tra số nguyên tố
def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(math.sqrt(num)) + 1):
        if num % i == 0:
            return False
    return True

# Đọc dữ liệu vào
t = int(input())
queries = []
for _ in range(t):
    n = int(input())
    queries.append(n)

# Giải từng truy vấn
for query in queries:
    p = int(math.sqrt(query))
    while True:
        if is_prime(p) and is_prime(p + 2) <= query:
            extra_bricks = p * (p + 2) - query
            print(extra_bricks)
            break
        p -= 1
