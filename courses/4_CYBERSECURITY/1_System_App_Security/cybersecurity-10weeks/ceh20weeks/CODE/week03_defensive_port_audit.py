#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# week03_defensive_port_audit.py
# CEH v13 - Module 03: Scanning Networks | Week 03 | Lab 3
# Defensive port audit - quet CHINH MAY MINH (127.0.0.1), cham muc ru ro
# cho tung port mỞ va dua khuyen nghi dong (BLUE TEAM).
#
# ====================================================================
# ETHICS: day la cong cu PHONG THU. Chi quet 127.0.0.1 (localhost).
# Quet may khac la bat hop phap va vi pham quy che khoa hoc.
# ====================================================================

import socket
import datetime

TARGET = "127.0.0.1"
TIMEOUT = 0.3

# Bang ru ro service pho bien (kinh nghiem CEH Module 03 + OWASP):
#   port -> (service, risk, advice)
#   CRITICAL = tiet lo thong tin / co the bj khai thac tuc thi
#   HIGH     = ben mat tan cong lon neu lo ra ngoai
PORT_RISK = {
    21:   ("ftp",         "CRITICAL", "FTP plaintext - dung SFTP/FTPS va chan IP ngoai"),
    22:   ("ssh",         "LOW",      "Can thiet cho remote - dung SSH key, chan password"),
    23:   ("telnet",      "CRITICAL", "Plaintext - TAT NGAY, thay bang SSH"),
    25:   ("smtp",        "MEDIUM",   "Chi can neu ban la mail server"),
    53:   ("domain",      "LOW",      "Chi can neu ban chay DNS server"),
    80:   ("http",        "MEDIUM",   "Public web can TLS - chuyen sang 443"),
    110:  ("pop3",        "LOW",      "Email plaintext - dung POP3S"),
    111:  ("rpcbind",     "HIGH",     "RPC phoi banner - dong neu khong can NFS"),
    135:  ("msrpc",       "MEDIUM",   "Windows RPC - dong neu khong can"),
    139:  ("netbios-ssn", "HIGH",     "NetBIOS - dong neu khong chia se file"),
    143:  ("imap",        "LOW",      "Email cleartext - dung IMAPS"),
    161:  ("snmp",        "HIGH",     "SNMP public/private weak - doi community + ACL"),
    443:  ("https",       "LOW",      "Chuan cho web server"),
    445:  ("microsoft-ds", "HIGH",    "SMB - TAT neu khong chia se file LAN"),
    514:  ("syslog",      "MEDIUM",   "Log plaintext - gioi han nguon gui log"),
    873:  ("rsync",       "MEDIUM",   "Chia se file - chan public, set read-only"),
    1080: ("socks",       "MEDIUM",   "Proxy mo - chan nguoi la"),
    1433: ("ms-sql-s",    "MEDIUM",   "SQL Server - chi bind localhost"),
    1521: ("oracle",      "MEDIUM",   "Oracle - chi bind localhost"),
    2049: ("nfs",         "HIGH",     "NFS - chan IP + root squash"),
    3306: ("mysql",       "MEDIUM",   "DB chi bind 127.0.0.1, dung firewall chan ngoai"),
    3389: ("ms-wbt-server", "HIGH",   "RDP - gioi han IP truy cap + xac thuc manh"),
    5432: ("postgresql",  "MEDIUM",   "DB chi bind 127.0.0.1"),
    5900: ("vnc",         "MEDIUM",   "VNC - chan cong khai, dung tunnel SSH"),
    6379: ("redis",       "HIGH",     "Redis unauthenticated - TAT neu khong can"),
    8000: ("http-alt",    "LOW",      "Dev server - tat khi khong dev"),
    8080: ("http-proxy",  "MEDIUM",   "Proxy/alt http - chan IP la"),
    8443: ("https-alt",   "LOW",      "TLS - can thiet cho admin portal"),
    9200: ("elasticsearch", "HIGH",   "ES khong co auth mac dinh - chan IP ngoai"),
    27017: ("mongod",     "HIGH",     "MongoDB khong auth - TAT hoac chan IP ngoai"),
}

RISK_LEVEL = {"LOW": 1, "MEDIUM": 2, "HIGH": 3, "CRITICAL": 4}
RISK_RANK = {v: k for k, v in RISK_LEVEL.items()}


def check_port(port: int) -> bool:
    """Kiem tra port MỞ tren localhost bang TCP connect."""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(TIMEOUT)
    try:
        return s.connect_ex((TARGET, port)) == 0
    finally:
        s.close()


def main():
    print("=" * 66)
    print("DEFENSIVE PORT AUDIT - kiem soat be mat tan cong may minh")
    print(f"Host    : {TARGET}   |   Thoi gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
    print("=" * 66)

    open_ports = [p for p in sorted(PORT_RISK) if check_port(p)]
    report_lines = []

    if not open_ports:
        print("[SAN SACH] Khong co port nao trong bang ru ro dang MO.")
        print("[KET LUAN] Be mat tan cong dang gon - tiep tuc theo doi.")
    else:
        print(f"[!] Phat hien {len(open_ports)} port dang MO:")
        for port in open_ports:
            name, risk, advice = PORT_RISK[port]
            report_lines.append({"port": port, "service": name,
                                 "risk": risk, "advice": advice})
            print(f"  [{risk:>8}]  :{port:<5}  {name:<15} -> {advice}")

        print("-" * 66)
        worst = max(report_lines, key=lambda r: RISK_LEVEL[r["risk"]])
        print(f"[KET LUAN] Rui ro cao nhat: {worst['risk']} "
              f"(port {worst['port']} - {worst['service']})")
        print("[KHUYEN NGHI] Uu tien dong ngay cac port HIGH/CRITICAL:")
        for r in report_lines:
            if r["risk"] in ("HIGH", "CRITICAL"):
                print(f"    sudo ufw deny {r['port']}/tcp    # {r['service']}")
                print(f"    # macOS: Hệ thống > Chung > Sharing -> tat dich vu tuong tu")

    with open("port_audit_report.csv", "w", encoding="utf-8") as f:
        f.write("port,service,risk,advice\n")
        for r in report_lines:
            f.write(f'{r["port"]},{r["service"]},{r["risk"]},"{r["advice"]}"\n')
    print("[+] Da xuat: port_audit_report.csv")


if __name__ == "__main__":
    main()