#!/usr/bin/env python3
"""week19_cloud_audit.py — Cloud Security Audit Toolkit (BLUE TEAM)

Tuan 19 - CEH Module 19 (Hacking Cloud Computing).

Cong cu PHONG THU (offline, khong goi API cloud nao):
  1) Quet thu muc code/config de phat hien access key / secret / token cloud
     bi lo (pattern AKIA..., AWS secret, GCP/API key).
  2) Giai thich nhanh shared responsibility theo mo hinh IaaS/PaaS/SaaS.
  3) In checklist audit IaaS theo OWASP Cloud Top 10.

[ETIKA - DOC TRUOC KHI CHAY]
  - Chi quet thu muc BAN CO QUYEN. Khong goi bat ky API cloud nao, khong
    quet account nguoi khac. Secret tim duoc trong project cua chinh ban
    phai duoc xoa va xoay key ngay.
"""
import argparse
import os
import re

CODE_EXTS = {".env", ".ini", ".conf", ".yaml", ".yml", ".json", ".tf",
             ".py", ".js", ".ts", ".java", ".kt", ".go", ".sh", ".cfg",
             ".toml", ".properties", ".txt"}

SECRET_PATTERNS = [
    (r"\bAKIA[0-9A-Z]{16}\b", "AWS access key (AKIA...)"),
    (r"\bwJalrXUtn[0-9A-Za-z/+]{20,}\b", "AWS secret (dạng mẫu)"),
    (r"(?i)aws[_-]?secret[_-]?access[_-]?key\s*[:=]", "AWS secret access key"),
    (r"(?i)aws[_-]?access[_-]?key[_-]?id\s*[:=]\s*['\"]?AKIA", "AWS access key id"),
    (r"AIza[0-9A-Za-z_\-]{20,}", "GCP/Google API key"),
    (r"ya29\.[0-9A-Za-z_\-]{20,}", "Google OAuth token"),
    (r"sk-[0-9A-Za-z]{20,}", "OpenAI/Stripe secret key (sk-)"),
    (r"ghp_[0-9A-Za-z]{20,}", "GitHub personal access token"),
    (r"(?i)azure[_-]?client[_-]?secret\s*[:=]", "Azure client secret"),
    (r"(?i)secret[_-]?key\s*[:=]\s*['\"][^'\"]{8,}", "generic secret key"),
]

CHECKLIST = [
    "IAM theo nguyên tắc least privilege + MFA bắt buộc + key xoay định kỳ",
    "Bucket/container KHÔNG public; block public access khi không cần",
    "Không commit access key / secret lên git hoặc lộ trong config",
    "Logging & giám sát bật (CloudTrail/GuardDuty) + cảnh báo hành động lạ",
    "Dữ liệu mã hoá at-rest (KMS) và in-transit (TLS)",
    "Security group/network hẹp, không mở 0.0.0.0/0 trừ khi thật cần",
    "Quét cấu hình định kỳ (Prowler/ScoutSuite/--scan)",
    "Rà soát OWASP Cloud Top 10 mỗi quý",
]

RESPONSIBILITY = {
    "iaas": ("IaaS (EC2/VM tự quản)",
             ["hạ tầng vật lý, hypervisor, mạng data center"],
             ["OS, patch, firewall guest, IAM, dữ liệu, mã hoá"]),
    "paas": ("PaaS (App Engine/Heroku)",
             ["runtime, OS, hạ tầng, patch nền"],
             ["app code, cấu hình, dữ liệu, quản lý secret"]),
    "saas": ("SaaS (Gmail/O365)",
             ["toàn bộ ứng dụng, hạ tầng, bảo mật nền"],
             ["dữ liệu, cách dùng, cấu hình tổ chức, quản trị tài khoản"]),
}


def scan_dir(root):
    print("=" * 60)
    print("CLOUD SECRET SCANNER (BLUE TEAM)")
    print("=" * 60)
    total = 0
    hits = 0
    for dirpath, _dirs, files in os.walk(root):
        if "/.git/" in dirpath or "/node_modules/" in dirpath:
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
                                print(f"  {fpath}:{lineno} [!] {label}")
                                hits += 1
                                break
            except OSError:
                pass
    print("-" * 60)
    print(f"[KẾT QUẢ] Quét {total} file, phát hiện {hits} secret lộ.")
    if hits:
        print("[NGUY HIỂM] Kẻ tấn công quét GitHub/pastebin bằng pattern này "
              "để tìm key.")
        print("            -> Xoá secret khỏi file, XOAY KEY (revoke) ngay, "
              "đưa secret vào secret manager.")
    else:
        print("[TỐT] Không phát hiện secret cloud trong phạm vi đã quét.")


def responsibility(model: str):
    name, csp, cust = RESPONSIBILITY.get(
        model.lower(), (model, ["?"], ["?"]))
    print("=" * 60)
    print(f"[MÔ HÌNH] {name}")
    print(f"  CSP chịu: {', '.join(csp)}")
    print(f"  BẠN chịu: {', '.join(cust)}")
    print("=> Phần lớn lỗi bảo mật cloud do CẤU HÌNH phía bạn (shared "
          "responsibility).")


def checklist():
    print("=" * 60)
    print("CLOUD SECURITY CHECKLIST (BLUE TEAM)")
    print("=" * 60)
    for item in CHECKLIST:
        print(f" [ ] {item}")
    print("=" * 60)
    print("Hướng dẫn: áp dụng cho account cloud của CHÍNH BẠN.")


def main():
    ap = argparse.ArgumentParser(description="Cloud audit toolkit (offline)")
    ap.add_argument("--scan", metavar="DIR", help="quét secret trong thư mục")
    ap.add_argument("--responsibility", metavar="iaas|paas|saas",
                    help="giải thích shared responsibility")
    ap.add_argument("--checklist", action="store_true", help="in checklist")
    args = ap.parse_args()

    if args.scan:
        if os.path.isdir(args.scan):
            scan_dir(args.scan)
        else:
            print(f"[LỖI] Không tìm thấy thư mục: {args.scan}")
    elif args.responsibility:
        responsibility(args.responsibility)
    elif args.checklist:
        checklist()
    else:
        ap.print_help()
        print("\nVD: python3 CODE/week19_cloud_audit.py --scan ./repo")


if __name__ == "__main__":
    main()
