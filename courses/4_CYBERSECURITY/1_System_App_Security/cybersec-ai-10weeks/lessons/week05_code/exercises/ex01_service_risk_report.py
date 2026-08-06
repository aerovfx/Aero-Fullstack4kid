"""
BÀI TẬP 1 (Tuần 5): BÁO CÁO RỦI RO DỊCH VỤ TỪ OUTPUT `ss`/`netstat`
Ôn lại: kiểm toán mạng nội bộ, phân tích cổng đang lắng nghe, tư duy Blue Team.

BỐI CẢNH:
Trên Kali/Linux, lệnh `ss -tulpn` liệt kê mọi cổng đang lắng nghe. Thay vì đọc
bằng mắt, ta viết script bóc tách và tự chấm rủi ro. Dưới đây là output MẪU đã
lưu sẵn (biến SAMPLE_SS) để bạn chạy được ngay mà không cần Kali.

NHIỆM VỤ:
1. Bóc tách từng dòng LISTEN, lấy ra địa chỉ:cổng.
2. Với mỗi cổng, tra bảng RISK để biết dịch vụ + mức rủi ro.
3. Phân biệt cổng bind 127.0.0.1 (an toàn) vs 0.0.0.0/* (lộ ra mạng - nguy hiểm hơn).
4. In báo cáo + khuyến nghị.

AN TOÀN: chỉ phân tích dữ liệu của CHÍNH máy mình.
"""

# Output mẫu của: ss -tulpn  (đã rút gọn)
SAMPLE_SS = """Netid  State   Local Address:Port   Peer Address:Port
tcp    LISTEN  127.0.0.1:5432       0.0.0.0:*
tcp    LISTEN  0.0.0.0:22           0.0.0.0:*
tcp    LISTEN  0.0.0.0:23           0.0.0.0:*
tcp    LISTEN  0.0.0.0:80           0.0.0.0:*
tcp    LISTEN  127.0.0.1:8080       0.0.0.0:*
tcp    LISTEN  0.0.0.0:3389         0.0.0.0:*
"""

# cổng -> (tên dịch vụ, mức rủi ro)
RISK = {
    22:   ("SSH", "TRUNG BÌNH"),
    23:   ("Telnet", "RẤT CAO"),
    80:   ("HTTP", "TRUNG BÌNH"),
    443:  ("HTTPS", "THẤP"),
    3389: ("RDP", "RẤT CAO"),
    5432: ("PostgreSQL", "CAO"),
    8080: ("HTTP-Alt", "TRUNG BÌNH"),
}


def parse_listening(ss_output):
    """Trả về list các tuple (địa_chỉ, cổng) từ các dòng LISTEN."""
    results = []
    for line in ss_output.strip().splitlines():
        if "LISTEN" not in line:
            continue
        # TODO 1: tách cột "Local Address:Port" (cột thứ 3, index 2 khi split()).
        # TODO 2: cắt phần địa chỉ và cổng bằng rsplit(":", 1).
        # TODO 3: append (addr, int(port)) vào results.
        pass
    return results


if __name__ == "__main__":
    print("=== BÁO CÁO RỦI RO DỊCH VỤ (từ ss -tulpn) ===\n")
    services = parse_listening(SAMPLE_SS)

    # TODO 4: In bảng: CỔNG | DỊCH VỤ | RỦI RO | PHẠM VI (localhost / LỘ RA MẠNG)
    #   - addr bắt đầu bằng "127." -> "chỉ localhost (an toàn hơn)"
    #   - còn lại (0.0.0.0, *, ::) -> "LỘ RA MẠNG (!)"

    # TODO 5: In khuyến nghị cho các cổng RẤT CAO/CAO đang LỘ RA MẠNG.
