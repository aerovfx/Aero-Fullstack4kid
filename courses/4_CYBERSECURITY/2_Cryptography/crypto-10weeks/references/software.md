# Hướng Dẫn Cài Đặt Phần Mềm Mật Mã / Cryptography Software Setup Guide

---

## 🛠️ Danh Sách Thư Viện & Công Cụ Bắt Buộc

1. **Python Cryptography Libraries**:
   ```bash
   pip install cryptography pycryptodome bcrypt argon2-cffi requests
   ```

2. **OpenSSL CLI Tool**:
   - **Linux**: `sudo apt update && sudo apt install openssl libssl-dev`
   - **macOS**: `brew install openssl`
   - **Windows**: Tải OpenSSL Light Binary từ Shining Light Productions.

3. **GnuPG (GPG)**:
   - **Linux**: `sudo apt install gnupg`
   - **macOS**: `brew install gnupg`
   - **Windows**: Tải Gpg4win tại https://gpg4win.org/

4. **C++ OpenSSL Development**:
   - Biên dịch C++ với OpenSSL: `g++ main.cpp -lssl -lcrypto -o app`
