# 06_banner_grabbing.py
import socket

# AN TOÀN: theo quy định của khoá học, chỉ thực hành trên localhost.
# (scanme.nmap.org là host duy nhất trên Internet cho phép quét công khai,
#  nhưng ta vẫn không dùng để giữ đúng nguyên tắc "chỉ quét máy của mình".)
HOST = "127.0.0.1"
PORT = 9002                # cổng lab SSH giả - nhớ chạy 20_lab_target_server.py trước

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