# Khoá Học: Mật Mã Học Thực Chiến & Bảo Mật Dữ Liệu (10 Tuần) / Course: Applied Cryptography & Data Security (10 Weeks)

Chào mừng bạn đến với khoá học **Mật Mã Học Thực Chiến & Bảo Mật Dữ Liệu (10 Tuần)**. Chương trình đào tạo chuẩn STEM được thiết kế nhằm trang bị cho học viên nền tảng toán học mật mã vững chắc, các thuật toán mã hóa hiện đại (AES, RSA, ECC), hạ tầng khóa công khai PKI/TLS, và kỹ năng lập trình phần mềm mã hóa đầu-cuối (E2EE) bằng Python và C++.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │     PHẦN 1: MÃ HÓA CỔ ĐIỂN & MÃ HÓA ĐỐI XỨNG (W1-W5)   │
                                    │     PART 1: CLASSICAL & SYMMETRIC CRYPTOGRAPHY         │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Mật mã cổ điển (Caesar, Vigenère) & Tần suất
                                         Tuần 2: Mã hóa khối đối xứng (AES-128/256, ECB vs CBC)
                                         Tuần 3: Mã hóa dòng (ChaCha20) & CSPRNG Ngẫu nhiên
                                         Tuần 4: Hàm băm mật mã (SHA-256, SHA-3) & HMAC
                                         Tuần 5: Toán học mật mã & Mã hóa bất đối xứng RSA
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: ECC, PKI, BẮT TAY TLS & AI CRYPTO AUDIT(W6-W10)│
                                    │  PART 2: ECC, PKI, TLS HANDSHAKE & ADVANCED CRYPTO     │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 6: Đường cong Elliptic (ECC), Diffie-Hellman & ECDH
                                         Tuần 7: Chữ ký số (ECDSA/RSA), PKI & Bắt tay TLS/SSL
                                         Tuần 8: Băm mật khẩu (Bcrypt, Argon2id) & KDFs
                                         Tuần 9: Mật mã nâng cao (Zero-Knowledge Proofs & PQC)
                                         Tuần 10: Xây dựng hệ thống E2EE Messenger & Bảo vệ Capstone
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             BẢO VỆ DỰ ÁN CUỐI KHOÁ / DEMO DAY          │
                                    └──────────────────────────┬─────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks/references/components.md) | Danh sách thiết bị phần cứng (YubiKey, HSM Kit) & Công cụ với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks/references/software.md) | Setup OpenSSL, GnuPG, Python `cryptography`, PyCryptodome, C++ OpenSSL |
| [An Toàn & Đạo Đức / Safety & Ethics](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks/references/safety.md) | Quy tắc an toàn thông tin, bảo vệ khóa riêng tư (Private Key) |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |

---

## 📦 Danh Mục Thiết Bị & Công Cụ (BOM) / Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| YubiKey 5 NFC Hardware Key| Hỗ trợ FIDO2, WebAuthn, PGP, Smart Card RSA/ECC | 1 | 1,400,000 VNĐ | Yubico VN / Shopee |
| USB Live Encrypted Drive | USB 3.0 32GB (Mã hóa phần cứng XTS-AES 256-bit) | 1 | 450,000 VNĐ | Tiki / Phong Vũ |
| Smart Card Reader USB    | Đầu đọc thẻ thông minh ISO 7816 hỗ trợ PKI Card | 1 | 180,000 VNĐ | Shopee / Lazada |

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Linux (Ubuntu/Kali) & Windows/macOS.
- **Ngôn ngữ lập trình**: Python 3.10+ & C++ (GCC/G++ 11+).
- **Thư viện mật mã chuẩn**:
  - Python: `cryptography`, `pycryptodome`, `hashlib`, `hmac`, `bcrypt`.
  - C++: OpenSSL libcrypto (`<openssl/evp.h>`, `<openssl/rsa.h>`).
- **Công cụ CLI**: OpenSSL, GnuPG (GPG), Keytool.

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết Toán mật mã**: 30%
- **Thực hành Lab Mã hóa/Giải mã**: 40%
- **Lập trình ứng dụng Mật mã thực chiến**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập & Thực hành Lab tuần học**: 40%
- **Mã nguồn ứng dụng Mật mã cá nhân / GitHub**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Báo cáo, Mã nguồn E2EE và Demo Day).
