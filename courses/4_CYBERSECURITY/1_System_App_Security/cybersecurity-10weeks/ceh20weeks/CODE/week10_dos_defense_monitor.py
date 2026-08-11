#!/usr/bin/env python3
"""week10_dos_defense_monitor.py — DoS/DDoS Defense Monitor (BLUE TEAM)

Tuan 10 - CEH Module 10 (Denial-of-Service).

Cong cu PHONG THU: doc bang ket noi TCP cua CHINH may cua ban (`netstat -an`
tren macOS/Linux), dem so ket noi theo IP nguon va so ket noi o trang thai
SYN_RECV (dau hieu SYN flood / connection exhaustion).

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi doc netstat/lsof cua may BAN. Khong gui bat ky goi tin nao ra ngoai.
  - Khong dung tool nay de quet may khac; khong xac dinh "doi thu" tren mang
    cua nguoi khac.
"""
import argparse
import re
import subprocess
import sys
import time

TCP_RE = re.compile(r"^tcp[46]?\s+\d+\s+\d+\s+\S+\s+(\S+)\s+(\w+)", re.M)


def extract_ip(remote: str) -> str:
    """Tach IP tu chuoi remote addr: '192.168.1.2.443' -> '192.168.1.2'."""
    if remote.startswith("[") or ":" in remote:
        # IPv6: [::1]:443 hoac ::1.443 -> lay phan truoc port cuoi cung
        if "]" in remote:
            return remote.split("]")[0].lstrip("[")
        parts = remote.rsplit(".", 1)
        if parts[-1].isdigit():
            return parts[0]
        return remote
    # IPv4: IP.port
    parts = remote.rsplit(".", 1)
    if len(parts) == 2 and parts[-1].isdigit():
        return parts[0]
    return remote


def read_tcp():
    """Doc bang ket noi TCP. Tra ve list (remote_addr, state)."""
    out = subprocess.run(["netstat", "-an"], capture_output=True, text=True,
                         timeout=15).stdout
    rows = []
    for m in TCP_RE.finditer(out):
        rows.append((m.group(1), m.group(2)))
    return rows


def check(show_top=8):
    rows = read_tcp()
    if not rows:
        print("[LOI] Khong doc duoc ket noi TCP (thu lai sau).")
        return

    syn_recv = sum(1 for _, st in rows if st == "SYN_RECV")
    by_src = {}
    for remote, st in rows:
        ip = extract_ip(remote)
        if ip in ("127.0.0.1", "::1", "*", "") or "*" in ip:
            continue
        by_src[ip] = by_src.get(ip, 0) + 1

    print("=" * 60)
    print("DoS DEFENSE MONITOR (BLUE TEAM) — doc netstat may ban")
    print("=" * 60)
    print(f"[NETSTAT]   {len(rows)} kết nối TCP")
    print(f"[SYN_RECV]  {syn_recv} kết nối (dấu hiệu backlog/SYN flood nếu cao dai)")

    top = sorted(by_src.items(), key=lambda kv: kv[1], reverse=True)[:show_top]
    if top:
        print("[TOP IP NGUỒN]")
        for ip, n in top:
            flag = "  <-- nghi ngo" if n >= 30 else ""
            print(f"    {ip:>20}: {n} kết nối{flag}")

    syn_ok = syn_recv < 50
    max_conn = max(by_src.values(), default=0)
    conn_ok = max_conn < 30
    if syn_ok and conn_ok:
        print("\n[KẾT LUẬN] Chưa có dấu hiệu DoS rõ ràng. Giám sát tiếp.")
    else:
        print(f"\n[KẾT LUẬN] Có dấu hiệu bất thường: SYN_RECV={syn_recv}, "
              f"max conn/IP={max_conn}.")
        print("          Hãy kiểm tra rate limiting theo IP & SYN cookies.")


def watch(rounds):
    for i in range(rounds):
        print(f"\n--- Vòng {i+1}/{rounds} ---")
        check(show_top=5)
        if i < rounds - 1:
            time.sleep(2)


def main():
    ap = argparse.ArgumentParser(description="DoS defense monitor (doc netstat cua may ban)")
    ap.add_argument("--check", action="store_true", help="kiem tra 1 lan")
    ap.add_argument("--watch", type=int, nargs="?", const=5, metavar="N",
                    help="theo doi N vong (mac dinh 5), cach 2 giay")
    args = ap.parse_args()

    if args.watch:
        watch(args.watch)
    elif args.check:
        check()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week10_dos_defense_monitor.py --check")


if __name__ == "__main__":
    main()
