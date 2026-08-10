"""
Phase 2 - Port Scanner
Quét cổng TCP kiểu "connect scan" (bắt tay 3 bước đầy đủ, không cần quyền root,
khác với SYN scan "half-open" của nmap thật - xem module syn_scanner.py).

Dùng ThreadPoolExecutor để quét song song hàng trăm/nghìn cổng nhanh chóng.
"""

import socket
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import dataclass


@dataclass
class PortResult:
    port: int
    state: str  # "open" | "closed" | "filtered"


def parse_ports(port_spec: str) -> list[int]:
    """
    Hỗ trợ cú pháp giống nmap:
      "22"          -> [22]
      "22,80,443"   -> [22, 80, 443]
      "1-1024"      -> range 1..1024
      "22,80,1000-1010" -> kết hợp
    """
    ports: set[int] = set()
    for part in port_spec.split(","):
        part = part.strip()
        if "-" in part:
            start, end = part.split("-")
            ports.update(range(int(start), int(end) + 1))
        else:
            ports.add(int(part))
    return sorted(ports)


def scan_port(host: str, port: int, timeout: float = 0.8) -> PortResult:
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(timeout)
            result = s.connect_ex((host, port))
            if result == 0:
                return PortResult(port, "open")
            elif result == 111 or result == 61:  # ECONNREFUSED (Linux/macOS)
                return PortResult(port, "closed")
            else:
                return PortResult(port, "filtered")
    except socket.timeout:
        return PortResult(port, "filtered")
    except socket.error:
        return PortResult(port, "filtered")


def scan_ports(host: str, ports: list[int], max_workers: int = 200,
                timeout: float = 0.8, show_progress=False) -> list[PortResult]:
    results: list[PortResult] = []
    total = len(ports)
    done = 0

    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(scan_port, host, p, timeout): p for p in ports}
        for future in as_completed(futures):
            results.append(future.result())
            done += 1
            if show_progress and done % 200 == 0:
                print(f"    ... {done}/{total} cong da quet", flush=True)

    results.sort(key=lambda r: r.port)
    return results


if __name__ == "__main__":
    import sys

    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"
    port_spec = sys.argv[2] if len(sys.argv) > 2 else "1-1024"

    ports = parse_ports(port_spec)
    print(f"[*] Quet {target} tren {len(ports)} cong...")
    results = scan_ports(target, ports, show_progress=True)

    open_ports = [r for r in results if r.state == "open"]
    print(f"\n[+] Tim thay {len(open_ports)} cong mo:")
    for r in open_ports:
        print(f"    {r.port}/tcp\topen")
