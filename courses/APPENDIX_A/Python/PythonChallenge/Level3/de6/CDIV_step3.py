# Dữ liệu đầu vào
n = 6
arr = [12, 5, 6, 4, 7, 10]

# Tìm ước chung của các cặp số và ước chung lớn nhất
max_gcd = 1  # Ước chung lớn nhất ban đầu là 1

for i in range(n):
    for j in range(i+1, n):
        a = arr[i]
        b = arr[j]
        gcd = 1  # Ước chung ban đầu là 1

        # Tìm ước chung lớn nhất
        for k in range(2, min(a, b) + 1):
            if a % k == 0 and b % k == 0:
                gcd = k

        # So sánh và cập nhật ước chung lớn nhất
        if gcd > max_gcd:
            max_gcd = gcd

# In kết quả ước chung lớn nhất
print("Max GCD:", max_gcd)
