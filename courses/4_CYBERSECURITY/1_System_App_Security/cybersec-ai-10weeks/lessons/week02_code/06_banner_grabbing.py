# 06_banner_grabbing.py
#
# Banner Grabbing: kết nối vào một cổng đang mở và đọc "danh thiếp" mà phần mềm
# đứng sau đó tự giới thiệu. Đây là bước đầu để biết máy đích chạy phần mềm gì,
# phiên bản nào - từ đó tra CVE ở bài 07.
#
# AN TOÀN: theo quy định của khoá học, chỉ thực hành trên localhost.
# CHUẨN BỊ: chạy 20_lab_target_server.py ở terminal khác để có cổng mở.

import socket

HOST = "127.0.0.1"
PORT = 9002        # cổng lab SSH giả

s = socket.socket()
s.settimeout(5)

try:
    s.connect((HOST, PORT))

    try:
        banner = s.recv(1024).decode(errors="ignore").strip()
        print(f"[+] Banner: {banner}" if banner else "[!] Cổng mở nhưng không gửi banner.")
    except socket.timeout:
        print("[!] Cổng mở nhưng im lặng - dịch vụ này chờ client chào trước.")

except ConnectionRefusedError:
    print(f"[-] Cổng {PORT} đang ĐÓNG. Bạn đã chạy 20_lab_target_server.py chưa?")
except OSError as e:
    print(f"[-] Lỗi kết nối: {e}")
finally:
    s.close()
