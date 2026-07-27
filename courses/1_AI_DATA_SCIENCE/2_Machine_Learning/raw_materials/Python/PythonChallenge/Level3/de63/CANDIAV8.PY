def count_ways_to_balance(n, weights):
    total_weight = sum(weights)
    
    # Tạo một bảng DP với các hàng là tổng khối lượng bên trái và các cột là chỉ số của quả cân
    dp = [[0] * (n + 1) for _ in range(total_weight + 1)]

    # Khởi tạo giá trị ban đầu: có 1 cách xếp khi không có quả cân nào
    dp[0][0] = 1
    count =0
    # Điền bảng DP
    for weight in range(1, total_weight + 1):
        for i in range(1, n):
            # Không đặt quả cân thứ i lên đĩa trái
            dp[weight][i] = dp[weight][i - 1]

            # Nếu khối lượng bên trái lớn hơn hoặc bằng khối lượng bên phải
            if weight >= weights[i - 1]:
                count += 1

    # Kết quả là giá trị nằm ở dòng cuối cùng, cột n
    result = dp[total_weight // 2][n]

    return count

# Đọc dữ liệu từ file CANDIA.INP
with open("CANDIA.INP", "r") as f:
    n = int(f.readline())
    weights = list(map(int, f.readline().split()))

# Tính số cách xếp
result = count_ways_to_balance(n, weights)

# In kết quả
print(result)
