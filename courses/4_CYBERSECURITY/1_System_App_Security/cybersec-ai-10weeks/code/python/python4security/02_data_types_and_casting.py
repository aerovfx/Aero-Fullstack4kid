# Bài 2: Kiểu dữ liệu và Ép kiểu (Data Types & Casting)
# Xử lý địa chỉ IP và Port đòi hỏi sự chính xác về kiểu dữ liệu.

# 1. Chuỗi văn bản (String - str): Thường dùng để lưu địa chỉ IP hoặc tên miền
ip_address = "10.0.0.5"
domain = "google.com"

# 2. Số nguyên (Integer - int): Thường dùng để lưu số cổng (Port)
# Lưu ý: Port là số, không có dấu ngoặc kép
http_port = 80
ssh_port = 22

# 3. Số thực (Float - float): Lưu thời gian trễ (timeout) hoặc phiên bản phần mềm
timeout_seconds = 2.5

# 4. Kiểu luận lý (Boolean - bool): Chỉ có True (Đúng) hoặc False (Sai)
is_vulnerable = True # Máy chủ có lỗ hổng không?

print(f"Mục tiêu {ip_address} mở cổng {http_port}. Lỗ hổng: {is_vulnerable}")

# --- ÉP KIỂU (Casting) ---
# Khi người dùng nhập số cổng từ bàn phím, nó là Chuỗi (String)
user_input_port = input("Nhập cổng muốn quét (vd: 443): ") # Ví dụ nhập "443"

# Nếu chúng ta muốn làm toán (vd cộng thêm 1) với Port này, ta phải ép nó về số nguyên (int)
real_port = int(user_input_port)
print(f"Cổng tiếp theo sẽ quét là: {real_port + 1}")
