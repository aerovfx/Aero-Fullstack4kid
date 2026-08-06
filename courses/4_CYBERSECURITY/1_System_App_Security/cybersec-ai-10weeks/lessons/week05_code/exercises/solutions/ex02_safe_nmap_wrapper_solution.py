"""ĐÁP ÁN - Bài tập 2 (Tuần 5): Wrapper Nmap an toàn."""

import subprocess
import sys


def is_allowed_target(ip):
    parts = ip.split(".")
    if len(parts) != 4 or not all(p.isdigit() and 0 <= int(p) <= 255 for p in parts):
        return False
    a, b = int(parts[0]), int(parts[1])
    if a == 127:
        return True
    if a == 10:
        return True
    if a == 192 and b == 168:
        return True
    if a == 172 and 16 <= b <= 31:
        return True
    return False


def run_nmap(ip):
    cmd = ["nmap", "-sV", "--open", "-p", "1-1000", ip]
    print(f"[+] Chạy: {' '.join(cmd)}")
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
        print(result.stdout)
    except FileNotFoundError:
        print("[-] Chưa cài nmap. Trên Kali đã có sẵn; máy khác: cài nmap trước.")
    except subprocess.TimeoutExpired:
        print("[-] Nmap chạy quá lâu, đã dừng.")


if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "127.0.0.1"

    if not is_allowed_target(target):
        print(f"[X] TỪ CHỐI: '{target}' không phải localhost/mạng nội bộ.")
        print("    Chỉ được quét tài sản của chính bạn. Bài lab dừng lại.")
        sys.exit(1)

    print(f"[+] '{target}' hợp lệ (localhost/nội bộ). Tiến hành quét...")
    run_nmap(target)

# KIỂM CHỨNG CHỐT CHẶN:
#   python3 ... 127.0.0.1      -> hợp lệ, chạy nmap
#   python3 ... 8.8.8.8        -> BỊ TỪ CHỐI, không chạy nmap
#   python3 ... 192.168.1.10   -> hợp lệ (nội bộ)
