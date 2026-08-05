import socket
import time
import concurrent.futures

# Đích quét: điền IP LAN của máy đích.
#
# AN TOÀN - ĐỌC KỸ: chỉ được điền IP của MÁY CHÍNH BẠN trong mạng riêng
# ở nhà hoặc phòng lab, và phải được chủ mạng đồng ý. Xem quy trình đầy đủ
# tại huong_dan_lab_2_macbook.md. Quét máy người khác là vi phạm pháp luật.
# Nếu chỉ muốn thử nghiệm một mình, để nguyên "127.0.0.1".
target_ip = "127.0.0.1"  # đổi thành IP LAN máy đích của bạn, vd "192.168.1.100"
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
    # Quét đủ 65535 cổng
    executor.map(scan_port, range(1, 65536))

end_time = time.time()

# Sắp xếp danh sách cổng từ nhỏ đến lớn cho dễ đọc
open_ports.sort()

print("\n" + "="*50)
print("BÁO CÁO KẾT QUẢ QUÉT ĐA LUỒNG (MULTI-THREADING):")
print(f"- Tổng số cổng đang mở: {len(open_ports)}")
print(f"- Danh sách các cổng: {open_ports}")
print(f"- Thời gian hoàn thành: {round(end_time - start_time, 2)} giây")
print("="*50)
