# Tuần 9: Mật Mã Nâng Cao, Bằng Chứng Không Tiết Lộ & Mật Mã Hậu Lượng Tử (Advanced Crypto, ZKP & PQC)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Khám phá các xu hướng mật mã tiên tiến nhất hiện nay: **Bằng chứng Không Tiết lộ (Zero-Knowledge Proofs - ZKP)**, **Mã hóa Đồng hình (Homomorphic Encryption)** và **Mật mã Hậu Lượng tử (Post-Quantum Cryptography - PQC)**.
- Hiểu nguyên lý toán học của ZKP: Chứng minh cho một bên khác biết rằng mình sở hữu một bí mật mà KHÔNG CẦN TIẾT LỘ bất kỳ thông tin nào về bí mật đó.
- Nắm vững mối đe dọa của Máy tính Lượng tử (Thuật toán Shor và Thuật toán Grover) đối với các hệ mật RSA, ECC và AES.
- Tìm hiểu các chuẩn thuật toán PQC mới được NIST phê duyệt (Kyber / ML-KEM cho mã hóa và Dilithium / ML-DSA cho chữ ký số) dựa trên **Bài toán Lưới (Lattice-based Cryptography)**.
- Thực hành lập trình Python mô phỏng giao thức ZKP đơn giản (Schnorr Identification Protocol concept).

### English
- Explore cutting-edge cryptographic paradigms: **Zero-Knowledge Proofs (ZKP)**, **Homomorphic Encryption (HE)**, and **Post-Quantum Cryptography (PQC)**.
- Master the fundamental principle of ZKP: Proving to another party that you know a secret WITHOUT REVEALING any information about the secret itself.
- Understand the quantum computing threat (Shor's and Grover's Algorithms) to RSA, ECC, and AES.
- Study NIST-standardized Post-Quantum Cryptography algorithms (Kyber/ML-KEM for encryption and Dilithium/ML-DSA for signatures) based on **Lattice-Based Cryptography**.
- Practice Python programming simulating a simple ZKP protocol (Schnorr Identification Protocol concept).

---

## Lý Thuyết / Theory

### 1. Bằng Chứng Không Tiết Lộ (Zero-Knowledge Proofs - ZKP)

#### Tiếng Việt
**Zero-Knowledge Proof (ZKP)** cho phép Người chứng minh (**Prover - Pegman**) thuyết phục Người xác minh (**Verifier - Victor**) rằng một tuyên bố là đúng mà không tiết lộ thêm bất kỳ thông tin nào khác.

Một giao thức ZKP hợp lệ phải thỏa mãn **3 điều kiện**:
1. **Completeness (Tính đầy đủ):** Nếu tuyên bố là đúng, Verifier chân chính sẽ bị thuyết phục bởi Prover chân chính.
2. **Soundness (Tính đúng đắn):** Nếu tuyên bố là sai, không Prover gian dối nào có thể thuyết phục được Verifier (ngoại trừ xác suất nhỏ vô cùng).
3. **Zero-Knowledge (Tính không tiết lộ):** Verifier không học được bất kỳ thông tin nào khác ngoài việc tuyên bố đó là đúng.

**Ứng dụng thực tế:** Xác thực mật khẩu không gửi password, tiền điện tử bảo mật danh tính (Zcash, zk-Rollups trên Ethereum), e-ID không tiết lộ ngày sinh.

---

### 2. Mật Mã Hậu Lượng Tử (Post-Quantum Cryptography - PQC)

#### Tiếng Việt
> [!WARNING]
> **THẢM HỌA LƯỢNG TỬ (QUANTUM APOCALYPSE):**
> Khi máy tính lượng tử đủ mạnh ra đời:
> - **Thuật toán Shor:** Giải bài toán phân tích số nguyên lớn và bài toán log rời rạc trong thời gian đa thức -> **Phá hủy hoàn toàn RSA, DSA, DH, ECDH, ECDSA!**
> - **Thuật toán Grover:** Rút ngắn thời gian vét cạn khóa đối xứng từ $N$ xuống $\sqrt{N}$ -> Giảm một nửa độ an toàn của AES (AES-128 chỉ còn độ an toàn 64-bit, AES-256 vẫn an toàn 128-bit).

**Giải Pháp PQC dựa trên Bài Toán Lưới (Lattice-based Cryptography):**
Các bài toán trên lưới nhiều chiều (như **Learning With Errors - LWE**) cực kỳ khó giải đối với cả máy tính cổ điển lẫn máy tính lượng tử.
NIST đã công bố các chuẩn PQC chính thức:
- **ML-KEM (CRYSTALS-Kyber):** Chuẩn trao đổi khóa bất đối ứng hậu lượng tử.
- **ML-DSA (CRYSTALS-Dilithium):** Chuẩn chữ ký số hậu lượng tử.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: Interactive Schnorr ZKP Protocol Simulation in Python
```python
import random

# Simplified Schnorr ZKP Protocol Concept over a prime field
def zkp_schnorr_demo():
    # Public Domain Parameters
    p = 2695139  # Large prime
    g = 2        # Generator
    
    # Prover (Alice) holds secret key x
    x = 123456   # Secret Key
    y = pow(g, x, p) # Public Key y = (g^x) mod p
    
    print("=== SCHNORR ZERO-KNOWLEDGE PROOF SIMULATION ===")
    print(f"[+] Prover Public Key (y) : {y}")
    print(f"[+] Prover Secret Key (x) : HIDDEN ({x})")
    
    # Step 1: Commitment by Prover
    r = random.randint(1, p - 2) # Secret random commitment
    t = pow(g, r, p)             # Public commitment
    print(f"\n1. Prover sends Commitment (t) = {t}")
    
    # Step 2: Challenge by Verifier
    c = random.randint(1, 1000)  # Random challenge
    print(f"2. Verifier sends Challenge (c)  = {c}")
    
    # Step 3: Response by Prover
    # s = r + c * x
    s = r + c * x
    print(f"3. Prover sends Response (s)    = {s}")
    
    # Step 4: Verification by Verifier
    # Verifier checks if (g^s) mod p == (t * (y^c)) mod p
    lhs = pow(g, s, p)
    rhs = (t * pow(y, c, p)) % p
    
    print(f"\n[+] Verifier LHS (g^s mod p)     : {lhs}")
    print(f"[+] Verifier RHS (t * y^c mod p) : {rhs}")
    print(f"[+] ZKP Verification Result      : {lhs == rhs}")

if __name__ == "__main__":
    zkp_schnorr_demo()
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Lấy ví dụ minh họa bằng lời (như hang động Alibaba) để giải thích cơ chế ZKP cho người không chuyên.
2. Thuật toán Shor trên máy tính lượng tử phá vỡ RSA và ECC dựa trên nguyên lý toán học nào?
3. Tại sao AES-256 vẫn được coi là an toàn trước máy tính lượng tử trong khi RSA-4096 bị sụp đổ hoàn toàn?
4. Bài toán Lưới (Lattice-Based Cryptography) khác biệt gì so với Bài toán Phân tích số nguyên lớn của RSA?
5. Mã hóa đồng hình hoàn toàn (Fully Homomorphic Encryption - FHE) cho phép thực hiện những tính toán gì trên dữ liệu đang bị mã hóa?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Nghiên Cứu Chuẩn PQC CRYSTALS-Kyber (ML-KEM)
Đọc tài liệu công bố chuẩn PQC của NIST và viết báo cáo tóm tắt (2 trang) về nguyên lý trao đổi khóa của ML-KEM.

### Task 2: Mô Phỏng ZKP Xác Thực Mật Khẩu
Viết script Python triển khai giao thức ZKP đơn giản cho phép Client chứng minh với Server rằng mình biết mật khẩu mà không cần gửi mật khẩu qua mạng.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết ZKP & PQC** | Giải thích sâu sắc 3 điều kiện ZKP, tác động của Thuật toán Shor/Grover và nguyên lý Mật mã Bài toán Lưới. | Hiểu khái niệm ZKP, nhận thức được mối đe dọa lượng tử tới RSA/ECC. | Nắm được định nghĩa ZKP nhưng chưa giải thích được PQC. | Nhầm lẫn ZKP với mã hóa thông thường. |
| **Thực Hành Code Python** | Lập trình giao thức Schnorr ZKP chuẩn xác, xác minh đẳng thức toán học mượt mà. | Code ZKP chạy đúng và trả về kết quả verification hợp lệ. | Code có lỗi tính toán số dư modulo. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
