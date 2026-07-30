````md
# Aero-Fullstack4Kid
## Cybersecurity AI - 10 Weeks
### Week 02 - Defensive Auditor & Security Assessment

---

## Mục tiêu bài học

Sau bài học này, học sinh có thể:

1. Kiểm tra một máy chủ hoặc dịch vụ mà mình được phép quản lý.
2. Xác định máy có đang hoạt động hay không.
3. Phân tích độ trễ mạng (Latency).
4. Tra cứu thông tin ASN, ISP và vị trí tương đối.
5. Kiểm tra cấu hình HTTP/HTTPS.
6. Đọc và phân tích chứng chỉ TLS/SSL.
7. Kiểm tra Security Headers.
8. Đánh giá mức độ an toàn của hệ thống.
9. Sinh báo cáo bảo mật tự động.

> Lưu ý:
>
> Các bài thực hành chỉ áp dụng trên:
>
> - localhost
> - Máy cá nhân
> - Máy chủ của lớp học
> - Hệ thống được cấp quyền kiểm tra
>
> Không sử dụng các công cụ này trên hệ thống của người khác.

---

## Kiến thức nền tảng

### Quy trình đánh giá bảo mật phòng thủ

```text
Host
 ↓
Ping
 ↓
DNS Lookup
 ↓
GeoIP
 ↓
HTTP/HTTPS
 ↓
TLS Certificate
 ↓
Security Headers
 ↓
Service Fingerprinting
 ↓
Risk Score
 ↓
Generate Report
```

---

## Bước 1 - Ping

Mục tiêu:

- Kiểm tra máy có phản hồi hay không.
- Đo Round Trip Time (RTT).

Ví dụ:

```bash
ping -c 4 localhost
```

Kết quả:

```text
64 bytes from localhost:
icmp_seq=1 ttl=64 time=0.2 ms
```

### Ý nghĩa

| Thông số | Ý nghĩa |
|--------|---------|
| ttl | Time To Live |
| time | Độ trễ mạng |
| packet loss | Tỷ lệ mất gói |

Ví dụ:

```text
4 packets transmitted
4 received
0% packet loss
```

=> Máy đang hoạt động bình thường.

---

## Bước 2 - DNS Lookup

```python
import socket

host = "example.com"

print(socket.gethostbyname(host))
```

Ví dụ:

```text
93.184.216.34
```

---

## Bước 3 - GeoIP

Ví dụ:

```python
import requests

ip = "8.8.8.8"

r = requests.get(
    f"http://ip-api.com/json/{ip}"
)

print(r.json())
```

Kết quả:

```json
{
    "country": "United States",
    "city": "Mountain View",
    "isp": "Google LLC"
}
```

### Chú ý

GeoIP:

- Không chính xác 100%.
- Thường chỉ phản ánh ISP hoặc trung tâm dữ liệu.
- Không dùng để xác định vị trí cá nhân.

---

## Bước 4 - HTTP Analysis

Kiểm tra:

```python
import requests

r = requests.get(
    "http://example.com",
    allow_redirects=False
)

print(r.status_code)
```

Ví dụ:

```text
301
```

### Ý nghĩa

| Mã | Mô tả |
|----|------|
| 200 | OK |
| 301 | Redirect |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Server Error |

Ví dụ:

```text
HTTP/1.0 301 Moved Permanently
Location: https://example.com
```

=> Website tự động chuyển sang HTTPS.

---

## Bước 5 - TLS Certificate Analysis

```python
import ssl
import socket

ctx = ssl.create_default_context()

with socket.create_connection(
    ("example.com",443)
) as sock:

    with ctx.wrap_socket(
        sock,
        server_hostname="example.com"
    ) as ssock:

        cert = ssock.getpeercert()

        print(cert)
```

Thông tin quan trọng:

- Subject
- Issuer
- Expiration Date

Ví dụ:

```text
Subject:
CN=example.com

Issuer:
Let's Encrypt

Expire:
2027-03-01
```

---

## Bước 6 - Security Headers

```python
import requests

r = requests.get(
    "https://example.com"
)

headers = [
    "Strict-Transport-Security",
    "Content-Security-Policy",
    "X-Frame-Options",
    "X-Content-Type-Options",
    "Referrer-Policy"
]

for h in headers:
    print(
        h,
        r.headers.get(h)
    )
```

Ví dụ:

```text
Strict-Transport-Security
max-age=31536000

Content-Security-Policy
None
```

---

## Security Headers quan trọng

| Header | Công dụng |
|------|-----------|
| HSTS | Bắt buộc HTTPS |
| CSP | Chống XSS |
| XFO | Chống Clickjacking |
| XCTO | Chống MIME Sniffing |
| Referrer Policy | Kiểm soát Referrer |

---

## Bước 7 - Service Fingerprinting

Ví dụ:

```python
import socket

s = socket.socket()

s.connect(
    ("localhost",80)
)

s.send(
    b"HEAD / HTTP/1.0\r\n\r\n"
)

print(
    s.recv(1024)
)
```

Ví dụ kết quả:

```text
Server: nginx
```

Hoặc:

```text
Server: Apache/2.4
```

---

## Bước 8 - CVE Lookup

Ví dụ:

```text
Apache 2.4.49
```

Tra cứu:

```text
CVE-2021-41773
```

### Quy trình

```text
Service
 ↓
Version
 ↓
Search CVE
 ↓
Risk Assessment
```

> Không khai thác lỗ hổng.
>
> Chỉ sử dụng để học cách cập nhật phần mềm.

---

## Bước 9 - Risk Scoring

Ví dụ:

```python
score = 100

if no_https:
    score -= 30

if cert_expired:
    score -= 40

if no_hsts:
    score -= 10

if no_csp:
    score -= 10

print(score)
```

### Bảng đánh giá

| Điểm | Mức độ |
|-----|------|
| 90-100 | Tốt |
| 70-89 | Khá |
| 50-69 | Trung bình |
| <50 | Cần cải thiện |

Ví dụ:

```text
Security Score:
85/100
```

---

## Bước 10 - Sinh báo cáo

```python
report = f"""
# Security Report

Host:
localhost

Score:
85/100

Open Services:
- HTTP
- HTTPS

Security Headers:
- HSTS: YES
- CSP: NO

TLS:
- Valid

"""
```

Xuất file:

```python
with open(
    "report.md",
    "w"
) as f:
    f.write(report)
```

---

## Cấu trúc dự án

```text
week02_code/

├── ping_check.py
├── dns_lookup.py
├── geoip_lookup.py
├── http_analysis.py
├── tls_analyzer.py
├── security_headers.py
├── service_fingerprint.py
├── cve_lookup.py
├── risk_scoring.py
├── report_generator.py
└── defensive_auditor.py
```

---

## Bài tập thực hành

### Bài 1

Kiểm tra:

```text
localhost
```

Thu thập:

- Ping
- HTTP
- TLS

---

### Bài 2

Kiểm tra máy cá nhân:

```text
127.0.0.1
```

Sinh báo cáo:

```text
report.md
```

---

### Bài 3

Xây dựng:

```text
Defensive Auditor v2
```

Yêu cầu:

- Ping
- DNS
- GeoIP
- HTTP
- HTTPS
- TLS
- Security Headers
- Risk Score
- Markdown Report

---

## Defensive Auditor v2

```text
             HOST
               |
         +-----+-----+
         |           |
       PING         DNS
         |           |
         +-----+-----+
               |
             GEOIP
               |
             HTTP
               |
            HTTPS
               |
              TLS
               |
      SECURITY HEADERS
               |
         FINGERPRINT
               |
          RISK SCORE
               |
          REPORT.MD
```

---

## Tổng kết

Sau bài học này, học sinh có thể:

- Phân tích mạng cơ bản.
- Đọc thông tin HTTP/HTTPS.
- Kiểm tra chứng chỉ số.
- Đánh giá Security Headers.
- Tính Security Score.
- Sinh báo cáo Markdown.
- Hiểu tư duy Defensive Security.

> Mục tiêu của khóa học:
>
> "Giúp học sinh trở thành người xây dựng hệ thống an toàn hơn, không phải người tấn công hệ thống của người khác."

---
© Aero-Fullstack4Kid - Cybersecurity AI 10 Weeks
````
