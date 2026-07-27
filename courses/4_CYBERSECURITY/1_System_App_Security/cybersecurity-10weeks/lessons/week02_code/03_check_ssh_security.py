# 03_check_ssh_security.py

import socket

HOST = "localhost"
PORT = 22

s = socket.socket()
s.connect((HOST, PORT))

banner = s.recv(1024).decode()

print("SSH Banner:")
print(banner)

if "OpenSSH" in banner:
    print("\nKhuyến nghị:")
    print("- Sử dụng SSH Key.")
    print("- Tắt đăng nhập root.")
    print("- Bật Fail2Ban.")
    print("- Cập nhật OpenSSH mới nhất.")