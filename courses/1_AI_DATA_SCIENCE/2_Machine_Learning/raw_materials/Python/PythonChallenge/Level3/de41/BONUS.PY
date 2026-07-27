def find_maximum_reward(m, n, w, h, a, b):
    # Tạo ma trận tổng tích lũy
    prefix_sum = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            prefix_sum[i][j] = prefix_sum[i][j - 1] + prefix_sum[i - 1][j] - prefix_sum[i - 1][j - 1] + a[i - 1] + b[j - 1]

    max_reward = 0

    # Duyệt qua tất cả các khung hình có kích thước w x h
    for i in range(m - w + 1):
        for j in range(n - h + 1):
            # Tính tổng giá trị của khung hình hiện tại
            reward = prefix_sum[i + w][j + h] - prefix_sum[i + w][j] - prefix_sum[i][j + h] + prefix_sum[i][j]
            max_reward = max(max_reward, reward)

    return max_reward

# Đọc dữ liệu từ file
with open('BONUS.INP', 'r') as f:
    m, n, w, h = map(int, f.readline().split())
    a = list(map(int, f.readline().split()))
    b = list(map(int, f.readline().split()))

# Gọi hàm tìm giá trị lớn nhất và lưu kết quả vào file
max_reward = find_maximum_reward(m, n, w, h, a, b)
with open('BONUS.OUT', 'w') as f:
    f.write(str(max_reward))
