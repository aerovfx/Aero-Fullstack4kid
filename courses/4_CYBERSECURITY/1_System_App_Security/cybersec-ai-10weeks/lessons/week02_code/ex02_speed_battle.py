"""
BÀI TẬP 2: ĐẤU TỐC ĐỘ - VÒNG LẶP vs ĐA LUỒNG (Speed Battle)
Thời gian: ~20 phút | Ôn lại: Cấp độ 2 + Cấp độ 3 (threading)

NHIỆM VỤ:
Quét CÙNG một dải cổng (8900 - 9400) bằng 2 cách, bấm giờ cả hai, rồi so sánh
xem đa luồng nhanh hơn bao nhiêu LẦN. Đây là cách bạn tự chứng minh cho mình
vì sao hacker và chuyên gia bảo mật bắt buộc phải dùng threading.

YÊU CẦU:
1. Hoàn thành hàm scan_slow()  - vòng lặp for thông thường.
2. Hoàn thành hàm scan_fast()  - mỗi cổng một thread, nhớ t.start() và t.join().
3. Cả hai hàm phải trả về danh sách cổng mở (list) để đối chiếu kết quả.
4. In bảng so sánh thời gian + hệ số tăng tốc (speedup = thời gian chậm / thời gian nhanh).

CÂU HỎI SUY NGẪM (viết câu trả lời vào phần comment cuối file):
- Hai cách quét có ra CÙNG danh sách cổng mở không? Nếu lệch thì vì sao?
- Nếu quét đủ 65535 cổng thay vì 501, cách chậm sẽ mất bao lâu?

AN TOÀN: chỉ quét 127.0.0.1.
"""

import socket
import threading
import time

target_ip = "127.0.0.1"
# Dải 8900-9400 gồm 501 cổng và bao trọn 3 cổng lab (9001-9003),
# nên bạn sẽ thấy cả cổng mở thật chứ không chỉ một danh sách rỗng.
START_PORT = 8900
END_PORT = 9400
TIMEOUT = 0.1

# ---------------------------------------------------------------------------
# VÌ SAO CẦN NETWORK_LATENCY?
# Khi quét localhost, cổng đóng bị hệ điều hành từ chối NGAY LẬP TỨC (gói RST
# quay về sau vài micro giây) - không hề có thời gian chờ. Mà đa luồng chỉ
# thắng khi có thời gian CHỜ để chia nhau. Nếu bỏ dòng này, bạn sẽ thấy đa
# luồng còn CHẬM HƠN vòng lặp thường vì tốn công tạo 500 thread.
#
# Nên ta cộng thêm 0.02 giây cho mỗi cổng đóng để mô phỏng độ trễ của một máy
# thật ngoài mạng. Đây là "phòng thí nghiệm có kiểm soát" - đặt về 0 rồi chạy
# lại để tự thấy sự khác biệt.
# ---------------------------------------------------------------------------
NETWORK_LATENCY = 0.02


def check_port(port):
    """Trả về True nếu cổng mở, False nếu đóng. Dùng chung cho cả 2 cách quét."""
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(TIMEOUT)
    try:
        is_open = scanner.connect_ex((target_ip, port)) == 0
        if not is_open:
            time.sleep(NETWORK_LATENCY)  # mô phỏng thời gian chờ của mạng thật
        return is_open
    except Exception:
        return False
    finally:
        scanner.close()


def scan_slow():
    """CÁCH 1: Quét tuần tự - gõ cửa từng cổng một, xong cổng này mới sang cổng khác."""
    found = []
    # TODO 1: for port in range(START_PORT, END_PORT + 1):
    #             nếu check_port(port) là True thì found.append(port)
    return found


def scan_fast():
    """CÁCH 2: Quét đa luồng - hàng trăm 'công nhân' gõ cửa cùng lúc."""
    found = []
    threads = []

    def worker(port):
        # TODO 2: gọi check_port(port), nếu mở thì found.append(port)
        pass

    # TODO 3: Tạo 1 thread cho mỗi cổng: threading.Thread(target=worker, args=(port,))
    #         Nhớ t.start() và thêm t vào list threads.

    # TODO 4: Duyệt list threads và gọi t.join() để chờ TẤT CẢ làm xong.
    #         Thiếu join() = báo cáo sẽ in ra khi công nhân còn đang làm việc!

    return found


if __name__ == "__main__":
    print(f"=== ĐẤU TỐC ĐỘ: quét cổng {START_PORT}-{END_PORT} trên {target_ip} ===\n")

    t0 = time.time()
    slow_result = scan_slow()
    slow_time = time.time() - t0
    print(f"[CHẬM] Vòng lặp thường: {len(slow_result)} cổng mở trong {slow_time:.2f} giây")

    t0 = time.time()
    fast_result = scan_fast()
    fast_time = time.time() - t0
    print(f"[NHANH] Đa luồng      : {len(fast_result)} cổng mở trong {fast_time:.2f} giây")

    # TODO 5: Tính speedup = slow_time / fast_time và in bảng kết quả.
    #         Cẩn thận chia cho 0 nếu fast_time quá nhỏ!

    # TODO 6: In ra danh sách cổng mở của cả hai cách (nhớ sorted()) để so sánh.

# TRẢ LỜI CÂU HỎI SUY NGẪM Ở ĐÂY:
# 1.
# 2.
