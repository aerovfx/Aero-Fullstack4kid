"""
Phase 1 - Host Discovery
Xác định các host đang "sống" trong một dải mạng (subnet) trước khi quét cổng.

Chiến lược:
1. ICMP ping (gọi lệnh `ping` hệ thống qua subprocess - không cần quyền root,
   hoạt động trên cả Linux/macOS/Windows).
2. Nếu ICMP bị chặn (nhiều firewall/host chặn ping), fallback sang TCP ping
   tới vài cổng phổ biến (80, 443, 22) - nếu connect được hoặc bị reset
   (thay vì timeout) thì coi như host sống.
"""

import ipaddress
import platform
import socket
import subprocess
from concurrent.futures import ThreadPoolExecutor, as_completed


def icmp_ping(host: str, timeout: float = 1.0) -> bool:
    """Ping 1 gói ICMP bằng lệnh hệ thống. Trả về True nếu host phản hồi."""
    system = platform.system().lower()
    if system == "windows":
        cmd = ["ping", "-n", "1", "-w", str(int(timeout * 1000)), host]
    else:
        cmd = ["ping", "-c", "1", "-W", str(int(timeout)), host]

    try:
        result = subprocess.run(
            cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=timeout + 1
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def tcp_ping(host: str, ports=(80, 443, 22), timeout: float = 0.6) -> bool:
    """Fallback: thử connect nhanh vài cổng phổ biến để suy luận host sống."""
    for port in ports:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.settimeout(timeout)
                result = s.connect_ex((host, port))
                # 0 = mở, các mã lỗi "connection refused" cũng chứng tỏ host có phản hồi
                if result == 0 or result == 111:
                    return True
        except (socket.timeout, socket.error):
            continue
    return False


def check_host(host: str) -> tuple[str, bool]:
    alive = icmp_ping(host)
    if not alive:
        alive = tcp_ping(host)
    return host, alive


def discover_hosts(cidr: str, max_workers: int = 100) -> list[str]:
    """
    Quét toàn bộ dải mạng CIDR (vd: 192.168.1.0/24) và trả về danh sách
    các IP đang sống.
    """
    network = ipaddress.ip_network(cidr, strict=False)
    hosts = [str(ip) for ip in network.hosts()]

    alive_hosts = []
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(check_host, h): h for h in hosts}
        for future in as_completed(futures):
            host, alive = future.result()
            if alive:
                alive_hosts.append(host)

    # Sắp xếp theo thứ tự IP cho dễ đọc
    alive_hosts.sort(key=lambda ip: ipaddress.ip_address(ip))
    return alive_hosts


if __name__ == "__main__":
    import sys

    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1/32"
    print(f"[*] Dang do host trong dai: {target}")
    found = discover_hosts(target)
    print(f"[+] Tim thay {len(found)} host song:")
    for h in found:
        print(f"    {h}")
