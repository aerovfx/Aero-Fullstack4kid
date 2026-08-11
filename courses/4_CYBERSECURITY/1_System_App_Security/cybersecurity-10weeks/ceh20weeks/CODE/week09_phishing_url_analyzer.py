#!/usr/bin/env python3
"""week09_phishing_url_analyzer.py — Phishing URL Analyzer (BLUE TEAM)

Tuan 9 - CEH Module 09 (Social Engineering).

Cong cu PHONG THU: phan tich TINH mot URL (khong truy cap, khong ket noi mang)
de chi ra cac dau hieu pho bien cua phishing:
  - host la IP thuan (domain that thuong la ten mien)
  - punycode (unicode tra hinh) / nhieu dau gach ngang
  - subdomain dai danh may ("paypal.com.login.example.org")
  - https nhung port la
  - chua tu khoa nhay cam (paypal, login, bank, verify, secure...)

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich URL BAN TU NHAP / URL mau. Khong quet, khong truy cap bat ky
    trang nao. Tool nay chi lam viec tren chuoi ky tu.
"""
import argparse
import ipaddress
import re
from urllib.parse import urlparse

KEYWORDS = [
    "login", "signin", "verify", "secure", "account", "update",
    "paypal", "apple", "microsoft", "google", "netflix", "bank", "pay",
    "password", "confirm", "suspend", "unlock", "billing",
]

PORT = {"http": 80, "https": 443, "ftp": 21, "ssh": 22}


def analyze(url: str):
    print("=" * 60)
    print("PHISHING URL ANALYZER (BLUE TEAM)")
    print("=" * 60)
    print(f"URL: {url}")

    try:
        parsed = urlparse(url)
    except Exception as e:
        print(f"[LOI] Khong parse duoc URL: {e}")
        return 0

    host = parsed.hostname or ""
    score = 0
    issues = []

    # 1) Host la IP
    try:
        ipaddress.ip_address(host)
        issues.append(f"[!] HOST LA DIA CHI IP ({host}) — domain that thuong la ten mien, nghi ngo")
        score += 1
    except ValueError:
        pass

    # 2) Punycode
    if "xn--" in host.lower():
        issues.append(f"[!] host chua PUNYCODE ('xn--') — co the giong ten that nhung ky tu Unicode")
        score += 1

    # 3) Gach ngang
    if host.count("-") >= 2:
        issues.append(f"[!] host co {host.count('-')} dau gach ngang — thuong gap o domain gia mo phong")
        score += 1

    # 4) Nhieu dot / subdomain
    dots = host.count(".")
    if dots >= 3:
        issues.append(f"[!] host co {dots} dau cham (subdomain dai) — co the gia danh thuong hieu: {host}")
        score += 1

    # 5) Port la
    port = parsed.port
    scheme = parsed.scheme.lower()
    if port and scheme in PORT and port != PORT[scheme]:
        issues.append(f"[!] dung port {port} thay vi {PORT[scheme]} — khong pho bien o dich vu hop le")
        score += 1

    # 6) Tu khoa nhanh
    kw_hits = [k for k in KEYWORDS if k in host.lower() or k in parsed.path.lower()]
    if kw_hits:
        issues.append(f"[!] chua tu khoa nhanh: {kw_hits[:5]}")
        score += 1

    # 7) Khong phai https
    if scheme != "https":
        issues.append(f"[!] giao thuc {scheme.upper()} (khong ma hoa) — ban khong gui thong tin nhay cam")
        score += 1

    for i in issues:
        print(i)

    print("-" * 60)
    level = "NGHI NGỜ PHISHING" if score >= 2 else "It dau hieu (van can cau trong)"
    print(f"[DIEM NGUY CO] {score}/7 -> {level}")
    print("[KHUYEN NGHI] Neu nghi ngo: khong nhap, khong nhan link. Kiem tra thu cong:")
    print("              xem doi chieu domain thuc (VD: xem email chinh thuc cua ngan hang).")
    return score


QUIZ = [
    ("Nhan email 'Ban thang xe may, bam link nhan thuong'. Ban se?",
     ["Bam link ngay", "Xoa / bao cao va khong bam", "Gui lai cho ban be"],
     1),
    ("Mot nguoi tu xung IT goi dien xin mat khau de 'sua may'. Ban se?",
     ["Cho mat khau", "Cu mac ke", "Tu choi va xac minh qua kenh khac"],
     2),
    ("Thay mot USB tai ban ghe. Ban se?",
     ["Cam vao may tinh ngay", "Giao cho IT / khong dung", "Dem ve nha mo"],
     1),
    ("Email cua 'CEO' yeu cau chuyen tien gap truoc khi xac minh. Ban se?",
     ["Chuyen ngay vi CEO", "Kiem tra so dien thoai cua CEO dang ky trong so",
      "Chuyen 1 nua cho nhanh"],
     1),
]


def print_quiz():
    print("=" * 60)
    print("QUIZ AN TOAN CHO NGUOI DUNG (Social Engineering) — kem dap an")
    print("=" * 60)
    for i, (q, opts, ans) in enumerate(QUIZ, 1):
        print(f"\nQ{i}. {q}")
        for j, o in enumerate(opts):
            mark = " [DUNG]" if j == ans else ""
            print(f"   {chr(97+j)}) {o}{mark}")


def main():
    ap = argparse.ArgumentParser(description="Phishing URL analyzer (offline)")
    ap.add_argument("--url", help="URL can phan tich (chi phan tich chuoi, khong truy cap)")
    ap.add_argument("--demo", action="store_true", help="chay demo 2 URL mau")
    ap.add_argument("--quiz", action="store_true", help="in cau hoi awareness")
    args = ap.parse_args()

    if args.url:
        analyze(args.url)
    elif args.demo:
        print("[DEMO 1]")
        analyze("https://192.168.1.5:8443/paypal-login/verify")
        print()
        print("[DEMO 2]")
        analyze("https://www.example.com/dashboard")
    elif args.quiz:
        print_quiz()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week09_phishing_url_analyzer.py --demo")


if __name__ == "__main__":
    main()
