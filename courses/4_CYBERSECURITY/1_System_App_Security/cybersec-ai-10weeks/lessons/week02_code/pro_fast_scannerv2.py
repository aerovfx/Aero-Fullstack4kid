import socket
import time
import concurrent.futures 

# 1. THAY ĐỔI QUAN TRỌNG: Đổi thành IP LAN của máy đích
# Ví dụ: "192.168.1.100", "192.168.0.15", v.v.
target_ip = "192.168.1.100" 
open_ports = []

print(f"=== BẮT ĐẦU QUÉT TOÀN BỘ 65535 CỔNG TRÊN {target_ip} ===")
start_time = time.time()

def scan_port(port):
    """Hàm nhiệm vụ: Đi gõ cửa 1 cổng cụ thể."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # Thời gian timeout 0.5s là phù hợp cho mạng LAN nội bộ
    scanner.settimeout(0.5) 
    
    try:
        if scanner.connect_ex((target_ip, port)) == 0:
            print(f"[+] PHÁT HIỆN CỔNG MỞ: {port}")
            open_ports.append(port)
    except Exception:
        pass
    finally:
        scanner.close()

max_threads = 500 

with concurrent.futures.ThreadPoolExecutor(max_workers=max_threads) as executor:
    # 2. THAY ĐỔI QUAN TRỌNG: Sửa lại range để quét đủ 65535 cổng
    executor.map(scan_port, range(1, 65536))

end_time = time.time()

# 3. THAY ĐỔI QUAN TRỌNG: Sắp xếp lại danh sách các cổng từ nhỏ đến lớn
open_ports.sort()

print("\n" + "="*50)
print("BÁO CÁO KẾT QUẢ QUÉT ĐA LUỒNG (MULTI-THREADING):")
print(f"- Tổng số cổng đang mở: {len(open_ports)}")
print(f"- Danh sách các cổng: {open_ports}")
print(f"- Thời gian hoàn thành: {round(end_time - start_time, 2)} giây")
print("="*50)