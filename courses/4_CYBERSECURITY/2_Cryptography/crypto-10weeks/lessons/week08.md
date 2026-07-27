# Tuần 8: Băm Mật Khẩu & Các Hàm Dẫn Xuất Khóa KDFs (Password Hashing & Key Derivation Functions)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững rủi ro của việc lưu trữ mật khẩu ở dạng văn bản rõ (Plaintext) hoặc hàm băm thông thường (SHA-256).
- Hiểu sâu các kỹ thuật phòng thủ: **Salting** (chống Rainbow Table) và **Peppering** (chống rò rỉ CSDL).
- Phân tích nguyên lý của các **Hàm dẫn xuất khóa (Key Derivation Functions - KDFs)** được thiết kế cố tình chạy chậm để chống tấn công phần cứng GPU/ASIC.
- So sánh các thuật toán băm mật khẩu hàng đầu: **PBKDF2, Bcrypt, và Argon2id** (Quán quân Password Hashing Competition).
- Thực hành lập trình Python xây dựng hệ thống xác thực người dùng an toàn bằng `argon2-cffi` và `bcrypt`.

### English
- Master the security risks of storing passwords in plaintext or simple hash functions (like SHA-256).
- Deeply understand defensive techniques: **Salting** (defeating Rainbow Tables) and **Peppering** (mitigating database leaks).
- Analyze **Key Derivation Functions (KDFs)** engineered to be computationally expensive to resist GPU/ASIC hardware cracking.
- Compare leading password hashing algorithms: **PBKDF2, Bcrypt, and Argon2id** (Winner of the Password Hashing Competition).
- Practice Python programming to build a secure user authentication system using `argon2-cffi` and `bcrypt`.

---

## Lý Thuyết / Theory

### 1. Thảm Họa Khi Lưu Mật Khẩu Bằng SHA-256 & Bảng Rainbow

#### Tiếng Việt
SHA-256 được thiết kế để **CHẠY RẤT NHANH** (hàng tỷ phép băm/giây trên Card đồ họa GPU). Nếu lưu mật khẩu bằng `SHA-256(password)`:
- Kẻ tấn công có thể chạy tấn công vét cạn (Brute-force) thử hàng tỷ mật khẩu/giây trên một GPU thương mại.
- **Rainbow Tables:** Bảng tra cứu tính toán sẵn mã băm của hàng trăm triệu mật khẩu thông dụng.

**Giải Pháp: Salting & Peppering**
- **Salt (Muối):** Chuỗi ký tự ngẫu nhiên duy nhất cho từng người dùng, lưu công khai trong CSDL cùng với Hash. Làm cho mã băm của 2 người dùng có cùng mật khẩu trở nên hoàn toàn khác nhau, vô hiệu hóa Rainbow Table.
- **Pepper (Tiêu):** Chuỗi bí mật lưu trong biến môi trường máy chủ ứng dụng (không lưu trong CSDL).

---

### 2. Các Thuật Toán Băm Mật Khẩu Chuyên Dụng (KDFs)

#### Tiếng Việt
Để chống lại sức mạnh tính toán của GPU/ASIC, các KDFs giới thiệu các tham số cấu hình:
1. **PBKDF2 (Password-Based Key Derivation Function 2):**
   - Áp dụng lặp lại HMAC (ví dụ 600,000 lần) trên mật khẩu + salt.
   - ⚠️ Điểm yếu: Chỉ tốn CPU/Time, dễ bị tăng tốc bởi phần cứng GPU.

2. **Bcrypt:**
   - Dựa trên thuật toán mã hóa khối Blowfish. Có tham số Work Factor (thường từ 10 đến 14).
   - Tốn bộ nhớ RAM cố định (4KB), chống lại GPU tốt hơn PBKDF2.

3. **Argon2id (Chuẩn Mực Cao Nhất Hiện Tại):**
   - Quán quân cuộc thi Password Hashing Competition (PHC 2015).
   - Kết hợp Argon2d (chống tấn công GPU) và Argon2i (chống tấn công Side-channel).
   - Có 3 tham số cấu hình linh hoạt: **Time Cost** (số vòng lặp), **Memory Cost** (dung lượng RAM sử dụng, ví dụ 64MB), và **Parallelism** (số luồng CPU).

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: Argon2id Password Hashing & Verification in Python
```python
from argon2 import PasswordHasher
from argon2.exceptions import VerifyMismatchError, InvalidHashError

def create_secure_hasher():
    """Configures an Argon2id hasher with production-grade parameters."""
    return PasswordHasher(
        time_cost=3,        # 3 iterations
        memory_cost=65536,  # 64 MB RAM
        parallelism=4,      # 4 CPU threads
        hash_len=32,        # 32-byte hash
        salt_len=16         # 16-byte random salt
    )

def hash_user_password(ph: PasswordHasher, password: str) -> str:
    """Hashes password with Argon2id and automatic random salt."""
    return ph.hash(password)

def verify_user_password(ph: PasswordHasher, password: str, hashed_str: str) -> bool:
    """Verifies input password against stored Argon2id hash."""
    try:
        ph.verify(hashed_str, password)
        return True
    except VerifyMismatchError:
        return False
    except InvalidHashError:
        return False

if __name__ == "__main__":
    hasher = create_secure_hasher()
    user_pw = "SuperStrongPassword@2026!"
    
    argon2_hash = hash_user_password(hasher, user_pw)
    print(f"[+] Plaintext Password : {user_pw}")
    print(f"[+] Stored Argon2id Hash: {argon2_hash}")
    
    # Test valid verification
    valid = verify_user_password(hasher, "SuperStrongPassword@2026!", argon2_hash)
    print(f"[+] Verification Correct Password : {valid}")
    
    # Test wrong password
    invalid = verify_user_password(hasher, "WrongPassword!", argon2_hash)
    print(f"[+] Verification Wrong Password   : {invalid}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao hàm băm SHA-256 lại RẤT TỐT cho việc kiểm tra tính toàn vẹn tệp tin nhưng lại RẤT TỒI cho việc băm mật khẩu người dùng?
2. Sự khác biệt giữa Salt và Pepper là gì? Tại sao Salt phải lưu trong CSDL còn Pepper thì không?
3. Tính chất Memory-Hard trong Argon2id chống lại việc bẻ khóa mật khẩu bằng GPU/ASIC như thế nào?
4. Điều gì sẽ xảy ra nếu lập trình viên đặt tham số Memory Cost của Argon2id quá cao trên một máy chủ Web có 10,000 lượt đăng nhập/phút?
5. Tại sao không nên tự viết logic băm mật khẩu mà nên dùng thư viện chuẩn như `argon2-cffi` hoặc `bcrypt`?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Đo Thời Gian Bẻ Khóa Mật Khẩu SHA-256 vs Argon2id
Viết script Python đo thời gian thực hiện 10,000 phép băm mật khẩu giữa SHA-256 thuần túy và Argon2id để so sánh mức độ làm chậm tấn công vét cạn.

### Task 2: Xây Dựng Secure Auth Module Với Argon2id & Lockout
Cập nhật hệ thống xác thực người dùng từ Tuần 7, thay thế Bcrypt bằng Argon2id và bổ sung Pepper từ biến môi trường.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết Password Hashing & KDFs** | Giải thích sâu sắc lý do SHA-256 không an toàn cho mật khẩu, nguyên lý Salt/Pepper và 3 tham số của Argon2id. | Hiểu các khái niệm Salt, PBKDF2, Bcrypt và Argon2id. | Nắm được định nghĩa Salt nhưng chưa giải thích được tính chất Memory-Hard. | Nhầm lẫn băm mật khẩu với mã hóa đối xứng. |
| **Thực Hành Code Python** | Lập trình Argon2id chuẩn xác với `argon2-cffi`, xử lý ngoại lệ và cấu hình tham số production. | Code băm và xác thực Argon2id chạy đúng không lỗi. | Code có lỗi biên dịch hoặc thiếu thư viện `argon2-cffi`. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
