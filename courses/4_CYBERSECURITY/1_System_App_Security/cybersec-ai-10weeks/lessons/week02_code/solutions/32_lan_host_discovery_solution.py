"""ĐÁP ÁN - Bài LAN 2: Điểm danh thiết bị trong mạng."""

import socket
import threading

PROBE_PORTS = [22, 80, 443, 445, 9001, 9002, 9003]
TIMEOUT = 0.3

results = {}
results_lock = threading.Lock()


def get_my_lan_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(("8.8.8.8", 80))
        return s.getsockname()[0]
    except Exception:
        return None
    finally:
        s.close()


def is_private(ip):
    parts = ip.split(".")
    if len(parts) != 4 or not all(p.isdigit() for p in parts):
        return False
    a, b = int(parts[0]), int(parts[1])
    return a == 10 or (a == 192 and b == 168) or (a == 172 and 16 <= b <= 31)


def probe_host(ip):
    open_here = []
    for port in PROBE_PORTS:
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.settimeout(TIMEOUT)
        try:
            if s.connect_ex((ip, port)) == 0:
                open_here.append(port)
        except Exception:
            pass
        finally:
            s.close()

    if open_here:
        with results_lock:
            results[ip] = open_here
        print(f"[+] Tìm thấy thiết bị {ip} - cổng mở: {open_here}")


if __name__ == "__main__":
    print("=== BÀI LAN 2: ĐIỂM DANH THIẾT BỊ TRONG MẠNG ===\n")

    my_ip = get_my_lan_ip()
    if not my_ip or not is_private(my_ip):
        print(f"[X] Không xác định được IP nội bộ hợp lệ (nhận được: {my_ip}). Dừng lại.")
        raise SystemExit(1)

    prefix = ".".join(my_ip.split(".")[:3]) + "."

    print(f"IP máy bạn (Máy B): {my_ip}")
    print(f"Dải mạng sẽ quét  : {prefix}1 - {prefix}254")

    confirm = input("\nĐây là mạng LAN riêng của bạn và bạn được phép quét? (YES): ").strip()
    if confirm != "YES":
        print("Đã huỷ. Lựa chọn đúng đắn nếu bạn không chắc chắn!")
        raise SystemExit(0)

    print("\nĐang quét... (đa luồng, chờ vài giây)\n")

    threads = []
    for last in range(1, 255):
        ip = f"{prefix}{last}"
        t = threading.Thread(target=probe_host, args=(ip,))
        threads.append(t)
        t.start()

    for t in threads:
        t.join()

    print("\n" + "=" * 62)
    print("KẾT QUẢ ĐIỂM DANH")
    print("=" * 62)

    lab_ports = {9001, 9002, 9003}
    for ip in sorted(results, key=lambda x: int(x.split(".")[-1])):
        ports = results[ip]
        note = ""
        if lab_ports & set(ports):
            note = "  <-- ĐÂY LÀ MÁY A"
        elif ip == my_ip:
            note = "  <-- chính là Máy B (bạn)"
        elif ip.endswith(".1"):
            note = "  <-- nhiều khả năng là Router"
        print(f"{ip:<18}{str(ports):<28}{note}")

    print("=" * 62)
    print(f"Tổng cộng: {len(results)} thiết bị đang bật trong mạng.")
    print("\nLƯU Ý ĐẠO ĐỨC: thiết bị không phải của bạn (TV, điện thoại, máy in của")
    print("người khác) thì CHỈ ghi nhận. Không quét sâu, không thử kết nối vào chúng.")

# CÂU HỎI SUY NGẪM:
# 1. Thường sẽ thấy: router ở .1, điện thoại/laptop trong nhà, có thể có TV thông minh
#    (cổng 8008/8009 của Chromecast), máy in mạng (cổng 9100), camera IP (554/80).
# 2. Router mở 80/443 vì nó có trang quản trị web để người dùng đăng nhập chỉnh Wi-Fi.
#    Đây cũng là lý do phải đổi mật khẩu mặc định của router ngay khi lắp đặt.
