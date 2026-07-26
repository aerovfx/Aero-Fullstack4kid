def tim_pt_toi_da(m, n, w, h, a, b):
    # Tạo ma trận tổng tích lũy
    tong_tien_to = [[0] * (n + 1) for _ in range(m + 1)]
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            tong_tien_to[i][j] = tong_tien_to[i][j - 1] +tong_tien_to[i - 1][j] - tong_tien_to[i - 1][j - 1] + a[i - 1] + b[j - 1]

    pt = 0

    # Duyệt qua tất cả các khung hình có kích thước w x h
    for i in range(m - w + 1):
        for j in range(n - h + 1):
            # Tính tổng giá trị của khung hình hiện tại
            reward = tong_tien_to[i + w][j + h] - tong_tien_to[i + w][j] - tong_tien_to[i][j + h] + tong_tien_to[i][j]
            pt = max(pt, reward)

    return pt

# Đọc dữ liệu từ file
with open('bai3.INP', 'r') as f:
    m, n, w, h = map(int, f.readline().split())
    a = list(map(int, f.readline().split()))
    b = list(map(int, f.readline().split()))

# Gọi hàm tìm giá trị lớn nhất và lưu kết quả vào file
pt = tim_pt_toi_da(m, n, w, h, a, b)
with open('bai3.OUT', 'w') as f:
    f.write(str(pt))