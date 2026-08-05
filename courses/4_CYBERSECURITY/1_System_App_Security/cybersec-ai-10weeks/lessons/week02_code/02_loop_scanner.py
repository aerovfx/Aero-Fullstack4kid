import socket
import time

# AN TOÀN: chỉ được quét localhost (xem cảnh báo pháp lý trong week02.md).
target_ip = "127.0.0.1"

print(f"=== BẮT ĐẦU QUÉT HỆ THỐNG: {target_ip} ===")
start_time = time.time()

# Quét từ cổng 1 đến 10000 (bao gồm cả cổng lab 9001-9003)
for port in range(1, 10001):
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.1) # Chờ 0.1s mỗi cổng để quét nhanh hơn

    result = scanner.connect_ex((target_ip, port))
    if result == 0:
        print(f"[+] PHÁT HIỆN CỔNG MỞ: {port}")

    scanner.close()

end_time = time.time()
print(f"Hoàn tất quét trong {round(end_time - start_time, 2)} giây.")
