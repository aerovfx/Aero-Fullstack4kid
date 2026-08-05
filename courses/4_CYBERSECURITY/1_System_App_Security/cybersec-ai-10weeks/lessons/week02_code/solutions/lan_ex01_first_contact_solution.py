"""ĐÁP ÁN - Bài LAN 1: Bắt liên lạc."""

import socket

PORTS = [21, 22, 23, 80, 443, 3306, 8080, 9001, 9002, 9003]
TIMEOUT = 0.5


def check_lab_ip(ip):
    parts = ip.split(".")
    if len(parts) != 4 or not all(p.isdigit() for p in parts):
        return False
    a, b = int(parts[0]), int(parts[1])
    if a == 10:
        return True
    if a == 192 and b == 168:
        return True
    if a == 172 and 16 <= b <= 31:
        return True
    if a == 127:
        return True
    return False


def is_alive(ip):
    """Máy sống thì trả lời NGAY (mở hoặc từ chối). Máy tắt thì treo tới hết timeout."""
    for port in (80, 443, 9001, 22):
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(0.3)
        try:
            result = s.connect_ex((ip, port))
            # 0 = mở; các mã như 111 (Linux) / 61 (macOS) = từ chối -> máy vẫn sống
            if result == 0 or result in (61, 111, 10061):
                return True
        except socket.timeout:
            pass
        except Exception:
            pass
        finally:
            s.close()
    return False


def scan_host(ip):
    found = []
    for port in PORTS:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(TIMEOUT)
        try:
            if s.connect_ex((ip, port)) == 0:
                found.append(port)
        except Exception:
            pass
        finally:
            s.close()
    return found


if __name__ == "__main__":
    print("=== BÀI LAN 1: BẮT LIÊN LẠC VỚI MÁY A ===\n")

    target_ip = input("Nhập IP của MÁY A (vd 192.168.1.25): ").strip()

    if not check_lab_ip(target_ip):
        print("[X] TỪ CHỐI: đây không phải IP mạng nội bộ. Bài lab dừng lại.")
        raise SystemExit(1)

    confirm = input(f"Xác nhận {target_ip} là máy CỦA BẠN trong mạng lab? (YES): ").strip()
    if confirm != "YES":
        print("Đã huỷ.")
        raise SystemExit(0)

    print(f"\nĐang kiểm tra Máy A ({target_ip})...")
    if is_alive(target_ip):
        print("[+] MÁY A ĐANG BẬT và có thể liên lạc được.")
    else:
        print("[-] Không thấy Máy A phản hồi. Kiểm tra lại:")
        print("    - Gõ đúng IP chưa? (chạy ipconfig/ifconfig trên Máy A)")
        print("    - Hai máy có cùng Wi-Fi không?")
        print("    - Firewall Máy A có đang chặn hết không?")

    print(f"\nQuét Máy A ({target_ip})...")
    remote_open = scan_host(target_ip)

    print("Quét chính Máy B (127.0.0.1)...")
    local_open = scan_host("127.0.0.1")

    print("\n" + "=" * 52)
    print(f"{'CỔNG':<8}{'MÁY A (qua LAN)':<20}{'MÁY B (localhost)'}")
    print("-" * 52)
    for port in PORTS:
        a_state = "MỞ" if port in remote_open else "ĐÓNG"
        b_state = "MỞ" if port in local_open else "ĐÓNG"
        print(f"{port:<8}{a_state:<20}{b_state}")
    print("=" * 52)
    print(f"Máy A: {len(remote_open)} cổng mở {sorted(remote_open)}")
    print(f"Máy B: {len(local_open)} cổng mở {sorted(local_open)}")

# NHẬN XÉT:
# Máy A mở 9001-9003 ra LAN vì lan_target_server.py bind vào "0.0.0.0" - nghĩa là
# lắng nghe trên MỌI card mạng nên Máy B nhìn thấy. Ngược lại các dịch vụ trên Máy B
# (PostgreSQL, server dev...) thường bind vào "127.0.0.1" nên chỉ chính nó thấy,
# máy khác trong nhà quét sẽ báo ĐÓNG. Bind vào đâu quyết định ai được phép gõ cửa.
