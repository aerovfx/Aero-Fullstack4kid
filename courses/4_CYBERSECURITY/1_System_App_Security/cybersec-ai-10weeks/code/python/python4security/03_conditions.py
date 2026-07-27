# Bài 3: Cấu trúc rẽ nhánh (If - Else)
# Dùng để kiểm tra quyền truy cập hoặc đối chiếu mật khẩu (Access Control).

print("=== HỆ THỐNG ĐĂNG NHẬP ===")
# Giả lập mật khẩu đúng lưu trong cơ sở dữ liệu
correct_password = "SuperSecretPassword123!"

# Lấy mật khẩu do người dùng nhập
user_pass = input("Password: ")

# Lệnh if (nếu) dùng để so sánh 2 giá trị. Ký hiệu == nghĩa là "bằng nhau tuyệt đối"
if user_pass == correct_password:
    print("[+] Đăng nhập thành công! Chào mừng Admin.")
    print("Truy cập hệ thống cấp quyền cao nhất...")
    
# elif (else if - nếu không thì, xét điều kiện khác)
elif user_pass == "admin":
    print("[-] Mật khẩu quá yếu! Hãy đổi mật khẩu ngay lập tức.")
    
# else (nếu tất cả các điều kiện trên đều sai)
else:
    print("[!] CẢNH BÁO: Mật khẩu sai. Ghi log địa chỉ IP kẻ xâm nhập!")
