# 09_check_web_headers.py
#
# Kiểm tra các HTTP Security Header của một website.
# Đây KHÔNG phải quét cổng - chỉ là gửi một request bình thường như trình duyệt,
# nên dùng được với website công khai. example.com là tên miền dành riêng cho
# mục đích ví dụ/giảng dạy.
#
# CẦN CÀI THƯ VIỆN: pip3 install requests

import requests

url = "https://example.com"

# Header nào thiếu thì website đó yếu ở mặt tương ứng
HEADERS = {
    "Server": "Lộ tên/phiên bản web server - nên ẩn đi",
    "X-Frame-Options": "Chống bị nhúng vào iframe (clickjacking)",
    "Content-Security-Policy": "Chống chèn mã độc XSS",
    "Strict-Transport-Security": "Ép trình duyệt luôn dùng HTTPS",
}

try:
    response = requests.get(url, timeout=10)

    print(f"URL   : {url}")
    print(f"Status: {response.status_code}")
    print("-" * 70)

    for name, meaning in HEADERS.items():
        value = response.headers.get(name)
        if value:
            print(f"[+] {name}: {value}")
        else:
            print(f"[-] {name}: THIẾU  ->  {meaning}")

except requests.exceptions.RequestException as e:
    print(f"[-] Không truy cập được {url}: {e}")
