#!/usr/bin/env bash
#
# nmap.sh - Cong cu quet mang toi gian kieu nmap (self-contained)
# ==================================================================
# CHI SU DUNG TREN HE THONG/MANG BAN SO HUU HOAC DA DUOC CAP PHEP RO RANG.
# Quet cong/mang trai phep co the vi pham phap luat (Luat An ninh mang VN,
# CFAA o Hoa Ky, v.v).
#
# Script nay nhung toan bo logic Python vao 1 file bash duy nhat:
#   Phase 1: Host Discovery   (ICMP + TCP ping fallback)
#   Phase 2: Port Scanner     (TCP connect scan mac dinh, hoac SYN scan
#                              voi --scan-type syn - can root + scapy)
#   Phase 3: Service Detect   (banner grabbing)
#   Phase 4: Output           (table / json / csv)
#
# Chi can Python 3 (>=3.9) co san. SYN scan (--scan-type syn) can them:
#   pip install scapy
# va chay voi quyen root. Neu thieu dieu kien, script se tu dong fallback
# ve connect scan va bao loi ro rang, khong bi crash.
#
# Vi du dung:
#   ./nmap.sh -t 192.168.1.10 -p 1-1024
#   ./nmap.sh -t 192.168.1.0/24 --discover-only
#   ./nmap.sh -t 192.168.1.10 -p 22,80,443 -o json --out result.json
#   sudo ./nmap.sh -t 192.168.1.10 -p 1-1024 --scan-type syn
#
set -euo pipefail

# --- Kiem tra Python 3 co san ---
if command -v python3 >/dev/null 2>&1; then
    PYBIN=python3
elif command -v python >/dev/null 2>&1; then
    PYBIN=python
else
    echo "[!] Khong tim thay Python 3. Vui long cai dat Python 3 truoc khi chay." >&2
    exit 1
fi

# --- Nhung script Python va chay, truyen nguyen doi so dong lenh ("$@") ---
exec "$PYBIN" - "$@" <<'''PYTHON_EOF'''
#!/usr/bin/env python3
"""
mini_nmap - Cong cu quet mang toi gian kieu nmap (ban gop 1 file)
====================================================================
CHI SU DUNG TREN HE THONG/MANG BAN SO HUU HOAC DA DUOC CAP PHEP RO RANG.
Quet cong/mang trai phep co the vi pham phap luat.

Gom du 4 phase chinh trong 1 file duy nhat:
  Phase 1: Host Discovery   (ICMP ping + TCP ping fallback)
  Phase 2: Port Scanner     (TCP connect scan, da luong)
  Phase 3: Service Detect   (banner grabbing)
  Phase 4: Output           (table / json / csv)

Chi dung thu vien chuan Python, khong can cai dat gi them.
"""

import argparse
import csv
import ipaddress
import json
import os
import platform
import socket
import subprocess
import sys
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from dataclasses import asdict, dataclass

try:
    from scapy.all import IP, TCP, sr1, RandShort
    SCAPY_AVAILABLE = True
except ImportError:
    SCAPY_AVAILABLE = False


# ============================================================
# PHASE 1 - HOST DISCOVERY
# ============================================================

def icmp_ping(host: str, timeout: float = 1.0) -> bool:
    """Ping 1 goi ICMP bang lenh he thong. Tra ve True neu host phan hoi."""
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
    """Fallback: thu connect nhanh vai cong pho bien de suy luan host song."""
    for port in ports:
        try:
            with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
                s.settimeout(timeout)
                result = s.connect_ex((host, port))
                if result == 0 or result == 111:
                    return True
        except (socket.timeout, socket.error):
            continue
    return False


def check_host(host: str) -> tuple:
    alive = icmp_ping(host)
    if not alive:
        alive = tcp_ping(host)
    return host, alive


def discover_hosts(cidr: str, max_workers: int = 100) -> list:
    network = ipaddress.ip_network(cidr, strict=False)
    hosts = [str(ip) for ip in network.hosts()]
    alive_hosts = []
    with ThreadPoolExecutor(max_workers=max_workers) as executor:
        futures = {executor.submit(check_host, h): h for h in hosts}
        for future in as_completed(futures):
            host, alive = future.result()
            if alive:
                alive_hosts.append(host)
    alive_hosts.sort(key=lambda ip: ipaddress.ip_address(ip))
    return alive_hosts


# ============================================================
# PHASE 2 - PORT SCANNER
# ============================================================

@dataclass
class PortResult:
    port: int
    state: str  # "open" | "closed" | "filtered"


def parse_ports(port_spec: str) -> list:
    ports = set()
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
            elif result == 111 or result == 61:  # ECONNREFUSED
                return PortResult(port, "closed")
            else:
                return PortResult(port, "filtered")
    except socket.timeout:
        return PortResult(port, "filtered")
    except socket.error:
        return PortResult(port, "filtered")


def scan_ports(host: str, ports: list, max_workers: int = 200,
                timeout: float = 0.8, show_progress: bool = False) -> list:
    results = []
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


# ============================================================
# PHASE 6 - SYN SCAN ("half-open scan", tuy chon, can root + scapy)
# ============================================================
# Khac voi Phase 2 (TCP connect scan - bat tay 3 buoc day du), SYN scan chi
# gui goi SYN va doc phan hoi SYN-ACK/RST ma KHONG hoan tat bat tay -> nhanh
# hon va it de lai log ket noi day du tren server dich (giong "-sS" cua
# nmap that). Can quyen root/administrator (raw socket) va thu vien scapy.

@dataclass
class SynResult:
    port: int
    state: str


def syn_scan_port(host: str, port: int, timeout: float = 1.0) -> SynResult:
    src_port = RandShort()
    packet = IP(dst=host) / TCP(sport=src_port, dport=port, flags="S")
    response = sr1(packet, timeout=timeout, verbose=0)

    if response is None:
        return SynResult(port, "filtered")

    if response.haslayer(TCP):
        flags = response.getlayer(TCP).flags
        if flags == 0x12:  # SYN-ACK -> open
            rst_packet = IP(dst=host) / TCP(sport=src_port, dport=port, flags="R")
            sr1(rst_packet, timeout=0.5, verbose=0)
            return SynResult(port, "open")
        elif flags == 0x14:  # RST-ACK -> closed
            return SynResult(port, "closed")

    return SynResult(port, "filtered")


def syn_scan(host: str, ports: list, timeout: float = 1.0) -> list:
    """
    LUU Y: scapy khong thread-safe hoan toan o tang socket, nen chay tuan
    tu tung cong thay vi da luong nhu Phase 2.
    """
    results = [syn_scan_port(host, p, timeout) for p in ports]
    return sorted(results, key=lambda r: r.port)


def check_syn_prerequisites() -> str:
    """Tra ve chuoi loi neu thieu dieu kien cho SYN scan, rong neu OK."""
    if not SCAPY_AVAILABLE:
        return ("Thieu thu vien 'scapy'. Cai dat bang: pip install scapy\n"
                "    (hoac: pip install scapy --break-system-packages)")
    if os.name != "nt" and hasattr(os, "geteuid") and os.geteuid() != 0:
        return "SYN scan can quyen root. Chay lai voi: sudo ./nmap.sh ... --scan-type syn"
    return ""


# ============================================================
# PHASE 3 - SERVICE / VERSION DETECTION
# ============================================================

COMMON_PORTS = {
    21: "ftp", 22: "ssh", 23: "telnet", 25: "smtp", 53: "dns",
    80: "http", 110: "pop3", 143: "imap", 443: "https",
    3306: "mysql", 3389: "rdp", 5432: "postgresql", 6379: "redis",
    8080: "http-proxy", 27017: "mongodb",
}

ACTIVE_PROBES = {
    80: b"HEAD / HTTP/1.0\r\nHost: probe\r\n\r\n",
    8080: b"HEAD / HTTP/1.0\r\nHost: probe\r\n\r\n",
    443: None,
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
            try:
                s.settimeout(0.8)
                data = s.recv(1024)
                if data:
                    banner = data.decode(errors="ignore").strip()
            except socket.timeout:
                pass
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


def detect_services(host: str, open_ports: list) -> list:
    return [grab_banner(host, p) for p in open_ports]


# ============================================================
# PHASE 4 - OUTPUT
# ============================================================

@dataclass
class ScanRecord:
    host: str
    port: int
    state: str
    service: str
    banner: str


def print_table(records: list) -> None:
    if not records:
        print("[!] Khong co ket qua nao de hien thi.")
        return
    col_port = max(len("PORT"), max(len(f"{r.port}/tcp") for r in records))
    col_state = max(len("STATE"), max(len(r.state) for r in records))
    col_service = max(len("SERVICE"), max(len(r.service) for r in records))
    header = f"{'PORT'.ljust(col_port)}  {'STATE'.ljust(col_state)}  {'SERVICE'.ljust(col_service)}  BANNER"
    print(header)
    print("-" * len(header))
    current_host = None
    for r in records:
        if r.host != current_host:
            current_host = r.host
            print(f"\nHost: {current_host}")
        line = (
            f"{f'{r.port}/tcp'.ljust(col_port)}  "
            f"{r.state.ljust(col_state)}  "
            f"{r.service.ljust(col_service)}  "
            f"{r.banner}"
        )
        print(line)


def export_json(records: list, path: str) -> None:
    with open(path, "w", encoding="utf-8") as f:
        json.dump([asdict(r) for r in records], f, ensure_ascii=False, indent=2)


def export_csv(records: list, path: str) -> None:
    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=["host", "port", "state", "service", "banner"])
        writer.writeheader()
        for r in records:
            writer.writerow(asdict(r))


# ============================================================
# CLI / MAIN
# ============================================================

def is_network_range(target: str) -> bool:
    return "/" in target


def build_arg_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="nmap.sh",
        description="mini_nmap - cong cu quet mang toi gian (giao dien kieu nmap)"
    )
    p.add_argument("-t", "--target", required=True,
                    help="IP, hostname, hoac dai CIDR (vd: 192.168.1.0/24)")
    p.add_argument("-p", "--ports", default="1-1024",
                    help="Danh sach/dai cong, vd: 22,80,443 hoac 1-1024 (mac dinh: 1-1024)")
    p.add_argument("--discover-only", action="store_true",
                    help="Chi do host song trong dai mang, khong quet cong")
    p.add_argument("--scan-type", choices=["connect", "syn"], default="connect",
                    help="'connect' = TCP connect scan mac dinh (khong can root); "
                         "'syn' = SYN/half-open scan (can root + scapy, nhanh & kin dao hon)")
    p.add_argument("--no-service", action="store_true",
                    help="Bo qua buoc nhan dien service/banner (nhanh hon)")
    p.add_argument("--timeout", type=float, default=0.8,
                    help="Timeout (giay) cho moi ket noi (mac dinh 0.8)")
    p.add_argument("--threads", type=int, default=200,
                    help="So luong thread song song khi quet cong (mac dinh 200)")
    p.add_argument("-o", "--output-format", choices=["table", "json", "csv"], default="table",
                    help="Dinh dang hien thi/ket qua (mac dinh table)")
    p.add_argument("--out", help="Duong dan file de xuat ket qua (dung voi -o json/csv)")
    return p


def resolve_targets(target: str) -> list:
    if is_network_range(target):
        print(f"[*] Phase 1: Dang do host song trong dai {target} ...")
        hosts = discover_hosts(target)
        print(f"[+] Tim thay {len(hosts)} host song.\n")
        return hosts
    else:
        return [target]


def run_scan_on_host(host: str, ports: list, args) -> list:
    if args.scan_type == "syn":
        print(f"[*] Phase 2 (SYN scan): Dang quet {len(ports)} cong tren {host} ...")
        raw_results = syn_scan(host, ports, timeout=args.timeout)
        # SynResult va PortResult co cung shape (port, state) nen dung chung duoc
        port_results = raw_results
    else:
        print(f"[*] Phase 2 (connect scan): Dang quet {len(ports)} cong tren {host} ...")
        port_results = scan_ports(host, ports, max_workers=args.threads, timeout=args.timeout)

    open_ports = [r.port for r in port_results if r.state == "open"]
    print(f"[+] {host}: {len(open_ports)} cong mo.")

    service_map = {}
    if open_ports and not args.no_service:
        print(f"[*] Phase 3: Dang nhan dien service tren {len(open_ports)} cong mo ...")
        for info in detect_services(host, open_ports):
            service_map[info.port] = info

    records = []
    for r in port_results:
        if r.state != "open":
            continue
        info = service_map.get(r.port)
        records.append(ScanRecord(
            host=host,
            port=r.port,
            state=r.state,
            service=info.service if info else "unknown",
            banner=info.banner if info else "",
        ))
    return records


def main():
    args = build_arg_parser().parse_args()
    start = time.time()

    if args.scan_type == "syn":
        err = check_syn_prerequisites()
        if err:
            print(f"[!] Khong the dung SYN scan: {err}")
            print("[!] Se tu dong chuyen sang 'connect' scan thay the.")
            args.scan_type = "connect"

    try:
        targets = resolve_targets(args.target)
    except ValueError as e:
        print(f"[!] Target khong hop le: {e}")
        sys.exit(1)

    if not targets:
        print("[!] Khong tim thay host nao song. Ket thuc.")
        sys.exit(0)

    if args.discover_only:
        for h in targets:
            print(f"    {h}")
        return

    ports = parse_ports(args.ports)
    all_records = []
    for host in targets:
        all_records.extend(run_scan_on_host(host, ports, args))

    elapsed = time.time() - start
    print(f"\n[*] Phase 4: Xuat ket qua (dinh dang: {args.output_format}) - thoi gian: {elapsed:.2f}s\n")

    if args.output_format == "table":
        print_table(all_records)
    elif args.output_format == "json":
        if args.out:
            export_json(all_records, args.out)
            print(f"[+] Da ghi ket qua vao {args.out}")
        else:
            print(json.dumps([asdict(r) for r in all_records], ensure_ascii=False, indent=2))
    elif args.output_format == "csv":
        out_path = args.out or "scan_result.csv"
        export_csv(all_records, out_path)
        print(f"[+] Da ghi ket qua vao {out_path}")


if __name__ == "__main__":
    main()

PYTHON_EOF
