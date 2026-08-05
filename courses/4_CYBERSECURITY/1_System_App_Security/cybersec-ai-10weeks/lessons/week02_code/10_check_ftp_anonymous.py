# 10_check_ftp_anonymous.py
#
# Kiểm tra máy mình có đang chạy FTP cho phép đăng nhập ẩn danh không.
# FTP ẩn danh nghĩa là AI CŨNG VÀO ĐƯỢC mà không cần mật khẩu - rủi ro rất cao.
#
# AN TOÀN: chỉ kiểm tra chính máy mình (127.0.0.1).

from ftplib import FTP

HOST = "127.0.0.1"

try:
    # timeout để script không treo vô hạn nếu cổng bị firewall nuốt gói tin
    ftp = FTP(HOST, timeout=5)
    ftp.login("anonymous", "anonymous@test.com")

    print("[!] CẢNH BÁO: FTP trên máy bạn CHO PHÉP Anonymous Login!")
    print("    Bất kỳ ai trong mạng cũng vào được. Hãy tắt FTP nếu không dùng.")

    ftp.quit()

except Exception:
    print("[+] Không đăng nhập ẩn danh được (FTP đang tắt, hoặc có yêu cầu mật khẩu).")
    print("    Đây là trạng thái an toàn.")
