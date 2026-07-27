# 01_banner_grabbing.py
import socket

HOST = "scanme.nmap.org"   # hoặc localhost
PORT = 22                  # SSH

try:
    s = socket.socket()
    s.settimeout(5)

    s.connect((HOST, PORT))

    try:
        banner = s.recv(1024).decode()
        print(f"[+] Banner: {banner}")
    except:
        print("[!] Không nhận được banner.")

    s.close()

except Exception as e:
    print(f"Lỗi: {e}")