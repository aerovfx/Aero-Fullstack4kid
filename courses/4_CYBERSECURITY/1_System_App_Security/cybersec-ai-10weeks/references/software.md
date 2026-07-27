# Hướng Dẫn Cài Đặt Phần Mềm / Software Setup Guide

Khoá học này yêu cầu một số phần mềm chuyên dụng cho cả lập trình, phân tích mạng và chạy mô hình AI. Dưới đây là hướng dẫn cài đặt từng bước cho hệ thống của bạn.

---

## 💻 1. Môi Trường Ảo Hóa / Virtualization Environment
Để chạy Kali Linux an toàn, bạn nên sử dụng phần mềm ảo hóa.

- **Trên Windows / Linux**:
  - Tải và cài đặt **VMware Workstation Player** (Miễn phí) hoặc **VirtualBox** (Mã nguồn mở).
- **Trên macOS (Intel)**:
  - Tải và cài đặt **VirtualBox** hoặc **VMware Fusion**.
- **Trên macOS (Apple Silicon M1/M2/M3)**:
  - Tải và cài đặt **UTM** (Miễn phí) hoặc **VMware Fusion Tech Preview** để chạy máy ảo kiến trúc ARM.

---

## 🐲 2. Máy Ảo Kali Linux / Kali Linux Virtual Machine
1. Truy cập trang chủ [Kali Linux Downloads](https://www.kali.org/get-kali/).
2. Chọn mục **Virtual Machines** (Ảnh đĩa dựng sẵn cho VMware/VirtualBox) để tiết kiệm thời gian cài đặt.
3. Giải nén file tải về và mở trực tiếp bằng phần mềm ảo hóa của bạn.
4. Tài khoản đăng nhập mặc định:
   - **Username**: \`kali\`
   - **Password**: \`kali\`

---

## 🛠️ 3. Môi Trường Lập Trình Python & C++ / Programming Environment
- **VS Code**: Cài đặt Visual Studio Code từ trang chủ.
- **Extensions khuyên dùng**:
  - \`C/C++\` (by Microsoft)
  - \`Python\` (by Microsoft)
- **C++ Compiler**:
  - Trên Kali Linux, bộ biên dịch GCC đã được cài đặt sẵn. Kiểm tra bằng lệnh:
    ```bash
    g++ --version
    ```
  - Trên Windows: Cài đặt **MinGW-w64** qua MSYS2 và cấu hình biến môi trường Path.

---

## 🤖 4. Trí Tuệ Nhân Tạo Local (Ollama) / Local AI Environment
Để phân tích log và mã nguồn ngoại tuyến mà không sợ rò rỉ dữ liệu lên đám mây, chúng ta sẽ chạy LLM cục bộ bằng Ollama.

1. Tải Ollama tại [Ollama.com](https://ollama.com/).
2. Tiến hành cài đặt (Hỗ trợ macOS, Windows, và Linux).
3. Mở terminal/CMD và tải về mô hình **Llama 3** (hoặc **Mistral** cho máy cấu hình yếu):
   ```bash
   ollama run llama3:8b
   ```
   Hoặc:
   ```bash
   ollama run mistral
   ```
4. Kiểm tra xem API của Ollama có đang chạy hay không bằng cách truy cập: `http://localhost:11434` trên trình duyệt. Màn hình hiển thị "Ollama is running" nghĩa là thành công.
