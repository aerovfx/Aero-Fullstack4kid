# Hướng Dẫn Dự Án Tốt Nghiệp Capstone Mật Mã Học / Final Capstone Project Guide

Dự án tốt nghiệp chiếm **40% tổng số điểm** đánh giá toàn khóa. Học viên chọn 1 trong 3 đề tài (Tracks) dưới đây.

---

## 🧭 Track A: Hệ thống Trình Chat Mã Hóa Đầu-Cuối (End-to-End Encrypted E2EE Messenger)
Xây dựng ứng dụng Chat CLI/Web bằng Python sử dụng giao thức Signal-like protocol: Trao đổi khóa ECDH (Curve25519) + Mã hóa tin nhắn AES-256-GCM + Chữ ký số Ed25519 xác thực người dùng.

## 🤖 Track B: Trình Quản Lý Mật Khẩu Mã Hóa An Toàn (Secure Password Vault & KDF Manager)
Xây dựng công cụ Vault lưu trữ mật khẩu mã hóa cá nhân. Sử dụng Argon2id để dẫn xuất Master Key, mã hóa CSDL bằng AES-256-GCM, tự động phát hiện mật khẩu yếu và chống tấn công dò từ điển.

## 🚨 Track C: Hệ thống Cấp & Kiểm Tra Chứng Chỉ Số PKI/CA Tự Động (Automated PKI Authority)
Xây dựng hạ tầng khóa công khai PKI thu nhỏ bằng Python & OpenSSL API. Cho phép sinh Root CA, cấp phát chứng chỉ X.509 cho Web Server và kiểm tra thu hồi chứng chỉ (CRL / OCSP simulation).

---

## 🏆 Rubric Đánh Giá Capstone (100 Điểm)

| Tiêu Chí | Điểm | Chi Tiết Đánh Giá Mật Mã Học |
|---|---|---|
| **Đúng Thuật Toán (Crypto Correctness)** | 30 | Sử dụng đúng thuật toán (AES-GCM, ECDH, Bcrypt/Argon2id), không đè ngẫu nhiên, không reuse IV/Nonce. |
| **Chất Lượng Mã Nguồn (Code Quality)** | 30 | Cấu trúc code sạch, xử lý ngoại lệ tốt, quản lý khóa riêng tư an toàn, không hard-code secrets. |
| **Thực Hành Demo (Demo & Working App)** | 20 | Demo ứng dụng chạy mượt mà, mã hóa/giải mã chính xác. |
| **Báo Cáo An Toàn Mật Mã (Security Report)** | 20 | Báo cáo chi tiết sơ đồ luồng dữ liệu mật mã, phân tích lý do chọn thuật toán và đánh giá rủi ro. |
