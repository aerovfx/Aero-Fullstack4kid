"""
BÀI LAN 1: BẮT LIÊN LẠC (First Contact) - chạy trên MÁY B
Thời gian: ~20 phút | Ôn lại: Cấp độ 1 + Cấp độ 2, áp dụng qua mạng thật

BỐI CẢNH:
Máy A đang chạy 30_lan_target_server.py và mở 3 cổng lab (9001, 9002, 9003).
Bạn ngồi ở Máy B, nhiệm vụ là tìm ra những cánh cửa đó QUA MẠNG LAN.

NHIỆM VỤ:
1. Nhập IP của Máy A (hỏi bạn ngồi máy A, dạng 192.168.x.x).
2. Kiểm tra Máy A có "sống" không bằng TCP ping (thử gõ vài cổng, nếu có
   bất kỳ phản hồi nào - kể cả RST - thì máy đang bật).
3. Quét checklist cổng trên Máy A và in kết quả.
4. Quét CÙNG checklist đó trên chính máy mình (127.0.0.1) và so sánh 2 cột.

BÀI HỌC RÚT RA: cổng mở trên localhost CHƯA CHẮC mở ra LAN, và ngược lại.
Đây chính là khác biệt giữa bind("127.0.0.1") và bind("0.0.0.0").

AN TOÀN: hàm check_lab_ip() bên dưới chỉ cho phép IP nội bộ (192.168.x.x,
10.x.x.x, 172.16-31.x.x). Không được xoá hàm này.
"""

import socket

PORTS = [21, 22, 23, 80, 443, 3306, 8080, 9001, 9002, 9003]
TIMEOUT = 0.5


def check_lab_ip(ip):
    """Chốt chặn an toàn: chỉ chấp nhận IP mạng nội bộ (private)."""
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
    """
    'TCP ping': thử kết nối vài cổng. Nếu hệ điều hành trả lời NGAY (dù là từ chối)
    thì máy đang bật. Nếu tất cả đều treo tới hết timeout -> máy tắt hoặc bị firewall chặn.
    """
    # TODO 1: for port in (80, 443, 9001, 22):
    #             tạo socket, settimeout(0.3), gọi connect_ex
    #             nếu result == 0 (mở) HOẶC result == 111/61 (bị từ chối) -> return True
    #         Gợi ý: cổng đóng nhưng máy sống thường trả về mã khác 0 rất nhanh,
    #         còn máy tắt sẽ ném socket.timeout. Bắt timeout bằng try/except.
    return False


def scan_host(ip):
    """Quét danh sách PORTS trên 1 máy, trả về list cổng mở."""
    found = []
    # TODO 2: duyệt PORTS, dùng connect_ex, cổng nào mở thì found.append(port)
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

    # TODO 3: gọi is_alive(target_ip), in "Máy A đang BẬT" hoặc "Không thấy Máy A".
    #         Nếu không thấy: gợi ý kiểm tra lại IP, Wi-Fi, hoặc firewall Máy A.

    # TODO 4: quét Máy A -> lưu vào remote_open
    # TODO 5: quét chính mình (127.0.0.1) -> lưu vào local_open

    # TODO 6: In bảng so sánh 2 cột, ví dụ:
    # CỔNG   MÁY A (LAN)   MÁY B (localhost)
    # 9001   MỞ            ĐÓNG
    # ...

    # TODO 7: Viết 1-2 câu nhận xét vào comment cuối file:
    #   Vì sao có cổng mở ở máy này mà không mở ở máy kia?

# NHẬN XÉT CỦA BẠN:
#
