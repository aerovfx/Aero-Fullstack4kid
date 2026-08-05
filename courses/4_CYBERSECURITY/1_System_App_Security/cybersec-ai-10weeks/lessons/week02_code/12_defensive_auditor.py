import socket
import concurrent.futures

COMMON_PORTS = {
    21: "FTP - Truyền file",
    22: "SSH - Quản trị từ xa",
    23: "Telnet - Quản trị từ xa (không an toàn)",
    53: "DNS",
    80: "HTTP - Web Server",
    110: "POP3 - Email",
    139: "NetBIOS",
    143: "IMAP",
    443: "HTTPS - Web Server",
    445: "SMB - Chia sẻ file Windows",
    3306: "MySQL",
    3389: "Remote Desktop",
    5432: "PostgreSQL",
    8080: "HTTP Alternate",
}

TIMEOUT = 0.5

def check_port(ip, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(TIMEOUT)
    try:
        result = sock.connect_ex((ip, port))
        if result == 0:
            return {
                "ip": ip,
                "port": port,
                "service": COMMON_PORTS.get(port, "Không xác định")
            }
    except:
        pass
    finally:
        sock.close()
    return None

def scan_host(ip):
    results = []
    for port in COMMON_PORTS:
        info = check_port(ip, port)
        if info:
            results.append(info)
    return results

if __name__ == "__main__":
    # BẢO MẬT KHÓA HỌC: Công cụ kiểm kê phòng thủ này chỉ quét an toàn trên 127.0.0.1 (Localhost)
    # Tuyệt đối không thay đổi thành IP của mạng Wi-Fi (Ví dụ 192.168.1.x) để đảm bảo tuân thủ tiêu chuẩn an toàn!
    target_ip = "127.0.0.1"

    print(f"Đang kiểm tra an ninh mạng trên thiết bị {target_ip}...\n")

    all_results = scan_host(target_ip)

    print("=" * 60)
    for item in sorted(all_results, key=lambda x: (x["ip"], x["port"])):
        print(f"{item['ip']:15} Port {item['port']:<5} {item['service']}")

    print("\nKhuyến nghị phòng thủ:")
    print("- Đóng Telnet (23) nếu không dùng.")
    print("- Hạn chế SSH (22) chỉ cho máy tin cậy.")
    print("- Kiểm tra SMB (445) nếu không cần chia sẻ file.")
    print("- Không mở Remote Desktop (3389) ra Internet.")
