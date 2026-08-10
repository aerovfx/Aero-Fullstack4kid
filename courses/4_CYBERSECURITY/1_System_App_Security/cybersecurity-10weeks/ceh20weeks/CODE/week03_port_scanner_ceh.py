#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# week03_port_scanner_ceh.py
# CEH v13 - Module 03: Scanning Networks | Week 03
# Port scanner da luong (multi-thread) + banner grabbing + JSON report.
#
# ====================================================================
# ETHICS BANNER (BAT BUOC DOC TRUOC KHI SU DUNG)
# --------------------------------------------------------------------
# day la CONG CU PHONG THU cho muc dich hoc tap CEH.
# CHI QUET 127.0.0.1 (localhost) HOAC MAY AO CUA CHINH BAN.
# Viet lai target/o localhost trong CODE la VI PHAM PHAP LUAT va
# se dan den xu ly hoc vu toan khoa hoc.
# Ban chiu trach nhiem hoan toan ve moi thao tac cua minh.
# Neu ban dang lam viec, bat buoc co Authorization bang van ban.
# ====================================================================

import argparse
import json
import socket
import sys
import threading
import datetime
from queue import Queue

# --------------------------------------------------------------------
# Dau ra nhat quy: du lieu co the kiem chung (deterministic)
# --------------------------------------------------------------------
ETHICS_NOTICE = "ETHICAL USE: only 127.0.0.1 | localhost | your own VM"

TARGETS = ["127.0.0.1", "localhost", "::1"]

# Map port -> service noi tieng de gán nhan cho bao cao
PORT_SERVICES = {
    20: "ftp-data", 21: "ftp", 22: "ssh", 23: "telnet", 25: "smtp",
    53: "domain",    69: "tftp", 80: "http", 110: "pop3", 111: "rpcbind",
    135: "msrpc",    139: "netbios-ssn", 143: "imap", 161: "snmp",
    443: "https",    445: "microsoft-ds", 514: "syslog", 636: "ldaps",
    873: "rsync",    993: "imaps", 995: "pop3s", 1080: "socks",
    1433: "ms-sql-s", 1521: "oracle", 2049: "nfs", 3306: "mysql",
    3389: "ms-wbt-server", 5432: "postgresql", 5900: "vnc",
    5985: "winrm",   6379: "redis", 8000: "http-alt", 8080: "http-proxy",
    8443: "https-alt", 8888: "sun-answerbook", 9000: "cslistener",
    9200: "elasticsearch", 27017: "mongod",
}

# Bac ru ro danh gia theo kinh nghiem CEH (LOW/MEDIUM/HIGH/CRITICAL)
PORT_RISK = {
    21: "MEDIUM", 22: "LOW", 23: "CRITICAL", 25: "MEDIUM", 53: "LOW",
    80: "MEDIUM", 110: "LOW", 111: "HIGH", 135: "MEDIUM", 139: "HIGH",
    445: "HIGH", 514: "MEDIUM", 1080: "MEDIUM", 1433: "MEDIUM",
    1521: "MEDIUM", 2049: "HIGH", 3306: "MEDIUM", 3389: "HIGH",
    5432: "MEDIUM", 5900: "MEDIUM", 5985: "MEDIUM", 6379: "HIGH",
    27017: "HIGH",
}

MAX_THREADS = 100
CONNECT_TIMEOUT = 1.0
BANNER_TIMEOUT = 3.0
READ_SIZE = 4096


def validate_host(host: str) -> str:
    """Bao dong an toan: chi cho phep host local."""
    if host in TARGETS:
        return "127.0.0.1"
    raise SystemExit(
        "[!] TU CHOI: chi quet 127.0.0.1 / localhost / ::1. "
        "Quet IP khac la bat hop phap."
    )


def parse_ports(expr: str):
    """Bien doi bieu thuc port: '22,80,443' hoac '1-1000' thanh list."""
    ports = set()
    for part in expr.replace(" ", "").split(","):
        if "-" in part:
            lo, _, hi = part.partition("-")
            lo, hi = int(lo), int(hi)
            if lo < 1 or hi > 65535 or lo > hi:
                raise SystemExit(f"[!] Dai port sai: {part}")
            ports.update(range(lo, hi + 1))
        else:
            p = int(part)
            if p < 1 or p > 65535:
                raise SystemExit(f"[!] Port sai: {part}")
            ports.add(p)
    if not ports:
        raise SystemExit("[!] Danh sach port rong.")
    return sorted(ports)


def grab_banner(host: str, port: int) -> str:
    """Ket noi 1 lan nua, doc banner ma service tu in ra (banner grabbing)."""
    banner = None
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(BANNER_TIMEOUT)
            s.connect((host, port))
            s.sendall(b"\r\n")
            data = s.recv(READ_SIZE)
            if data:
                banner = data.decode(errors="replace").strip()
    except OSError:
        pass
    return banner


def open_port(host: str, port: int) -> bool:
    """Kiem tra port MỞ bằng TCP connect voi timeout ngan."""
    try:
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(CONNECT_TIMEOUT)
            return s.connect_ex((host, port)) == 0
    except OSError:
        return False


def scan_worker(queue: Queue, host: str, results: dict, lock: threading.Lock):
    while True:
        try:
            port = queue.get_nowait()
        except Exception:
            break
        is_open = open_port(host, port)
        banner = None
        if is_open:
            banner = grab_banner(host, port)
        with lock:
            results[port] = {
                "port": port,
                "state": "open" if is_open else "closed",
                "service": PORT_SERVICES.get(port, "unknown"),
                "banner": banner,
                "risk": PORT_RISK.get(port, "LOW"),
            }
            sys.stdout.write(
                f"\r[ok] quet xong {sum(1 for r in results.values()):>4} port | "
                f"open: {sum(1 for r in results.values() if r['state'] == 'open'):>2} "
            )
            sys.stdout.flush()
        queue.task_done()


def build_report(host: str, ports: list, results: dict) -> dict:
    open_ports = {
        p: r
        for p, r in sorted(results.items())
        if r["state"] == "open"
    }
    return {
        "tool": "week03_port_scanner_ceh.py",
        "ethic_banner": ETHICS_NOTICE,
        "target": host,
        "scanned_at": str(datetime.datetime.now()),
        "scan_type": "TCP threaded (connect) + banner grab",
        "ports_scanned": len(ports),
        "threads_used": min(MAX_THREADS, len(ports)),
        "open_ports_count": len(open_ports),
        "open_ports": list(open_ports.keys()),
        "services": open_ports,
        "note": "CHI hop le tren host cua chinh ban (localhost).",
    }


def main(argv=None):
    parser = argparse.ArgumentParser(
        description="Port scanner da luong cho 127.0.0.1 (CEH W3 - phong thu).",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=(
            "Vi du:\n"
            "  %(prog)s                         # quet default 1-1024\n"
            "  %(prog)s -p 22,80,443,8000       # chon port\n"
            "  %(prog)s -s 1 -e 2000 -t 50      # quet dai + so thread\n"
            "  %(prog)s -o custom.json          # ten file report"
        ),
    )
    parser.add_argument("-p", "--ports", default="1-1024",
                        help="danh sach/dai port (default: 1-1024)")
    parser.add_argument("-s", "--start", type=int, default=None,
                        help="port bat dau (thay cho --ports)")
    parser.add_argument("-e", "--end", type=int, default=None,
                        help="port ket thuc (thay cho --ports)")
    parser.add_argument("-t", "--threads", type=int, default=MAX_THREADS,
                        help=f"so luong thread (default: {MAX_THREADS})")
    parser.add_argument("-T", "--target", default="127.0.0.1",
                        help="target (CHI 127.0.0.1/localhost)")
    parser.add_argument("-o", "--output", default="port_scan_report.json",
                        help="file JSON report (default: port_scan_report.json)")
    parser.add_argument("--no-banner", action="store_true",
                        help="tat banner grabbing (chi quet state)")
    args = parser.parse_args(argv)

    if args.start and args.end:
        ports = parse_ports(f"{args.start}-{args.end}")
    else:
        ports = parse_ports(args.ports)

    host = validate_host(args.target)
    threads = max(1, min(args.threads, MAX_THREADS))

    print("=" * 64)
    print("ETHICS:\n" + ETHICS_NOTICE)
    print("=" * 64)
    print(f"[*] Target          : {host}")
    print(f"[*] So port quet    : {len(ports)}")
    print(f"[*] Threads         : {threads}")
    if args.no_banner:
        print("[*] Banner grabbing : TAT")
    print("-" * 64)

    results = {}
    lock = threading.Lock()
    queue = Queue()
    for port in ports:
        queue.put(port)

    workers = [
        threading.Thread(
            target=scan_worker, args=(queue, host, results, lock), daemon=True
        )
        for _ in range(threads)
    ]
    for w in workers:
        w.start()
    queue.join()
    for w in workers:
        w.join()

    print("")
    report = build_report(host, ports, results)
    with open(args.output, "w", encoding="utf-8") as f:
        json.dump(report, f, ensure_ascii=False, indent=2)

    print("-" * 64)
    print(f"[RESULT] Open ports: {report['open_ports_count']}")
    for port, info in report["services"].items():
        risk = info["risk"]
        banner = info["banner"] if info["banner"] else "(no banner)"
        print(f"  [{'RISK ' + risk:>9}] :{port:<5} {info['service']:<18} {banner[:60]}")
    print(f"[+] Da xuat report: {args.output}")

    if report["open_ports_count"] == 0:
        print("[+] SACH: khong co port MO trong dai quet.")
    else:
        print("[!] Nho kiem tra/ dong port bang phan Lab 3 (defensive audit).")


if __name__ == "__main__":
    main()