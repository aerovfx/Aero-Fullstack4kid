import socket

# Khai báo mục tiêu an toàn (Luôn là localhost)
#target_ip = "127.0.0.1"
target_ip = "76.223.54.146"


port_to_scan = 9999

# Tạo socket TCP
scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
scanner.settimeout(1) # Chỉ chờ tối đa 1 giây để phản hồi

print(f"Đang gõ cửa cổng {port_to_scan} trên {target_ip}...")

# connect_ex trả về số 0 nếu kết nối thành công (Cổng MỞ)
# Trả về các số khác (ví dụ: 61, 111) nếu Cổng ĐÓNG
result = scanner.connect_ex((target_ip, port_to_scan))

if result == 0:
    print(f"[+] CỔNG {port_to_scan}: MỞ (OPEN)")
else:
    print(f"[-] CỔNG {port_to_scan}: ĐÓNG (CLOSED)")

scanner.close()
