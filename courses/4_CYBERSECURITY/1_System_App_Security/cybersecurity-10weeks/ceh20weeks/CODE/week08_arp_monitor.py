#!/usr/bin/env python3
"""week08_arp_monitor.py — ARP Poisoning Monitor (BLUE TEAM)

Tuan 8 - CEH Module 08 (Sniffing).

Cong cu PHONG THU: doc bang ARP cua CHINH may cua ban (`arp -a` tren macOS/Linux),
theo doi su thay doi MAC<->IP. ARP poisoning (Tuần 8 - ly thuyet) lam cho
1 IP tro toi nhieu MAC, hoac 1 MAC xuat hien o nhieu IP -> co dau hieu MITM.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi doc bang ARP cua may BAN. Khong gui goi tin, khong quet mang, khong
    can quyen root.
  - Khong dung tool nay de "kiem tra nguoi khac" tren mang khong thuoc quyen
    cua ban — doc bang ARP cua may nguoi khac cung can su cho phep.
"""
import argparse
import re
import subprocess
import sys
import time

IP_RE = re.compile(r"(\d+\.\d+\.\d+\.\d+)")
MAC_RE = re.compile(r"([0-9a-fA-F]{1,2}[-:]){5}[0-9a-fA-F]{1,2}")


def get_arp_entries():
    """Doc bang ARP. Tra ve list (ip, mac) da chuan hoa."""
    entries = []
    try:
        out = subprocess.run(["arp", "-a"], capture_output=True, text=True,
                             timeout=10).stdout
    except Exception as e:
        print(f"[LOI] Khong doc duoc bang ARP: {e}")
        print("      (macOS/Linux: lenh 'arp -a' khong san co tren Windows)")
        sys.exit(1)

    lines = out.splitlines()
    if sys.platform == "darwin":
        for ln in lines:
            m = re.search(r"\(?(\d+\.\d+\.\d+\.\d+)\)?", ln)
            mac = re.search(MAC_RE, ln)
            if m and mac:
                entries.append((m.group(1), mac.group(0).lower()))
    else:
        for ln in lines[1:]:
            parts = ln.split()
            if len(parts) >= 3 and re.match(r"^\d+\.\d+\.\d+\.\d+$", parts[0]):
                entries.append((parts[0], parts[2].lower()))
    return entries


def analyze(entries):
    """Tim dau hieu binh thuong / nghi ngo ARP poisoning."""
    ip_to_macs = {}
    mac_to_ips = {}
    for ip, mac in entries:
        if mac == "ff:ff:ff:ff:ff:ff":
            continue
        ip_to_macs.setdefault(ip, set()).add(mac)
        mac_to_ips.setdefault(mac, set()).add(ip)

    findings = []
    for ip, macs in ip_to_macs.items():
        if len(macs) > 1:
            findings.append(f"[!] IP {ip} tro toi {len(macs)} MAC: {sorted(macs)} — NGHI ARP POISONING")
    for mac, ips in mac_to_ips.items():
        if len(ips) > 4:  # may quet / gateway server thuc thuong co it
            findings.append(f"[!] MAC {mac} xuat hien o {len(ips)} IP: {sorted(ips)} — nghien quet/gia mao")
    return findings


def main():
    ap = argparse.ArgumentParser(description="ARP poisoning monitor (doc bang ARP cua may ban)")
    ap.add_argument("--check", action="store_true", help="kiem tra 1 lan")
    ap.add_argument("--scan", type=int, nargs="?", const=3, metavar="N",
                    help="quét N lan (mac dinh 3), cach 2 giay, so sanh thay doi")
    args = ap.parse_args()

    if not (args.check or args.scan):
        ap.print_help()
        print("\nVD: python3 CODE/week08_arp_monitor.py --check")
        sys.exit(0)

    baseline = {}
    print("=" * 60)
    print("ARP MONITOR (BLUE TEAM) — kiem tra ARP poisoning")
    print("=" * 60)

    if args.scan:
        for i in range(args.scan):
            entries = get_arp_entries()
            cur = dict(entries)
            if baseline and cur != baseline:
                for ip in set(baseline) | set(cur):
                    if baseline.get(ip) != cur.get(ip):
                        print(f"[SCAN #{i+1}] Thay doi: {ip}: {baseline.get(ip)} -> {cur.get(ip)}")
            baseline = cur
            findings = analyze(entries)
            for f in findings:
                print(f)
            if i < args.scan - 1:
                time.sleep(2)
    else:
        entries = get_arp_entries()
        print(f"[OK] Doc duoc {len(entries)} entry ARP:")
        for ip, mac in sorted(entries):
            print(f"    {ip:>16}  ->  {mac}")
        findings = analyze(entries)
        if findings:
            print("\n[KET LUAN] PHAT HIEN DAU HIEU NGHI NGỜ:")
            for f in findings:
                print(f)
        else:
            print("\n[KET LUAN] Khong thay dau hieu ARP poisoning (baseline binh thuong).")
            print("          Chu y: khong co dau hieu != chua bi tan cong.")


if __name__ == "__main__":
    main()
