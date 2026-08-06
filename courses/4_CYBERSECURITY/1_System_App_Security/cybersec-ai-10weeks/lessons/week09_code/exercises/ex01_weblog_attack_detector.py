"""
BÀI TẬP 1 (Tuần 9): PHÁT HIỆN TẤN CÔNG WEB TỪ LOG (Blue Team + AI mindset)
Ôn lại: phân tích log máy chủ, nhận diện SQLi/XSS/Path Traversal.

BỐI CẢNH:
Trước khi nhờ AI phân tích, bạn phải hiểu AI đang tìm gì. Bài này cho sẵn log
Nginx/Apache mẫu (biến ACCESS_LOG). Bạn viết bộ phát hiện dựa trên MẪU (signature)
cho 3 loại tấn công web phổ biến nhất - đây chính là "luật" mà sau này bạn nhờ AI
mở rộng.

NHIỆM VỤ:
1. Duyệt từng dòng log, dùng regex/keyword phát hiện dấu hiệu:
   - SQL Injection: ' OR 1=1 , UNION SELECT , -- , ...
   - XSS: <script , onerror= , javascript:
   - Path Traversal: ../  , ..%2f , /etc/passwd
2. In cảnh báo kèm IP nguồn và loại tấn công.
3. Thống kê IP tấn công nhiều nhất.

CHẠY:  python3 ex01_weblog_attack_detector.py
"""

import re
from collections import Counter

# Log truy cập mẫu (định dạng combined rút gọn): IP - - "REQUEST" status
ACCESS_LOG = """
192.168.1.10 - - "GET /index.html HTTP/1.1" 200
192.168.1.55 - - "GET /products?id=1' OR '1'='1 HTTP/1.1" 200
192.168.1.55 - - "GET /search?q=<script>alert(1)</script> HTTP/1.1" 200
192.168.1.10 - - "GET /about.html HTTP/1.1" 200
203.0.113.7 - - "GET /download?file=../../../../etc/passwd HTTP/1.1" 200
203.0.113.7 - - "GET /items?id=5 UNION SELECT username,password FROM users HTTP/1.1" 500
192.168.1.10 - - "POST /login HTTP/1.1" 200
203.0.113.7 - - "GET /img?src=javascript:alert(document.cookie) HTTP/1.1" 200
"""

# TODO 1: hoàn thiện các mẫu regex cho từng loại tấn công (không phân biệt hoa/thường).
SIGNATURES = {
    "SQL Injection":  r"(' or |union select|--|' *= *')",
    "XSS":            r"(<script|onerror=|javascript:)",
    "Path Traversal": r"(\.\./|\.\.%2f|/etc/passwd)",
}


def parse_line(line):
    """Trả về (ip, request) từ 1 dòng log, hoặc None nếu không khớp."""
    m = re.match(r'^(\S+) - - "([^"]+)"', line.strip())
    if not m:
        return None
    return m.group(1), m.group(2)


def detect(log):
    """Trả về list (ip, attack_type, request) cho mỗi dòng đáng ngờ."""
    findings = []
    # TODO 2: duyệt từng dòng -> parse_line -> với mỗi loại trong SIGNATURES,
    #         nếu re.search(pattern, request, re.IGNORECASE) thì thêm vào findings.
    return findings


if __name__ == "__main__":
    print("=== PHÁT HIỆN TẤN CÔNG WEB TỪ LOG ===\n")
    findings = detect(ACCESS_LOG)

    # TODO 3: in từng cảnh báo: "[!] <loại> từ <ip>: <request>".
    # TODO 4: dùng Counter đếm IP xuất hiện nhiều nhất trong findings, in top kẻ tấn công.
    # TODO 5: in khuyến nghị: chặn IP, dùng WAF, tham số hoá truy vấn (chống SQLi),
    #         escape đầu ra (chống XSS).
