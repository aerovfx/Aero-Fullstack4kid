"""
Phase 3 - Service/Version Detection
Với mỗi cổng đang mở, thử "banner grabbing": kết nối rồi đọc dữ liệu server
tự gửi (SSH, FTP, SMTP...) hoặc chủ động gửi probe nhẹ (HTTP HEAD) rồi đọc
response để suy luận dịch vụ + phiên bản.
"""

import socket
from dataclasses import dataclass

# Cổng phổ biến -> tên dịch vụ mặc định (dùng khi banner rỗng)
COMMON_PORTS = {
    21: "ftp", 22: "ssh", 23: "telnet", 25: "smtp", 53: "dns",
    80: "http", 110: "pop3", 143: "imap", 443: "https",
    3306: "mysql", 3389: "rdp", 5432: "postgresql", 6379: "redis",
    8080: "http-proxy", 27017: "mongodb",
}

# Probe chủ động cho các dịch vụ không tự gửi banner (vd HTTP)
ACTIVE_PROBES = {
    80: b"HEAD / HTTP/1.0\r\nHost: probe\r\n\r\n",
    8080: b"HEAD / HTTP/1.0\r\nHost: probe\r\n\r\n",
    443: None,  # TLS - cần bắt tay SSL riêng, bỏ qua ở bản đơn giản này
}


@dataclass
class ServiceInfo:
    port: int
    service: str
    banner: str


def grab_banner(host: str, port: int, timeout: float = 1.5) -> ServiceInfo:
    service_guess = COMMON_PORTS.get(port, "unknown")
    banner = ""

    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(timeout)
            s.connect((host, port))

            # Một số service (SSH, FTP, SMTP) tự gửi banner ngay khi connect
            try:
                s.settimeout(0.8)
                data = s.recv(1024)
                if data:
                    banner = data.decode(errors="ignore").strip()
            except socket.timeout:
                pass

            # Nếu chưa có banner và có probe chủ động cho cổng này -> gửi thử
            if not banner and port in ACTIVE_PROBES and ACTIVE_PROBES[port]:
                s.sendall(ACTIVE_PROBES[port])
                s.settimeout(1.0)
                try:
                    data = s.recv(2048)
                    if data:
                        banner = data.decode(errors="ignore").strip().split("\r\n")[0]
                except socket.timeout:
                    pass
    except (socket.timeout, socket.error, ConnectionRefusedError):
        pass

    # Suy luận thêm service từ nội dung banner nếu có
    if banner:
        low = banner.lower()
        if "ssh" in low:
            service_guess = "ssh"
        elif "ftp" in low:
            service_guess = "ftp"
        elif "http" in low:
            service_guess = "http"
        elif "smtp" in low or "mail" in low:
            service_guess = "smtp"

    return ServiceInfo(port=port, service=service_guess, banner=banner[:120])


def detect_services(host: str, open_ports: list[int]) -> list[ServiceInfo]:
    return [grab_banner(host, p) for p in open_ports]


if __name__ == "__main__":
    import sys

    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
    ports = [int(p) for p in sys.argv[2].split(",")] if len(sys.argv) > 2 else [22, 80]

    for info in detect_services(target, ports):
        print(f"{info.port}/tcp\t{info.service}\t{info.banner}")
