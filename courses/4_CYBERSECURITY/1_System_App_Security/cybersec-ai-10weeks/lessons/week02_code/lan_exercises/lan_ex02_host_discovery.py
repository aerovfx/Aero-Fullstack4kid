"""
BÀI LAN 2: ĐIỂM DANH THIẾT BỊ TRONG NHÀ (Host Discovery) - chạy trên MÁY B
Thời gian: ~25 phút | Ôn lại: Cấp độ 3 (threading) ở quy mô mạng

BỐI CẢNH:
Lần này bạn KHÔNG hỏi IP của Máy A. Bạn phải tự tìm nó giữa 254 địa chỉ
có thể có trong mạng nhà mình - giống hệt cách một quản trị mạng kiểm kê
xem trong nhà đang có bao nhiêu thiết bị kết nối Wi-Fi.

NHIỆM VỤ:
1. Tự phát hiện dải mạng của mình (vd 192.168.1.0/24) từ IP máy B.
2. Dùng ĐA LUỒNG quét từ .1 đến .254, mỗi host thử vài cổng đầu mối.
3. In danh sách thiết bị tìm thấy kèm cổng mở.
4. Chỉ ra đâu là Máy A (host nào mở cổng 9001/9002/9003).

VÌ SAO PHẢI ĐA LUỒNG: 254 host x 5 cổng = 1270 lần gõ cửa. Quét tuần tự với
timeout 0.5s sẽ mất hơn 10 phút. Đa luồng đưa nó về vài giây.

AN TOÀN - ĐỌC KỸ:
- Chỉ chạy trong mạng LAN nhà bạn / phòng lab, đã được chủ mạng cho phép.
- Bài này quét CẢ MẠNG, nên tuyệt đối không chạy ở trường, công ty, quán xá,
  ký túc xá hay bất kỳ Wi-Fi công cộng nào. Ở đó nó là hành vi trinh sát trái phép.
- Nếu thấy thiết bị lạ (TV, điện thoại người khác) trong kết quả: chỉ ghi nhận,
  KHÔNG quét sâu, KHÔNG thử kết nối vào chúng.
"""

import socket
import threading

# Vài cổng "đầu mối" - đủ để biết một thiết bị có tồn tại, không cần quét hết 65535
PROBE_PORTS = [22, 80, 443, 445, 9001, 9002, 9003]
TIMEOUT = 0.3

results = {}          # ip -> list cổng mở
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
    """Gõ cửa vài cổng của 1 thiết bị. Nếu có ít nhất 1 cổng mở -> ghi vào results."""
    open_here = []
    # TODO 1: for port in PROBE_PORTS: tạo socket, settimeout(TIMEOUT),
    #         connect_ex((ip, port)) == 0 thì open_here.append(port). Nhớ close().

    # TODO 2: nếu open_here không rỗng:
    #             with results_lock:      # khoá lại để 2 luồng không ghi đè nhau
    #                 results[ip] = open_here
    #             in ngay một dòng "[+] Tìm thấy ..." cho học sinh thấy tiến độ
    pass


if __name__ == "__main__":
    print("=== BÀI LAN 2: ĐIỂM DANH THIẾT BỊ TRONG MẠNG ===\n")
    print(__doc__.split("AN TOÀN - ĐỌC KỸ:")[1])

    my_ip = get_my_lan_ip()
    if not my_ip or not is_private(my_ip):
        print(f"[X] Không xác định được IP nội bộ hợp lệ (nhận được: {my_ip}). Dừng lại.")
        raise SystemExit(1)

    # TODO 3: Tính prefix của mạng từ my_ip.
    #         Vd my_ip = "192.168.1.7"  ->  prefix = "192.168.1."
    #         Gợi ý: ".".join(my_ip.split(".")[:3]) + "."
    prefix = None

    print(f"IP máy bạn (Máy B): {my_ip}")
    print(f"Dải mạng sẽ quét  : {prefix}1 - {prefix}254")

    confirm = input("\nĐây là mạng LAN riêng của bạn và bạn được phép quét? (YES): ").strip()
    if confirm != "YES":
        print("Đã huỷ. Lựa chọn đúng đắn nếu bạn không chắc chắn!")
        raise SystemExit(0)

    # TODO 4: Tạo 1 thread cho mỗi host từ .1 đến .254, start() và lưu vào list.
    # TODO 5: join() tất cả các thread.
    # TODO 6: In bảng kết quả: mỗi IP tìm thấy + danh sách cổng mở.
    # TODO 7: Host nào có cổng 9001/9002/9003 -> in "<-- ĐÂY LÀ MÁY A".
    # TODO 8: In tổng số thiết bị tìm thấy và nhắc: thiết bị lạ thì chỉ ghi nhận,
    #         không được quét sâu hay tấn công.

# CÂU HỎI SUY NGẪM (trả lời vào đây):
# 1. Ngoài Máy A, bạn còn thấy thiết bị nào khác? Đoán xem chúng là gì
#    (router thường là .1, máy in, TV thông minh, camera...).
# 2. Vì sao router (.1) hầu như luôn mở cổng 80 hoặc 443?
