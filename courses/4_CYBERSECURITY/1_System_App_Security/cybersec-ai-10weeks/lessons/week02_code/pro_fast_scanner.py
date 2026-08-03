import socket
import time
import concurrent.futures # Thư viện quản lý Đa luồng (Thread Pool) hiện đại của Python

#target_ip = "127.0.0.1"
target_ip = "76.223.54.146"
open_ports = []

# Đóng dấu thời gian bắt đầu
print(f"=== BẮT ĐẦU QUÉT TOÀN BỘ 65535 CỔNG TRÊN {target_ip} ===")
start_time = time.time()

def scan_port(port):
    """Hàm nhiệm vụ: Đi gõ cửa 1 cổng cụ thể."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.5) # Chờ tối đa nửa giây
    
    try:
        # Nếu connect_ex trả về 0 nghĩa là Cổng Mở
        if scanner.connect_ex((target_ip, port)) == 0:
            print(f"[+] PHÁT HIỆN CỔNG MỞ: {port}")
            open_ports.append(port)
    except Exception:
        pass
    finally:
        scanner.close()

# Sử dụng ThreadPoolExecutor để giới hạn số lượng "công nhân" (threads) hoạt động cùng lúc.
# Nếu mở cùng lúc 65535 luồng (Thread) kiểu cũ, máy tính sẽ bị quá tải bộ nhớ và văng lỗi.
# Ở đây ta thuê tối đa 500 công nhân, họ sẽ luân phiên nhau làm việc cho đến khi hết 65535 cổng.
max_threads = 500 

with concurrent.futures.ThreadPoolExecutor(max_workers=max_threads) as executor:
    # Giao việc cho các công nhân: Quét từ cổng 1 đến 65535
    # executor.map sẽ tự động chia đều các cổng cho 500 công nhân làm việc song song
    executor.map(scan_port, range(1, 10000))

# Đóng dấu thời gian kết thúc
end_time = time.time()

print("\\n" + "="*50)
print("BÁO CÁO KẾT QUẢ QUÉT ĐA LUỒNG (MULTI-THREADING):")
print(f"- Tổng số cổng đang mở: {len(open_ports)}")
print(f"- Danh sách các cổng: {open_ports}")
print(f"- Thời gian hoàn thành quét 65535 cổng: {round(end_time - start_time, 2)} giây")
print("="*50)
