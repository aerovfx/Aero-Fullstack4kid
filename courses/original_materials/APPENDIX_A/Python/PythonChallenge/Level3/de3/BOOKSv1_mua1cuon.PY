# Đọc dữ liệu từ file
with open('BOOKS.INP', 'r') as file:
    n, x = map(int, file.readline().split())  # Đọc n và x từ dòng đầu tiên
    prices = list(map(int, file.readline().split()))  # Đọc giá của các cuốn sách
    pages = list(map(int, file.readline().split()))  # Đọc số trang của các cuốn sách

# Khởi tạo biến
max_pages = 0  # Số trang sách tối đa mà Nam có thể mua
current_price = 0  # Tổng giá của các cuốn sách đã mua

# Duyệt qua các cuốn sách
for i in range(n):
    if current_price + prices[i] <= x:  # Nếu tổng giá sách đã mua cộng với giá sách hiện tại không vượt quá số tiền tối đa
        current_price += prices[i]  # Cộng dồn giá sách đã mua
        max_pages += pages[i]  # Cộng dồn số trang sách đã mua

# Ghi kết quả vào file
with open('BOOKS.OUT', 'w') as file:
    file.write(str(max_pages))  # Ghi số trang sách tối đa mà Nam có thể mua vào file
