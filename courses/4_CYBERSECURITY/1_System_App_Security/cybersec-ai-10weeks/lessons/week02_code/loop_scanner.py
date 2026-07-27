import socket
import time

target_ip = "127.0.0.1"

print(f"=== BẮT ĐẦU QUÉT HỆ THỐNG: {target_ip} ===")
start_time = time.time()

# Quét các cổng phổ biến từ 1 đến 100
for port in range(9990, 10001):
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.1) # Chờ 0.1s mỗi cổng để quét nhanh hơn
    
    result = scanner.connect_ex((target_ip, port))
    if result == 0:
        print(f"[+] PHÁT HIỆN CỔNG MỞ: {port}")
        
    scanner.close()

end_time = time.time()
print(f"Hoàn tất quét trong {round(end_time - start_time, 2)} giây.")
