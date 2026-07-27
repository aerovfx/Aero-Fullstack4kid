# Tuần 5: Lý Thuyết Số & Mã Hóa Bất Đối Xứng RSA (Number Theory & RSA Cryptography)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững nền tảng Lý thuyết số phục vụ Mật mã học: Đồng dư (Modular Arithmetic), Ước số chung lớn nhất (GCD), Thuật toán Euclid mở rộng (Extended Euclidean Algorithm), và Phi hàm Euler $\phi(n)$.
- Hiểu nguyên lý toán học của hệ mật mã bất đối xứng **RSA (Rivest-Shamir-Adleman)**.
- Nắm vững quy trình Sinh cặp khóa RSA (Public Key & Private Key), Mã hóa và Giải mã.
- Phân tích rủi ro của RSA khi mã hóa không đệm (Raw / Textbook RSA) và tầm quan trọng của các chuẩn đệm an toàn như **OAEP (Optimal Asymmetric Encryption Padding)**.
- Thực hành lập trình Python xây dựng thuật toán RSA từ đầu bằng phép tính số nguyên lớn và sử dụng thư viện `cryptography` để mã hóa chuẩn.

### English
- Master foundational Number Theory for Cryptography: Modular Arithmetic, Greatest Common Divisor (GCD), Extended Euclidean Algorithm, and Euler's Totient Function $\phi(n)$.
- Understand the mathematical inner workings of the **RSA** asymmetric cryptosystem.
- Master the RSA Key Generation process (Public & Private Keys), Encryption, and Decryption.
- Analyze vulnerabilities of Raw / Textbook RSA and the critical need for padding schemes like **OAEP**.
- Practice Python programming to implement RSA from scratch and use the `cryptography` library for production-grade RSA encryption.

---

## Lý Thuyết / Theory

### 1. Nền Tảng Toán Học Của RSA / Mathematical Foundations

#### Tiếng Việt
Khác với Mật mã đối xứng dùng 1 khóa duy nhất, **Mật mã bất đối xứng (Asymmetric Cryptography)** sử dụng một **Cặp khóa (Key Pair)**:
- **Public Key ($e, n$):** Công khai cho tất cả mọi người dùng để Mã hóa.
- **Private Key ($d, n$):** Giữ bí mật tuyệt đối dùng để Giải mã.

**Quy trình Toán học Sinh Khóa RSA:**
1. Chọn 2 số nguyên tố cực lớn $p$ và $q$ ($p \neq q$).
2. Tính $n = p \times q$ (Module n).
3. Tính Phi hàm Euler: $\phi(n) = (p - 1)(q - 1)$.
4. Chọn số nguyên $e$ sao cho $1 < e < \phi(n)$ và $\gcd(e, \phi(n)) = 1$ (Thường chọn $e = 65537$).
5. Tính nghịch đảo nhân đồng dư $d$:
   $$d \equiv e^{-1} \pmod{\phi(n)} \iff (d \times e) \equiv 1 \pmod{\phi(n)}$$

**Công thức Mã hóa và Giải mã:**
- **Mã hóa:** $C \equiv M^e \pmod n$
- **Giải mã:** $M \equiv C^d \pmod n$

---

### 2. Nguyên Lý An Toàn & Lỗi Textbook RSA

#### Tiếng Việt
Độ an toàn của RSA dựa trên **Bài toán Phân tích Số Nguyên Lớn (Integer Factorization Problem)**:
Từ $n = p \times q$, nếu kẻ tấn công biết được $n$, cực kỳ khó để phân tích $n$ ngược lại thành $p$ và $q$ nếu $n$ đủ lớn (tối thiểu 2048 bits hoặc 4096 bits).

> [!WARNING]
> **THẢM HỌA CỦA TEXTBOOK RSA (RAW RSA):**
> Nếu không sử dụng Đệm (Padding), mã hóa $C = M^e \bmod n$ có tính chất nhân:
> $$E(M_1) \times E(M_2) \equiv (M_1^e \bmod n)(M_2^e \bmod n) \equiv (M_1 \times M_2)^e \bmod n \equiv E(M_1 \times M_2) \pmod n$$
> Kẻ tấn công có thể dễ dàng tạo ra các bản mã giả mạo!
> Do đó, bắt buộc phải sử dụng chuẩn đệm ngẫu nhiên **OAEP (Optimal Asymmetric Encryption Padding)** trong thực tế.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: RSA Key Generation & Encryption from Scratch
```python
import math

def extended_gcd(a: int, b: int):
    """Extended Euclidean Algorithm to find modular multiplicative inverse."""
    if a == 0:
        return b, 0, 1
    gcd, x1, y1 = extended_gcd(b % a, a)
    x = y1 - (b // a) * x1
    y = x1
    return gcd, x, y

def mod_inverse(e: int, phi: int) -> int:
    gcd, x, y = extended_gcd(e, phi)
    if gcd != 1:
        raise Exception("Modular inverse does not exist")
    return x % phi

def generate_rsa_keys(p: int, q: int):
    n = p * q
    phi = (p - 1) * (q - 1)
    e = 65537
    d = mod_inverse(e, phi)
    return (e, n), (d, n) # Public Key, Private Key

def rsa_encrypt(message_int: int, public_key: tuple) -> int:
    e, n = public_key
    return pow(message_int, e, n) # (M^e) % n

def rsa_decrypt(ciphertext_int: int, private_key: tuple) -> int:
    d, n = private_key
    return pow(ciphertext_int, d, n) # (C^d) % n

if __name__ == "__main__":
    # Small primes for demonstration only
    p = 61
    q = 53
    pub_key, priv_key = generate_rsa_keys(p, q)
    print(f"[+] Generated Public Key (e, n)  : {pub_key}")
    print(f"[+] Generated Private Key (d, n) : {priv_key}")
    
    msg_val = 42 # Integer message
    c = rsa_encrypt(msg_val, pub_key)
    m = rsa_decrypt(c, priv_key)
    
    print(f"[+] Original Message Integer : {msg_val}")
    print(f"[+] Encrypted Ciphertext     : {c}")
    print(f"[+] Decrypted Message        : {m}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Tại sao mã hóa bất đối ứng (RSA) lại chậm hơn mã hóa đối xứng (AES) hàng trăm lần? Trong thực tế người ta kết hợp 2 hệ mật này như thế nào (Hybrid Encryption)?
2. Bài toán phân tích số nguyên lớn (Integer Factorization) liên quan trực tiếp đến độ an toàn của RSA ra sao?
3. Tại sao chọn $e = 65537$ ($2^{16} + 1$) làm thành phần Public Exponent phổ biến nhất trong thực tế?
4. Đệm OAEP khắc phục các điểm yếu nào của Raw/Textbook RSA?
5. Máy tính lượng tử (Quantum Computer) sử dụng Thuật toán Shor sẽ đe dọa độ an toàn của RSA như thế nào?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Mã Hóa Kết Hợp Hybrid Encryption (RSA + AES)
Viết script Python mã hóa một file dung lượng lớn bằng AES-256-GCM với một Session Key ngẫu nhiên. Sau đó mã hóa Session Key này bằng RSA-OAEP 2048-bit.

### Task 2: Cài Đặt Thuật Toán Euclid Mở Rộng
Viết hàm Python tự tính nghịch đảo đồng dư cho các tham số số nguyên lớn $2048$-bit.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết Số & RSA** | Giải thích sâu sắc toán học RSA, Euclid mở rộng, nghịch đảo đồng dư và lý do cần OAEP. | Hiểu quy trình sinh khóa RSA và công thức mã hóa/giải mã. | Nắm được công thức RSA nhưng chưa giải thích được bài toán phân tích số nguyên. | Nhầm lẫn giữa RSA và AES. |
| **Thực Hành Code Python** | Lập trình RSA từ đầu và Hybrid Encryption (RSA+AES) chuẩn xác. | Code sinh khóa và mã hóa RSA chạy đúng với tham số nhỏ. | Code có lỗi tính toán số dư hoặc chưa xử lý được chuỗi văn bản. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
