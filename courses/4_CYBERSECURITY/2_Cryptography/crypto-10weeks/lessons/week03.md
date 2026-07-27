# Tuần 3: Mã Hóa Dòng & Tính Ngẫu Nhiên Mật Mã (Stream Ciphers & CSPRNG)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Phân biệt sự khác biệt cơ bản giữa Mật mã khối (Block Cipher) và Mật mã dòng (Stream Cipher).
- Hiểu thuật toán mã hóa dòng **ChaCha20** và biến thể mã hóa xác thực **ChaCha20-Poly1305**.
- Nắm vững khái niệm Bộ sinh số giả ngẫu nhiên mật mã **CSPRNG (Cryptographically Secure Pseudorandom Number Generator)** và sự nguy hiểm khi dùng PRNG thông thường (như `random` của Python).
- Phân tích lỗ hổng tái sử dụng Khóa/Nonce (**Nonce Reuse Attack**) làm sụp đổ hoàn toàn tính bảo mật của Mật mã dòng.
- Thực hành lập trình Python mã hóa dữ liệu luồng tốc độ cao với ChaCha20.

### English
- Distinguish the fundamental differences between Block Ciphers and Stream Ciphers.
- Understand the **ChaCha20** stream cipher and the **ChaCha20-Poly1305** Authenticated Encryption construction.
- Master the concept of **CSPRNG (Cryptographically Secure Pseudorandom Number Generator)** vs standard PRNG (e.g., Python's `random`).
- Analyze the catastrophic **Nonce Reuse Attack** in stream ciphers.
- Practice Python programming for high-speed stream data encryption using ChaCha20.

---

## Lý Thuyết / Theory

### 1. Khái niệm Mật Mã Dòng / Stream Cipher Concepts

#### Tiếng Việt
Khác với Mật mã khối xử lý từng cụm dữ liệu 16 bytes, **Mật mã dòng (Stream Cipher)** sinh ra một chuỗi khóa giả ngẫu nhiên có độ dài vô hạn gọi là **Keystream ($K_s$)**, sau đó thực hiện phép toán XOR trực tiếp với từng byte (hoặc bit) của Văn bản rõ ($P$):

$$\text{Mã hóa: } C_i = P_i \oplus K_s[i]$$
$$\text{Giải mã: } P_i = C_i \oplus K_s[i]$$

**Ưu điểm của Mật mã dòng:**
- Tốc độ xử lý cực nhanh trên phần cứng không hỗ trợ tăng tốc AES.
- Không cần dùng Padding (đệm bộ nhớ).
- Thích hợp cho mã hóa luồng dữ liệu thời gian thực (Audio/Video call, TLS 1.3).

---

### 2. Thuật Toán ChaCha20 & Poly1305

#### Tiếng Việt
**ChaCha20** được thiết kế bởi Daniel J. Bernstein năm 2008. Nó hoạt động trên ma trận $4 \times 4$ gồm mười sáu từ 32-bit (tổng cộng 512 bits) và thực hiện 20 vòng xáo trộn dữ liệu bằng các phép toán cơ bản: **ARX (Add-Rotate-XOR)**.

Khi kết hợp với thuật toán mã xác thực **Poly1305**, ta có hệ mật **ChaCha20-Poly1305** (chuẩn RFC 7539):
- Dùng cho giao thức Google TLS, SSH và VPN WireGuard.
- Cung cấp tính năng Mã hóa xác thực (AEAD): Vừa giữ bí mật, vừa phát hiện khi gói tin bị thay đổi trên đường truyền.

---

### 3. Lỗ Hổng Tái Sử Dụng Nonce (Nonce Reuse Attack)

#### Tiếng Việt
> [!CAUTION]
> **THẢM HỌA BẢO MẬT: NONCE REUSE IN STREAM CIPHERS**
> Nếu kẻ tấn công bắt được 2 bản mã $C_1$ và $C_2$ được mã hóa cùng một Khóa ($K$) và cùng một Nonce (nghĩa là dùng chung Keystream $K_s$):
> $$C_1 = P_1 \oplus K_s$$
> $$C_2 = P_2 \oplus K_s$$
> Kẻ tấn công chỉ cần XOR hai bản mã $C_1 \oplus C_2$:
> $$C_1 \oplus C_2 = (P_1 \oplus K_s) \oplus (P_2 \oplus K_s) = P_1 \oplus P_2$$
> Lúc này, Khóa $K_s$ hoàn toàn bị triệt tiêu! Kẻ tấn công dễ dàng khôi phục lại văn bản gốc $P_1$ và $P_2$.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: ChaCha20-Poly1305 Encryption in Python
```python
from Crypto.Cipher import ChaCha20_Poly1305
from Crypto.Random import get_random_bytes

def chacha20_encrypt(plaintext: bytes, secret_key: bytes):
    """Encrypts data using ChaCha20-Poly1305 stream cipher."""
    cipher = ChaCha20_Poly1305.new(key=secret_key)
    ciphertext, tag = cipher.encrypt_and_digest(plaintext)
    return {
        "nonce": cipher.nonce,
        "ciphertext": ciphertext,
        "tag": tag
    }

def chacha20_decrypt(encrypted_dict: dict, secret_key: bytes) -> bytes:
    """Decrypts data and verifies integrity."""
    cipher = ChaCha20_Poly1305.new(key=secret_key, nonce=encrypted_dict["nonce"])
    plaintext = cipher.decrypt_and_verify(encrypted_dict["ciphertext"], encrypted_dict["tag"])
    return plaintext

if __name__ == "__main__":
    # ChaCha20 requires a 32-byte (256-bit) Key
    key = get_random_bytes(32)
    stream_data = b"REAL-TIME VIDEO STREAM PACKET #10492"
    
    enc = chacha20_encrypt(stream_data, key)
    print(f"[+] Nonce (12 bytes) : {enc['nonce'].hex()}")
    print(f"[+] Ciphertext (Hex) : {enc['ciphertext'].hex()}")
    
    dec = chacha20_decrypt(enc, key)
    print(f"[+] Decrypted Stream : {dec.decode('utf-8')}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao hàm `random` chuẩn của Python không được phép sử dụng trong các bài toán mật mã?
2. Điều gì xảy ra khi hai thông điệp khác nhau được mã hóa bằng cùng một Keystream trong Stream Cipher?
3. So sánh hiệu năng và độ an toàn giữa AES-256-GCM và ChaCha20-Poly1305 trên các thiết bị di động không có chip AES-NI.
4. Phép toán ARX (Add-Rotate-XOR) trong ChaCha20 có ưu điểm gì so với việc dùng bảng tra S-Box của AES?
5. Bộ sinh số ngẫu nhiên mật mã CSPRNG lấy nguồn Entropy từ đâu trong các hệ điều hành Linux và Windows?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Mô Phỏng Tấn Công Nonce Reuse
Viết một script Python mã hóa 2 chuỗi văn bản bằng cùng một chìa khóa và cùng 1 Nonce với ChaCha20. Thực hiện phép XOR 2 ciphertext thu được và dùng kỹ thuật đoán từ (Word Dragging) để tìm lại nội dung Plaintext.

### Task 2: So Sánh Tốc Độ Mã Hóa AES vs ChaCha20
Viết chương trình đo thời gian mã hóa 100MB dữ liệu giữa AES-256-GCM và ChaCha20-Poly1305 trong Python.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết Stream Cipher & CSPRNG** | Giải thích sâu sắc nguyên lý Keystream, thảm họa Nonce Reuse và sự khác biệt PRNG vs CSPRNG. | Hiểu cơ bản cơ chế Stream Cipher và tác hại của việc dùng trùng Nonce. | Nắm được định nghĩa Stream Cipher nhưng chưa hiểu bản chất toán học XOR. | Nhầm lẫn giữa Stream Cipher và Block Cipher. |
| **Thực Hành Code Python** | Lập trình ChaCha20-Poly1305 chuẩn xác, đo đạc tốc độ mã hóa mượt mà. | Code mã hóa chạy đúng nhưng chưa xử lý được MAC Tag validation. | Code có lỗi biên dịch hoặc dùng sai kích thước Nonce. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
