# Quy Định An Toàn Mật Mã & Quản Lý Khóa / Cryptographic Safety & Key Management Rules

Mật mã học là lá chắn bảo vệ dữ liệu nhạy cảm. Việc áp dụng sai thuật toán hoặc quản lý khóa bất cẩn có thể dẫn đến rò rỉ thông tin nghiêm trọng.

---

## 🛑 Quy Tắc An Toàn Mật Mã Tuyệt Đối (Cryptographic Best Practices)

1. **KHÔNG BAO GIỜ TỰ TẠO THUẬT TOÁN MÃ HÓA RIÊNG (NEVER ROLL YOUR OWN CRYPTO)**:
   - Trong ứng dụng thực tế, luôn sử dụng các thư viện mật mã đã được kiểm toán (Audited Libraries) như PyCA `cryptography`, OpenSSL hoặc libsodium.
   - Các bài tập tự viết RSA / AES từ đầu trong khóa học **chỉ phục vụ mục đích hiểu bản chất toán học**, không được dùng trực tiếp cho sản phẩm thực tế.

2. **BẢO VỆ KHÓA BÍ MẬT (PRIVATE KEY SECURITY)**:
   - Tuyệt đối không commit Private Keys, Passphrases hoặc API Keys lên GitHub public.
   - Sử dụng tệp `.env` hoặc hệ thống quản lý khóa (KMS / Hardware Security Module).

3. **KHÔNG REUSE NONCE / IV (NEVER REUSE NONCES)**:
   - Việc tái sử dụng Nonce/IV trong các chế độ mã hóa như AES-GCM hoặc ChaCha20 sẽ làm lộ toàn bộ văn bản rõ (Plaintext).
