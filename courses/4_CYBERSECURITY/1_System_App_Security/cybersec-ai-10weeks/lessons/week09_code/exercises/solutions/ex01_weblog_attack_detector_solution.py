"""ĐÁP ÁN - Bài tập 1 (Tuần 9): Phát hiện tấn công web từ log."""

import re
from collections import Counter

ACCESS_LOG = """
192.168.1.10 - - "GET /index.html HTTP/1.1" 200
192.168.1.55 - - "GET /products?id=1' OR '1'='1 HTTP/1.1" 200
192.168.1.55 - - "GET /search?q=<script>alert(1)</script> HTTP/1.1" 200
192.168.1.10 - - "GET /about.html HTTP/1.1" 200
203.0.113.7 - - "GET /download?file=../../../../etc/passwd HTTP/1.1" 200
203.0.113.7 - - "GET /items?id=5 UNION SELECT username,password FROM users HTTP/1.1" 500
192.168.1.10 - - "POST /login HTTP/1.1" 200
203.0.113.7 - - "GET /img?src=javascript:alert(document.cookie) HTTP/1.1" 200
"""

SIGNATURES = {
    "SQL Injection":  r"(' or |union select|--|' *= *')",
    "XSS":            r"(<script|onerror=|javascript:)",
    "Path Traversal": r"(\.\./|\.\.%2f|/etc/passwd)",
}


def parse_line(line):
    m = re.match(r'^(\S+) - - "([^"]+)"', line.strip())
    if not m:
        return None
    return m.group(1), m.group(2)


def detect(log):
    findings = []
    for line in log.strip().splitlines():
        parsed = parse_line(line)
        if not parsed:
            continue
        ip, request = parsed
        for attack, pattern in SIGNATURES.items():
            if re.search(pattern, request, re.IGNORECASE):
                findings.append((ip, attack, request))
    return findings


if __name__ == "__main__":
    print("=== PHÁT HIỆN TẤN CÔNG WEB TỪ LOG ===\n")
    findings = detect(ACCESS_LOG)

    for ip, attack, request in findings:
        print(f"[!] {attack:<15} từ {ip}: {request}")

    print("\n--- Kẻ tấn công nhiều nhất ---")
    counter = Counter(ip for ip, _, _ in findings)
    for ip, count in counter.most_common():
        print(f"  {ip}: {count} yêu cầu độc hại")

    print("\nKHUYẾN NGHỊ:")
    print("- Chặn IP tấn công ở firewall/WAF.")
    print("- Chống SQLi: dùng truy vấn tham số hoá (prepared statement).")
    print("- Chống XSS: escape/encode dữ liệu trước khi render ra HTML.")
    print("- Chống Path Traversal: chuẩn hoá & kiểm tra đường dẫn, không nối trực tiếp input.")
