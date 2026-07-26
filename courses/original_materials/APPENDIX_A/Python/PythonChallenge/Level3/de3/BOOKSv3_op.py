def find_max_pages(prices, pages, budget):
    n = len(prices)

    # Khởi tạo mảng dp với kích thước (budget + 1)
    dp = [0] * (budget + 1)

    # Duyệt qua từng cuốn sách
    for price, page in zip(prices, pages):
        # Duyệt qua các giá trị từ budget đến price - 1 (bước nhảy -1)
        for j in range(budget, price - 1, -1):
            # Cập nhật giá trị dp[j] bằng cách so sánh page + dp[j - price] và dp[j]
            dp[j] = max(page + dp[j - price], dp[j])

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
