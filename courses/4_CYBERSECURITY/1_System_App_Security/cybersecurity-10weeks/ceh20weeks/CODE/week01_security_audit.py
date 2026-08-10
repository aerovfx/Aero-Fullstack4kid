#!/usr/bin/env python3
# security_audit.py
# Security Audit Tool - Đánh giá bảo mật cơ bản máy tính cá nhân (BLUE TEAM)
# Chỉ quét localhost. Tuần 1 - CEH Module 01.
import socket
import json
import datetime

print("=" * 60)
print("SECURITY AUDIT - Kiểm kê cửa sổ bảo mật máy cá nhân")
print(f"Thời gian: {datetime.datetime.now():%Y-%m-%d %H:%M}")
print("=" * 60)

TARGET = "127.0.0.1"

RISKY_PORTS = {
    21: "FTP - truyền file không mã hoá",
    22: "SSH - remote shell",
    23: "Telnet - KHÔNG an toàn",
    445: "SMB - chia sẻ file Windows",
    3389: "RDP - remote desktop",
    5432: "PostgreSQL DB",
    3306: "MySQL DB",
    6379: "Redis DB",
    27017: "MongoDB DB",
    8080: "HTTP alt",
}


def check_port(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.3)
    try:
        result = s.connect_ex((TARGET, port))
        return result == 0
    finally:
        s.close()


open_risky = []
report = {"host": TARGET, "scanned_at": str(datetime.datetime.now())}

for port, desc in RISKY_PORTS.items():
    if check_port(port):
        print(f"[!] CỔNG MỞ: {port:>5} -> {desc}")
        open_risky.append(port)

print("-" * 60)
if open_risky:
    print(f"[KẾT QUẢ] Phát hiện {len(open_risky)} cổng rủi ro đang mở.")
    print("[KHUYẾN NGHỊ] Hãy kiểm tra / đóng bằng firewall (xem Lab 2).")
    report["open_ports"] = open_risky
    report["risk_level"] = "HIGH"
else:
    print("[KẾT QUẢ] Không phát hiện cổng rủi ro nào đang mở.")
    report["open_ports"] = []
    report["risk_level"] = "LOW"

with open("security_report.json", "w", encoding="utf-8") as f:
    json.dump(report, f, ensure_ascii=False, indent=2)
print("[+] Đã xuất báo cáo: security_report.json")