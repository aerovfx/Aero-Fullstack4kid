# Tuần 13: Hacking Web Servers (CEH v13 Module 13)

> Module CEH v13 tương ứng: **13 — Hacking Web Servers**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 13** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu **kiến trúc web server** và các thành phần (HTTP, request/response, virtual host, reverse proxy, load balancer).
2. Nắm các **loại tấn công web server**: directory traversal, HTTP verb tampering, URL encoding bypass, buffer overflow, misconfiguration, default credentials, chmod/physical path.
3. Biết **web server footprinting**: đọc **HTTP header / server banner** (Server, X-Powered-By), enum tool (Nikto) — phục vụ phòng thủ.
4. Hiểu **patch management** và lý do web server lỗi thời là mục tiêu lớn.
5. Xây dựng **hardening checklist**: tắt banner, xoá default page, cấu hình TLS, tối thiểu hoá module, permission đúng — và kiểm tra header bằng tool (Lab 1).

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Web Server

```
Client ──HTTP──▶ [Reverse Proxy/WAF] ──▶ [Web Server (Apache/Nginx/IIS)]
                                              │
                                              ▼
                                   [Application Server + DB]
```

| Thành phần | Vai trò |
|-----------|---------|
| **Web server** | Phục vụ file tĩnh + routing (Apache, Nginx, IIS) |
| **Application server** | Chạy logic (Node, Python, Java, PHP) |
| **Reverse proxy** | Che dấu web server thật, TLS termination, caching |
| **Load balancer** | Phân tải, HA |
| **Database** | Lưu dữ liệu (mục tiêu cuối cùng) |

### 2. Các Loại Tấn Công Web Server

| Tấn công | Cơ chế | Phòng thủ |
|----------|--------|-----------|
| **Directory traversal** | Dùng `../` / `..%2f` để thoát webroot đọc file | Normalize path, chặn `../`, chroot |
| **HTTP verb tampering** | Dùng các method ít bị check (PUT, TRACE, PATCH) | Chặn method không cần (Allow list) |
| **URL encoding bypass** | Double-encoding, Unicode bypass ACL | Decode + validate nhiều lần |
| **Misconfiguration** | Directory listing bật, default page, debug mode | Hardening (Lab 3) |
| **Default credentials** | Đăng nhập admin mặc định (admin/admin) | Đổi mật khẩu ngay khi cài |
| **Buffer overflow** | Tràn bộ nhớ trên module cũ | Patch, compile flags an toàn |
| **Web shell upload** | Upload file `.php/.jsp` thực thi | Validate MIME + đuôi file + thư mục không thực thi |
| **DoS web** | Slowloris, HTTP flood (Tuần 10) | Reverse proxy, rate limit |

### 3. Web Server Footprinting (Góc nhìn phòng thủ)

> **Phòng thủ bắt đầu từ việc biết "kẻ xấu thấy gì về mình":** banner và header tiết lộ server & version → giúp attacker tìm exploit. Hardening = giảm thông tin lộ ra.

| Thông tin lộ | Ví dụ header | Rủi ro |
|--------------|--------------|--------|
| Server type + version | `Server: Apache/2.4.10 (Ubuntu)` | Tìm exploit cho version cũ |
| Framework | `X-Powered-By: PHP/7.0` | Tìm CVE của PHP 7.0 |
| OS | `Server: Microsoft-IIS/8.5` | Nhắm exploit Windows |

**Công cụ phòng thủ kiểm tra:** `curl -I`, `headers` check (Lab 1), Nikto (quét cấu hình, chỉ lab của bạn).

### 4. Patch Management

- Web server là **mục tiêu số 1** vì thường **chạy lâu, quên update**.
- Quy trình: inventory phiên bản → theo dõi CVE (Tuần 5) → test patch trong staging → triển khai → verify.
- **Ví dụ lịch sử:** Apache Struts CVE-2017-5638 (Equifax), IIS CVE-2021-31166.

### 5. Web Server Hardening (Checklist)

- **Tắt/ẩn banner:** `ServerTokens Prod` (Apache), `server_tokens off` (Nginx), giảm `X-Powered-By`.
- **Xoá default page & sample**, tắt directory listing.
- **Tối thiểu hoá module/service**, chạy với quyền thấp (non-root).
- **Cấu hình TLS đúng** (TLS 1.2+, HSTS, tắt TLS 1.0/1.1, strong cipher).
- **Phân quyền file** (webroot read-only, upload dir không thực thi), chroot nếu được.
- **Cập nhật patch định kỳ**; giám sát log; WAF + rate limit.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này là **PHÒNG THỦ**: kiểm tra header của **web app của chính bạn** (localhost) hoặc dùng **header mẫu** — không quét web server của người khác.
> 2. Chỉ chạy Nikto/curl lên **máy chủ bạn sở hữu** hoặc đã có văn bản ủy quyền. Quét server người khác là bất hợp pháp.
> 3. Không thử directory traversal / web shell trên hệ thống không thuộc quyền của bạn.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week13_header_scanner.py`. Tool **mặc định phân tích header mẫu**, chỉ quét localhost khi bạn chủ động bật `--live`.

### Lab 1: HTTP Header / Banner Scanner (Python)

Công cụ phòng thủ: kiểm tra response headers (từ **header mẫu** hoặc `http://localhost` của bạn) và đánh dấu các điểm xấu: banner lộ version (`Server: Apache/2.4.10`), thiếu security headers (**X-Frame-Options**, **Content-Security-Policy**, **Strict-Transport-Security**, **X-Content-Type-Options**), `X-Powered-By` lộ framework.

```bash
python3 CODE/week13_header_scanner.py --demo
python3 CODE/week13_header_scanner.py --live http://localhost:8080   # CHỈ localhost của bạn
```

Kết quả mẫu (demo):

```
[Server]       Apache/2.4.10 (Ubuntu)  -> [!] lộ version, nên dùng 'ServerTokens Prod'
[X-Powered-By] PHP/7.0                 -> [!] lộ framework
[X-Frame-Options] KHÔNG CÓ             -> [!] dễ bị clickjacking
[Strict-Transport-Security] KHÔNG CÓ   -> [!] thiếu HSTS
[KẾT LUẬN] 3 vấn đề cần xử lý — xem hardening checklist Lab 3.
```

### Lab 2: Kiểm tra bằng curl (chỉ web app của bạn)

```bash
curl -sI http://localhost:8080 | head -20        # xem đầy đủ response headers
curl -sI https://localhost:8443 | grep -iE "server|strict|x-frame"
```

> Chỉ dùng `localhost` hoặc server bạn sở hữu. Header thật của site khác không nằm trong phạm vi học này.

### Lab 3: Hardening checklist (tham khảo cấu hình)

```nginx
# Nginx — ẩn banner, bật security headers (phòng thủ)
server_tokens off;
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Content-Security-Policy "default-src 'self'" always;
add_header Strict-Transport-Security "max-age=31536000" always;
```

```apache
# Apache — ẩn banner & X-Powered-By
ServerTokens Prod
ServerSignature Off
Header unset X-Powered-By
```

---

## Bài Tập Về Nhà / Homework

1. **Scan header:** chạy `week13_header_scanner.py --demo`, chụp màn hình; nếu có web app localhost, chạy `--live` lên nó. Ghi các vấn đề phát hiện.
2. **Directory traversal (lý thuyết):** giải thích 3 dạng encode của `../` (`..%2f`, `..%5c`, `..%252f`) và vì sao cần **normalize + decode nhiều lần**.
3. **Viết hardening plan:** 8 mục checklist hardening cho Apache/Nginx/IIS của bạn, mỗi mục 1-2 dòng lý do.
4. **Nghiên cứu Equifax:** tóm tắt vụ Equifax 2017 (Apache Struts CVE-2017-5638) — nguyên nhân gốc, thiệt hại, bài học patch management.

---

## Rubric Đánh Giá Tuần 13

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Scan header** | Chạy đúng, phân tích từng header, chụp ảnh (40đ) | Chạy được nhưng thiếu phân tích (25đ) | Không chạy được (10đ) |
| **Directory traversal** | Giải thích đúng 3 encode + normalize (30đ) | Đúng 2/3 (20đ) | Sai cơ chế (5đ) |
| **Hardening + Equifax** | Đủ 8 mục + phân tích case (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 13

- [ ] Mô tả được kiến trúc web server (client → proxy → web server → app → DB)
- [ ] Liệt kê 5 tấn công web server (traversal, verb tampering, misconfig, default creds, web shell)
- [ ] Giải thích vì sao banner/header tiết lộ thông tin nguy hiểm
- [ ] Hiểu patch management và case Equifax (CVE-2017-5638)
- [ ] Chạy thành công `week13_header_scanner.py --demo`
- [ ] Nêu 5 mục hardening (ẩn banner, xoá default, TLS, least privilege, patch)
