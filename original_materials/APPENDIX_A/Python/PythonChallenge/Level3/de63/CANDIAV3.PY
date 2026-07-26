def count_ways_to_balance_weights(weights):
    n = len(weights)
    
    # Sắp xếp danh sách các quả cân theo thứ tự tăng dần
    weights.sort()
    
    # Tạo một mảng DP để lưu số cách xếp cho mỗi trạng thái (lượng trái, lượng phải, và chỉ số của quả cân đang xem xét)
    dp = [[[0 for _ in range(n + 1)] for _ in range(sum(weights) + 1)] for _ in range(2)]
    
    # Khởi tạo trạng thái ban đầu (không có quả cân)
    dp[0][0][0] = 1
    
    # Duyệt qua từng quả cân
    for i in range(1, n + 1):
        for left_weight in range(sum(weights) + 1):
            for prev_count in range(i + 1):
                # Số cách xếp khi không sử dụng quả cân thứ i
                dp[i % 2][left_weight][prev_count] = dp[(i - 1) % 2][left_weight][prev_count]
                
                # Số cách xếp khi sử dụng quả cân thứ i
                if prev_count > 0 and left_weight >= weights[i - 1]:
                    dp[i % 2][left_weight][prev_count] += dp[(i - 1) % 2][left_weight - weights[i - 1]][prev_count - 1]
    
    # Tổng số cách xếp khi sử dụng tất cả các quả cân
    total_ways = sum(dp[n % 2][left_weight][n // 2] for left_weight in range(sum(weights) + 1))
    
    return total_ways

# Đọc dữ liệu từ người dùng
n = int(input())
weights = list(map(int, input().split()))

# Tính và in ra kết quả
result = count_ways_to_balance_weights(weights)

# In kết quả ra file CANDIA.OUT và in ra màn hình các trường hợp có thể xảy ra
with open("CANDIA.OUT", "w") as f:
    f.write(str(result) + "\n")

print(result)
