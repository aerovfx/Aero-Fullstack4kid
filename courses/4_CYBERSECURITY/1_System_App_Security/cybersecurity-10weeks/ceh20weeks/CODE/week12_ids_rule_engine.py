#!/usr/bin/env python3
"""week12_ids_rule_engine.py — Mini IDS Rule Engine (BLUE TEAM)

Tuan 12 - CEH Module 12 (Evading IDS, Firewalls, and Honeypots).

Cong cu PHONG THU: mo phong cach SIGNATURE-BASED IDS hoat dong — doc tung dong
log (access log / security log ban tu cung cap, hoac log mau), so khop voi
tap RULE (pattern) va in canh bao.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich log BAN SO HUU (log web app cua ban, log may ban) hoac log
    mau kem theo. Khong quet may khac, khong gui gi ra ngoai.
"""
import argparse
import collections
import re
import sys

RULES = [
    ("SQLi", r"(?i)union\s+select|['\"]\s*or\s+['\"]?\s*1\s*=\s*1|--\s*$|;drop\s+table"),
    ("XSS", r"(?i)<\s*script|javascript\s*:|onerror\s*=|onload\s*="),
    ("PathTraversal", r"(?i)\.\.(/|%2f|\\\\|%5c)|/etc/passwd|C:\\windows"),
    ("CommandInjection", r"(?i)(^|[;&|])\s*(cat|wget|curl|nc|bash|sh|powershell)\s"),
    ("UserAgentAnomaly", r"(?i)(sqlmap|nikto|nmap|nessus|gobuster)"),
]

SAMPLE_LOG = [
    "192.168.1.50 - - [12/Feb/2026:10:00:01] \"GET /index.html HTTP/1.1\" 200",
    "10.0.0.7 - - [12/Feb/2026:10:00:02] \"GET /search?q=1' OR 1=1-- HTTP/1.1\" 500",
    "10.0.0.7 - - [12/Feb/2026:10:00:03] \"GET /profile?u=<script>alert(1)</script> HTTP/1.1\" 400",
    "10.0.0.9 - - [12/Feb/2026:10:00:04] \"GET /files/..%2f..%2fetc%2fpasswd HTTP/1.1\" 403",
    "192.168.1.50 - - [12/Feb/2026:10:00:05] \"GET /index.html HTTP/1.1\" 200",
    "10.0.0.7 - - [12/Feb/2026:10:00:06] \"GET /run?cmd=cat%20/etc/passwd HTTP/1.1\" 500",
    "10.0.0.7 - - [12/Feb/2026:10:00:07] \"GET /login HTTP/1.1\" 302",
    "198.51.100.4 - - [12/Feb/2026:10:00:08] \"GET /admin HTTP/1.1\" 404",
    "198.51.100.4 - - [12/Feb/2026:10:00:09] \"GET /wp-admin HTTP/1.1\" 404",
    "198.51.100.4 - - [12/Feb/2026:10:00:10] \"GET /backup.zip HTTP/1.1\" 404",
    "192.168.1.50 - - [12/Feb/2026:10:00:11] \"GET /favicon.ico HTTP/1.1\" 200",
    "203.0.113.9 - - [12/Feb/2026:10:00:12] \"GET / HTTP/1.1\" 200 (User-Agent: sqlmap/1.7)",
    "192.168.1.60 - - [12/Feb/2026:10:00:13] \"GET /index.html HTTP/1.1\" 200",
    "198.51.100.4 - - [12/Feb/2026:10:00:14] \"GET /config.php.bak HTTP/1.1\" 404",
    "203.0.113.9 - - [12/Feb/2026:10:00:15] \"POST /api/login HTTP/1.1\" 401",
    "198.51.100.4 - - [12/Feb/2026:10:00:16] \"GET /phpinfo.php HTTP/1.1\" 404",
    "192.168.1.60 - - [12/Feb/2026:10:00:17] \"GET /about HTTP/1.1\" 200",
    "198.51.100.4 - - [12/Feb/2026:10:00:18] \"GET /robots.txt HTTP/1.1\" 200",
    "10.0.0.7 - - [12/Feb/2026:10:00:19] \"GET /api/delete?id=1;drop table users HTTP/1.1\" 500",
    "192.168.1.50 - - [12/Feb/2026:10:00:20] \"GET /index.html HTTP/1.1\" 200",
]

PORTS_PER_IP = 12
DUP_REQUESTS = 8


def detect_port_scan(lines):
    """Phat hien 1 IP gui nhieu request toi nhieu PATH khac nhau trong khoang
    thoi gian ngan (mau cua port/dir scan)."""
    per_ip = collections.Counter()
    for ln in lines:
        m = re.match(r"^(\S+)", ln)
        if m:
            per_ip[m.group(1)] += 1
    return [(ip, n) for ip, n in per_ip.items() if n >= PORTS_PER_IP]


def run(lines):
    print("=" * 60)
    print("MINI IDS RULE ENGINE (BLUE TEAM) — signature matching")
    print("=" * 60)
    print(f"[LOG] {len(lines)} dòng")

    total = 0
    for name, pattern in RULES:
        hits = []
        for i, ln in enumerate(lines):
            if re.search(pattern, ln):
                hits.append((i + 1, ln[:80]))
        if hits:
            print(f"\n[RULE:{name}] {len(hits)} dòng khớp:")
            for lineno, snippet in hits[:4]:
                print(f"   L{lineno}: {snippet}")
            total += len(hits)

    scans = detect_port_scan(lines)
    if scans:
        print(f"\n[RULE:PortScan] nghi quét: " +
              ", ".join(f"{ip} ({n} yêu cầu)" for ip, n in scans))
        total += len(scans)

    print("-" * 60)
    print(f"[TỔNG] {total} cảnh báo từ {len(lines)} dòng log")
    if total:
        print("[GỢI Ý] Xác minh bằng anomaly detection (baseline lưu lượng thật) "
              "để giảm false positive — IDS thực tế kết hợp cả 2.")
    else:
        print("[GỢI Ý] Không khớp rule nào — có thể chưa có tấn công, "
              "hoặc tấn công đã evasion (fragmentation/encoding).")


def main():
    ap = argparse.ArgumentParser(description="Mini IDS rule engine (offline)")
    ap.add_argument("--log", help="duong dan file log ban muon phan tich")
    ap.add_argument("--demo", action="store_true", help="chay tren log mau kem theo")
    args = ap.parse_args()

    if args.log:
        try:
            lines = open(args.log, encoding="utf-8", errors="ignore").read().splitlines()
        except OSError as e:
            print(f"[LOI] Khong doc duoc file: {e}")
            sys.exit(1)
        run(lines)
    elif args.demo:
        run(SAMPLE_LOG)
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week12_ids_rule_engine.py --demo")


if __name__ == "__main__":
    main()
