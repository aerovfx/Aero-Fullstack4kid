"""
BÀI LAN 3: SONG ĐẤU TƯỜNG LỬA (Firewall Duel) - Red Team vs Blue Team
Thời gian: ~30 phút | Ôn lại: Banner Grabbing + Remediation + kiểm chứng

BỐI CẢNH: Hai bạn đóng hai vai.
    MÁY A = Blue Team (phòng thủ) - chạy lan_target_server.py rồi bật firewall.
    MÁY B = Red Team  (trinh sát) - chạy file này, quét trước và sau khi A đóng cổng.

LUẬT CHƠI - 3 hiệp:
    Hiệp 1 (BEFORE): Máy A mở cả 3 cổng lab. Máy B quét + lấy banner, lưu ảnh chụp
                     hiện trạng vào file snapshot_before.json.
    Hiệp 2 (VÁ LỖI): Máy A dùng firewall chặn cổng 9001 và 9002 (xem lệnh bên dưới).
    Hiệp 3 (AFTER):  Máy B quét lại, so sánh với ảnh chụp cũ và chấm điểm Blue Team:
                     đóng được bao nhiêu cổng? Còn sót cổng nào?

LỆNH CHO MÁY A (Blue Team) - chạy ở hiệp 2:
    Ubuntu/Linux:
        sudo ufw enable
        sudo ufw deny 9001
        sudo ufw deny 9002
        sudo ufw status
    macOS:
        sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on
        # rồi cho phép chặn Python khi macOS hỏi
    Windows (PowerShell với quyền Administrator):
        New-NetFirewallRule -DisplayName "Block Lab 9001" -Direction Inbound `
            -Protocol TCP -LocalPort 9001 -Action Block
        New-NetFirewallRule -DisplayName "Block Lab 9002" -Direction Inbound `
            -Protocol TCP -LocalPort 9002 -Action Block

    NHỚ DỌN DẸP sau khi học xong:
        sudo ufw delete deny 9001 ; sudo ufw delete deny 9002
        Remove-NetFirewallRule -DisplayName "Block Lab 9001"

CÁCH CHẠY (trên Máy B):
    python3 lan_ex03_firewall_duel.py before
    ... đợi Máy A vá lỗi ...
    python3 lan_ex03_firewall_duel.py after

AN TOÀN: chỉ IP nội bộ, chỉ máy của nhóm bạn.
"""

import json
import os
import socket
import sys

LAB_PORTS = [9001, 9002, 9003]
SNAPSHOT_FILE = "snapshot_before.json"


def is_private(ip):
    parts = ip.split(".")
    if len(parts) != 4 or not all(p.isdigit() for p in parts):
        return False
    a, b = int(parts[0]), int(parts[1])
    return a == 10 or (a == 192 and b == 168) or (a == 172 and 16 <= b <= 31)


def grab_banner(ip, port):
    """Kết nối và lấy banner. Trả về chuỗi banner, hoặc None nếu cổng đóng/im lặng."""
    # TODO 1: socket + settimeout(1.5), connect((ip, port)) trong try.
    # TODO 2: thử recv(1024) trước (dịch vụ tự chào); nếu rỗng thì sendall(b"HELLO\r\n")
    #         rồi recv(1024) lần nữa.
    # TODO 3: decode(errors="ignore").strip(); rỗng -> "(mở nhưng im lặng)".
    # TODO 4: except Exception -> return None (coi như cổng đóng). finally: close().
    return None


def scan_round(ip):
    """Quét 1 lượt: trả về dict {port: banner_hoặc_None}."""
    snapshot = {}
    # TODO 5: for port in LAB_PORTS: snapshot[port] = grab_banner(ip, port)
    #         In từng dòng kết quả cho học sinh theo dõi.
    return snapshot


def save_snapshot(ip, snapshot):
    """Lưu ảnh chụp hiện trạng ra file JSON để hiệp 3 đem ra so sánh."""
    # TODO 6: json.dump({"ip": ip, "ports": snapshot}, open(SNAPSHOT_FILE, "w"), ...)
    #         Nhớ ensure_ascii=False và indent=2 cho dễ đọc tiếng Việt.
    pass


def compare(before, after):
    """In bảng so sánh trước/sau và chấm điểm Blue Team."""
    # TODO 7: Với mỗi cổng, xác định trạng thái:
    #   - trước MỞ, sau ĐÓNG  -> "ĐÃ VÁ"       (Blue Team +1 điểm)
    #   - trước MỞ, sau MỞ    -> "CÒN HỞ"      (Red Team vẫn vào được)
    #   - trước ĐÓNG, sau MỞ  -> "MỞ THÊM (!)" (đi lùi, trừ điểm)
    #   - cả hai ĐÓNG         -> "ỔN ĐỊNH"
    # TODO 8: In điểm: "Blue Team đóng được X/Y cổng từng mở."
    # TODO 9: Nếu còn cổng hở -> in khuyến nghị cụ thể cho cổng đó.
    pass


if __name__ == "__main__":
    if len(sys.argv) != 2 or sys.argv[1] not in ("before", "after"):
        print("Cách dùng: python3 lan_ex03_firewall_duel.py before|after")
        raise SystemExit(1)

    phase = sys.argv[1]

    if phase == "before":
        target_ip = input("Nhập IP của MÁY A: ").strip()
        if not is_private(target_ip):
            print("[X] TỪ CHỐI: không phải IP mạng nội bộ.")
            raise SystemExit(1)
        if input(f"Xác nhận {target_ip} là máy của nhóm bạn? (YES): ").strip() != "YES":
            raise SystemExit(0)

        print("\n--- HIỆP 1: QUÉT TRƯỚC KHI VÁ ---")
        snap = scan_round(target_ip)
        save_snapshot(target_ip, snap)
        print(f"\nĐã lưu {SNAPSHOT_FILE}.")
        print("Giờ tới lượt MÁY A: bật firewall chặn cổng 9001 và 9002 (xem lệnh đầu file).")
        print("Xong thì chạy lại:  python3 lan_ex03_firewall_duel.py after")

    else:
        if not os.path.exists(SNAPSHOT_FILE):
            print(f"[X] Chưa có {SNAPSHOT_FILE}. Hãy chạy bước 'before' trước đã.")
            raise SystemExit(1)

        # TODO 10: đọc file JSON, lấy lại ip và ports cũ,
        #          quét lại 1 lượt rồi gọi compare(before, after).

# BÁO CÁO CỦA BẠN (điền sau khi chạy xong 3 hiệp):
# - Cổng đã vá thành công:
# - Cổng còn hở và lý do:
# - Bài học: firewall chặn ở tầng nào? Server vẫn đang chạy hay đã tắt?
