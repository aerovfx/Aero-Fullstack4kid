"""
BÀI TẬP 2 (Tuần 5): WRAPPER NMAP AN TOÀN - CHỐT CHẶN MỤC TIÊU
Ôn lại: tự động hoá Nmap, nguyên tắc chỉ quét tài sản của mình.

BỐI CẢNH:
Tự động hoá Nmap rất mạnh nhưng cũng nguy hiểm: một script lỡ quét nhầm IP
ngoài là đã phạm luật. Bài này dạy cách viết một "chốt chặn" (guard rail) bắt
buộc mọi mục tiêu phải là localhost/mạng nội bộ TRƯỚC KHI gọi nmap.

NHIỆM VỤ:
1. Viết is_allowed_target(ip): chỉ cho 127.0.0.1 và dải nội bộ (10/8, 192.168/16,
   172.16-31/12). Trả về False cho mọi IP công cộng.
2. Nếu bị chặn -> in lỗi và KHÔNG chạy nmap.
3. Nếu hợp lệ -> dựng câu lệnh nmap và chạy (bắt lỗi nếu máy chưa cài nmap).

CHẠY:  python3 ex02_safe_nmap_wrapper.py 127.0.0.1
"""

import subprocess
import sys


def is_allowed_target(ip):
    """True nếu ip là localhost hoặc IP mạng nội bộ (private)."""
    parts = ip.split(".")
    if len(parts) != 4 or not all(p.isdigit() and 0 <= int(p) <= 255 for p in parts):
        return False
    a, b = int(parts[0]), int(parts[1])
    # TODO 1: trả về True nếu:
    #   a == 127                      (localhost)
    #   a == 10                       (10.0.0.0/8)
    #   a == 192 and b == 168         (192.168.0.0/16)
    #   a == 172 and 16 <= b <= 31    (172.16.0.0/12)
    # Ngược lại trả về False.
    return False


def run_nmap(ip):
    """Dựng lệnh nmap quét top 1000 cổng + phát hiện phiên bản, rồi chạy."""
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

    # TODO 2: nếu KHÔNG is_allowed_target(target) -> in cảnh báo từ chối và sys.exit(1).
    # TODO 3: nếu hợp lệ -> gọi run_nmap(target).
