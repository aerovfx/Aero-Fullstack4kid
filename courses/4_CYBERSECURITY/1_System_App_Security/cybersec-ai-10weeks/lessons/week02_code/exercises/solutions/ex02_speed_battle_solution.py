"""ĐÁP ÁN - Bài tập 2: Đấu tốc độ vòng lặp vs đa luồng."""

import socket
import threading
import time

target_ip = "127.0.0.1"
# Dải 8900-9400 gồm 501 cổng và bao trọn 3 cổng lab (9001-9003),
# nên bạn sẽ thấy cả cổng mở thật chứ không chỉ một danh sách rỗng.
START_PORT = 8900
END_PORT = 9400
TIMEOUT = 0.1

# Cổng đóng trên localhost bị từ chối tức thì -> không có thời gian chờ để
# đa luồng chia nhau. Cộng thêm độ trễ giả lập cho giống một máy thật ngoài mạng.
NETWORK_LATENCY = 0.02


def check_port(port):
    scanner = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    scanner.settimeout(TIMEOUT)
    try:
        is_open = scanner.connect_ex((target_ip, port)) == 0
        if not is_open:
            time.sleep(NETWORK_LATENCY)
        return is_open
    except Exception:
        return False
    finally:
        scanner.close()


def scan_slow():
    found = []
    for port in range(START_PORT, END_PORT + 1):
        if check_port(port):
            found.append(port)
    return found


def scan_fast():
    found = []
    threads = []
    lock = threading.Lock()  # tránh 2 luồng cùng ghi vào list một lúc

    def worker(port):
        if check_port(port):
            with lock:
                found.append(port)

    for port in range(START_PORT, END_PORT + 1):
        t = threading.Thread(target=worker, args=(port,))
        threads.append(t)
        t.start()

    for t in threads:
        t.join()  # chờ tất cả công nhân xong việc

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

    speedup = slow_time / fast_time if fast_time > 0 else float("inf")

    print("\n" + "=" * 50)
    print(f"{'Phương pháp':<22}{'Thời gian':>12}")
    print("-" * 50)
    print(f"{'Vòng lặp thường':<22}{slow_time:>10.2f}s")
    print(f"{'Đa luồng (threading)':<22}{fast_time:>10.2f}s")
    print("-" * 50)
    print(f"=> Đa luồng nhanh hơn {speedup:.1f} lần")
    print("=" * 50)

    print(f"\nCổng mở (chậm) : {sorted(slow_result)}")
    print(f"Cổng mở (nhanh): {sorted(fast_result)}")
    if sorted(slow_result) != sorted(fast_result):
        print("[!] Kết quả lệch nhau - thường do timeout quá ngắn khi hàng trăm luồng chạy cùng lúc.")

# TRẢ LỜI CÂU HỎI SUY NGẪM:
# 1. Kết quả CÓ THỂ lệch nhẹ. Khi 500 luồng cùng chạy, máy bị quá tải nên vài cổng
#    phản hồi chậm hơn TIMEOUT 0.1s và bị báo nhầm là đóng. Đây là đánh đổi kinh điển:
#    quét càng nhanh thì độ chính xác càng giảm. Khắc phục bằng cách tăng timeout
#    hoặc giới hạn số luồng (ThreadPoolExecutor với max_workers=100).
# 2. Cách chậm quét 500 cổng mất khoảng T giây. Quét 65535 cổng sẽ mất khoảng
#    T x 131 lần. Với timeout 1 giây và cổng đóng, con số này lên tới hơn 18 tiếng.
#
# GHI CHÚ CHO GIÁO VIÊN:
# Đặt NETWORK_LATENCY = 0 rồi chạy lại: đa luồng sẽ CHẬM HƠN vòng lặp thường.
# Đây là bài học nâng cao rất đáng thảo luận - threading không "thần kỳ", nó chỉ
# có lợi khi chương trình phải NGỒI CHỜ (I/O-bound). Nếu công việc không có thời
# gian chờ, chi phí tạo và chuyển đổi luồng lại làm mọi thứ chậm đi.
