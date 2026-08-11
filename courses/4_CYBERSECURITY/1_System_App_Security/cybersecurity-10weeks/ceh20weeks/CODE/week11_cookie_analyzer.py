#!/usr/bin/env python3
"""week11_cookie_analyzer.py — Session Cookie Analyzer (BLUE TEAM)

Tuan 11 - CEH Module 11 (Session Hijacking).

Cong cu PHONG THU: phan tich MOT CHUOI SET-COOKIE/COOKIE ban tu nhap (web app
cua ban / cookie demo) de kiem tra:
  - Flag Secure (chi gui qua HTTPS)
  - Flag HttpOnly (JS khong doc duoc -> chong XSS steal)
  - Flag SameSite (chong CSRF)
  - Do manh session token (do dai + entropy -> session prediction)

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich cookie BAN SO HUU hoac cookie demo. Khong doc / khong danh
    cap cookie cua nguoi khac, khong ket noi mang.
"""
import argparse
import math
import re
import sys

SECURE_RE = re.compile(r"(?i)\bSecure\b")
HTTPONLY_RE = re.compile(r"(?i)\bHttpOnly\b")
SAMESITE_RE = re.compile(r"(?i)\bSameSite=(\w+)")
NAME_VALUE_RE = re.compile(r"(?i)^\s*([^=;]+)=([^;]+)")


def entropy(token: str) -> float:
    if not token:
        return 0.0
    freqs = {}
    for ch in token:
        freqs[ch] = freqs.get(ch, 0) + 1
    h = 0.0
    for c in freqs.values():
        p = c / len(token)
        h -= p * math.log2(p)
    return h * len(token)


def analyze(cookie: str):
    print("=" * 60)
    print("SESSION COOKIE ANALYZER (BLUE TEAM)")
    print("=" * 60)
    print(f"[COOKIE] {cookie}")

    has_secure = bool(SECURE_RE.search(cookie))
    has_httponly = bool(HTTPONLY_RE.search(cookie))
    ss = SAMESITE_RE.search(cookie)

    print(f"[Secure]   {'OK' if has_secure else 'KHONG CO'} — "
          f"{'chi gui qua HTTPS' if has_secure else 'có thể bị sniff qua HTTP'}")
    print(f"[HttpOnly] {'OK' if has_httponly else 'KHONG CO'} — "
          f"{'JS khong doc duoc (chong XSS steal)' if has_httponly else 'JS có thể đọc -> bị XSS steal'}")
    if ss:
        print(f"[SameSite] {ss.group(1)}")
    else:
        print(f"[SameSite] KHONG CO — dễ bị CSRF (nên Lax/Strict)")

    m = NAME_VALUE_RE.match(cookie)
    if m and "session" in m.group(1).lower() or m and "sid" in m.group(1).lower():
        token = m.group(2).strip().strip('"')
        bits = entropy(token)
        if len(token) < 16 or bits < 60:
            level = "YEU (nghi session prediction)"
        elif bits < 90:
            level = "trung binh"
        else:
            level = "manh"
        print(f"[TOKEN]    '{m.group(1)}' = {len(token)} ky tu, entropy ~ {bits:.0f} bits -> {level}")
        print(f"[KHUYEN NGHI] token nen >= 128 bits, sinh bang CSPRNG (secrets.token_hex)")
    else:
        print("[TOKEN]    (khong nhan dien duoc session token — chi phan tich flags)")

    missing = []
    if not has_secure:
        missing.append("Secure")
    if not has_httponly:
        missing.append("HttpOnly")
    if not ss:
        missing.append("SameSite")
    print("-" * 60)
    if missing:
        print(f"[KET LUAN] Thieu: {', '.join(missing)} — can bo sung de chong "
              f"sniff/XSS/CSRF (session hijacking).")
    else:
        print("[KET LUAN] 3 flag co ban OK (van con can: timeout, xoay ID, MFA).")


DEMO = [
    "sessionid=abc123; Secure; HttpOnly",
    "connect.sid=s%3A9f2b4c1d8e7a6b5c4d3e2f1a; Path=/; HttpOnly; Secure; SameSite=Lax",
]


def main():
    ap = argparse.ArgumentParser(description="Session cookie analyzer (offline)")
    ap.add_argument("--cookie", help="chuoi Set-Cookie/coookie ban muon phan tich")
    ap.add_argument("--demo", action="store_true", help="phan tich 2 cookie demo")
    args = ap.parse_args()

    if args.cookie:
        analyze(args.cookie)
    elif args.demo:
        for c in DEMO:
            analyze(c)
            print()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week11_cookie_analyzer.py --demo")


if __name__ == "__main__":
    main()
