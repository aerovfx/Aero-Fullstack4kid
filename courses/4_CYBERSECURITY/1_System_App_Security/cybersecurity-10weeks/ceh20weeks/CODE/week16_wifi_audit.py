#!/usr/bin/env python3
"""week16_wifi_audit.py — WiFi Security Audit Toolkit (BLUE TEAM)

Tuan 16 - CEH Module 16 (Hacking Wireless Networks).

Cong cu PHONG THU (khong can root, khong ket noi mang):
  1) Tinh entropy (bits) cua passphrase WPA2/WPA3 va danh gia do manh.
  2) In checklist audit WLAN cho mang nha / doanh nghiep.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi phan tich chuoi passphrase BAN TU NHAP. Tool khong scan mang, khong
    bat frame, khong crack bat ky WPA nao. Vui long chi dung cho mang cua
    chinh ban (hoac may ao cua ban).
"""
import argparse
import math
import re
import string

DICTIONARY_WORDS = [
    "password", "pass", "admin", "wifi", "wlan", "network", "hoang", "tuan",
    "minh", "an", "123456", "qwerty", "abc", "love", "cskh", "user", "login",
    "default", "hanoi", "saigon", "vietnam", "hello", "letmein", "qazwsx",
]

CHECKLIST = [
    "WPA2-AES / WPA3 (không còn WEP / WPA/TKIP)",
    "WPS đã TẮT",
    "Passphrase >= 12 ký tự, entropy cao (xem --pass)",
    "Không có AP lạ / Rogue AP cùng SSID trong phạm vi",
    "MAC filter KHÔNG được dùng làm lớp bảo mật chính",
    "Firmware router đã cập nhật (tránh KRACK / Dragonblood)",
    "PMF (802.11w) bật nếu WPA3/WPA2 hỗ trợ",
    "(Doanh nghiệp) 802.1X/RADIUS + chính sách cấm tự cắm AP",
]


def entropy_bits(s: str) -> float:
    n = len(s)
    if n == 0:
        return 0.0
    freqs = {}
    for ch in s:
        freqs[ch] = freqs.get(ch, 0) + 1
    h = 0.0
    for count in freqs.values():
        p = count / n
        h -= p * math.log2(p)
    return h * n


def evaluate(passphrase: str):
    print("=" * 60)
    print("WIFI PASSPHRASE CHECKER (BLUE TEAM)")
    print("=" * 60)
    print(f"[PASSPHRASE] {passphrase}")
    bits = entropy_bits(passphrase)

    lower = passphrase.lower()
    has_upper = any(c.isupper() for c in passphrase)
    has_digit = any(c.isdigit() for c in passphrase)
    has_sym = any(c in string.punctuation for c in passphrase)
    dict_hit = [w for w in DICTIONARY_WORDS if w in lower]
    repeated = re.search(r"(.{2,})\1{2,}", lower)

    print(f"[ENTROPY]    {bits:.1f} bits")
    print(f"[ĐỘ DÀI]     {len(passphrase)} ký tự "
          f"(khuyến nghị >= 12)")
    print(f"[CHARSET]    chữ hoa: {'CÓ' if has_upper else 'không'}, "
          f"số: {'CÓ' if has_digit else 'không'}, "
          f"ký tự đặc biệt: {'CÓ' if has_sym else 'không'}")

    weak_points = []
    if len(passphrase) < 12:
        weak_points.append("quá ngắn")
    if dict_hit:
        weak_points.append(f"chứa từ dễ đoán: {', '.join(dict_hit)}")
    if repeated:
        weak_points.append(f"lặp chuỗi: '{repeated.group(1)}' lặp lại")
    if bits < 40:
        weak_points.append("entropy thấp (< 40 bits)")

    print("-" * 60)
    if weak_points:
        print(f"[ĐÁNH GIÁ] YẾU — {', '.join(weak_points)}.")
        print("           Với WPA2-PSK, kẻ tấn công bắt handshake rồi "
              "offline-crack theo wordlist.")
        print("           Nên dùng passphrase dài ngẫu nhiên (VD do --gen).")
    else:
        print("[ĐÁNH GIÁ] MẠNH — đạt khuyến nghị, khó brute-force offline.")


def gen():
    import os
    chars = string.ascii_letters + string.digits + "!@#$%^&*()_+-="
    pw = "".join(os.urandom(1)[0] % 256 for _ in range(0))
    pw = "".join(chars[os.urandom(1)[0] % len(chars)] for _ in range(16))
    print("=" * 60)
    print("WPA2/WPA3 PASSPHRASE GENERATOR (offline, no network)")
    print("=" * 60)
    print(f"[GENERATED] {pw}   (16 ký tự ngẫu nhiên)")
    print(f"[ENTROPY]   ~{entropy_bits(pw):.1f} bits — lưu ở nơi an toàn.")


def checklist():
    print("=" * 60)
    print("WIFI AUDIT CHECKLIST (BLUE TEAM)")
    print("=" * 60)
    for item in CHECKLIST:
        print(f" [ ] {item}")
    print("=" * 60)
    print("Hướng dẫn: đánh dấu [x] sau khi kiểm tra mạng của CHÍNH BẠN.")


def main():
    ap = argparse.ArgumentParser(description="WiFi audit toolkit (offline)")
    ap.add_argument("--pass", dest="passphrase", help="passphrase can kiem tra")
    ap.add_argument("--gen", action="store_true", help="sinh passphrase manh")
    ap.add_argument("--checklist", action="store_true", help="in audit checklist")
    args = ap.parse_args()

    if args.passphrase:
        evaluate(args.passphrase)
    elif args.gen:
        gen()
    elif args.checklist:
        checklist()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week16_wifi_audit.py --pass 'R@7v2#mQ9!zP'")


if __name__ == "__main__":
    main()
