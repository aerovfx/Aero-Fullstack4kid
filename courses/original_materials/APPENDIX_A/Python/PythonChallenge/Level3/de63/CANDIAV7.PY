def count_ways_to_balance_weights(weights):
    n = len(weights)
    
    # Sắp xếp danh sách các quả cân theo thứ tự tăng dần
    weights.sort()
    
    # Tạo một mảng DP để lưu số cách xếp cho mỗi trạng thái (lượng trái, lượng phải, và chỉ số của quả cân đang xem xét)
    dp = [[[0 for _ in range(n + 1)] for _ in range(sum(weights) + 1)] for _ in range(2)]
    
    # Khởi tạo trạng thái ban đầu (không có quả cân)
    dp[0][0][0] = 1
    
    # Lưu trữ các trường hợp xếp cân
    arrangements = []
    
    # Duyệt qua từng quả cân
    for i in range(1, n + 1):
        for left_weight in range(sum(weights) + 1):
            for prev_count in range(i + 1):
                # Số cách xếp khi không sử dụng quả cân thứ i
                dp[i % 2][left_weight][prev_count] = dp[(i - 1) % 2][left_weight][prev_count]
                
                # Số cách xếp khi sử dụng quả cân thứ i
                if prev_count > 0 and left_weight >= weights[i - 1]:
                    dp[i % 2][left_weight][prev_count] += dp[(i - 1) % 2][left_weight - weights[i - 1]][prev_count - 1]
    
    # Duyệt qua các trạng thái và ghi lại các trường hợp xếp cân
    for i in range(2, n + 1, 2):
        left_weight = sum(weights) // 2
        prev_count = i // 2
        arrangements.append(f"{i}. đặt quả cân {i} bên trái rồi quả cân {i - 1} bên trái")
        arrangements.append(f"{i + 1}. đặt quả cân {i} bên trái rồi quả cân {i - 1} bên phải")
        arrangements.append(f"{i + 2}. đặt quả cân {i} bên phải rồi đặt quả cân {i - 1} bên trái")
        arrangements.append(f"{i + 3}. đặt quả cân {i} bên phải rồi đặt quả cân {i - 1} bên phải")
        arrangements.append(f"{i + 4}. đặt quả cân {i - 1} bên trái rồi quả cân {i} bên trái")
        arrangements.append(f"{i + 5}. đặt quả cân {i - 1} bên trái rồi quả cân {i} bên phải")
        arrangements.append(f"{i + 6}. đặt quả cân {i - 1} bên phải rồi đặt quả cân {i} bên trái")
        arrangements.append(f"{i + 7}. đặt quả cân {i - 1} bên phải rồi quả cân {i} bên phải")
    
    # Tổng số cách xếp khi sử dụng tất cả các quả cân
    total_ways = sum(dp[n % 2][left_weight][prev_count] for left_weight in range(sum(weights) + 1))
    print(total_ways)
    return total_ways, arrangements

# Đọc dữ liệu từ người dùng
# Đọc dữ liệu từ file CANDIA.INP
with open("CANDIA.INP", "r") as f:
    n = int(f.readline())
    weights = list(map(int, f.readline().split()))

# Tính và in ra kết quả
result, arrangements = count_ways_to_balance_weights(weights)

# In kết quả ra file "CANDIA.OUT" với encoding là 'utf-8'
with open("CANDIA.OUT", "w", encoding='utf-8') as f:
    arrangement_prefix = "Cách số"
    for i, arrangement in enumerate(arrangements, start=1):
        f.write(f"{i}. {arrangement_prefix} {arrangement}\n")
    f.write(str(result) + "\n")
