"""ĐÁP ÁN - Bài LAN 3: Song đấu tường lửa."""

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
    """Trả về banner nếu cổng mở, None nếu cổng đóng/không tới được."""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1.5)
    try:
        s.connect((ip, port))
        try:
            data = s.recv(1024)
        except socket.timeout:
            data = b""

        if not data:
            s.sendall(b"HELLO\r\n")
            try:
                data = s.recv(1024)
            except socket.timeout:
                data = b""

        text = data.decode(errors="ignore").strip()
        return text if text else "(mở nhưng im lặng)"
    except Exception:
        return None
    finally:
        s.close()


def scan_round(ip):
    snapshot = {}
    for port in LAB_PORTS:
        banner = grab_banner(ip, port)
        snapshot[port] = banner
        if banner:
            print(f"  [+] Cổng {port}: MỞ  -> {banner[:50]}")
        else:
            print(f"  [-] Cổng {port}: ĐÓNG")
    return snapshot


def save_snapshot(ip, snapshot):
    with open(SNAPSHOT_FILE, "w", encoding="utf-8") as f:
        json.dump({"ip": ip, "ports": snapshot}, f, ensure_ascii=False, indent=2)


ADVICE = {
    9001: "Cổng 9001 (FTP giả) vẫn vào được - thêm luật deny hoặc tắt dịch vụ.",
    9002: "Cổng 9002 (SSH giả) vẫn vào được - kiểm tra luật firewall đã áp đúng chiều Inbound chưa.",
    9003: "Cổng 9003 (HTTP giả) đang mở - đây là cổng chủ ý để đối chiếu, giữ nguyên cũng được.",
}


def compare(before, after):
    print("\n" + "=" * 68)
    print(f"{'CỔNG':<8}{'TRƯỚC':<12}{'SAU':<12}{'KẾT LUẬN'}")
    print("-" * 68)

    was_open = 0
    patched = 0
    still_open = []

    for port in LAB_PORTS:
        b_open = before.get(str(port)) is not None or before.get(port) is not None
        a_open = after.get(port) is not None

        if b_open:
            was_open += 1

        if b_open and not a_open:
            verdict = "ĐÃ VÁ"
            patched += 1
        elif b_open and a_open:
            verdict = "CÒN HỞ"
            still_open.append(port)
        elif not b_open and a_open:
            verdict = "MỞ THÊM (!)"
            still_open.append(port)
        else:
            verdict = "ỔN ĐỊNH"

        print(f"{port:<8}{('MỞ' if b_open else 'ĐÓNG'):<12}{('MỞ' if a_open else 'ĐÓNG'):<12}{verdict}")

    print("=" * 68)
    print(f"ĐIỂM BLUE TEAM: đóng được {patched}/{was_open} cổng từng mở.")

    if still_open:
        print("\nKHUYẾN NGHỊ CHO BLUE TEAM:")
        for port in still_open:
            print(f"- {ADVICE.get(port, f'Cổng {port} vẫn mở - rà lại luật firewall.')}")
    else:
        print("\nXuất sắc! Red Team không còn cửa nào để vào.")


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
        print("Giờ tới lượt MÁY A: bật firewall chặn cổng 9001 và 9002.")
        print("Xong thì chạy lại:  python3 lan_ex03_firewall_duel.py after")

    else:
        if not os.path.exists(SNAPSHOT_FILE):
            print(f"[X] Chưa có {SNAPSHOT_FILE}. Hãy chạy bước 'before' trước đã.")
            raise SystemExit(1)

        with open(SNAPSHOT_FILE, encoding="utf-8") as f:
            saved = json.load(f)

        target_ip = saved["ip"]
        before = saved["ports"]

        print(f"--- HIỆP 3: QUÉT LẠI {target_ip} SAU KHI VÁ ---")
        after = scan_round(target_ip)
        compare(before, after)

# BÁO CÁO MẪU:
# - Cổng đã vá thành công: 9001, 9002 (firewall chặn ở tầng mạng).
# - Cổng còn hở: 9003 - chủ ý để nguyên làm nhóm đối chứng, chứng minh rằng
#   server vẫn chạy bình thường và chỉ có firewall thay đổi kết quả quét.
# - Bài học: firewall chặn gói tin TRƯỚC KHI chúng tới được ứng dụng. Dịch vụ
#   trên Máy A vẫn đang chạy (Máy A tự kết nối 127.0.0.1:9001 vẫn được), nhưng
#   Máy B ngoài mạng thì không thấy nữa. Muốn an toàn thật sự thì nên làm CẢ HAI:
#   tắt dịch vụ không cần thiết VÀ bật firewall (phòng thủ nhiều lớp).
