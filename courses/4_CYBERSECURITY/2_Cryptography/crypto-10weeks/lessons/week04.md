# Tuần 4: Hàm Băm Mật Mã & Mã Xác Thực Thông Điệp HMAC (Cryptographic Hash Functions & HMAC)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững khái niệm và 3 tính chất cốt lõi của Hàm băm mật mã (Cryptographic Hash Functions).
- Hiểu cấu trúc họ hàm băm **SHA-2 (SHA-256/512)** và chuẩn thế hệ mới **SHA-3 (Keccak)**.
- Phân biệt sự khác nhau giữa Hàm băm thuần túy và Mã xác thực thông điệp có khóa **HMAC (Hash-based Message Authentication Code)**.
- Phân tích rủi ro va chạm băm (Hash Collision) và cuộc tấn công **Birthday Attack**.
- Thực hành lập trình Python tính toán giá trị băm SHA-256, kiểm tra tính toàn vẹn tệp tin và tạo HMAC signature.

### English
- Master the core concepts and 3 essential security properties of Cryptographic Hash Functions.
- Understand the internal construction of **SHA-2 (SHA-256/512)** and the new standard **SHA-3 (Keccak)**.
- Differentiate between plain Hash Functions and keyed Message Authentication Codes (**HMAC**).
- Analyze the risk of Hash Collisions and the mathematical principles of the **Birthday Attack**.
- Practice Python programming to calculate SHA-256 hashes, verify file integrity, and construct HMAC signatures.

---

## Lý Thuyết / Theory

### 1. 3 Tính Chất Cốt Lõi Của Hàm Băm Mật Mã / Core Properties

#### Tiếng Việt
Hàm băm mật mã $H$ nhận một thông điệp $M$ có độ dài tùy ý và biến đổi thành một chuỗi giá trị $h = H(M)$ có độ dài cố định (ví dụ: 256 bits đối với SHA-256).

Để được coi là an toàn mật mã, $H$ bắt buộc phải thỏa mãn **3 tính chất**:

1. **Tính Kháng Tiền Ảnh (Pre-image Resistance - One-Way Property):**
   Cho trước giá trị băm $h$, cực kỳ khó (bất khả thi về mặt tính toán) để tìm lại thông điệp gốc $M$ sao cho $H(M) = h$.

2. **Tính Kháng Tiền Ảnh Thứ Hai (Second Pre-image Resistance):**
   Cho trước thông điệp $M_1$, cực kỳ khó để tìm thấy một thông điệp khác $M_2 \neq M_1$ sao cho $H(M_1) = H(M_2)$.

3. **Tính Kháng Va Chạm (Collision Resistance):**
   Cực kỳ khó để tìm thấy **bất kỳ** cặp thông điệp nào $(M_1, M_2)$ với $M_1 \neq M_2$ sao cho $H(M_1) = H(M_2)$.

---

### 2. Tấn Công Sinh Nhật (Birthday Attack)

#### Tiếng Việt
Theo **Nghịch lý Ngày sinh (Birthday Paradox)** trong xác suất thống kê: Trong một phòng chỉ cần có 23 người, xác suất có ít nhất 2 người cùng ngày sinh đã vượt quá 50%.

Áp dụng vào Mật mã học: Nếu hàm băm có đầu ra độ dài $n$ bits (tổng số giá trị băm là $2^n$), kẻ tấn công chỉ cần thử khoảng **$2^{n/2}$** thông điệp ngẫu nhiên để tìm ra một cặp va chạm băm ($H(M_1) = H(M_2)$).
- Đối với MD5 ($n = 128$ bits): Độ phức tạp bẻ khóa va chạm chỉ là $2^{64}$ (Đã bị bẻ khóa hoàn toàn).
- Đối với SHA-256 ($n = 256$ bits): Độ phức tạp va chạm là $2^{128}$ (An toàn tuyệt đối hiện tại).

---

### 3. Mã Xác Thực Thông Điệp HMAC (Hash-based MAC)

#### Tiếng Việt
Nếu chỉ gửi thông điệp $M$ kèm theo giá trị băm $H(M)$, kẻ tấn công đứng giữa có thể sửa thông điệp thành $M'$ và tính lại $H(M')$. BÊN NHẬN KHÔNG THỂ PHÁT HIỆN ĐƯỢC!

Để chống lại việc này, ta phải sử dụng **HMAC** kết hợp với một Khóa bí mật ($K$):

$$\text{HMAC}(K, M) = H\Big((K \oplus opad) \parallel H\big((K \oplus ipad) \parallel M\big)\Big)$$

Trong đó `ipad` (inner pad) và `opad` (outer pad) là các hằng số byte cố định. Chỉ ai có Khóa bí mật $K$ mới tạo và kiểm tra được chữ ký HMAC hợp lệ.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: File Integrity Checker & HMAC Generator in Python
```python
import hashlib
import hmac
import os

def calculate_sha256(filepath: str) -> str:
    """Calculates the SHA-256 hash of a file in chunks."""
    sha256 = hashlib.sha256()
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            sha256.update(chunk)
    return sha256.hexdigest()

def create_hmac_signature(message: bytes, secret_key: bytes) -> str:
    """Creates a SHA-256 HMAC signature for payload authentication."""
    signature = hmac.new(secret_key, message, hashlib.sha256).hexdigest()
    return signature

def verify_hmac_signature(message: bytes, secret_key: bytes, expected_sig: str) -> bool:
    """Verifies HMAC signature in constant-time to prevent timing attacks."""
    actual_sig = create_hmac_signature(message, secret_key)
    # hmac.compare_digest prevents Timing Side-Channel Attacks
    return hmac.compare_digest(actual_sig, expected_sig)

if __name__ == "__main__":
    key = b"SuperSecretAPIKey12345"
    payload = b'{"action": "TRANSFER", "amount": 5000, "to": "Alice"}'
    
    sig = create_hmac_signature(payload, key)
    print(f"[+] Message Payload : {payload.decode('utf-8')}")
    print(f"[+] HMAC Signature  : {sig}")
    
    valid = verify_hmac_signature(payload, key, sig)
    print(f"[+] Signature Valid : {valid}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao thuật toán MD5 và SHA-1 lại bị cấm sử dụng trong các hệ thống an ninh hiện đại?
2. Sự khác biệt cơ bản giữa mã hóa (Encryption) và băm (Hashing) là gì? Tại sao không thể "giải mã" một giá trị băm?
3. Tại sao việc so sánh chữ ký HMAC bắt buộc phải dùng so sánh thời gian cố định (`compare_digest`) thay vì dùng toán tử `==` thông thường?
4. Cấu trúc Merkle-Damgård trong SHA-2 có ưu điểm gì và dễ bị mắc lỗi Length Extension Attack ra sao?
5. Cấu trúc Sponge Construction trong SHA-3 (Keccak) khắc phục các hạn chế của SHA-2 thế nào?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Xây Dựng Trình Kiểm Tra Tính Toàn Vẹn Thư Mục (File Integrity Monitor)
Viết script Python quét qua toàn bộ các tệp trong một thư mục, lưu giá trị băm SHA-256 của từng tệp vào tệp JSON. Khi chạy lại, script phải phát hiện tệp nào đã bị sửa đổi, thêm mới hoặc xóa đi.

### Task 2: Mô Phỏng Tấn Công Birthday Attack Trên Hash Ngắn
Viết script Python tìm va chạm (Collision) cho một hàm băm SHA-256 bị cắt ngắn còn 24 bits (3 bytes) để đo số lần thử trung bình cần thiết.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết Hàm Băm & HMAC** | Giải thích sắc bén 3 tính chất hàm băm, Birthday Attack và lý do cần dùng HMAC. | Hiểu các khái niệm chính, giải thích được SHA-256 và HMAC. | Nắm được định nghĩa hàm băm nhưng nhầm lẫn HMAC với Hashing thường. | Nhầm lẫn Hashing với Encryption. |
| **Thực Hành Code Python** | Lập trình FIM và HMAC verification chuẩn xác, sử dụng `compare_digest` chống Timing Attack. | Code chạy đúng chức năng băm file và HMAC. | Code có lỗi đọc file lớn hoặc không tính đúng HMAC. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
