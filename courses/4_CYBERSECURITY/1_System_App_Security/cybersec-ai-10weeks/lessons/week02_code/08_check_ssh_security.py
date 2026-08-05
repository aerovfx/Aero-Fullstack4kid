# 08_check_ssh_security.py
#
# Kiểm tra banner SSH của chính máy mình và in khuyến nghị bảo mật.
# Cổng 22 chỉ mở khi bạn đã bật Remote Login (macOS: System Settings > General
# > Sharing > Remote Login). Nếu đang tắt, script sẽ báo ĐÓNG chứ không lỗi.

import socket

HOST = "127.0.0.1"
PORT = 22

s = socket.socket()
s.settimeout(3)

try:
    s.connect((HOST, PORT))
    banner = s.recv(1024).decode(errors="ignore").strip()

    print("SSH Banner:")
    print(banner if banner else "(dịch vụ mở nhưng không gửi banner)")

    if "OpenSSH" in banner:
        print("\nKhuyến nghị:")
        print("- Sử dụng SSH Key thay cho mật khẩu.")
        print("- Tắt đăng nhập bằng tài khoản root.")
        print("- Bật Fail2Ban để chặn dò mật khẩu.")
        print("- Cập nhật OpenSSH lên bản mới nhất.")

except (ConnectionRefusedError, socket.timeout, OSError):
    print(f"[-] Cổng {PORT} trên {HOST} đang ĐÓNG - máy bạn không chạy dịch vụ SSH.")
    print("    Đây là trạng thái an toàn. Không cần làm gì thêm.")
finally:
    s.close()
