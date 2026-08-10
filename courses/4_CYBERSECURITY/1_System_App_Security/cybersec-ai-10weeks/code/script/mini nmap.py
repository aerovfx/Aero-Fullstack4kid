#!/usr/bin/env python3
"""
mini_nmap.py - Cong cu quet mang toi gian kieu nmap
=====================================================
CHI SU DUNG TREN HE THONG/MANG BAN SO HUU HOAC DA DUOC CAP PHEP RO RANG.
Quet cong/mang trai phep co the vi pham phap luat (VD: Luat An ninh mang VN,
Computer Fraud and Abuse Act o Hoa Ky, v.v.)

Vi du su dung:
    python3 mini_nmap.py -t 192.168.1.10 -p 1-1024
    python3 mini_nmap.py -t 192.168.1.0/24 --discover-only
    python3 mini_nmap.py -t example_lab_host -p 22,80,443 -o json --out result.json
"""

import argparse
import ipaddress
import sys
import time

from discovery import discover_hosts
from port_scanner import parse_ports, scan_ports
from service_detect import detect_services
from output import ScanRecord, print_table, export_json, export_csv


def is_network_range(target: str) -> bool:
    return "/" in target


def build_arg_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        description="mini_nmap - cong cu quet mang toi gian (giao dien kieu nmap)"
    )
    p.add_argument("-t", "--target", required=True,
                    help="IP, hostname, hoac dai CIDR (vd: 192.168.1.0/24)")
    p.add_argument("-p", "--ports", default="1-1024",
                    help="Danh sach/dai cong, vd: 22,80,443 hoac 1-1024 (mac dinh: 1-1024)")
    p.add_argument("--discover-only", action="store_true",
                    help="Chi do host song trong dai mang, khong quet cong")
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


def resolve_targets(target: str) -> list[str]:
    if is_network_range(target):
        print(f"[*] Phase 1: Dang do host song trong dai {target} ...")
        hosts = discover_hosts(target)
        print(f"[+] Tim thay {len(hosts)} host song.\n")
        return hosts
    else:
        return [target]


def run_scan_on_host(host: str, ports: list[int], args) -> list[ScanRecord]:
    print(f"[*] Phase 2: Dang quet {len(ports)} cong tren {host} ...")
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
            continue  # chi hien thi cong mo cho gon, giong hanh vi mac dinh cua nmap
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
    all_records: list[ScanRecord] = []
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
            import json
            from dataclasses import asdict
            print(json.dumps([asdict(r) for r in all_records], ensure_ascii=False, indent=2))
    elif args.output_format == "csv":
        out_path = args.out or "scan_result.csv"
        export_csv(all_records, out_path)
        print(f"[+] Da ghi ket qua vao {out_path}")


if __name__ == "__main__":
    main()
