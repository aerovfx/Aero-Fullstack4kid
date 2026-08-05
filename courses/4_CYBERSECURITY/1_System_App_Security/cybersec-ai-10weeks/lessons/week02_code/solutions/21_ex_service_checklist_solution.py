"""ĐÁP ÁN - Bài tập 1: Checklist dịch vụ."""

import socket

target_ip = "127.0.0.1"

COMMON_PORTS = {
    21: "FTP - Truyền file",
    22: "SSH - Quản trị từ xa",
    23: "Telnet - Lỗi thời, rất nguy hiểm",
    80: "HTTP - Web Server",
    443: "HTTPS - Web Server bảo mật",
    3306: "MySQL - Cơ sở dữ liệu",
    5432: "PostgreSQL - Cơ sở dữ liệu",
    9001: "Cổng lab (FTP giả)",
    9002: "Cổng lab (SSH giả)",
    9003: "Cổng lab (HTTP giả)",
}

open_count = 0

print(f"=== CHECKLIST DỊCH VỤ TRÊN {target_ip} ===\n")

for port, service_name in COMMON_PORTS.items():
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(0.5)

    result = scanner.connect_ex((target_ip, port))
    if result == 0:
        print(f"[+] MỞ   - Cổng {port:<5} | {service_name}")
        open_count += 1
    else:
        print(f"[-] ĐÓNG - Cổng {port:<5} | {service_name}")

    scanner.close()

print(f"\nTổng kết: {open_count}/{len(COMMON_PORTS)} cổng đang mở.")
