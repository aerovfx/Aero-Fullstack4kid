"""
30_lan_target_server.py - "MÁY A" (Máy mục tiêu) trong phòng lab 2 máy.

Máy A mở vài cổng dịch vụ giả ra mạng LAN để Máy B (máy quét) tìm thấy.

  [MÁY A - Target]  <---- Wi-Fi/LAN nhà bạn ---->  [MÁY B - Scanner]
  chạy file này                                    chạy 31/32/33_lan_*

=========================== ĐIỀU KIỆN BẮT BUỘC ===============================
Chỉ chạy bài lab này khi TẤT CẢ các điều sau đều đúng:
  1. Cả Máy A và Máy B đều là máy của BẠN (hoặc của lớp học, do giáo viên cấp).
  2. Mạng LAN là mạng riêng ở nhà / phòng lab - KHÔNG phải Wi-Fi trường học,
     công ty, quán cà phê, ký túc xá hay mạng công cộng.
  3. Bạn đã được chủ mạng đồng ý (nếu mạng nhà thì hỏi bố mẹ một câu là đủ).
Quét máy của người khác mà không được phép là hành vi vi phạm pháp luật.
==============================================================================

Cách dùng trên MÁY A:
    1. Xem địa chỉ IP nội bộ của Máy A:
         macOS/Linux:  ifconfig | grep "inet "     hoặc   ip addr
         Windows:      ipconfig
       Ghi lại IP dạng 192.168.x.x hoặc 10.0.x.x -> đây là "IP Máy A".
    2. python3 30_lan_target_server.py
    3. Đọc kỹ và gõ YES để xác nhận đây là mạng lab hợp lệ.
    4. Đọc IP Máy A cho bạn ngồi ở Máy B.

Nhấn Ctrl + C để tắt toàn bộ dịch vụ khi học xong.
"""

import socket
import threading

# Cổng lab -> banner của "dịch vụ giả"
LAB_SERVICES = {
    9001: "Aero-FTP Server v1.2 (anonymous login allowed)",
    9002: "Aero-SSH_2.0 OpenLab-8.9",
    9003: "Aero-HTTP/1.1 200 OK | Server: AeroLabNginx/1.24",
}

# 0.0.0.0 = lắng nghe trên mọi card mạng, tức là Máy B trong LAN nhìn thấy được.
# Chỉ dùng giá trị này TRONG bài lab 2 máy, và nhớ tắt server sau khi học xong.
HOST = "0.0.0.0"


def get_my_lan_ip():
    """Tìm IP nội bộ của chính máy này (không gửi dữ liệu đi đâu cả)."""
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    try:
        s.connect(("8.8.8.8", 80))  # chỉ để hệ điều hành chọn card mạng, không gửi gói tin
        return s.getsockname()[0]
    except Exception:
        return "không xác định"
    finally:
        s.close()


def run_service(port, banner):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((HOST, port))
    server.listen(5)
    print(f"[MÁY A] Đã mở cổng {port} -> {banner}")

    while True:
        try:
            client, addr = server.accept()
        except OSError:
            break

        print(f"[MÁY A] Có người gõ cửa cổng {port} từ {addr[0]}:{addr[1]}")
        try:
            client.sendall((banner + "\r\n").encode())
            client.recv(1024)
        except Exception:
            pass
        finally:
            client.close()


if __name__ == "__main__":
    print(__doc__)
    answer = input("Bạn xác nhận cả 3 điều kiện trên đều đúng? (gõ YES để tiếp tục): ").strip()
    if answer != "YES":
        print("Đã huỷ. Hãy quay lại bài lab localhost trong thư mục exercises/ nhé.")
        raise SystemExit(0)

    print(f"\n>>> IP MÁY A CỦA BẠN LÀ: {get_my_lan_ip()}  <<<")
    print(">>> Đọc địa chỉ này cho bạn ngồi ở Máy B.\n")

    for port, banner in LAB_SERVICES.items():
        threading.Thread(target=run_service, args=(port, banner), daemon=True).start()

    print("\nMáy A sẵn sàng. Nhấn Ctrl + C để dừng khi học xong.\n")
    try:
        threading.Event().wait()
    except KeyboardInterrupt:
        print("\n[MÁY A] Đã đóng toàn bộ cổng lab. Mạng của bạn sạch sẽ trở lại!")
