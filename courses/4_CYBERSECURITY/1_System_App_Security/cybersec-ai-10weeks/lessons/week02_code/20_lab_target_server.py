"""
20_lab_target_server.py - "Con mồi" cho phòng lab Tuần 2.

Mở sẵn vài cổng TRÊN LOCALHOST (127.0.0.1) để Scanner của bạn có thứ để tìm thấy.
Mỗi cổng trả về một Banner khác nhau, phục vụ bài tập Banner Grabbing.

Cách dùng:
    Terminal 1:  python3 20_lab_target_server.py     (để chạy nền, đừng tắt)
    Terminal 2:  python3 21_ex_service_checklist.py

Nhấn Ctrl + C để tắt server khi học xong.
"""

import socket
import threading

# Cổng lab -> Banner mà "dịch vụ giả" sẽ gửi trả cho client
LAB_SERVICES = {
    9001: "Aero-FTP Server v1.2 (anonymous login allowed)",
    9002: "Aero-SSH_2.0 OpenLab-8.9",
    9003: "Aero-HTTP/1.1 200 OK | Server: AeroLabNginx/1.24",
}

# CHỈ localhost. Không đổi thành 0.0.0.0 hay IP Wi-Fi - đây là quy định an toàn của khoá học.
HOST = "127.0.0.1"


def run_service(port, banner):
    """Mở 1 cổng giả lập, ai gõ cửa thì gửi banner rồi đóng kết nối."""
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server.bind((HOST, port))
    server.listen(5)
    print(f"[LAB] Đã mở cổng {port} -> {banner}")

    while True:
        try:
            client, addr = server.accept()
        except OSError:
            break

        # Gửi banner ngay khi có người kết nối (giống dịch vụ thật)
        try:
            client.sendall((banner + "\r\n").encode())
            client.recv(1024)  # đọc thử lời chào của scanner (nếu có)
        except Exception:
            pass
        finally:
            client.close()


if __name__ == "__main__":
    print("=== LAB TARGET SERVER (chỉ chạy trên 127.0.0.1) ===")
    for port, banner in LAB_SERVICES.items():
        # daemon=True để Ctrl + C tắt được toàn bộ chương trình
        threading.Thread(target=run_service, args=(port, banner), daemon=True).start()

    print("\nServer đang chạy. Mở terminal khác và chạy bài tập của bạn.")
    print("Nhấn Ctrl + C để dừng.\n")

    try:
        threading.Event().wait()  # ngủ vô hạn, chờ Ctrl + C
    except KeyboardInterrupt:
        print("\n[LAB] Đã tắt toàn bộ dịch vụ giả lập. Tạm biệt!")
