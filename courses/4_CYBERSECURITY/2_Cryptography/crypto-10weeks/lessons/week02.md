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

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 2.1: Lập Trình Công Cụ Mã Hóa Tệp AES-256-GCM (AES File Encryptor CLI)
Viết script Python `aes_file_tool.py` nhận vào đường dẫn tệp tin và mật khẩu chuỗi từ người dùng. Script thực hiện:
1. Dẫn xuất khóa 32 bytes từ mật khẩu.
2. Mã hóa tệp tin bằng AES-256-GCM với Nonce 12 bytes ngẫu nhiên.
3. Ghi tệp mã hóa chứa cấu trúc: `[12 bytes Nonce] + [16 bytes Tag] + [Ciphertext]`.

- **Đầu vào (Input):** `input.txt` (nội dung bất kỳ) và `Password = "SecretKey2026"`
- **Đầu ra kỳ vọng (Expected Output):** Tạo tệp `input.txt.enc`. Khi giải mã sai mật khẩu hoặc bị sửa 1 byte dữ liệu, chương trình báo lỗi `Invalid Tag` và không xuất file hỏng.

#### Bài 2.2: So Sánh Tính Chất Khuếch Tán (Avalanche Effect)
Viết script Python mã hóa 2 chuỗi văn bản chỉ khác nhau 1 bit duy nhất bằng AES-128. Đếm số lượng bit bị thay đổi giữa 2 Ciphertext thu được và in ra tỷ lệ phần trăm (Kỳ vọng $\approx 50\%$).

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 2.3: Mô Phỏng Trực Quan Hóa Lỗi Mã Hóa Chế Độ ECB (ECB Image Visualizer)
Viết script Python đọc một file ảnh Bitmap (`.bmp` 24-bit color). Giữ nguyên 54 bytes tiêu đề (Header) của ảnh `.bmp`, chỉ mã hóa phần dữ liệu Pixel bằng:
1. Chế độ AES-ECB.
2. Chế độ AES-CBC.

Lưu 2 file ảnh mới `encrypted_ecb.bmp` và `encrypted_cbc.bmp`. Mở 2 ảnh xem trực quan và viết báo cáo giải thích tại sao đường nét cấu trúc ảnh vẫn hiện rõ ở file ECB nhưng biến mất hoàn toàn ở file CBC.

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 2.4: Đo Hiệu Năng Mã Hóa AES Trên Google Colab
Mở Google Colab notebook và thực thi bài lab:
1. Sinh dữ liệu ngẫu nhiên dung lượng 50MB bằng `os.urandom()`.
2. Đo thời gian mã hóa (tính bằng ms) giữa AES-128-GCM, AES-256-GCM và AES-256-CBC.
3. Vẽ biểu đồ so sánh tốc độ mã hóa (MB/giây) và đưa ra nhận xét về ảnh hưởng của độ dài khóa tới hiệu năng.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Phân Tích Thuật Toán** | Giải thích sâu sắc tại sao ECB làm lộ cấu trúc, cơ chế AEAD của GCM và Avalanche Effect. | Hiểu các chế độ mã hóa ECB, CBC, GCM và ý nghĩa của IV/Nonce. | Nắm được định nghĩa AES nhưng chưa giải thích được MAC Tag. | Nhầm lẫn giữa AES và thuật toán mã hóa cổ điển. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành đủ 4 bài (AES GCM CLI, Avalanche test, ECB BMP image lab & Colab benchmark). | Hoàn thành Bài 2.1 và Bài 2.2 chạy đúng không lỗi. | Code có lỗi xử lý file nhị phân hoặc dùng sai kích thước Nonce. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
