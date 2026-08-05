"""ĐÁP ÁN - Bài tập 3: Báo cáo kiểm toán mini."""

import socket

target_ip = "127.0.0.1"

PORT_INFO = {
    21:   ("FTP",         "CAO",        "Tắt FTP nếu không dùng, dữ liệu truyền không mã hoá."),
    22:   ("SSH",         "TRUNG BÌNH", "Chỉ cho đăng nhập bằng khoá công khai, tắt password."),
    23:   ("Telnet",      "RẤT CAO",    "Tắt hoàn toàn - giao thức lỗi thời, gửi mật khẩu dạng thô."),
    80:   ("HTTP",        "TRUNG BÌNH", "Kiểm tra web server có cần thiết không, ưu tiên HTTPS."),
    443:  ("HTTPS",       "THẤP",       "Bình thường, nhớ cập nhật chứng chỉ TLS."),
    445:  ("SMB",         "CAO",        "Tắt chia sẻ file nếu không dùng."),
    3306: ("MySQL",       "CAO",        "Chỉ bind vào 127.0.0.1, không mở ra mạng."),
    3389: ("RDP",         "RẤT CAO",    "Giới hạn bằng firewall hoặc VPN, không mở ra Internet."),
    5432: ("PostgreSQL",  "CAO",        "Chỉ bind vào 127.0.0.1, đặt mật khẩu mạnh."),
    8080: ("HTTP-Alt",    "TRUNG BÌNH", "Thường là server dev - tắt khi không lập trình."),
    9001: ("Lab-FTP",     "CAO",        "Cổng lab, tắt server lab sau khi học xong."),
    9002: ("Lab-SSH",     "TRUNG BÌNH", "Cổng lab, tắt server lab sau khi học xong."),
    9003: ("Lab-HTTP",    "TRUNG BÌNH", "Cổng lab, tắt server lab sau khi học xong."),
}


def is_open(ip, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.5)
    try:
        return s.connect_ex((ip, port)) == 0
    finally:
        s.close()


def grab_banner(ip, port):
    """Lấy 'danh thiếp' của phần mềm đứng sau cổng mở."""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1.5)
    try:
        s.connect((ip, port))
        try:
            # Nhiều dịch vụ tự chào trước - thử đọc ngay
            data = s.recv(1024)
        except socket.timeout:
            data = b""

        if not data:
            # Dịch vụ im lặng: chào trước rồi nghe lại
            s.sendall(b"HELLO\r\n")
            data = s.recv(1024)

        text = data.decode(errors="ignore").strip()
        return text if text else "(không phản hồi)"
    except Exception:
        return "(không phản hồi)"
    finally:
        s.close()


if __name__ == "__main__":
    print("=" * 78)
    print(f"BÁO CÁO KIỂM TOÁN AN NINH THIẾT BỊ - Mục tiêu: {target_ip}")
    print("=" * 78)

    open_ports = [port for port in PORT_INFO if is_open(target_ip, port)]

    if not open_ports:
        print("\n[OK] Không có cổng nào trong danh sách đang mở. Cấu hình 'default deny' rất tốt!")
    else:
        print(f"\n{'CỔNG':<7}{'DỊCH VỤ':<14}{'RỦI RO':<13}BANNER")
        print("-" * 78)
        for port in sorted(open_ports):
            service, risk, _ = PORT_INFO[port]
            banner = grab_banner(target_ip, port)
            print(f"{port:<7}{service:<14}{risk:<13}{banner[:40]}")

        print("\nKHUYẾN NGHỊ XỬ LÝ (Remediation):")
        print("-" * 78)
        for port in sorted(open_ports):
            service, risk, advice = PORT_INFO[port]
            print(f"- Cổng {port} ({service}) [{risk}]: {advice}")

    count = len(open_ports)
    if count == 0:
        level = "RẤT THẤP"
    elif count <= 2:
        level = "THẤP"
    else:
        level = "CẦN XEM LẠI"

    print("\n" + "=" * 78)
    print(f"Tổng số cổng mở: {count}  |  MỨC RỦI RO TỔNG THỂ: {level}")
    print("=" * 78)
