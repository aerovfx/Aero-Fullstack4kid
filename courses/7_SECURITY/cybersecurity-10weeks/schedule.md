# Lịch Trình Chi Tiết 10 Tuần Bảo Mật / 10-Week Cybersecurity Schedule

---

## 🗓️ Lịch Trình Chi Tiết / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks |
|-------------|----------------|-----------------------|-----------------------------------|
| **Tuần 1** | Buổi 1 | Giới thiệu An toàn thông tin & CIA Triad | Cài đặt phần mềm ảo hóa VirtualBox và download ISO Kali Linux |
| | Buổi 2 | Thiết lập phòng Lab Kali Linux & Cấu hình mạng Host-only | Cấu hình máy ảo Kali Linux và Windows Server giao tiếp nội bộ |
| **Tuần 2** | Buổi 3 | Quản trị dòng lệnh Linux (Linux CLI Basics) | Thực hành các lệnh duyệt file, phân quyền chmod/chown trên Kali |
| | Buổi 4 | Lập trình kịch bản Bash (Bash scripting) cơ bản | Viết script Bash tự động cập nhật hệ thống và quét IP local |
| **Tuần 3** | Buổi 5 | Nguyên lý hoạt động TCP/IP & Giao thức mạng cơ bản | Tìm hiểu cấu trúc header của các gói tin IP, TCP, UDP |
| | Buổi 6 | Dò quét cổng mạng với Nmap (Network Discovery)| Viết các lệnh quét cổng mở, phiên bản dịch vụ dịch vụ bằng Nmap |
| **Tuần 4** | Buổi 7 | Chặn bắt lưu lượng mạng thông qua Wireshark | Cấu hình card mạng ở chế độ Promiscuous và bắt gói tin |
| | Buổi 8 | Lọc gói tin (Display Filters) nâng cao trong Wireshark | Tìm kiếm mật khẩu gửi qua giao thức không mã hóa (HTTP, FTP) |
| **Tuần 5** | Buổi 9 | Cơ bản về Mật mã học (Cryptography) | Tìm hiểu mã hóa đối xứng (AES) và bất đối xứng (RSA) |
| | Buổi 10 | Các thuật toán băm (Hashing) và muối (Salting) | Phân biệt MD5, SHA-1, SHA-256 và cơ chế bảo mật của muối |
| **Tuần 6** | Buổi 11 | Giới thiệu công cụ phục hồi mật khẩu Hashcat | Tìm hiểu cơ chế bẻ khóa bằng từ điển (Dictionary attack) |
| | Buổi 12 | Thực hành bẻ khóa mã băm mật khẩu MD5/SHA256 | Chạy lệnh Hashcat bẻ khóa mật khẩu MD5 đơn giản dùng wordlist |
| **Tuần 7** | Buổi 13 | Lý thuyết về Mạng không dây Wi-Fi (802.11) | Tìm hiểu cấu trúc bắt tay 4 bước (4-Way Handshake) của WPA2 |
| | Buổi 14 | Kiểm toán Wi-Fi sử dụng Aircrack-ng | Giả lập bắt gói tin handshake và chạy từ điển bẻ khóa Wi-Fi |
| **Tuần 8** | Buổi 15 | Bảo mật Web: Các lỗ hổng bảo mật OWASP Top 10 | Phân tích cơ chế tấn công SQL Injection và Cross-Site Scripting |
| | Buổi 16 | Thực hành khai thác lỗi SQL Injection trong phòng Lab | Sử dụng DVWA để khai thác lấy dữ liệu từ bảng database ảo |
| **Tuần 9** | Buổi 17 | Giới thiệu Metasploit Framework | Tìm hiểu cấu trúc exploit, payload, auxiliary và encoder |
| | Buổi 18 | Thử nghiệm kiểm thử xâm nhập hệ thống Windows/Linux | Khai báo các option RHOSTS, LHOST và chạy lệnh exploit |
| **Tuần 10**| Buổi 19 | Lập trình an toàn (Secure Coding Principles) | Khắc phục các lỗi Buffer Overflow và SQLi trực tiếp trong code |
| | Buổi 20 | Triển khai Hệ thống Phát hiện xâm nhập Snort IDS | Viết luật Snort phát hiện hành vi quét cổng Nmap vào server |

---

## 🎯 Checklist Sản Phẩm Đầu Ra / Weekly Deliverables

- [ ] **Tuần 1**: Máy ảo Kali Linux hoạt động mượt mà, kết nối được internet.
- [ ] **Tuần 2**: Script Bash tự động hiển thị thông tin cấu hình mạng của máy.
- [ ] **Tuần 3**: Báo cáo danh sách 5 cổng dịch vụ mở trên máy ảo mục tiêu.
- [ ] **Tuần 4**: File chụp .pcap chứa gói tin HTTP POST chứa thông tin đăng nhập.
- [ ] **Tuần 5**: Chương trình Python mã hóa và giải mã file dùng thư viện AES.
- [ ] **Tuần 6**: Khôi phục thành công mật khẩu gốc của 3 mã băm SHA-256 mẫu.
- [ ] **Tuần 7**: File bắt tay WPA2 handshake .cap thu giữ từ router thử nghiệm.
- [ ] **Tuần 8**: Câu lệnh SQL Injection lấy ra thành công phiên bản database.
- [ ] **Tuần 9**: Kết nối shell (meterpreter) điều khiển thành công máy ảo thử nghiệm.
- [ ] **Tuần 10**: Luật Snort kích hoạt cảnh báo email/log mỗi khi có ping scan.
