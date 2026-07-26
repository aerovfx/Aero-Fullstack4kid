def find_max_pages(prices, pages, budget):
    n = len(prices)

    # Khởi tạo mảng dp với kích thước (budget + 1)
    dp = [0] * (budget + 1)

    # Duyệt qua từng cuốn sách
    for i in range(n):
        # Duyệt qua các giá trị từ budget đến prices[i] (bước nhảy -1)
        # Dòng lệnh for j in range(budget, prices[i] - 1, -1): có bước nhảy -1 
        # để đảm bảo rằng ta duyệt qua các giá trị của j từ budget cho đến prices[i] 
        # theo thứ tự giảm dần.
        for j in range(budget, prices[i] - 1, -1):
            # Cập nhật giá trị dp[j] bằng cách so sánh pages[i] + dp[j - prices[i]] và dp[j]
            dp[j] = max(pages[i] + dp[j - prices[i]], dp[j])

    # Trả về số trang tối đa có thể mua
    return dp[budget]


# Đọc dữ liệu từ file
with open('BOOKS.INP', 'r') as file:
    n, budget = map(int, file.readline().split())  # Đọc n và ngân sách
    prices = list(map(int, file.readline().split()))  # Đọc giá của các cuốn sách
    pages = list(map(int, file.readline().split()))  # Đọc số trang của các cuốn sách

# Tìm số trang tối đa có thể mua
max_pages = find_max_pages(prices, pages, budget)

# Ghi kết quả vào file
with open('BOOKS.OUT', 'w') as file:
    file.write(str(max_pages))  # Ghi số trang tối đa vào file kết quả
