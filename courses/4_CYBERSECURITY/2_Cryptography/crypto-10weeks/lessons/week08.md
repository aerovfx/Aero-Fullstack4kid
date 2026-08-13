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

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 8.1: Hệ Thống Xác Thực Mật Khẩu Sử Dụng Argon2id & Pepper
Viết class Python `SecureAuthManager` quản lý đăng ký và đăng nhập người dùng:
1. Nhận mật khẩu người dùng, kết hợp với Pepper bí mật đọc từ biến môi trường (`os.getenv("SECRET_PEPPER")`).
2. Băm mật khẩu bằng Argon2id với Salt ngẫu nhiên tự động (`time_cost=2, memory_cost=65536, parallelism=2`).
3. Lưu thông tin vào tệp JSON `users_db.json`.
4. Viết hàm `login(username, password)` xác thực tài khoản và khóa tài khoản khi nhập sai 5 lần liên tiếp.

- **Đầu ra kỳ vọng (Expected Output):** Đăng nhập đúng báo `[200 OK] Welcome!`. Đăng nhập sai 5 lần báo `[429 LOCKED] Account locked for 15 minutes!`.

#### Bài 8.2: So Sánh Tính Chất Độc Nhất Của Salt
Viết script Python băm 10 lần cùng một mật khẩu `"Password123"` với 10 Salt ngẫu nhiên khác nhau bằng Argon2id. In ra 10 chuỗi Hash thu được để chứng minh vĩnh viễn không trùng lặp (vô hiệu hóa Rainbow Table).

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 8.3: Đo Đoạc Tốc Độ Bẻ Khóa Vét Cạn (GPU Cracking Slowdown Benchmark)
Viết script Python `cracking_speed_benchmark.py`:
1. Thực hiện $100,000$ phép băm mật khẩu bằng `SHA-256` đơn thuần và đo tổng thời gian (ms).
2. Thực hiện $100$ phép băm mật khẩu bằng `Argon2id` và đo tổng thời gian (ms).
3. Quy đổi ra tốc độ số phép băm/giây và giải thích tại sao Argon2id làm chậm khả năng bẻ khóa của kẻ tấn công gấp hàng ngàn lần.

---

### 🔴 Phần C: Thực Hành Colab / Mini Project (Hands-on Colab Lab)

#### Bài 8.4: Tùy Chỉnh Tham Số Memory Cost & Parallelism Của Argon2id Trên Colab
Mở Google Colab notebook và thực hiện bài lab:
1. Thử nghiệm thay đổi tham số `memory_cost` từ `8MB`, `64MB` đến `512MB` và `time_cost` từ 1 đến 5.
2. Quản lý dung lượng bộ nhớ RAM tiêu tốn khi 10 luồng đồng thời thực hiện băm Argon2id.
3. Rút ra tham số tối ưu (Production Tuning Guidelines) cho máy chủ Web 4 Core RAM 8GB.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Phân Tích Thuật Toán** | Giải thích sâu sắc lý do SHA-256 không an toàn cho mật khẩu, nguyên lý Salt/Pepper và 3 tham số của Argon2id (Time, Memory, Parallelism). | Hiểu các khái niệm Salt, PBKDF2, Bcrypt và Argon2id. | Nắm được định nghĩa Salt nhưng chưa giải thích được tính chất Memory-Hard. | Nhầm lẫn băm mật khẩu với mã hóa đối xứng. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành đủ 4 bài (Argon2id auth manager, Salt uniqueness test, GPU cracking benchmark & Colab tuning lab). | Hoàn thành Bài 8.1 và Bài 8.2 chạy đúng không lỗi. | Code có lỗi biên dịch hoặc thiếu thư viện `argon2-cffi`. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.
