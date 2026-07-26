# Lịch Trình Chi Tiết 10 Tuần / 10-Week Detailed Schedule

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ). 

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Tổng quan & Thiết lập môi trường Python | Viết chương trình Client-Server Socket đơn giản | Cài đặt Python 3.10+ |
| | Buổi 2 | Lập trình Client-Server & Socket TCP/UDP nâng cao | Xây dựng công cụ TCP Port Scanner đơn giản | Đọc tài liệu RFC về TCP Handshake |
| **Tuần 2** | Buổi 3 | Giới thiệu Scapy & Cấu trúc gói tin mạng | Gửi các gói tin ICMP, TCP SYN thủ công bằng Scapy | Cài đặt Scapy (\`pip install scapy\`) |
| | Buổi 4 | Viết công cụ Packet Sniffer & ARP Spoofer | Chặn bắt traffic HTTP không mã hóa trong lab ảo | Đọc hiểu giao thức ARP Spoofing |
| **Tuần 3** | Buổi 5 | C++ Cơ bản cho lập trình hệ thống | Quản lý biến, cấu trúc điều khiển và mảng trong C++ | Cài đặt GCC/G++ Compiler |
| | Buổi 6 | Con trỏ (Pointers), Tham chiếu & Cấp phát bộ nhớ | Thao tác trực tiếp trên bộ nhớ Stack và Heap | Đọc hiểu cơ chế con trỏ C++ |
| **Tuần 4** | Buổi 7 | Đa luồng (Multi-threading) trong C++ | Viết trình quét cổng đa luồng hiệu năng cao bằng C++ | Thư viện C++ \`<thread>\` |
| | Buổi 8 | Lỗ hổng tràn bộ đệm (Buffer Overflow) | Khai thác và vá mã nguồn C++ có lỗi tràn bộ đệm | Học cách sử dụng debugger GDB cơ bản |
| **Tuần 5** | Buổi 9 | Cài đặt Kali Linux & Quản trị dòng lệnh cơ bản | Cấu hình mạng, quản lý service trên Kali | Cài đặt VMware/VirtualBox |
| | Buổi 10 | Quét mạng và Thăm dò lỗ hổng với Nmap | Quét lỗ hổng dịch vụ bằng Nmap Scripting Engine (NSE) | Đọc tài liệu hướng dẫn quét Nmap |
| **Tuần 6** | Buổi 11 | Phân tích gói tin với Wireshark | Sử dụng bộ lọc Wireshark để trích xuất file/log từ traffic | Cài đặt Wireshark trên máy Host/Kali |
| | Buổi 12 | Phân tích lưu lượng mã hóa & Phát hiện mã độc | Phân tích dấu hiệu nghi ngờ của mã độc giao tiếp C2 | Học về các kỹ thuật phát hiện quét mạng |
| **Tuần 7** | Buổi 13 | Khai thác hàm băm với Hashcat | Chạy Hashcat crack MD5, SHA-256 dùng wordlists & rules | Đọc hiểu cơ chế băm mật khẩu |
| | Buổi 14 | Kiểm thử bảo mật Wi-Fi với Aircrack-ng | Bắt gói tin bắt tay WPA2 và bẻ khóa offline | Chuẩn bị USB Wi-Fi Monitor Card |
| **Tuần 8** | Buổi 15 | Prompt Engineering cho AI trong Bảo mật | Viết System Prompts huấn luyện AI đóng vai trò Hacker mũ trắng | Tài khoản Gemini API hoặc OpenAI API |
| | Buổi 16 | Ứng dụng AI cho OSINT & Trinh sát mục tiêu | Sử dụng AI phân tích dữ liệu Shodan, WHOIS của mục tiêu | Đọc hiểu định dạng JSON từ Shodan |
| **Tuần 9** | Buổi 17 | AI Code Audit (Kiểm toán mã nguồn tự động) | Đưa code C++/Python lỗi vào AI phân tích theo OWASP Top 10 | Chuẩn bị mã nguồn C++ lỗi để test |
| | Buổi 18 | Phân tích Log lỗi máy chủ bằng AI | Dùng AI nhận diện dấu vết SQL Injection/XSS trong log web | Sưu tầm log access thô của Nginx/Apache |
| **Tuần 10**| Buổi 19 | Lập trình Tích hợp API OpenAI/Gemini/Ollama | Viết client Python kết nối API và xử lý dữ liệu cấu trúc | Cấu hình cài đặt local Ollama (Llama3) |
| | Buổi 20 | Hoàn thiện & Đóng gói 3 công cụ bảo mật AI | Đóng gói sản phẩm và chạy thực nghiệm trong phòng Lab | Viết tài liệu hướng dẫn sử dụng công cụ |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Script Python TCP Port Scanner đơn luồng hoạt động tốt.
- [ ] **Tuần 2**: Script Python ARP Spoofer giả lập chuyển tiếp gói tin thành công.
- [ ] **Tuần 3**: Chương trình C++ quản lý bộ nhớ động và thay đổi giá trị biến qua con trỏ.
- [ ] **Tuần 4**: Công cụ C++ TCP Scanner đa luồng có tốc độ quét nhanh gấp 10 lần bản đơn luồng.
- [ ] **Tuần 5**: Báo cáo kết quả quét dịch vụ (Nmap report) của một IP lab ảo.
- [ ] **Tuần 6**: File `.pcap` ghi lại quá trình đăng nhập HTTP và trích xuất thành công tài khoản dạng cleartext.
- [ ] **Tuần 7**: Lấy được mật khẩu gốc từ file băm SHA-256 cho trước bằng Hashcat.
- [ ] **Tuần 8**: Kịch bản System Prompt tối ưu cho AI để phân tích mã lỗi không bị từ chối do chính sách an toàn.
- [ ] **Tuần 9**: Script Python phát hiện tự động hành vi tấn công Web từ file log bằng AI.
- [ ] **Tuần 10**: Mã nguồn hoàn chỉnh của 3 công cụ bảo mật AI được đẩy lên GitHub cá nhân.
