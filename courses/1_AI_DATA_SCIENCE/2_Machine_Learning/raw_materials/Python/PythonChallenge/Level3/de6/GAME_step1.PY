def min_energy_cost(N, K, H):
    # Khởi tạo mảng dp với giá trị ban đầu là vô cùng
    dp = [float('inf')] * N

    # Khởi tạo giá trị đầu tiên
    dp[0] = 0

    # Duyệt qua các ô vuông
    for i in range(1, N):
        # Duyệt qua các ô vuông trước đó có thể nhảy tới
        for j in range(max(0, i - K), i):
            # Tính chi phí năng lượng để di chuyển từ ô j đến ô i
            energy_cost = abs(H[i] - H[j])

            # Cập nhật giá trị dp[i]
            dp[i] = min(dp[i], dp[j] + energy_cost)

    # Trả về giá trị nhỏ nhất tìm được để di chuyển từ ô thứ 1 đến ô thứ N
    return dp[N - 1]

# Dữ liệu đầu vào
N = 5
K = 3
H = [10, 25, 35, 40, 20]

# Gọi hàm để tính giá trị năng lượng nhỏ nhất
min_energy = min_energy_cost(N, K, H)

# In kết quả
print("Chi phí năng lượng thấp nhất:", min_energy)
