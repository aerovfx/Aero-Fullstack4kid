#!/usr/bin/env python3
"""week20_crypto_toolkit.py - Cryptography Toolkit (BLUE TEAM)

Tuan 20 - CEH Module 20 (Cryptography). Tuan CUOI khoa.

Cong cu PHONG THU (offline):
  1) --hash : so sanh MD5 vs SHA-256 cho 1 chuoi, canh bao thuat toan.
  2) --salt : minh hoa salt chong rainbow table (hash + salt ngau nhien).
  3) --quiz : quiz on tong hop 20 tuan, co cham diem ngay.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi chay tren du lieu BAN TU TAO. Khong be ma hoa / kiem tra mat khau
    nguoi khac. Dung thu vien chuan hashlib/secrets, khong tan cong gi.
"""
import argparse
import hashlib
import secrets

QUIZ = [
    ("Buoc DAU TIEN trong quy trinh ethical hacking?",
     ["Footprinting & reconnaissance", "Scanning", "Gaining access", "Covering tracks"], 0),
    ("Port mac dinh cua HTTP?", ["443", "80", "22", "21"], 1),
    ("Loai tan cong nao lam tran bo nho dem de thuc thi ma?",
     ["Buffer overflow", "Phishing", "SQLi", "Recon"], 0),
    ("Cong cu vet can thu muc web pho bien?", ["dirb/gobuster", "nmap", "aircrack-ng", "john"], 0),
    ("Phong thu GOC RE chong SQL Injection?",
     ["Parameterized query", "WAF", "Block User-Agent", "Xoá DB"], 0),
    ("Thuat toan hash nao DA VO (collision)?", ["SHA-256", "SHA-512", "MD5", "HMAC-SHA256"], 2),
    ("WPA3 dung handshake nao chong offline dictionary?",
     ["SAE/Dragonfly", "4-way TKIP", "WEP RC4", "PEAP"], 0),
    ("Ky thuat nao chong rainbow table?", ["Salt", "Base64", "URL encode", "XOR"], 0),
    ("Buc tranh chia se trach nhiem bao mat cloud goi la gi?",
     ["Shared responsibility", "Zero trust", "Sandbox", "Air gap"], 0),
    ("Digital signature dung key NAO de KY?", ["Private key", "Public key", "Session key", "Pre-shared key"], 0),
]


def show_hash(s: str, salt: str = None):
    print("=" * 60)
    if salt is None:
        print(f"[HASH] input = {s}")
        md5 = hashlib.md5(s.encode()).hexdigest()
        sha = hashlib.sha256(s.encode()).hexdigest()
        print(f"  MD5      = {md5}")
        print(f"  SHA-256  = {sha}")
        print("[!] MD5/SHA-1 da vo (collision). Hash nhanh = khong du de "
              "luu password.")
        print("    Voi password: dung bcrypt/argon2/PBKDF2 + salt.")
    else:
        print(f"[SALT] input = {s}")
        h_nosalt = hashlib.sha256(s.encode()).hexdigest()
        salt = salt if salt != "random" else secrets.token_hex(8)
        h_salt = hashlib.sha256((s + salt).encode()).hexdigest()
        print(f"  Khong salt: {h_nosalt}")
        print(f"  Co salt   : {h_salt}   (salt={salt})")
        print("[!] Rainbow table precompute hash cua wordlist KHONG giong "
              "hash co salt -> vo dung.")
        print("    Cung 1 password, moi user 1 salt -> hash khac nhau.")


def run_quiz():
    print("=" * 60)
    print("QUIZ ON TONG HOP 20 TUAN (CEH v13)")
    print("=" * 60)
    score = 0
    for i, (q, opts, ans) in enumerate(QUIZ, 1):
        print(f"\nQ{i}. {q}")
        for j, o in enumerate(opts):
            print(f"   {j+1}. {o}")
        try:
            choice = int(input("  Chon (1-4): ").strip()) - 1
        except (ValueError, EOFError):
            choice = -1
        if choice == ans:
            print("  [DUNG]")
            score += 1
        else:
            print(f"  [SAI]  Dap an dung: {opts[ans]}")
    print("\n" + "=" * 60)
    print(f"[KET QUA] {score}/{len(QUIZ)}")
    if score >= 8:
        print("[TOT] Ban san sang thi CEH - chuc mung hoan thanh 20 tuan!")
    elif score >= 5:
        print("[ON THEM] On lai cac tuan con yeu roi chay lai quiz.")
    else:
        print("[CAN ON LAI NHIEU] Doc lai lessons week01-week20, lam cac lab.")


def main():
    ap = argparse.ArgumentParser(description="Crypto toolkit (offline)")
    ap.add_argument("--hash", metavar="STR", help="so sanh hash MD5/SHA-256")
    ap.add_argument("--salt", metavar="SALT_OR_random", help="demo salt chong rainbow table")
    ap.add_argument("--quiz", action="store_true", help="quiz on 20 tuan")
    args = ap.parse_args()

    if args.hash:
        show_hash(args.hash)
    elif args.salt:
        show_hash("supersecret", salt=args.salt)
    elif args.quiz:
        run_quiz()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week20_crypto_toolkit.py --hash 'hello'")


if __name__ == "__main__":
    main()
