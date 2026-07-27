# Tuần 7: Chữ Ký Số, Hạ Tầng Khóa Công Khai PKI & Bắt Tay TLS/SSL (Digital Signatures, PKI & TLS)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu nguyên lý và vai trò của **Chữ ký số (Digital Signatures)** trong việc đảm bảo tính Toàn vẹn (Integrity), Xác thực (Authentication) và Chống chối bỏ (Non-repudiation).
- Phân biệt 2 thuật toán chữ ký số phổ biến: **RSA Signature** và **Ed25519 / ECDSA**.
- Nắm vững kiến trúc **Hạ tầng khóa công khai (PKI - Public Key Infrastructure)**: Nhà quản lý chứng chỉ (CA - Certificate Authority), Root CA, Intermediate CA, và Định dạng Chứng chỉ **X.509**.
- Thấu hiểu toàn bộ quy trình **Bắt tay TLS 1.3 (TLS Handshake)** bảo mật các kết nối HTTPS.
- Thực hành tạo Root CA riêng, tự cấp phát chứng chỉ X.509 và lập trình ký/xác thực thông điệp bằng Python.

### English
- Understand the mechanics and vital role of **Digital Signatures** in ensuring Integrity, Authentication, and Non-repudiation.
- Compare standard signature algorithms: **RSA Signatures** vs **Ed25519 / ECDSA**.
- Master **Public Key Infrastructure (PKI)** concepts: Certificate Authorities (CAs), Root CAs, Intermediate CAs, and **X.509** Certificate standards.
- Comprehend the end-to-end **TLS 1.3 Handshake** protocol securing HTTPS connections.
- Practice generating a custom Root CA, issuing self-signed X.509 certificates using OpenSSL CLI, and signing/verifying messages via Python.

---

## Lý Thuyết / Theory

### 1. Nguyên Lý Hoạt Động Của Chữ Ký Số / Digital Signature Principles

#### Tiếng Việt
Chữ ký số là tương quan ngược của Mã hóa bất đối xứng:
- **Mã hóa:** Dùng Public Key để mã hóa -> Dùng Private Key để giải mã.
- **Ký số:** Dùng **Private Key để ký (Sign)** -> Dùng **Public Key để xác thực (Verify)**.

**Quy trình Ký số và Xác thực:**
1. **Bên Ký (Alice):**
   - Tính giá trị băm thông điệp: $h = H(M)$.
   - Ký lên giá trị băm bằng Private Key của Alice: $S = \text{Sign}_{d_{\text{Alice}}}(h)$.
   - Gửi $(M, S)$ cho bên nhận.

2. **Bên Xác Thực (Bob):**
   - Tính giá trị băm thông điệp nhận được: $h' = H(M)$.
   - Giải mã chữ ký $S$ bằng Public Key của Alice: $h'' = \text{Verify}_{e_{\text{Alice}}}(S)$.
   - Nếu $h' == h''$, chữ ký hợp lệ!

**3 Tính chất đạt được:**
- **Integrity (Tính toàn vẹn):** Nếu $M$ bị sửa đổi DÙ CHỈ 1 BIT, $h' \neq h''$.
- **Authentication (Xác thực):** Chỉ người giữ Private Key của Alice mới tạo được chữ ký $S$.
- **Non-repudiation (Chống chối bỏ):** Alice không thể chối là mình không gửi thông điệp.

---

### 2. Hạ Tầng Khóa Công Khai PKI & Chứng Chỉ X.509

#### Tiếng Việt
Nếu Alice gửi Public Key cho Bob qua mạng, làm sao Bob biết Public Key đó THỰC SỰ là của Alice chứ không phải của Hacker? -> **Bài toán Man-in-the-Middle (MitM)**.

**Giải pháp: Hạ tầng Khóa công khai (PKI)**
- **Certificate Authority (CA):** Tổ chức uy tín thứ ba được cả thế giới tin tưởng (như Let's Encrypt, DigiCert).
- **Chứng chỉ X.509:** File chứa Public Key của nhà sán xuất/Domain kèm theo Chữ ký số của CA.
- **Chuỗi tin tưởng (Chain of Trust):** Trình duyệt tích hợp sẵn danh sách Root CA. Khi truy cập `https://google.com`, trình duyệt lấy chứng chỉ của Google, dùng Public Key của Root CA để xác thực chữ ký trên chứng chỉ.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: Ed25519 Digital Signature & Verification in Python
```python
from cryptography.hazmat.primitives.asymmetric import ed25519
from cryptography.exceptions import InvalidSignature

def generate_ed25519_keys():
    """Generates Ed25519 Signing (Private) and Verifying (Public) Key pair."""
    private_key = ed25519.Ed25519PrivateKey.generate()
    public_key = private_key.public_key()
    return private_key, public_key

def sign_message(message: bytes, private_key) -> bytes:
    """Signs a message using the Ed25519 Private Key."""
    signature = private_key.sign(message)
    return signature

def verify_signature(message: bytes, signature: bytes, public_key) -> bool:
    """Verifies the Ed25519 signature against the public key."""
    try:
        public_key.verify(signature, message)
        return True
    except InvalidSignature:
        return False

if __name__ == "__main__":
    priv_key, pub_key = generate_ed25519_keys()
    document = b"CONTRACT AGREEMENT: Transfer 100 Shares to Bob"
    
    sig = sign_message(document, priv_key)
    print(f"[+] Document     : {document.decode('utf-8')}")
    print(f"[+] Ed25519 Sig  : {sig.hex()}")
    
    # Test valid verification
    valid = verify_signature(document, sig, pub_key)
    print(f"[+] Signature Valid? : {valid}")
    
    # Test tampered document
    tampered_doc = b"CONTRACT AGREEMENT: Transfer 900 Shares to Bob"
    tampered_valid = verify_signature(tampered_doc, sig, pub_key)
    print(f"[+] Tampered Doc Valid? : {tampered_valid}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao chữ ký số lại ký lên giá trị băm $H(M)$ của thông điệp thay vì ký trực tiếp lên toàn bộ văn bản rõ $M$?
2. Sự khác biệt giữa Thuật toán RSA Signature và Ed25519 Signature là gì? Tại sao Ed25519 lại được ưu chuộng hơn hiện nay?
3. Mô tả cuộc tấn công Man-in-the-Middle (MitM) sẽ xảy ra như thế nào nếu hệ thống HTTPS không sử dụng chứng chỉ X.509 PKI?
4. Chuỗi tin tưởng (Chain of Trust) từ Leaf Certificate đến Root CA hoạt động như thế nào khi bạn truy cập một trang web HTTPS?
5. Sự khác biệt giữa quá trình Bắt tay TLS 1.2 (2 Round-Trips) và TLS 1.3 (1 Round-Trip) là gì?

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 7.1: Module Ký Số & Xác Thực Hợp Đồng Ed25519 (Ed25519 Document Signer)
Viết script Python `ed25519_signer.py` hỗ trợ:
1. Sinh cặp khóa Ed25519 (Private Key & Public Key).
2. Ký tệp tin PDF/Text bất kỳ.
3. Xuất file chữ ký riêng biệt `.sig`.
4. Viết chức năng kiểm tra tính toàn vẹn và hợp lệ của chữ ký.

- **Đầu vào (Input):** `contract.txt`, `signature.sig`, `public_key.pub`
- **Đầu ra kỳ vọng (Expected Output):** Nối đúng `[VALID SIGNATURE]`. Nếu tệp bị sửa 1 ký tự, báo `[INVALID SIGNATURE - FILE TAMPERED!]`.

#### Bài 7.2: Phân Tích Cấu Trúc Chứng Chỉ Số X.509
Viết script Python dùng thư viện `cryptography` đọc tệp chứng chỉ X.509 (`.crt` hoặc `.pem`) của trang web `google.com` và in các thông tin: Subject, Issuer, Serial Number, Expiration Date, và Public Key Algorithm.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 7.3: Tự Xây Dựng Hạ Tầng Cấp Chứng Chỉ Local Root CA Bằng OpenSSL CLI
Viết script Bash/Python tự động hóa quy trình PKI:
1. Tạo Private Key `rootCA.key` và chứng chỉ tự ký Root CA `rootCA.crt` (thời hạn 10 năm).
2. Tạo Private Key cho Web Server `server.key` và file Yêu cầu Cấp Chứng chỉ `server.csr`.
3. Dùng Root CA ký và cấp phát chứng chỉ số X.509 `server.crt` có mở rộng SAN (Subject Alternative Name = `localhost`, `127.0.0.1`).
4. Kiểm tra chuỗi chứng chỉ bằng lệnh `openssl verify -CAfile rootCA.crt server.crt`.

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 7.4: Mô Phỏng Toàn Bộ Quy Trình Bắt Tay TLS 1.3 (TLS 1.3 Handshake Simulator)
Mở Google Colab notebook và thực hiện mô phỏng luồng bắt tay TLS 1.3 (1 Round-Trip):
1. Client gửi `ClientHello` chứa Ephemeral ECDH Key Share (`client_eph_pub`).
2. Server phản hồi `ServerHello` chứa Ephemeral ECDH Key Share (`server_eph_pub`) + Certificate X.509 + Signature.
3. Cả hai bên tự tính toán Master Session Key và bắt đầu truyền dữ liệu mã hóa AES-GCM.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Phân Tích Thuật Toán** | Giải thích sâu sắc nguyên lý Ký số, 3 tính chất bảo mật (Integrity, Auth, Non-repudiation), Chuỗi tin tưởng X.509 và Bắt tay TLS 1.3. | Hiểu quy trình Ký/Xác thực chữ ký và khái niệm CA. | Nắm được định nghĩa Chữ ký số nhưng nhầm lẫn với Encryption. | Nhầm lẫn giữa Private Key ký và Public Key mã hóa. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành đủ 4 bài (Ed25519 signer module, X.509 parser, Local Root CA OpenSSL automation & Colab TLS 1.3 simulator). | Hoàn thành Bài 7.1 và Bài 7.2 đúng yêu cầu. | Code báo lỗi thư viện hoặc không tạo được chứng chỉ OpenSSL. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
