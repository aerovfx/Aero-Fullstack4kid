def count_ways_to_balance_weights(weights):
    n = len(weights)
    
    # Tạo một mảng dp có kích thước (n+1) x (n+1) x (n+1) để lưu số cách xếp
    dp = [[[0] * (n+1) for _ in range(n+1)] for _ in range(n+1)]
    
    # Ban đầu, có một cách xếp khi không có cân nào
    dp[0][0][0] = 1
    
    for i in range(1, n+1):
        for left in range(n+1):
            for right in range(n+1):
                # Cập nhật dp[i][left][right] bằng tổng của các trường hợp trước đó
                dp[i][left][right] = dp[i-1][left][right]
                
                # Nếu quả cân thứ i được đặt bên trái, cập nhật dp[i][left][right]
                if left >= weights[i-1]:
                    dp[i][left][right] += dp[i-1][left-weights[i-1]][right]
                
                # Nếu quả cân thứ i được đặt bên phải, cập nhật dp[i][left][right]
                if right >= weights[i-1]:
                    dp[i][left][right] += dp[i-1][left][right-weights[i-1]]
    
    # Tổng số cách xếp là dp[n][n//2][n//2] (vì tổng khối lượng bên trái và bên phải bằng nhau)
    total_ways = dp[n][n//2][n//2]
    
    return total_ways

# Đọc dữ liệu từ file
with open("CANDIA.INP", "r") as input_file:
    n = int(input_file.readline())
    weights = list(map(int, input_file.readline().split()))

# Tính số cách xếp
result = count_ways_to_balance_weights(weights)

# In kết quả ra file và các trường hợp thoả mãn
with open("CANDIA.OUT", "w") as output_file:
    output_file.write(str(result) + "\n")
    for i in range(1, n+1):
        for left in range(n+1):
            for right in range(n+1):
                if dp[i][left][right] == 1 and left <= right:
                    output_file.write(f"{i}. đặt quả cân {i} bên trái rồi đặt quả cân {i} bên phải\n")

# In kết quả ra màn hình
print(result)
