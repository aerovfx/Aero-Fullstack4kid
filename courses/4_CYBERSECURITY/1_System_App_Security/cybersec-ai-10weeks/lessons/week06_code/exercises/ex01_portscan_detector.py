"""
BÀI TẬP 1 (Tuần 6): PHÁT HIỆN QUÉT CỔNG TỪ BẢN GHI GÓI TIN (Blue Team)
Ôn lại: phân tích lưu lượng, nhận diện bất thường, tư duy phòng thủ.

BỐI CẢNH:
Bản gốc Tuần 6 dùng Scapy đọc file .pcap. Bài này không cần cài Scapy: ta mô
phỏng gói tin đã bóc tách sẵn thành bảng (biến PACKETS). Mỗi gói: nguồn, đích,
cổng đích, cờ TCP. Nhiệm vụ là NHẬN RA kẻ đang quét cổng.

DẤU HIỆU QUÉT CỔNG (theo bài giảng):
Một IP nguồn gửi gói SYN tới RẤT NHIỀU cổng đích khác nhau trong thời gian ngắn.

NHIỆM VỤ:
1. Với mỗi IP nguồn, đếm số cổng đích DUY NHẤT mà nó gửi gói SYN ('S').
2. IP nào chạm ngưỡng (>= THRESHOLD cổng) thì gắn cờ "nghi vấn quét cổng".
3. In báo cáo.

AN TOÀN: đây là dữ liệu lab, phân tích để PHÒNG THỦ.
"""

from collections import defaultdict

# Mô phỏng gói tin đã bóc tách: (src_ip, dst_ip, dst_port, flag)
PACKETS = [
    ("192.168.1.50", "192.168.1.10", 22,  "S"),
    ("192.168.1.50", "192.168.1.10", 23,  "S"),
    ("192.168.1.50", "192.168.1.10", 80,  "S"),
    ("192.168.1.50", "192.168.1.10", 443, "S"),
    ("192.168.1.50", "192.168.1.10", 3306,"S"),
    ("192.168.1.50", "192.168.1.10", 8080,"S"),
    ("192.168.1.20", "192.168.1.10", 443, "S"),   # người dùng bình thường
    ("192.168.1.20", "192.168.1.10", 443, "A"),
    ("192.168.1.99", "192.168.1.10", 21,  "S"),
    ("192.168.1.99", "192.168.1.10", 22,  "S"),
    ("192.168.1.99", "192.168.1.10", 25,  "S"),
    ("192.168.1.99", "192.168.1.10", 3389,"S"),
    ("192.168.1.99", "192.168.1.10", 5432,"S"),
]

THRESHOLD = 5   # >= 5 cổng SYN khác nhau => nghi vấn quét


def detect_scanners(packets):
    """Trả về dict {src_ip: set(cổng SYN)} chỉ gồm các IP vượt ngưỡng."""
    syn_ports = defaultdict(set)
    # TODO 1: duyệt packets, nếu flag == "S" thì thêm dst_port vào syn_ports[src_ip].
    # TODO 2: lọc ra những src có len(cổng) >= THRESHOLD và trả về.
    return {}


if __name__ == "__main__":
    print("=== PHÁT HIỆN QUÉT CỔNG ===\n")
    scanners = detect_scanners(PACKETS)

    # TODO 3: nếu rỗng -> in "Không phát hiện quét cổng."
    #         ngược lại -> với mỗi IP in số cổng bị dò + danh sách cổng (sorted).
    # TODO 4: in khuyến nghị: chặn IP nghi vấn bằng firewall, bật rate-limiting.
