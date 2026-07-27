# Hướng Dẫn Cài Đặt Phần Mềm / Software Installation & Setup Guide

Tài liệu này hướng dẫn thiết lập môi trường phát triển trên máy tính cá nhân.

---

## 🛠️ Danh Sách Phần Mềm Bắt Buộc

1. **Python 3.10+**:
   - Tải về tại: https://www.python.org/
   - Cài đặt các thư viện cần thiết:
     ```bash
     pip install scapy requests bcrypt pandas scikit-learn matplotlib colorama
     ```

2. **C++ Compiler (GCC / Clang)**:
   - **macOS**: Cài đặt Xcode Command Line Tools (`xcode-select --install`).
   - **Linux**: `sudo apt update && sudo apt install build-essential gdb`
   - **Windows**: Cài đặt MinGW-w64 hoặc Visual Studio Community.

3. **Kali Linux Virtual Machine**:
   - Tải VMware Workstation Player hoặc Oracle VirtualBox.
   - Tải Kali Linux Pre-built VM tại: https://www.kali.org/get-kali/#kali-virtual-machines

4. **Wireshark**:
   - Tải về tại: https://www.wireshark.org/download.html

5. **VS Code**:
   - Tải về tại: https://code.visualstudio.com/
   - Extensions khuyên dùng: C/C++, Python, Markdown Preview Enhanced.
