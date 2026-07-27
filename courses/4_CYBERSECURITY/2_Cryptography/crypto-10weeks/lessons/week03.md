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

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 3.1: Module Mã Hóa Luồng ChaCha20-Poly1305 (ChaCha20 Stream Module)
Viết class Python `StreamCipherManager` hỗ trợ mã hóa và giải mã chuỗi byte theo thời gian thực (Real-time Stream) bằng ChaCha20-Poly1305.

- **Đầu vào (Input):** `Data = b"PACKET_PAYLOAD_DATA"`, `Key = 32 bytes random`
- **Đầu ra kỳ vọng (Expected Output):** Mã hóa trả về `(nonce, ciphertext, tag)`. Giải mã trả về đúng dữ liệu gốc và xác thực tính toàn vẹn.

#### Bài 3.2: Kiểm Trợ Sự Khác Biệt PRNG vs CSPRNG
Viết script Python sinh $10,000$ số ngẫu nhiên 32-bit bằng `random.randint()` (PRNG) và `secrets.randbelow()` (CSPRNG). Đếm số lần lặp lại số ngẫu nhiên để thấy điểm khác biệt về độ an toàn mật mã.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 3.3: Mô Phỏng Tấn Công Tái Sử Dụng Nonce (Nonce Reuse Attack Simulation)
Viết script Python `nonce_reuse_attack.py` thực hiện các bước:
1. Cho 2 thông điệp Plaintext tiếng Anh $P_1 = \text{"ATTACK AT DAWN TODAY"}$ và $P_2 = \text{"RETREAT TO BASE NOW"}$.
2. Mã hóa cả $P_1$ và $P_2$ bằng ChaCha20 sử dụng **CÙNG MỘT KEY VÀ CÙNG MỘT NONCE** để thu được $C_1$ và $C_2$.
3. Thực hiện phép toán $C_1 \oplus C_2$.
4. Chứng minh $C_1 \oplus C_2 == P_1 \oplus P_2$ (Khóa hoàn toàn bị bóc tách).
5. Sử dụng kỹ thuật đoán từ (Word Dragging với các từ phổ biến như `"THE"`, `"ATTACK"`) để khôi phục lại $P_1$ và $P_2$.

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 3.4: So Sánh Tốc Độ Mã Hóa ChaCha20 vs AES-GCM Trên Mobile Colab
Mở Google Colab notebook và thực hiện:
1. Đo thời gian mã hóa 100MB dữ liệu giữa ChaCha20-Poly1305 và AES-256-GCM.
2. Đánh giá tốc độ xử lý trên CPU không có tăng tốc phần cứng AES-NI và giải thích lý do tại sao các ứng dụng di động (Android/iOS) ưa chuộng ChaCha20.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Phân Tích Thuật Toán** | Giải thích sắc bén nguyên lý Keystream, thảm họa Nonce Reuse và sự khác biệt PRNG vs CSPRNG. | Hiểu cơ bản cơ chế Stream Cipher và tác hại của việc dùng trùng Nonce. | Nắm được định nghĩa Stream Cipher nhưng chưa hiểu bản chất toán học XOR. | Nhầm lẫn giữa Stream Cipher và Block Cipher. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành đủ 4 bài (ChaCha20 module, PRNG vs CSPRNG test, Nonce Reuse attack simulation & Colab benchmark). | Hoàn thành Bài 3.1 và Bài 3.2 đúng yêu cầu. | Code có lỗi biên dịch hoặc chưa tính đúng phép XOR hai ciphertext. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
