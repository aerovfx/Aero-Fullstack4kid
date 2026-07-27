# Quy Định An Toàn & Đạo Đức Pentesting / Pentesting Ethics & Safety Guidelines

An ninh mạng là một lĩnh vực có tính chất nhạy cảm. Học viên bắt buộc phải tuân thủ nghiêm ngặt các quy định an toàn và đạo đức nghề nghiệp dưới đây trong suốt quá trình học tập.

---

## 🛑 Quy Tắc An Toàn Tuyệt Đối (Red Lines)

1. **CHỈ THỰC HÀNH TRÊN LOCALHOST (`127.0.0.1`) HOẶC MÁY ẢO CỦA BẠN**:
   - Tất cả mã nguồn Python (Socket, Scapy, Port Scanner) và C++ được viết trong khóa học **chỉ được phép hướng đến địa chỉ `127.0.0.1`**.
   - Tuyệt đối không thử nghiệm quét IP của trường học, công ty hoặc trang web công cộng khi chưa được cấp phép bằng văn bản.

2. **KHÔNG PHÁT HÀNH MÃ ĐỘC VÀ KHÔNG KHAI THÁC TRÁI PHÉP**:
   - Tất cả các kỹ thuật được học đều phục vụ mục đích **Phòng thủ (Blue Team)** và **Kiểm toán an toàn (Security Auditing)**.
   - Bất kỳ hành vi cố ý tấn công hoặc làm gián đoạn dịch vụ hệ thống khác sẽ dẫn đến việc đình chỉ học tập ngay lập tức.

3. **BẢO MẬT KHÓA API & DỮ LIỆU NHẠY CẢM**:
   - Không commit các API Keys (Shodan, OpenAI, Gemini) hoặc thông tin cá nhân lên GitHub public. Sử dụng biến môi trường (`.env`).
