# Tuần 10: Xây Dựng Ứng Dụng Mã Hóa Đầu-Cuối (E2EE System Architecture & Capstone Project)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Tóm tắt và kết nối toàn bộ các mảng kiến thức mật mã đã học trong 10 tuần thành một **Hệ Thống Phòng Thủ Mã Hóa Hoàn Chỉnh**.
- Thấu hiểu kiến trúc của một **Hệ thống Mã hóa Đầu-Cuối (End-to-End Encryption - E2EE)** thực tế (như Signal Protocol, WhatsApp).
- Áp dụng kết hợp các thuật toán đã học: **Curve25519 (ECDH)** để trao đổi khóa, **HKDF** để dẫn xuất khóa phiên, **AES-256-GCM / ChaCha20-Poly1305** để mã hóa thông điệp, và **Ed25519** để ký xác thực.
- Đánh giá các rủi ro bảo mật thực tế như Tấn công Man-in-the-Middle (MitM), rò rỉ Metadata, và lưu trữ khóa trên thiết bị cuối.
- Bảo vệ Dự án Capstone Cuối khóa (Demo Day) và trình bày báo cáo kỹ thuật đánh giá an toàn mật mã.

### English
- Synthesize all 10-week cryptographic concepts into a unified **End-to-End Cryptographic Security Architecture**.
- Deeply comprehend real-world **End-to-End Encryption (E2EE)** system designs (such as Signal Protocol or WhatsApp).
- Integrally apply studied ciphers: **Curve25519 (ECDH)** for key agreement, **HKDF** for session key derivation, **AES-256-GCM / ChaCha20-Poly1305** for payload encryption, and **Ed25519** for digital signatures.
- Evaluate real-world threat vectors including Man-in-the-Middle (MitM) attacks, metadata leakage, and endpoint key storage risks.
- Present and defend the Capstone Final Project (Demo Day) with a comprehensive cryptographic security report.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Mã Hóa Đầu-Cuối (E2EE Architecture)

#### Tiếng Việt
Trong mô hình mã hóa truyền thống (Server-side Encryption): Thông điệp được mã hóa từ Client tới Server qua TLS, nhưng **Server có thể đọc được nội dung tin nhắn**.

Trong mô hình **Mã hóa Đầu-Cuối (End-to-End Encryption - E2EE)**:
- Thông điệp được mã hóa trực tiếp trên thiết bị người gửi (Alice) và CHỈ CÓ THỂ GIẢI MÃ trên thiết bị người nhận (Bob).
- Server chuyển tiếp (Relay Server) chỉ thấy các gói tin mã hóa thô (Ciphertext). Ngay cả khi Server bị hack hoặc bị tịch thu, kẻ tấn công **VẪN KHÔNG THỂ ĐỌC ĐƯỢC NỘI DUNG CHAT**.

```text
  [Alice Device]                [Relay Server]               [Bob Device]
  (Private Key a)               (Sees Ciphertext)            (Private Key b)
        │                                                           │
        ├─── Encrypts with Shared Session Key ─────────────────────►│
        │    (AES-256-GCM)                                          │
        │                                                           │
        │◄── Decrypts with Shared Session Key ──────────────────────┤
```

---

### 2. Sơ Đồ Khối Cryptographic Protocol Suite (Signal-like Concept)

#### Tiếng Việt
1. **Thiết lập danh tính (Identity Setup):** Mỗi người dùng sinh cặp khóa Ed25519 cố định để ký xác thực (`Identity Key`).
2. **Trao đổi khóa tạm thời (Ephemeral Key Exchange):** Sinh khóa Curve25519 mới cho từng phiên gọi là `Ephemeral Key`.
3. **Tính toán Khóa phiên (Session Key Derivation):** Sử dụng ECDH kết hợp HKDF để tạo ra 2 khóa đối xứng: $K_{\text{send}}$ (khóa gửi) và $K_{\text{recv}}$ (khóa nhận).
4. **Mã hóa Payload (Authenticated Encryption):** Dùng AES-256-GCM để mã hóa tin nhắn.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: Complete E2EE Encrypted Messaging Core Engine
```python
from cryptography.hazmat.primitives.asymmetric import x25519, ed25519
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from cryptography.hazmat.primitives.ciphers.aead import AESGCM
import os

class E2EESession:
    def __init__(self, name: str):
        self.name = name
        # Identity Key Pair for Signing (Ed25519)
        self.id_priv = ed25519.Ed25519PrivateKey.generate()
        self.id_pub = self.id_priv.public_key()
        
        # Ephemeral Key Pair for Key Exchange (X25519)
        self.eph_priv = x25519.X25519PrivateKey.generate()
        self.eph_pub = self.eph_priv.public_key()
        self.session_key = None

    def establish_session(self, peer_eph_pub):
        """Computes ECDH shared key and derives 256-bit AES-GCM session key."""
        shared_secret = self.eph_priv.exchange(peer_eph_pub)
        hkdf = HKDF(
            algorithm=hashes.SHA256(),
            length=32,
            salt=b"E2EE-Protocol-Salt",
            info=b"E2EE Session Key Derivation",
        )
        self.session_key = hkdf.derive(shared_secret)

    def encrypt_message(self, plaintext: str) -> dict:
        """Encrypts message payload with AES-256-GCM and signs the ciphertext."""
        if not self.session_key:
            raise ValueError("Session not established!")
            
        aesgcm = AESGCM(self.session_key)
        nonce = os.urandom(12)
        ciphertext = aesgcm.encrypt(nonce, plaintext.encode('utf-8'), None)
        
        # Sign the ciphertext to ensure authenticity
        signature = self.id_priv.sign(ciphertext)
        
        return {
            "nonce": nonce,
            "ciphertext": ciphertext,
            "signature": signature
        }

    def decrypt_message(self, packet: dict, peer_id_pub) -> str:
        """Verifies signature and decrypts message payload."""
        if not self.session_key:
            raise ValueError("Session not established!")
            
        # 1. Verify Ed25519 signature
        peer_id_pub.verify(packet["signature"], packet["ciphertext"])
        
        # 2. Decrypt AES-GCM ciphertext
        aesgcm = AESGCM(self.session_key)
        plaintext_bytes = aesgcm.decrypt(packet["nonce"], packet["ciphertext"], None)
        return plaintext_bytes.decode('utf-8')

# Demo Execution
if __name__ == "__main__":
    print("=== DEMO ENGINE MÃ HÓA ĐẦU-CUỐI E2EE CHUẨN MỰC ===")
    alice = E2EESession("Alice")
    bob = E2EESession("Bob")
    
    # Establish E2EE Session
    alice.establish_session(bob.eph_pub)
    bob.establish_session(alice.eph_pub)
    print("[+] Session Keys established on both endpoints via ECDH + HKDF!")
    
    # Alice sends E2EE message to Bob
    secret_msg = "TOP SECRET LAUNCH CODE: 99887766"
    print(f"\n[Alice] Sending Plaintext: {secret_msg}")
    packet = alice.encrypt_message(secret_msg)
    print(f"[Network] Intercepted Ciphertext (Hex): {packet['ciphertext'].hex()[:32]}...")
    
    # Bob receives and decrypts
    decrypted_msg = bob.decrypt_message(packet, alice.id_pub)
    print(f"[Bob] Decrypted E2EE Message          : {decrypted_msg}")
```

---

## Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix

| Tuần | Chủ Đề Chính | Thuật Toán & Kỹ Thuật Đạt Được |
| :--- | :--- | :--- |
| **Week 1** | Mật Mã Cổ Điển | Caesar Cipher, Vigenère Cipher, Frequency Analysis, Kerckhoffs's Principle. |
| **Week 2** | Mã Hóa Khối Đối Xứng | AES-128/256, DES, Chế độ ECB/CBC/CTR/GCM, Padding PKCS#7. |
| **Week 3** | Mã Hóa Dòng & CSPRNG | ChaCha20-Poly1305, RC4, PRNG vs CSPRNG, Nonce Reuse Attack. |
| **Week 4** | Hàm Băm Mật Mã & HMAC | SHA-256, SHA-3, HMAC, Merkle Trees, Birthday Attack. |
| **Week 5** | Lý Thuyết Số & RSA | Euclid mở rộng, Đồng dư, Phi hàm Euler, RSA Keygen $(e, d, n)$, OAEP Padding. |
| **Week 6** | ECC & Trao Đổi Khóa | Curve25519, Diffie-Hellman, ECDH, Perfect Forward Secrecy (PFS). |
| **Week 7** | Chữ Ký Số & PKI | Ed25519, ECDSA, RSA Signatures, X.509 Certificates, TLS 1.3 Handshake. |
| **Week 8** | Băm Mật Khẩu & KDFs | Salting, Peppering, PBKDF2, Bcrypt, Argon2id (Memory-Hard). |
| **Week 9** | Mật Mã Nâng Cao | Zero-Knowledge Proofs (ZKP), Fully Homomorphic Encryption, PQC (Kyber/Dilithium). |
| **Week 10** | Hệ Thống E2EE & Capstone | Kiến trúc E2EE hoàn chỉnh (Signal Protocol concept), Capstone Project & Demo Day. |

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 10.1: Xây Dựng Khung Mã Nguồn Trình Chat E2EE Hoàn Chỉnh (E2EE Messenger Core)
Hoàn thiện script Python `e2ee_messenger_engine.py` bao gồm 4 khối chức năng:
1. Sinh cặp khóa Identity (`Ed25519`) và cặp khóa Ephemeral (`X25519`).
2. Thực hiện bắt tay ECDH + HKDF để sinh Session Key đối xứng 256-bit.
3. Mã hóa nội dung tin nhắn bằng `AES-256-GCM`.
4. Ký số lên Ciphertext bằng `Ed25519` để chống giả mạo người gửi.

- **Đầu ra kỳ vọng (Expected Output):** Người nhận giải mã mượt mà và kiểm tra đúng chữ ký số. Nếu kẻ tấn công thay đổi 1 byte Ciphertext trên đường truyền, chương trình lập tức cảnh báo `[SECURITY ALERT] Message signature verification failed!`.

#### Bài 10.2: Đóng Gói Module Lưu Trữ Khóa Bí Mật An Toàn (Secure Storage Manager)
Viết module mã hóa file chứa Private Keys trên thiết bị cuối bằng `Argon2id` + `AES-256-GCM` để bảo vệ khóa bí mật khi máy tính/điện thoại bị tắt.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 10.3: Phân Tích Rủi Ro Tấn Công Man-in-the-Middle (MitM) & Giả Mạo Khóa (KCI Attack)
Viết báo cáo đánh giá an toàn mật mã cho ứng dụng E2EE Messenger:
1. Mô tả kịch bản Server chuyển tiếp giả mạo Public Key của Bob khi gửi cho Alice và cách cơ chế Chữ ký số Ed25519 ngăn chặn cuộc tấn công này.
2. Phân tích cách sử dụng **Mã an toàn danh tính (Safety Numbers / QR Code Fingerprint)** để xác minh thủ công giữa hai người dùng (ví dụ: Fingerprint = `SHA-256(Alice_PubKey || Bob_PubKey)`).

---

### 🔴 Phần C: Bài Tập Tốt Nghiệp Capstone & Demo Day (Capstone Defense)

#### Bài 10.4: Bảo Vệ Dự Án Capstone Cuối Khóa & Demo Ứng Dụng
1. Hoàn thiện mã nguồn ứng dụng Capstone đã chọn (Track A: E2EE Messenger, Track B: Password Vault, hoặc Track C: PKI CA Authority).
2. Đóng gói mã nguồn đẩy lên GitHub repository công khai kèm tệp `README.md` hướng dẫn cài đặt và sử dụng.
3. Chuẩn bị Slide thuyết trình (8-10 trang) và thực hiện Demo ứng dụng trực tiếp trước hội đồng đánh giá trong buổi Demo Day (Buổi 20).

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Trúc Mật Mã E2EE** | Thiết kế luồng mã hóa E2EE hoàn chỉnh, dùng đúng AES-GCM, ECDH Curve25519, Ed25519 và HKDF. | Dùng đúng thuật toán mã hóa đối xứng và bất đối xứng nhưng thiếu chữ ký số xác thực. | Ứng dụng chạy được nhưng còn đè ngẫu nhiên IV hoặc dùng mã hóa không xác thực. | Không triển khai được mô hình E2EE. |
| **Hoàn Thành Bài Tập & Capstone** | Hoàn thành xuất sắc cả 4 bài, ứng dụng Capstone chạy mượt mà, slide thuyết trình ấn tượng và bảo vệ thành công. | Hoàn thành Bài 10.1 và Bài 10.2 chạy đúng không lỗi. | Code có lỗi xử lý ngoại lệ hoặc chưa nộp slide thuyết trình Capstone. | Không nộp dự án Capstone. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
