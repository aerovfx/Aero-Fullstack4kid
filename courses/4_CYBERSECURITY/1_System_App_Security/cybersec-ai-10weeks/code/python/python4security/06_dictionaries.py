# Bài 6: Từ điển (Dictionaries)
# Cực kỳ quan trọng trong bảo mật để lưu trữ dữ liệu dạng Cặp "Khoá - Giá trị" (Key - Value).
# Ví dụ: Tên đăng nhập và Mật khẩu, hoặc IP và Tên máy tính.

# Khai báo Dictionary bằng ngoặc nhọn {}
credentials = {
    "admin": "Admin@123",
    "root": "toor",
    "guest": "123456"
}

print("=== HỆ THỐNG PHÂN TÍCH THÔNG TIN ĐĂNG NHẬP ===")
# Lấy mật khẩu của tài khoản 'root' (truy xuất thông qua Khoá/Key)
print(f"Mật khẩu của root là: {credentials['root']}")

# Thêm một tài khoản mới vào từ điển
credentials["hacker"] = "hacked_you!"
print("Đã thêm user 'hacker'.")

# Sửa mật khẩu của 'guest'
credentials["guest"] = "khong_co_mat_khau"

# Kiểm tra xem một user có tồn tại trong từ điển không
target_user = "admin"
if target_user in credentials:
    print(f"Tài khoản '{target_user}' CÓ trong hệ thống. Mật khẩu: {credentials[target_user]}")
else:
    print("Tài khoản không tồn tại.")

# Duyệt qua tất cả các cặp user-pass bằng hàm items()
print("\nDanh sách toàn bộ User và Pass (Mô phỏng rò rỉ dữ liệu):")
for user, password in credentials.items():
    print(f"User: {user} | Pass: {password}")
