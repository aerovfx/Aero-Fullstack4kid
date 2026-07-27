# Bài 9: Xử lý Tệp tin (File Handling)
# Dùng để đọc danh sách mật khẩu (Wordlist) từ file txt hoặc ghi log kết quả tấn công ra file.

import os

# Đường dẫn file
file_path = "passwords.txt"

print("=== BƯỚC 1: GHI DỮ LIỆU RA FILE ===")
# Hàm open() mở file. Chế độ 'w' (Write) sẽ tạo file mới hoặc ghi đè lên file cũ.
# Dùng cấu trúc 'with' để tự động đóng file sau khi thao tác xong (rất an toàn).
with open(file_path, "w", encoding="utf-8") as file:
    file.write("admin123\n")
    file.write("password\n")
    file.write("12345678\n")
print(f"Đã tạo file {file_path} và ghi 3 mật khẩu vào đó.")

print("\n=== BƯỚC 2: GHI THÊM (APPEND) VÀO FILE ===")
# Chế độ 'a' (Append) dùng để ghi tiếp vào cuối file mà không xoá dữ liệu cũ
with open(file_path, "a", encoding="utf-8") as file:
    file.write("qwerty\n")
print("Đã thêm mật khẩu 'qwerty'.")

print("\n=== BƯỚC 3: ĐỌC DỮ LIỆU TỪ FILE ===")
# Chế độ 'r' (Read) dùng để đọc dữ liệu.
if os.path.exists(file_path): # Kiểm tra xem file có tồn tại không trước khi đọc
    with open(file_path, "r", encoding="utf-8") as file:
        # readlines() đọc toàn bộ file và trả về một danh sách (List) các dòng
        danh_sach_pass = file.readlines() 
        
        print(f"Đã tải {len(danh_sach_pass)} mật khẩu từ Wordlist:")
        for pwd in danh_sach_pass:
            # Dùng .strip() để cắt bỏ ký tự xuống dòng (\n) ở cuối mỗi chữ
            print(f" - Đang thử: {pwd.strip()}")
else:
    print("File không tồn tại!")
