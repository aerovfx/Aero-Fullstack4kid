# # Bài 1: Biến số và Nhập/Xuất dữ liệu (Variables & I/O)
# # Trong bảo mật, chúng ta thường xuyên phải tương tác với người dùng để lấy thông tin.
# # Khai báo biến (Variable) để lưu trữ một mục tiêu mạng

# target_ip = "192.168.1.10"
# port = 22

# # Hàm print() dùng để xuất thông tin ra màn hình Terminal
# print("=== HỆ THỐNG KIỂM THỬ BẢO MẬT ===")
# print("Đang chuẩn bị quét IP:", target_ip, "trên cổng:", port)

# # Hàm input() dùng để lấy dữ liệu nhập vào từ bàn phím của Hacker/Người dùng
# # Dữ liệu lấy từ input() luôn luôn là một chuỗi văn bản (String)
# username = input("Nhập tài khoản quản trị (admin): ")
# password = input("Nhập mật khẩu: ")

# # Sử dụng f-string (chữ f đặt trước chuỗi) để dễ dàng ghép biến vào câu văn
# print(f"[*] Đang thử đăng nhập vào {target_ip} với tài khoản {username}:{password}")

a = input("Nhập một số nguyên: ")
b = input("Nhập một số nguyên khác: ")  
print("Tổng của hai số là:", int(a) + int(b))  # Chuyển đổi chuỗi sang số nguyên trước khi tính tổng
    