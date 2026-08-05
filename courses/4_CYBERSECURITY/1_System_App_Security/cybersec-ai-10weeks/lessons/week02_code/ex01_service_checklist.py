"""
BÀI TẬP 1: CHECKLIST DỊCH VỤ (Service Checklist)
Thời gian: ~15 phút | Ôn lại: Cấp độ 1 + Cấp độ 2

NHIỆM VỤ:
Thay vì quét mù cả 65535 cổng, hãy quét đúng danh sách cổng "đáng ngờ" nhất
và in ra tên dịch vụ đứng sau mỗi cổng.

YÊU CẦU:
1. Dùng connect_ex() (KHÔNG dùng connect()) để chương trình không bị crash.
2. Duyệt qua dictionary COMMON_PORTS bằng vòng lặp for.
3. In "MỞ" hoặc "ĐÓNG" kèm tên dịch vụ cho từng cổng.
4. Cuối cùng in ra tổng kết: có bao nhiêu cổng mở.

AN TOÀN: target_ip LUÔN là "127.0.0.1". Sửa thành IP khác = 0 điểm.
"""

import socket

target_ip = "127.0.0.1"

# Danh sách "điểm danh" - cổng : tên dịch vụ
COMMON_PORTS = {
    21: "FTP - Truyền file",
    22: "SSH - Quản trị từ xa",
    23: "Telnet - Lỗi thời, rất nguy hiểm",
    80: "HTTP - Web Server",
    443: "HTTPS - Web Server bảo mật",
    3306: "MySQL - Cơ sở dữ liệu",
    5432: "PostgreSQL - Cơ sở dữ liệu",
    9001: "Cổng lab (FTP giả)",
    9002: "Cổng lab (SSH giả)",
    9003: "Cổng lab (HTTP giả)",
}

open_count = 0

print(f"=== CHECKLIST DỊCH VỤ TRÊN {target_ip} ===\n")

for port, service_name in COMMON_PORTS.items():
    # TODO 1: Tạo socket TCP (AF_INET, SOCK_STREAM)
    scanner = None

    # TODO 2: Đặt settimeout(0.5) để không phải chờ quá lâu

    # TODO 3: Gọi connect_ex((target_ip, port)) và lưu vào biến result

    # TODO 4: Nếu result == 0 -> in "[+] MỞ" + tên dịch vụ, cộng open_count thêm 1
    #         Ngược lại   -> in "[-] ĐÓNG" + tên dịch vụ

    # TODO 5: Đừng quên scanner.close() để trả tài nguyên cho hệ điều hành
    pass

# TODO 6: In dòng tổng kết, ví dụ:
# "Tổng kết: 3/10 cổng đang mở."
