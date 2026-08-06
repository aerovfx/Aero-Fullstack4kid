"""ĐÁP ÁN - Bài tập 2 (Tuần 6): Moi credential từ HTTP không mã hoá."""

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
    users = re.findall(r"username=([^&\s]+)", dump)
    passwords = re.findall(r"password=([^&\s]+)", dump)
    return list(zip(users, passwords))


if __name__ == "__main__":
    print("=== MOI CREDENTIAL TỪ HTTP KHÔNG MÃ HOÁ ===\n")
    creds = extract_credentials(HTTP_DUMP)

    for user, pw in creds:
        print(f"[!] Bắt được -> {user} : {pw}")

    print("\nBÀI HỌC:")
    print("- Toàn bộ mật khẩu trên truyền dạng THÔ trong HTTP -> ai nghe lén cũng đọc được.")
    print("- Nếu là HTTPS, phần thân request đã được mã hoá TLS; kẻ nghe lén chỉ thấy")
    print("  dữ liệu rác. => LUÔN dùng HTTPS cho mọi trang có đăng nhập.")
