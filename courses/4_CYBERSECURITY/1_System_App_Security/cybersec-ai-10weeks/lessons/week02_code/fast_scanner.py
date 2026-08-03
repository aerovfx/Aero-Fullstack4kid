import socket
import threading
import time

target_ip = "127.0.0.1"
open_ports = [] # Danh sách lưu các cổng đang mở

def scan_port(port):
    """Hàm quét 1 cổng duy nhất, sẽ được các công nhân (luồng) gọi."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.5)
    
    try:
        result = scanner.connect_ex((target_ip, port))
        if result == 0:
            print(f"[+] MỞ: Cổng {port}")
            open_ports.append(port)
    except Exception:
        pass # Bỏ qua lỗi
    finally:
        scanner.close()

print(f"=== MULTI-THREAD SCANNER ĐANG CHẠY TRÊN {target_ip} ===")
start_time = time.time()
threads = [] # Danh sách quản lý các công nhân

# Quét 1000 cổng đầu tiên (1 - 1000)
for port in range(1, 1001):
    # Tạo một luồng (thread) mới và giao nhiệm vụ chạy hàm scan_port
    t = threading.Thread(target=scan_port, args=(port,))
    threads.append(t)
    t.start() # Ra lệnh cho công nhân bắt đầu làm việc

# Chờ tất cả công nhân làm việc xong thì mới kết thúc chương trình
for t in threads:
    t.join()

end_time = time.time()
print("\\n" + "="*40)
print(f"BÁO CÁO KẾT QUẢ:")
print(f"- Tổng số cổng mở: {len(open_ports)} {open_ports}")
print(f"- Thời gian hoàn thành: {round(end_time - start_time, 2)} giây")
print("="*40)

# Port 3667: Không phải cổng chuẩn. Thường được các ứng dụng hoặc game sử dụng theo nhu cầu riêng.
# Port 5000: Rất phổ biến.
# Thường dùng cho máy chủ phát triển (ví dụ Flask, ASP.NET, Node.js).
# Có thể được một số dịch vụ UPnP hoặc ứng dụng khác sử dụng.
# Port 7000: Không có dịch vụ chuẩn duy nhất.
# Nhiều ứng dụng doanh nghiệp, máy chủ ứng dụng hoặc phần mềm tùy chỉnh sử dụng.
# Port 7768: Không phải cổng chuẩn, thường do ứng dụng riêng sử dụng.
# Port 9993: Không có dịch vụ Internet chuẩn phổ biến, thường là cổng của ứng dụng hoặc thiết bị cụ thể.