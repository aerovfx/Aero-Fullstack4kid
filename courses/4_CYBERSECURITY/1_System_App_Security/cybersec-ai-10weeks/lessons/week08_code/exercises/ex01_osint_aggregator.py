"""
BÀI TẬP 1 (Tuần 8): TỔNG HỢP OSINT & TÓM TẮT BỀ MẶT TẤN CÔNG
Ôn lại: OSINT (Footprinting), giai đoạn Reconnaissance của CEH.

BỐI CẢNH:
Trinh sát (Recon) là bước ĐẦU TIÊN của mọi cuộc tấn công. Công cụ như WHOIS,
Shodan trả về JSON. Bài này cho sẵn dữ liệu JSON giả (biến WHOIS, SHODAN) để bạn
viết bộ tổng hợp: gom thông tin rời rạc thành một bản tóm tắt "bề mặt tấn công".

NHIỆM VỤ:
1. Từ SHODAN, liệt kê các cổng mở + dịch vụ.
2. Chỉ ra dịch vụ nào ĐÁNG LO (cổng trong RISKY_PORTS).
3. Từ WHOIS, lấy thông tin liên hệ (email) có thể dùng cho phishing (để CẢNH BÁO
   phòng thủ, không phải để tấn công).
4. In "Attack Surface Summary".

AN TOÀN: dữ liệu giả lập. OSINT chỉ dùng thông tin công khai và cho mục đích
được phép (pentest có hợp đồng, tự đánh giá tổ chức của mình).
"""

# Dữ liệu giả lập như Shodan/WHOIS trả về
SHODAN = {
    "ip": "203.0.113.10",
    "hostnames": ["demo-target.example"],
    "ports": [
        {"port": 22,   "service": "OpenSSH 7.4"},
        {"port": 80,   "service": "nginx 1.14"},
        {"port": 443,  "service": "nginx 1.14"},
        {"port": 3389, "service": "Microsoft RDP"},
        {"port": 3306, "service": "MySQL 5.5"},
    ],
}

WHOIS = {
    "domain": "demo-target.example",
    "registrant_org": "Demo Corp",
    "emails": ["admin@demo-target.example", "it-support@demo-target.example"],
    "created": "2011-05-02",
}

RISKY_PORTS = {23, 3389, 3306, 21, 445}   # dịch vụ nhạy cảm nếu lộ ra Internet


def summarize(shodan, whois):
    """Trả về dict tóm tắt: open_ports, risky, contact_emails."""
    # TODO 1: open_ports = list (port, service) từ shodan["ports"].
    # TODO 2: risky = các cổng nằm trong RISKY_PORTS.
    # TODO 3: contact_emails = whois["emails"].
    return {}


if __name__ == "__main__":
    print("=== OSINT ATTACK SURFACE SUMMARY ===\n")
    s = summarize(SHODAN, WHOIS)

    # TODO 4: in mục tiêu (ip, domain), danh sách cổng mở + dịch vụ.
    # TODO 5: in cảnh báo cho các cổng risky đang lộ ra.
    # TODO 6: in các email liên hệ + ghi chú: đây là bề mặt cho tấn công phishing,
    #         nên tổ chức cần đào tạo nhận biết email lừa đảo.
