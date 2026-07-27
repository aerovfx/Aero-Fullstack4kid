# Tuần 2: Mã Hóa Khối Đối Xứng & Thuật Toán AES (Symmetric Block Ciphers & AES)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc và nguyên lý làm việc của Mật mã khối đối xứng (Symmetric Block Ciphers).
- Hiểu cấu trúc thuật toán mã hóa tiêu chuẩn **AES (Advanced Encryption Standard)** với các độ dài khóa 128, 192, và 256 bits.
- Phân biệt rõ các Chế độ hoạt động (Modes of Operation): **ECB, CBC, CTR, và GCM**.
- Nhận thức sâu sắc về rủi ro của chế độ ECB (Electronic Codebook) và tại sao **AES-GCM (Authenticated Encryption)** là chuẩn mực hiện đại.
- Thực hành lập trình Python mã hóa tệp tin và dữ liệu chuỗi an toàn bằng thư viện `pycryptodome`.

### English
- Master the architecture and working principles of Symmetric Block Ciphers.
- Understand the internal mechanics of **AES (Advanced Encryption Standard)** with 128, 192, and 256-bit key lengths.
- Clearly distinguish between Block Cipher Modes of Operation: **ECB, CBC, CTR, and GCM**.
- Understand the catastrophic security flaw of ECB mode and why **AES-GCM (Authenticated Encryption)** is the modern gold standard.
- Practice Python programming to securely encrypt files and data strings using the `pycryptodome` library.

---

## Lý Thuyết / Theory

### 1. Giới thiệu về Mã Hóa Khối Đối Xứng / Symmetric Block Ciphers

#### Tiếng Việt
Trong **Mật mã đối xứng (Symmetric Cryptography)**, cả bên gửi và bên nhận đều chia sẻ cùng một Khóa bí mật ($K$) duy nhất để mã hóa và giải mã.

Mật mã khối (Block Cipher) chia văn bản rõ thành các khối dữ liệu có kích thước cố định (ví dụ: 128 bits / 16 bytes đối với AES). Mỗi khối dữ liệu được đưa qua nhiều vòng biến đổi toán học bao gồm:
- **Substitution (Thay thế):** Sử dụng các bảng S-Box để chống phân tích mật mã tuyến tính.
- **Permutation / Diffusion (Khuếch tán):** Xáo trộn vị trí các bit dữ liệu để đảm bảo **Hiệu ứng vết tuyết (Avalanche Effect)**: Chỉ cần thay đổi 1 bit ở Plaintext hoặc Key, trung bình 50% số bit ở Ciphertext sẽ thay đổi.

#### English
In **Symmetric Cryptography**, both the sender and receiver share the exact same Secret Key ($K$) for encryption and decryption.

A Block Cipher breaks the plaintext into fixed-size blocks (e.g., 128 bits / 16 bytes for AES). Each block undergoes multiple rounds of mathematical transformations including:
- **Substitution:** Using S-Boxes to resist linear and differential cryptanalysis.
- **Permutation / Diffusion:** Shuffling bit positions to achieve the **Avalanche Effect**: Changing 1 bit in plaintext or key flips on average 50% of the ciphertext bits.

---

### 2. Thuật Toán AES (Advanced Encryption Standard)

#### Tiếng Việt
AES được Viện Tiêu chuẩn và Công nghệ Quốc gia Mỹ (NIST) phê duyệt năm 2001 để thay thế cho DES đã bị bẻ khóa. AES hoạt động trên kích thước khối cố định **128 bits (16 bytes)** và hỗ trợ 3 độ dài khóa:
- **AES-128:** 10 vòng biến đổi (10 rounds).
- **AES-192:** 12 vòng biến đổi (12 rounds).
- **AES-256:** 14 vòng biến đổi (14 rounds).

Mỗi vòng của AES bao gồm 4 bước cơ bản trên ma trận trạng thái $4 \times 4$ bytes:
1. `SubBytes`: Thay thế phi tuyến tính từng byte qua S-Box.
2. `ShiftRows`: Dịch chuyển các hàng của ma trận.
3. `MixColumns`: Trộn dữ liệu giữa các cột bằng phép nhân ma trận trên trường Galois $GF(2^8)$.
4. `AddRoundKey`: Phép XOR giữa ma trận trạng thái với Khóa vòng (Round Key).

---

### 3. Các Chế Độ Hoạt Động (Modes of Operation)

#### Tiếng Việt
Khi thông điệp dài hơn kích thước 1 khối (16 bytes), chúng ta phải dùng Chế độ hoạt động (Mode of Operation):

1. **ECB (Electronic Codebook):**
   - Mã hóa độc lập từng khối với cùng một khóa.
   - 🛑 **LỖ HỔNG:** Các khối Plaintext giống nhau sẽ tạo ra các khối Ciphertext giống hệt nhau. Khi mã hóa hình ảnh, cấu trúc hình ảnh vẫn bị lộ hoàn toàn!

2. **CBC (Cipher Block Chaining):**
   - Khối Plaintext trước khi mã hóa được XOR với khối Ciphertext ngay trước đó. Khối đầu tiên được XOR với Vector Khởi Tạo ngẫu nhiên (**IV - Initialization Vector**).
   - Yêu cầu Padding (như PKCS#7) để đủ 16 bytes.

3. **GCM (Galois/Counter Mode) - Authenticated Encryption:**
   - Kết hợp chế độ đếm CTR với mã xác thực thông điệp Galois (GMAC).
   - ✅ **CHUẨN MỰC HIỆN ĐẠI:** Vừa mã hóa bảo mật, vừa chống sửa đổi dữ liệu (Integrity Check).

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: AES-256-GCM Secure Encryption & Decryption
```python
from Crypto.Cipher import AES
from Crypto.Random import get_random_bytes

def aes_gcm_encrypt(plaintext: bytes, secret_key: bytes):
    """Encrypts plaintext using AES-256-GCM with Authenticated Data."""
    # AES-GCM requires a 12-byte Nonce
    nonce = get_random_bytes(12)
    cipher = AES.new(secret_key, AES.MODE_GCM, nonce=nonce)
    
    ciphertext, tag = cipher.encrypt_and_digest(plaintext)
    return {
        "nonce": nonce,
        "ciphertext": ciphertext,
        "tag": tag
    }

def aes_gcm_decrypt(encrypted_dict: dict, secret_key: bytes) -> bytes:
    """Decrypts ciphertext and verifies integrity using MAC tag."""
    cipher = AES.new(secret_key, AES.MODE_GCM, nonce=encrypted_dict["nonce"])
    # Verify MAC tag to detect tampering
    plaintext = cipher.decrypt_and_verify(encrypted_dict["ciphertext"], encrypted_dict["tag"])
    return plaintext

# Test execution
if __name__ == "__main__":
    # Generate 32-byte (256-bit) secret key
    key = get_random_bytes(32)
    secret_data = b"CONFIDENTIAL FINANCIAL RECORD: $1,000,000"
    
    encrypted = aes_gcm_encrypt(secret_data, key)
    print(f"[+] Ciphertext (Hex) : {encrypted['ciphertext'].hex()}")
    print(f"[+] MAC Tag (Hex)    : {encrypted['tag'].hex()}")
    
    decrypted = aes_gcm_decrypt(encrypted, key)
    print(f"[+] Decrypted Data   : {decrypted.decode('utf-8')}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao chế độ ECB (Electronic Codebook) tuyệt đối không được dùng trong mã hóa dữ liệu thực tế?
2. Sự khác biệt giữa Mã hóa thuần túy (Encryption) và Mã hóa xác thực (Authenticated Encryption - AEAD) là gì?
3. Tại sao Vector Khởi Tạo (IV / Nonce) phải ngẫu nhiên và KHÔNG ĐƯỢC tái sử dụng?
4. Phép toán XOR ($\oplus$) có tính chất gì đặc biệt khiến nó trở thành nền tảng của mật mã học?
5. Hiệu ứng vết tuyết (Avalanche Effect) đóng vai trò gì trong việc chống lại các kỹ thuật thám mã?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Mô Phỏng Lỗi Mã Hóa ECB Mode
Viết một script Python đọc một file ảnh Bitmap (`.bmp`), mã hóa phần dữ liệu pixel bằng AES-ECB và AES-CBC, sau đó lưu lại file ảnh mới để quan sát sự lộ lọt cấu trúc hình ảnh của ECB Mode.

### Task 2: Xây Dựng File Encrypter CLI
Viết ứng dụng dòng lệnh Python nhận vào đường dẫn tệp tin và mật khẩu, tự động mã hóa tệp bằng AES-256-GCM và lưu thành file `.enc`.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết AES & Block Modes** | Phân tích sâu sắc sự khác biệt giữa ECB, CBC, GCM và cơ chế AEAD. | Hiểu cơ bản cấu trúc AES và sự nguy hiểm của ECB mode. | Nắm khái niệm AES nhưng chưa giải thích được IV và MAC Tag. | Nhầm lẫn giữa AES và thuật toán mã hóa cổ điển. |
| **Thực Hành Code Python** | Viết code AES-256-GCM hoàn chỉnh, xử lý lỗi `ValueError` khi MAC tag sai. | Code mã hóa/giải mã chạy đúng nhưng thiếu kiểm tra tính toàn vẹn. | Code báo lỗi thư viện hoặc tái sử dụng Nonce cố định. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
