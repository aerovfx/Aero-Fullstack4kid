"""
BÀI TẬP 2 (Tuần 6): MOI THÔNG TIN ĐĂNG NHẬP TỪ TRAFFIC KHÔNG MÃ HOÁ
Ôn lại: vì sao HTTP (không HTTPS) nguy hiểm - nghe lén đọc được mật khẩu.

BỐI CẢNH:
Đây là bài học PHÒNG THỦ quan trọng nhất của Wireshark: traffic HTTP truyền
mật khẩu dạng thô (cleartext). Ai nghe lén cũng đọc được. Ta mô phỏng một đoạn
"bắt gói" HTTP POST (biến HTTP_DUMP) và viết công cụ trích xuất user/pass để
CHỨNG MINH mối nguy - từ đó hiểu vì sao BẮT BUỘC dùng HTTPS.

NHIỆM VỤ:
1. Dùng regex tìm cặp username=... và password=... trong dump.
2. In ra các thông tin nhạy cảm bắt được.
3. In bài học rút ra.

AN TOÀN: dữ liệu lab giả lập. Ngoài đời chỉ làm việc này trên traffic của
chính mình / được phép, phục vụ kiểm thử bảo mật.
"""

import re

HTTP_DUMP = """
POST /login HTTP/1.1
Host: 127.0.0.1:8080
Content-Type: application/x-www-form-urlencoded

username=admin&password=SuperSecret123&remember=1

POST /api/auth HTTP/1.1
Host: 127.0.0.1:8080

username=alice&password=P@ssw0rd!&csrf=abc
"""


def extract_credentials(dump):
    """Trả về list (username, password) tìm thấy trong dump."""
    creds = []
    # TODO 1: dùng re.findall bắt username=... (đến khi gặp & hoặc khoảng trắng).
    #   users = re.findall(r"username=([^&\s]+)", dump)
    # TODO 2: tương tự bắt password=...
    # TODO 3: ghép cặp (dùng zip) và trả về.
    return creds


if __name__ == "__main__":
    print("=== MOI CREDENTIAL TỪ HTTP KHÔNG MÃ HOÁ ===\n")
    creds = extract_credentials(HTTP_DUMP)

    # TODO 4: in từng cặp "user : pass" bắt được.
    # TODO 5: in bài học: nếu là HTTPS thì phần thân đã được mã hoá TLS,
    #         kẻ nghe lén chỉ thấy dữ liệu rác => luôn dùng HTTPS.
