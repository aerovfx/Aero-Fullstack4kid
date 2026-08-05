"""
BÀI TẬP 3: BÁO CÁO KIỂM TOÁN MINI (Mini Audit Report - Blue Team)
Thời gian: ~20 phút | Ôn lại: Banner Grabbing + Tư duy phòng thủ

NHIỆM VỤ:
Bạn không còn là hacker nữa - bạn là chuyên gia kiểm toán an ninh (Auditor).
Với mỗi cổng MỞ trên máy mình, hãy: lấy Banner -> chấm mức rủi ro -> đề xuất cách xử lý.

Quy trình chuẩn của Auditor (nhắc lại từ bài giảng):
    Quét -> Hiển thị cổng mở -> Giải thích chức năng -> Đánh giá rủi ro -> Hướng dẫn đóng cổng

YÊU CẦU:
1. Viết hàm grab_banner(ip, port) -> trả về chuỗi banner hoặc "(không phản hồi)".
   Bắt buộc dùng try/except vì nhiều dịch vụ mở nhưng im lặng -> sẽ ném lỗi timeout.
2. Quét các cổng trong PORT_INFO, chỉ xử lý những cổng MỞ.
3. In báo cáo dạng bảng: Cổng | Dịch vụ | Mức rủi ro | Banner.
4. In phần "KHUYẾN NGHỊ" - chỉ liệt kê khuyến nghị của những cổng thực sự đang mở.

AN TOÀN: chỉ quét 127.0.0.1 - chính máy bạn. Đây là bài tự kiểm tra thiết bị của mình.

GỢI Ý: mở 20_lab_target_server.py ở terminal khác để chắc chắn có cổng mở mà chấm điểm.
"""

import socket

target_ip = "127.0.0.1"

# cổng : (tên dịch vụ, mức rủi ro, khuyến nghị xử lý)
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
    """Kiểm tra nhanh 1 cổng có mở không."""
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.5)
    try:
        return s.connect_ex((ip, port)) == 0
    finally:
        s.close()


def grab_banner(ip, port):
    """
    Kết nối vào cổng mở và cố lấy 'danh thiếp' của phần mềm đứng sau.

    Chiến thuật: nhiều dịch vụ (SSH, FTP, SMTP) tự gửi banner ngay khi ta kết nối.
    Dịch vụ khác (HTTP) chỉ nói khi mình chào trước -> gửi thử một chuỗi rồi recv().
    """
    # TODO 1: Tạo socket, settimeout(1.5) - banner cần thời gian lâu hơn lúc quét.
    # TODO 2: connect((ip, port)) trong khối try.
    # TODO 3: Gửi lời chào: s.sendall(b"HELLO\r\n")
    # TODO 4: data = s.recv(1024) rồi decode(errors="ignore").strip()
    # TODO 5: Nếu data rỗng -> trả về "(không phản hồi)". Ngược lại trả về data.
    # TODO 6: except Exception -> trả về "(không phản hồi)"; finally -> s.close()
    return "(chưa làm)"


if __name__ == "__main__":
    print("=" * 78)
    print(f"BÁO CÁO KIỂM TOÁN AN NINH THIẾT BỊ - Mục tiêu: {target_ip}")
    print("=" * 78)

    open_ports = []

    # TODO 7: Duyệt PORT_INFO, nếu is_open() thì thêm vào open_ports.

    if not open_ports:
        print("\n[OK] Không có cổng nào trong danh sách đang mở. Cấu hình 'default deny' rất tốt!")
    else:
        # TODO 8: In bảng báo cáo. Gợi ý định dạng cho thẳng cột:
        # print(f"{'CỔNG':<6}{'DỊCH VỤ':<14}{'RỦI RO':<12}BANNER")
        # print(f"{port:<6}{service:<14}{risk:<12}{banner[:40]}")
        pass

        # TODO 9: In phần KHUYẾN NGHỊ cho từng cổng đang mở.

    # TODO 10: In "Điểm an toàn" đơn giản, ví dụ:
    #   0 cổng mở        -> "RỦI RO: RẤT THẤP"
    #   1-2 cổng mở      -> "RỦI RO: THẤP"
    #   >2 cổng mở       -> "RỦI RO: CẦN XEM LẠI"
