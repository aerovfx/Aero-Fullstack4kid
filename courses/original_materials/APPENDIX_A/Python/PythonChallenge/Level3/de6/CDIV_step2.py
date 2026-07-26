# Dữ liệu đầu vào
n = 6
arr = [12, 5, 6, 4, 7, 10]

# Tìm ước chung của các cặp số và in ra
for i in range(n):
    for j in range(i+1, n):
        a = arr[i]
        b = arr[j]
        gcd = 1  # Khởi tạo ước chung ban đầu là 1

        # Tìm ước chung lớn nhất
        for k in range(2, min(a, b) + 1):
            if a % k == 0 and b % k == 0:
                gcd = k

        # In kết quả
        print("Pair:", (a, b), "GCD:", gcd)
