# Lịch Trình Chi Tiết 10 Tuần (Mật Mã Học Thực Chiến)

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ).

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Lịch sử Mật mã & Mã hóa thế thế Caesar/Vigenère | Lập trình Python mã hóa và giải mã Caesar Cipher | Cài đặt Python 3.10+ |
| | Buổi 2 | Thống kê Tần suất (Frequency Analysis) & Phá mã | Viết script Python phân tích tần suất ký tự bẻ mã Vigenère | Đọc tài liệu Cryptanalysis |
| **Tuần 2** | Buổi 3 | Mã hóa khối đối xứng (Block Ciphers) & AES-128/256 | Lập trình AES-GCM & AES-CBC sử dụng `pycryptodome` | Cài đặt `pycryptodome` |
| | Buổi 4 | So sánh Chế độ hoạt động (ECB vs CBC vs GCM) | Mã hóa tệp ảnh bitmap để minh họa lỗ hổng ECB Mode | Đọc tài liệu NIST SP 800-38A |
| **Tuần 3** | Buổi 5 | Mã hóa dòng (Stream Ciphers) & ChaCha20 | Thực hành mã hóa dữ liệu tốc độ cao với ChaCha20-Poly1305 | Đọc RFC 7539 |
| | Buổi 6 | Ngẫu nhiên mật mã (CSPRNG vs PRNG) & Nonce reuse | Lập trình minh họa nguy cơ khi tái sử dụng Nonce/IV | Cài đặt thư viện `secrets` |
| **Tuần 4** | Buổi 7 | Hàm băm mật mã (Cryptographic Hash Functions) | Thực hành tính băm SHA-256, SHA-3 và kiểm tra tính toàn vẹn | Đọc RFC 6234 |
| | Buổi 8 | Mã xác thực thông điệp HMAC & Merkle Trees | Xây dựng hệ thống kiểm tra chữ ký thông điệp HMAC | Cài đặt `hashlib` & `hmac` |
| **Tuần 5** | Buổi 9 | Lý thuyết Số & Toán học mật mã (Modular Math & GCD) | Lập trình thuật toán Euclidian mở rộng & Tính số dư lớn | Ôn tập Đại số đồng dư |
| | Buổi 10 | Thuật toán mã hóa bất đối xứng RSA | Lập trình thuật toán RSA từ đầu (Sinh khóa $(e, d, n)$) | Đọc RFC 8017 (PKCS #1) |
| **Tuần 6** | Buổi 11 | Đường cong Elliptic (ECC) & Trao đổi khóa DH | Thực hành trao đổi khóa Diffie-Hellman & ECDH | Đọc tài liệu ECC Math |
| | Buổi 12 | Tính chất Bảo mật Chuyển tiếp (Perfect Forward Secrecy) | Lập trình mô phỏng bắt tay ECDHE sinh khóa phiên động | Cài đặt `cryptography` |
| **Tuần 7** | Buổi 13 | Chữ ký số (Digital Signatures: RSA & ECDSA) | Lập trình tạo và xác thực chữ ký số bằng Python | Đọc chuẩn FIPS 186-4 |
| | Buổi 14 | Hạ tầng Khóa công khai PKI & Chứng chỉ X.509 | Tạo Certificate Authority (CA) riêng & Cấp chứng chỉ SSL | Cài đặt OpenSSL CLI |
| **Tuần 8** | Buổi 15 | Cơ chế Băm mật khẩu (Password Hashing & Salting) | Lập trình hệ thống băm mật khẩu với Bcrypt và Salt | Cài đặt `bcrypt` |
| | Buổi 16 | Hàm dẫn xuất khóa KDFs (PBKDF2 & Argon2id) | Thực hành cấu hình Argon2id chống bẻ khóa GPU | Cài đặt `argon2-cffi` |
| **Tuần 9** | Buổi 17 | Bằng chứng Không Tiết lộ (Zero-Knowledge Proofs - ZKP) | Thực hành bài toán ZKP đơn giản (Schnorr Protocol concept) | Đọc tài liệu ZKP Intro |
| | Buổi 18 | Mật mã Hậu Lượng tử (Post-Quantum Cryptography - PQC) | Tìm hiểu chuẩn mã hóa PQC (Kyber/Dilithium) của NIST | Đọc NIST PQC Standards |
| **Tuần 10**| Buổi 19 | Xây dựng Ứng dụng Mã hóa Đầu-Cuối (E2EE Messenger) | Kết hợp ECDH + AES-GCM + Ed25519 tạo Chat E2EE | Hoàn thiện mã nguồn Python |
| | Buổi 20 | Bảo vệ Dự án Capstone & Demo Day | Thuyết trình sản phẩm và báo cáo đánh giá an toàn mật mã | Hoàn thiện Slide & Report |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Script Python mã hóa/phá mã Caesar và Vigenère bằng Thống kê tần suất.
- [ ] **Tuần 2**: Script Python mã hóa tệp bằng AES-256-GCM và bài lab minh họa lỗ hổng ECB Mode.
- [ ] **Tuần 3**: Module Python mã hóa dòng ChaCha20-Poly1305 và công cụ sinh số ngẫu nhiên CSPRNG.
- [ ] **Tuần 4**: Công cụ kiểm tra tính toàn vẹn tệp tin bằng SHA-256 & HMAC.
- [ ] **Tuần 5**: Module Python triển khai thuật toán RSA (Sinh khóa, Mã hóa, Giải mã).
- [ ] **Tuần 6**: Script Python mô phỏng trao đổi khóa ECDH tạo khóa phiên bí mật.
- [ ] **Tuần 7**: Hệ thống cấp và xác thực chứng chỉ số X.509 bằng OpenSSL CLI & Python.
- [ ] **Tuần 8**: Module xác thực người dùng sử dụng thuật toán Argon2id & Bcrypt.
- [ ] **Tuần 9**: Báo cáo phân tích chuẩn mã hóa Hậu lượng tử PQC (Kyber & Dilithium).
- [ ] **Tuần 10**: Mã nguồn hoàn chỉnh ứng dụng Chat E2EE hoặc Vault mã hóa hóa tệp đẩy lên GitHub.
