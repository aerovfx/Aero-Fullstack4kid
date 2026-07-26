def find_max_pages(prices, pages, budget):
    n = len(prices)

    # Tạo ma trận để lưu số trang tối đa có thể mua cho mỗi tổ hợp giá và ngân sách
    dp = [[0] * (budget + 1) for _ in range(n + 1)]

    #Ví dụ:
    #Nếu n = 3 (có 3 cuốn sách) và budget = 5 (ngân sách là 5), ma trận dp sẽ có kích thước (4 x 6) và được khởi tạo như sau:

    #dp = [
    #    [0, 0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0, 0],
    #    [0, 0, 0, 0, 0, 0]
    #]
    #Mỗi phần tử dp[i][j] trong ma trận dp sẽ lưu trữ số trang tối đa có thể mua cho tổ hợp giá i và ngân sách j.

    # Duyệt qua từng cuốn sách
    for i in range(1, n + 1):
        for j in range(1, budget + 1):
            # Kiểm tra nếu giá của cuốn sách hiện tại nằm trong ngân sách
            if prices[i - 1] <= j:
                # Tính toán số trang tối đa có thể mua bằng cách bao gồm hoặc loại bỏ cuốn sách hiện tại
                dp[i][j] = max(pages[i - 1] + dp[i - 1][j - prices[i - 1]], dp[i - 1][j])
            else:
                # Nếu giá của cuốn sách hiện tại vượt quá ngân sách, loại bỏ nó
                dp[i][j] = dp[i - 1][j]

    return dp[n][budget]

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

""""
budget: ngân sách
price: giá
page: trang
Trong phiên bản code đã chú thích, chúng ta sử dụng quy hoạch động để giải quyết bài toán. 
Chúng ta tạo một ma trận dp để lưu số trang tối đa có thể mua cho mỗi tổ hợp giá và ngân sách.
 Chúng ta duyệt qua từng cuốn sách và tính toán số trang tối đa có thể mua bằng cách bao gồm hoặc 
 loại bỏ cuốn sách hiện tại. Cuối cùng, chúng ta ghi số trang tối đa vào file kết quả.
"""