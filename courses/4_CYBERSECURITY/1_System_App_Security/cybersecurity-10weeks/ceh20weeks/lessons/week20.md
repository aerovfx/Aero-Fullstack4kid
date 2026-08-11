# Tuần 20: Cryptography (CEH v13 Module 20)

> Module CEH v13 tương ứng: **20 — Cryptography**. Nội dung đã được chuẩn hóa sang Markdown.

## Mục Tiêu Tuần / Week Objectives

Bám sát nội dung **Module 20** trong giáo trình CEH v13 — tuần cuối của khoá. Kết thúc tuần, học viên:

1. Hiểu các khái niệm nền: **mã hoá đối xứng vs bất đối xứng**, hash, salt, IV, key management.
2. Biết các thuật toán tiêu biểu và tình trạng: **AES (OK), DES/3DES (yếu), RSA/ECC (bất đối xứng), SHA-1/MD5 (đã vỡ), SHA-256/512 (dùng được)**.
3. Nắm **PKI, digital signature, certificate**, và vì sao SSL/TLS bảo mật web (liên hệ Tuần 13).
4. Hiểu kỹ thuật tấn công mật mã: **brute-force, dictionary, rainbow tables, length extension, padding oracle, side-channel**.
5. Xây dựng tool phòng thủ: **so sánh hash MD5/SHA-256, chống rainbow table bằng salt, mã hoá file AES** (Lab 1) và bài ôn tổng hợp (Lab 2).

---

## Lý Thuyết / Theory

### 1. Mã Hoá Đối Xứng vs Bất Đối Xứng

| Loại | Khái niệm | Thuật toán | Tốc độ | Dùng cho |
|------|-----------|------------|--------|----------|
| **Đối xứng** | Cùng 1 key mã/giải | AES, ChaCha20, (DES/3DES) | Nhanh | Mã hoá dữ liệu lớn |
| **Bất đối xứng** | Key riêng + key công khai | RSA, ECC, (DSA, Diffie-Hellman) | Chậm | Trao đổi key, chữ ký số |

> **Mô hình lai (hybrid):** TLS dùng bất đối xứng để **trao đổi key phiên** (session key), rồi đối xứng (AES) để mã hoá dữ liệu — nhanh mà vẫn bảo mật.

### 2. Bảng Thuật Toán & Tình Trạng

| Thuật toán | Loại | Tình trạng 2026 |
|------------|------|-----------------|
| **AES-256** | Đối xứng | **AN TOÀN** — chuẩn dùng phổ biến |
| **ChaCha20** | Đối xứng | An toàn, tốt cho thiết bị yếu |
| **DES / 3DES** | Đối xứng | **ĐÃ VỠ** — cấm dùng (DES 56-bit brute-force nhanh) |
| **RC4** | Đối xứng | Đã vỡ — cấm trong TLS |
| **RSA** | Bất đối xứng | An toàn khi key ≥ 2048-bit; chú ý **quantum threat** |
| **ECC** | Bất đối xứng | An toàn, key ngắn hơn RSA (256-bit ≈ RSA 3072) |
| **MD5 / SHA-1** | Hash | **ĐÃ VỠ** — collision (SHA-1 SHAttered 2017) |
| **SHA-256 / SHA-512** | Hash | An toàn — dùng cho checksum, HMAC, TLS 1.3 |

### 3. Hash, Salt, Rainbow Table

- **Hash:** một chiều (không giải mã được). Cùng input → cùng output.
- **Vấn đề:** kẻ tấn công lấy bảng hash password, dùng **rainbow table** (bảng precomputed hash của wordlist) để đối chiếu ngược.
- **Salt (muối):** thêm chuỗi ngẫu nhiên riêng cho mỗi user vào trước khi hash → hash khác nhau → **rainbow table vô dụng**, phải brute-force từng user. (Lab 1 minh hoạ.)

### 4. PKI & Digital Signature

```
Bob ký:      hash(msg) → mã hoá bằng PRIVATE key Bob → gửi msg + chữ ký
Alice xác nhận: giải mã chữ ký bằng PUBLIC key Bob → so sánh với hash(msg)
Nếu khớp → đúng người ký (xác thực) + chưa bị sửa (toàn vẹn)
```

- **Certificate (X.509):** gắn public key với danh tính; **CA** cấp phát.
- **TLS:** trình duyệt xác thực server qua cert → thiết lập phiên mã hoá (liên hệ Tuần 13 header scanner).

### 5. Tấn Công Mật Mã (LÝ THUYẾT)

| Tấn công | Mô tả |
|----------|-------|
| **Brute-force** | Thử toàn bộ key — không khả thi với AES-256 |
| **Dictionary** | Thử wordlist — đánh bại password yếu |
| **Rainbow table** | Bảng precomputed — chết vì salt |
| **Length extension** | Với hash không có cấu trúc chống (MD5/SHA-1) — dùng HMAC thay thế |
| **Padding oracle** | Rò thông tin qua lỗi padding của CBC — vá bằng GCM |
| **Side-channel** | Đo thời gian/điện năng — chống bằng constant-time |

> [!WARNING]
> Các mục trên là **LÝ THUYẾT** để hiểu vì sao thuật toán cũ bị loại. Không bẻ mã hoá của hệ thống người khác. Các lab dùng **hash/mã hoá bằng thư viện chuẩn**, không phá mã.

### 6. Phòng Thủ Mật Mã

- Dùng **AES-256-GCM / ChaCha20-Poly1305** cho dữ liệu; **SHA-256/512 + HMAC** cho toàn vẹn.
- **Loại bỏ** MD5, SHA-1, DES, 3DES, RC4 trong hệ thống của bạn.
- Lưu password bằng **thuật toán chậm có salt** (bcrypt/argon2/PBKDF2) — không phải MD5/SHA-1.
- **Quản lý key** đúng: xoay định kỳ, không nhúng key trong code (liên hệ Tuần 17, 19).
- Định kỳ **kiểm tra cấu hình TLS/cert** (như Tuần 13), theo dõi cảnh báo quantum-ready.

---

## Cảnh Báo An Toàn & Đạo Đức / Safety & Ethics

> [!WARNING]
> 1. Lab tuần này **chỉ dùng thư viện chuẩn** (hashlib, secrets) trên dữ liệu bạn tự tạo — không bẻ mã hoá của ai.
> 2. Không dùng tool để kiểm tra mật khẩu người khác.
> 3. Toàn bộ demo chạy offline, không kết nối mạng.
> 4. Vi phạm = **FAIL toàn bộ khoá học**.

---

## Thực Học Code / Hands-On (Defensive-first)

> Code đầy đủ trong `CODE/week20_crypto_toolkit.py`. Tool phòng thủ gồm:
> - So sánh **MD5 vs SHA-256** (vì sao MD5 không dùng cho password).
> - Minh hoạ **salt chống rainbow table** (hash + salt).
> - Mã hoá/giải mã file bằng **AES (qua Python stdlib `cryptography` nếu có, ngược lại dùng demo hash)** — đơn giản hoá an toàn.
> - Quiz ôn tổng hợp 20 tuần.

### Lab 1: Hash + Salt demo (Python stdlib)

```bash
python3 CODE/week20_crypto_toolkit.py --hash "supersecret"
python3 CODE/week20_crypto_toolkit.py --hash "supersecret" --salt random
python3 CODE/week20_crypto_toolkit.py --quiz
```

Kết quả mẫu:

```
[HASH]  input = supersecret
  MD5      = 2f65f5c20b3e2c20f3d0d0e0...   (16-byte, đã vỡ collision)
  SHA-256  = 2d711642b726b04401627ca9fbac32f5c... (32-byte, dùng được)
[!] Với password: dùng bcrypt/argon2 + salt, KHÔNG dùng MD5/SHA-1.

[SALT]  hash("supersecret" + salt ngẫu nhiên)
  Không salt: 2f65f5c20b3e2c20...   (giống mọi user — rainbow table đánh trúng)
  Có salt:    b7f1a3d0e9c8...       (khác mỗi user — rainbow table vô dụng)
```

> **Giải thích CEH:** cũng 1 mật khẩu, không salt → hash giống nhau cho mọi user → 1 bảng rainbow đối chiếu là ra. Có salt → mỗi user 1 hash khác → kẻ tấn công phải brute-force riêng từng user, chậm và tốn kém.

### Lab 2: Quiz ôn tổng hợp

```bash
python3 CODE/week20_crypto_toolkit.py --quiz
```

Quiz gồm 5-8 câu trắc nghiệm tiếng Việt về toàn bộ 20 tuần (footprinting → crypto), có chấm điểm ngay. Thử trả lời để tự kiểm tra.

---

## Bài Tập Về Nhà / Homework

1. **Hash & salt:** chạy `--hash` với 2 chuỗi giống nhau (không salt) và với `--salt` — nộp ảnh chụp + giải thích vì sao salt làm rainbow table vô dụng.
2. **Bảng thuật toán:** bảng gồm AES, DES, RSA, ECC, MD5, SHA-256 — loại, key size, tình trạng (OK/yếu/vỡ), dùng làm gì.
3. **PKI/TLS:** giải thích chữ ký số (Bob ký → Alice xác nhận) và vì sao TLS cần cả bất đối xứng lẫn đối xứng.
4. **Ôn tổng hợp:** chạy `--quiz` nhiều lần đến khi ≥ 8/10; liệt kê 5 chủ đề bạn cần ôn lại trước khi thi CEH.

---

## Rubric Đánh Giá Tuần 20

| Tiêu chí | Xuất sắc (90-100%) | Khá (70-89%) | Yếu (<70%) |
|----------|--------------------|--------------|------------|
| **Hash & salt demo** | 2 hash + giải thích salt đúng (40đ) | Thiếu giải thích (25đ) | Không chạy (10đ) |
| **Bảng thuật toán** | Đủ 6 thuật toán + tình trạng đúng (30đ) | Thiếu 1-2 (20đ) | Sai khái niệm (5đ) |
| **PKI/TLS + ôn tập** | Giải thích đúng + quiz ≥ 8/10 (30đ) | Thiếu 1 phần (20đ) | Chép lại (5đ) |

---

## Checklist Đầu Ra Tuần 20 (và CUỐI KHOÁ)

- [ ] Phân biệt đối xứng/bất đối xứng + hybrid TLS
- [ ] Biết tình trạng AES, DES, 3DES, RC4, RSA, ECC, MD5, SHA-1, SHA-256
- [ ] Giải thích salt chống rainbow table, HMAC thay length extension
- [ ] Trình bày chữ ký số & PKI/TLS
- [ ] Chạy thành công `week20_crypto_toolkit.py --hash`, `--salt`, `--quiz`
- [ ] **Đã hoàn thành 20 tuần:** tổng ôn, sẵn sàng thi CEH v13
