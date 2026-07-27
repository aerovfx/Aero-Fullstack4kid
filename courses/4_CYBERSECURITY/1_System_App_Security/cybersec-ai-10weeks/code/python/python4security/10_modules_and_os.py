# Bài 10: Thư viện (Modules) và tương tác Hệ điều hành (OS)
# Python mạnh mẽ vì có các thư viện (module) viết sẵn. 
# Trong bảo mật, thư viện 'os' và 'sys' giúp tương tác trực tiếp với hệ điều hành của máy nạn nhân/máy chủ.

import os
import sys
import platform

print("=== THU THẬP THÔNG TIN HỆ THỐNG (FOOTPRINTING) ===")
# Lấy tên hệ điều hành (Windows, Linux, Darwin/macOS)
os_name = platform.system()
print(f"Hệ điều hành mục tiêu: {os_name}")
print(f"Phiên bản chi tiết: {platform.release()}")

# Lấy thư mục hiện tại mà script đang chạy (Current Working Directory)
current_dir = os.getcwd()
print(f"Thư mục hiện tại: {current_dir}")

print("\n=== THỰC THI LỆNH HỆ THỐNG (COMMAND EXECUTION) ===")
# CẢNH BÁO BẢO MẬT: Hàm os.system() cho phép chạy các lệnh terminal ngay từ bên trong Python.
# Nếu kẻ tấn công chèn được mã độc vào hàm này, họ có thể chiếm quyền kiểm soát hệ thống.
print("Đang thực thi lệnh 'ping' tới localhost (chỉ ping 2 lần):")

if os_name == "Windows":
    # Lệnh ping trên Windows dùng -n
    os.system("ping -n 2 127.0.0.1")
else:
    # Lệnh ping trên Mac/Linux dùng -c
    os.system("ping -c 2 127.0.0.1")

print("\n=== KẾT THÚC KHÓA HỌC PYTHON CƠ BẢN ===")
# Thoát chương trình một cách an toàn bằng sys.exit()
sys.exit(0)
