#!/usr/bin/env python3
"""week13_header_scanner.py — HTTP Header/Banner Scanner (BLUE TEAM)

Tuan 13 - CEH Module 13 (Hacking Web Servers).

Cong cu PHONG THU: kiem tra HTTP response headers cua WEB APP CHINH BAN
(localhost) hoac header MAU. Tool chi:
  - Phan tich header mau (mặc định, --demo) — offline
  - Hoac gui 1 request GET/HEAD toi http://localhost (--live) — CHI localhost

Kiem tra: banner lo version (Server), X-Powered-By, va cac security headers
(X-Frame-Options, Content-Security-Policy, Strict-Transport-Security,
X-Content-Type-Options, Referrer-Policy).

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi chay --live len CHINH may cua ban (localhost) hoac server ban so huu.
  - Quet web server cua nguoi khac = footprinting bat hop phap.
"""
import argparse
import sys

# Header mau — mo phong response that cua web server chua harden
SAMPLE_HEADERS = {
    "HTTP/1.1 200 OK": None,
    "Server": "Apache/2.4.10 (Ubuntu)",
    "X-Powered-By": "PHP/7.0.33",
    "Content-Type": "text/html; charset=UTF-8",
    "Connection": "keep-alive",
}

SECURITY_HEADERS = {
    "X-Frame-Options": "chong clickjacking",
    "Content-Security-Policy": "chong XSS (whitelist nguon)",
    "Strict-Transport-Security": "HSTS — buoc HTTPS",
    "X-Content-Type-Options": "chong MIME sniffing",
    "Referrer-Policy": "giam lo leak thong tin qua Referer",
}


def analyze_headers(headers: dict):
    print("=" * 60)
    print("HTTP HEADER / BANNER SCANNER (BLUE TEAM)")
    print("=" * 60)

    issues = []
    server = headers.get("Server", "")
    if server:
        print(f"[Server]  {server}")
        if any(ch.isdigit() for ch in server):
            issues.append(f"Server lộ version ({server}) — nên ẩn (ServerTokens Prod)")
    else:
        print("[Server]  (không có — tốt)")

    powered = headers.get("X-Powered-By", "")
    if powered:
        print(f"[X-Powered-By] {powered}")
        issues.append(f"X-Powered-By lộ framework ({powered}) — nên tắt")
    else:
        print("[X-Powered-By] (không có — tốt)")

    for name, why in SECURITY_HEADERS.items():
        val = headers.get(name)
        if val:
            print(f"[{name}] {val}")
        else:
            print(f"[{name}] KHÔNG CÓ -> {why}")
            issues.append(f"Thiếu {name}")

    print("-" * 60)
    if issues:
        print(f"[KẾT LUẬN] {len(issues)} vấn đề cần xử lý:")
        for i in issues:
            print(f"  - {i}")
    else:
        print("[KẾT LUẬN] Header đạt chuẩn cơ bản. Vẫn cần: patch, TLS, WAF.")


def parse_raw(raw: str) -> dict:
    headers = {}
    for line in raw.splitlines():
        if ":" in line:
            k, _, v = line.partition(":")
            headers[k.strip()] = v.strip()
        elif line.startswith("HTTP/"):
            headers[line.strip()] = None
    return headers


def live(url):
    try:
        import urllib.request
        req = urllib.request.Request(url, method="GET", headers={"User-Agent": "week13-header-scanner"})
        with urllib.request.urlopen(req, timeout=10) as resp:
            hdrs = {}
            for k, v in resp.getheaders():
                hdrs[k] = v
            return hdrs
    except Exception as e:
        print(f"[LOI] Khong truy cap duoc {url}: {e}")
        print("      Chi chay --live len localhost / server ban so huu.")
        sys.exit(1)


def main():
    ap = argparse.ArgumentParser(description="HTTP header/banner scanner (localhost hoac header mau)")
    ap.add_argument("--demo", action="store_true", help="phan tich header mau (offline)")
    ap.add_argument("--live", metavar="URL", help="CHI localhost: vi du http://localhost:8080")
    ap.add_argument("--raw", metavar="FILE", help="doc header tu file text")
    args = ap.parse_args()

    if args.demo:
        analyze_headers(SAMPLE_HEADERS)
    elif args.live:
        url = args.live.lower()
        if "localhost" not in url and "127.0.0.1" not in url and "::1" not in url:
            print("[!] CHỈ cho phép quét localhost/127.0.0.1 hoặc server của bạn.")
            sys.exit(1)
        analyze_headers(live(url))
    elif args.raw:
        try:
            raw = open(args.raw, encoding="utf-8").read()
        except OSError as e:
            print(f"[LOI] {e}")
            sys.exit(1)
        analyze_headers(parse_raw(raw))
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week13_header_scanner.py --demo")


if __name__ == "__main__":
    main()
