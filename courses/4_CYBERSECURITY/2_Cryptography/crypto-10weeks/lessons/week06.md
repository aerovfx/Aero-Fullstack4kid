# Tuần 6: Đường Cong Elliptic (ECC) & Trao Đổi Khóa Diffie-Hellman (Elliptic Curve Cryptography & ECDH)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Hiểu nền tảng toán học của **Mật mã đường cong Elliptic (ECC - Elliptic Curve Cryptography)** và lý do ECC thay thế RSA trong thế giới hiện đại.
- Nắm vững bài toán Logarithm rời rạc trên đường cong Elliptic (**ECDLP - Elliptic Curve Discrete Logarithm Problem**).
- Phân tích giao thức **Trao đổi khóa Diffie-Hellman (DH)** và biến thể trên đường cong Elliptic (**ECDH**).
- Thấu hiểu khái niệm **Bảo mật chuyển tiếp (PFS - Perfect Forward Secrecy)** trong các giao thức mã hóa mạng (TLS 1.3, Signal, WireGuard).
- Thực hành lập trình Python trao đổi khóa ECDH bằng Curve25519 với thư viện `cryptography`.

### English
- Understand the mathematical foundations of **Elliptic Curve Cryptography (ECC)** and why ECC is replacing RSA in modern applications.
- Master the **Elliptic Curve Discrete Logarithm Problem (ECDLP)**.
- Analyze the **Diffie-Hellman Key Exchange (DH)** protocol and its elliptic curve variant (**ECDH**).
- Grasp the critical concept of **Perfect Forward Secrecy (PFS)** in network protocols (TLS 1.3, Signal, WireGuard).
- Practice Python programming for ECDH key exchange using Curve25519 with the `cryptography` library.

---

## Lý Thuyết / Theory

### 1. Tại Sao ECC Lại Vượt Trội Hơn RSA? / Why ECC Supersedes RSA

#### Tiếng Việt
RSA yêu cầu độ dài khóa ngày càng lớn để duy trì an toàn (2048 bits hoặc 4096 bits). Ngược lại, ECC đạt cùng độ an toàn với kích thước khóa nhỏ hơn rất nhiều:

| Độ an toàn (Security Level) | Độ dài khóa RSA | Độ dài khóa ECC (Curve25519 / secp256k1) |
| :--- | :--- | :--- |
| 128-bit (Tiêu chuẩn hiện tại) | 3072 bits | **256 bits** |
| 256-bit (Cực kỳ an toàn) | 15360 bits | **521 bits** |

**Ưu điểm của ECC:**
- Khóa ngắn hơn 12 lần -> Tiết kiệm băng thông mạng.
- Tốc độ tính toán nhanh hơn -> Ít tốn pin và RAM trên thiết bị di động / IoT.

---

### 2. Giao Thức Trao Đổi Khóa Diffie-Hellman (ECDH)

#### Tiếng Việt
Giao thức ECDH cho phép 2 bên (Alice và Bob) **tự tạo ra một Khóa bí mật chung (Shared Secret Key)** qua một kênh truyền công khai mà kẻ nghe lén (Eve) KHÔNG THỂ TÌM ĐƯỢC.

**Quy trình ECDH trên Curve25519:**
1. Alice chọn Private Key $a$ (số ngẫu nhiên 256-bit), tính Public Key $A = a \cdot G$ ($G$ là điểm gốc trên đường cong).
2. Bob chọn Private Key $b$, tính Public Key $B = b \cdot G$.
3. Alice và Bob trao đổi Public Key $A$ và $B$ công khai qua mạng.
4. Alice tính Khóa chung: $K_{\text{Alice}} = a \cdot B = a \cdot (b \cdot G) = (a \cdot b) \cdot G$.
5. Bob tính Khóa chung: $K_{\text{Bob}} = b \cdot A = b \cdot (a \cdot G) = (b \cdot a) \cdot G$.

Do $(a \cdot b) \cdot G = (b \cdot a) \cdot G$, Alice và Bob thu được **CHÍNH XÁC CÙNG MỘT KHÓA $K$**! Kẻ nghe lén chỉ có $A$ và $B$, không thể tìm được $a$ hay $b$ do bài toán ECDLP.

---

### 3. Tính Chất Bảo Mật Chuyển Tiếp (Perfect Forward Secrecy - PFS)

#### Tiếng Việt
> [!IMPORTANT]
> **PERFECT FORWARD SECRECY (PFS):**
> Nếu kẻ tấn công thu thập toàn bộ dữ liệu mã hóa trên đường truyền trong nhiều năm, sau đó đánh cắp được Private Key dài hạn của Server, kẻ tấn công **VẪN KHÔNG THỂ GIẢI MÃ** được các phiên làm việc trong quá khứ!
> PFS đạt được bằng cách sử dụng **ECDHE (Ephemeral ECDH)**: Sinh cặp khóa ECDH mới ngẫu nhiên cho MỖI PHIÊN LÀM VIỆC và hủy khóa ngay khi phiên kết thúc.

---

## Code Mẫu Thực Hành / Python Implementation

### Code 1: ECDH Key Exchange using Curve25519 in Python
```python
from cryptography.hazmat.primitives.asymmetric import x25519
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.hkdf import HKDF

def generate_ecdh_keypair():
    """Generates Curve25519 Private and Public Key pair."""
    private_key = x25519.X25519PrivateKey.generate()
    public_key = private_key.public_key()
    return private_key, public_key

def derive_shared_symmetric_key(private_key, peer_public_key) -> bytes:
    """Computes ECDH shared secret and derives 32-byte AES key using HKDF."""
    raw_shared_secret = private_key.exchange(peer_public_key)
    
    # Derive a 256-bit AES key using HKDF
    hkdf = HKDF(
        algorithm=hashes.SHA256(),
        length=32,
        salt=None,
        info=b'ECDH Key Exchange Session',
    )
    return hkdf.derive(raw_shared_secret)

if __name__ == "__main__":
    # Alice generates keypair
    alice_priv, alice_pub = generate_ecdh_keypair()
    
    # Bob generates keypair
    bob_priv, bob_pub = generate_ecdh_keypair()
    
    # Alice and Bob exchange Public Keys over insecure network...
    
    # Alice computes shared key using Bob's Public Key
    alice_shared_key = derive_shared_symmetric_key(alice_priv, bob_pub)
    
    # Bob computes shared key using Alice's Public Key
    bob_shared_key = derive_shared_symmetric_key(bob_priv, alice_pub)
    
    print(f"[+] Alice Shared Key (Hex): {alice_shared_key.hex()}")
    print(f"[+] Bob Shared Key   (Hex): {bob_shared_key.hex()}")
    print(f"[+] Keys Match Perfectly? : {alice_shared_key == bob_shared_key}")
```

---

## Câu Hỏi Thảo Luận / Discussion

1. Bài toán Logarithm rời rạc trên đường cong Elliptic (ECDLP) khác gì so với bài toán Logarithm rời rạc trên trường số nguyên thông thường?
2. Tại sao kích thước khóa 256-bit của ECC lại cung cấp độ an toàn tương đương khóa 3072-bit của RSA?
3. Nguyên lý hoạt động của PFS (Perfect Forward Secrecy) bảo vệ dữ liệu người dùng khỏi việc nghe lén đại trà (Mass Surveillance) thế nào?
4. Sự khác biệt giữa Curve25519 và secp256k1 (được Bitcoin sử dụng) là gì?
5. Tại sao không nên sử dụng trực tiếp kết quả ECDH raw secret làm khóa AES mà phải đi qua hàm HKDF?

---

## Bài Về Nhà & Lab / Homework

### Task 1: Mô Phỏng Bắt Tay ECDHE + AES-GCM
Viết chương trình Python mô phỏng cuộc hội thoại an toàn 2 chiều giữa Alice và Bob: Sinh khóa ECDH ngẫu nhiên, trao đổi khóa, tạo khóa phiên AES bằng HKDF, sau đó mã hóa và giải mã tin nhắn bằng AES-256-GCM.

### Task 2: So Sánh Tốc Độ Sinh Khóa RSA vs ECC
Viết script Python đo thời gian sinh khóa RSA 3072-bit và thời gian sinh khóa Curve25519 (100 lần lặp) để so sánh hiệu năng.

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Lý Thuyết ECC & ECDH** | Giải thích sâu sắc toán học ECC, trao đổi khóa ECDH, HKDF và ý nghĩa của Perfect Forward Secrecy. | Hiểu quy trình trao đổi khóa ECDH và ưu điểm của ECC so với RSA. | Nắm được định nghĩa ECDH nhưng chưa giải thích được PFS. | Nhầm lẫn trao đổi khóa với mã hóa đối xứng. |
| **Thực Hành Code Python** | Lập trình ECDH với Curve25519 và HKDF chuẩn xác, kết hợp AES-GCM mượt mà. | Code trao đổi khóa ECDH chạy đúng và xác nhận 2 khóa trùng khớp. | Code có lỗi chuyển đổi kiểu dữ liệu Public Key. | Không chạy được mã nguồn Python. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - Cryptography 10 Weeks)*
