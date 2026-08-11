#!/usr/bin/env python3
"""week17_mobile_scanner.py — Mobile Security Scanner (BLUE TEAM)

Tuan 17 - CEH Module 17 (Hacking Mobile Platforms).

Cong cu PHONG THU:
  1) Quet file ma nguon app (tu ban tao / app cua chinh ban) de phat hien
     secret bj lo: API key, password, token, connection string.
  2) In checklist cau hinh an toan thiet bi Android/iOS.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi quet thu muc/ma nguon BAN CO QUYEN. Khong quet app nguoi khac,
    khong root/jailbreak, khong ket noi mang. Phat hien secret trong app
    cua chinh ban de khac phuc (insecure storage).
"""
import argparse
import os
import re

CODE_EXTS = {".java", ".kt", ".swift", ".js", ".ts", ".py", ".php", ".go",
             ".rb", ".cs", ".c", ".cpp", ".h", ".xml", ".json", ".plist",
             ".gradle", ".yml", ".yaml", ".properties"}

SECRET_PATTERNS = [
    (r"(?i)api[_-]?key\s*[:=]\s*['\"][A-Za-z0-9_\-]{10,}", "API key"),
    (r"(?i)(sk|pk|AKIA|ghp_|AIza|ya29\.)[A-Za-z0-9_\-]{8,}", "API token (prefix)"),
    (r"(?i)\b\w*password\w*\s*[:=]\s*['\"][^'\"]{4,}", "password"),
    (r"(?i)\b\w*pass(word|wd)?\w*\s*[:=]\s*['\"][^'\"]{4,}", "password"),
    (r"(?i)\bsecret\s*[:=]\s*['\"][^'\"]{6,}", "secret"),
    (r"(?i)token\s*[:=]\s*['\"][A-Za-z0-9_\-\.]{10,}", "token"),
    (r"(?i)passwd\s*[:=]\s*['\"][^'\"]{4,}", "passwd"),
    (r"(?i)connection\s*string\s*[:=]\s*['\"][^'\"]{10,}", "connection string"),
    (r"(?i)(BEGIN\s+(RSA\s+)?PRIVATE\s+KEY)", "private key"),
]

CHECKLIST = [
    "Thiết bị KHÔNG root/jailbreak (trừ khi thực sự cần cho lab)",
    "Mã hoá thiết bị bật + màn hình khoá mạnh",
    "Chỉ cài app từ store chính thức (không sideload)",
    "Permission cấp tối thiểu cho từng app",
    "OS + app đã cập nhật đầy đủ",
    "Không lưu API key/password/token trong mã nguồn app",
    "TLS bắt buộc + certificate pinning trong app (nếu làm dev)",
    "(Doanh nghiệp) MDM + containerization cho BYOD",
]


def scan_dir(root):
    print("=" * 60)
    print("MOBILE APP SECRET SCANNER (BLUE TEAM)")
    print("=" * 60)
    total = 0
    hits = 0
    for dirpath, _dirs, files in os.walk(root):
        if "/node_modules/" in dirpath or "/.git/" in dirpath:
            continue
        for fname in sorted(files):
            ext = os.path.splitext(fname)[1].lower()
            if ext not in CODE_EXTS:
                continue
            fpath = os.path.join(dirpath, fname)
            total += 1
            try:
                with open(fpath, "r", errors="ignore") as fh:
                    for lineno, line in enumerate(fh, 1):
                        for pat, label in SECRET_PATTERNS:
                            if re.search(pat, line):
                                print(f"  {fpath}:{lineno} "
                                      f"[!] DẤU HIỆU {label}")
                                print(f"      {line.strip()[:90]}")
                                hits += 1
                                break
            except OSError:
                pass
    print("-" * 60)
    print(f"[KẾT QUẢ] Quét {total} file mã nguồn, "
          f"phát hiện {hits} dấu hiệu secret lộ.")
    if hits:
        print("[RỦI RO]   App bị reverse engineer sẽ trích xuất được secret "
              "(insecure storage).")
        print("           -> Di chuyển secret sang keystore/server-side, "
              "xóa khỏi source.")
    else:
        print("[TỐT]      Không phát hiện secret trong phạm vi đã quét.")


def checklist():
    print("=" * 60)
    print("MOBILE SECURITY CHECKLIST (BLUE TEAM)")
    print("=" * 60)
    for item in CHECKLIST:
        print(f" [ ] {item}")
    print("=" * 60)
    print("Hướng dẫn: tự đánh giá thiết bị/ứng dụng của CHÍNH BẠN.")


def main():
    ap = argparse.ArgumentParser(description="Mobile security scanner (offline)")
    ap.add_argument("--scan", metavar="DIR", help="quét mã nguồn trong thư mục")
    ap.add_argument("--checklist", action="store_true", help="in checklist")
    args = ap.parse_args()

    if args.scan:
        if os.path.isdir(args.scan):
            scan_dir(args.scan)
        else:
            print(f"[LỖI] Không tìm thấy thư mục: {args.scan}")
    elif args.checklist:
        checklist()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week17_mobile_scanner.py --scan ./myapp")


if __name__ == "__main__":
    main()
