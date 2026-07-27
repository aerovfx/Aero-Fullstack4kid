# Lịch Trình Chi Tiết 10 Tuần / 10-Week Detailed Schedule

Chương trình học gồm 20 buổi (mỗi tuần 2 buổi, mỗi buổi 2.5 giờ).

---

## 🗓️ Lịch Trình Chi Tiết Các Buổi Học / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks | Chuẩn Bị / Preparation |
|-------------|----------------|-----------------------|-----------------------------------|------------------------|
| **Tuần 1** | Buổi 1 | Tổng quan Cybersec & Lập trình Socket Python | Tạo Server-Client Echo cơ bản trên Localhost | Cài đặt Python 3.10+ |
| | Buổi 2 | Lập trình Chat Server đa phiên & Bảo mật kết nối | Xây dựng Chat Server vòng lặp với kiểm tra IP | Đọc RFC về TCP Handshake |
| **Tuần 2** | Buổi 3 | Nguyên lý Quét Cổng & TCP Connect Scan | Lập trình Python Port Scanner đơn luồng & vòng lặp | Cấu hình máy ảo Local |
| | Buổi 4 | Quét Cổng đa luồng tốc độ cao & Auditor | Viết Fast Port Scanner với ThreadPoolExecutor | Đọc về TCP Flags (SYN/ACK) |
| **Tuần 3** | Buổi 5 | C++ Cơ bản, Biến & Địa chỉ bộ nhớ | Thao tác giải tham chiếu con trỏ và toán tử `*`, `&` | Cài đặt GCC/Clang Compiler |
| | Buổi 6 | Cấp phát bộ nhớ Stack vs Heap & Dangling Pointers | Viết chương trình quản lý bộ nhớ động và xử lý UAF | Đọc tài liệu Memory Management |
| **Tuần 4** | Buổi 7 | Đa luồng trong C++ (`<thread>` & `<mutex>`) | Lập trình đồng bộ luồng bằng `lock_guard` chống Race Condition | Học về RAII Pattern |
| | Buổi 8 | Nguyên lý Tràn Bộ Đệm (BOF) & Secure Coding | Refactor code C nguy hiểm sang C++ an toàn (`std::string`)| Cài đặt GDB Debugger |
| **Tuần 5** | Buổi 9 | Môi trường Kali Linux & Quản trị dòng lệnh | Thao tác CLI, quản lý service với `systemctl` | Cài đặt VMware/VirtualBox |
| | Buổi 10 | Kiểm toán hạ tầng với Nmap | Quét phiên bản dịch vụ và xuất báo cáo an ninh | Đọc Nmap Options Manual |
| **Tuần 6** | Buổi 11 | Bắt gói tin với Wireshark & Cấu trúc Header | Lọc lưu lượng HTTP/HTTPS/DNS bằng Display Filters | Cài đặt Wireshark |
| | Buổi 12 | Phân tích PCAP tự động với Scapy | Viết script Python đếm gói SYN để phát hiện Port Scan | Cài đặt `scapy` |
| **Tuần 7** | Buổi 13 | Cơ chế băm mật khẩu (Hashing, Salt & Pepper) | Mã hóa mật khẩu với `bcrypt` và chống Rainbow Table | Cài đặt `bcrypt` |
| | Buổi 14 | Phân tích bảo mật giao thức Wi-Fi (WPA2 vs WPA3)| Phân tích quá trình bắt tay 4-way Handshake | Đọc chuẩn WPA3 SAE |
| **Tuần 8** | Buổi 15 | Khái niệm OSINT & Thu thập thông tin công khai | Thu thập dữ liệu tên miền, DNS và Shodan API | Đăng ký Shodan API Free |
| | Buổi 16 | Prompt Engineering cho Threat Intelligence | Viết System Prompt trích xuất IOCs chuẩn JSON | Chuẩn bị Python OpenAI/Ollama |
| **Tuần 9** | Buổi 17 | Kiểm toán mã nguồn tĩnh (SAST Audit) | Viết script Python phát hiện SQL Injection & Hardcoded Keys | Ôn tập OWASP Top 10 |
| | Buổi 18 | Phân tích Web Log & Phát hiện tấn công | Parse log Nginx/Apache bằng Regex phát hiện XSS | Chuẩn bị mẫu file Log |
| **Tuần 10**| Buổi 19 | Tự động hóa SOC & Phân tích bất thường AI | Huấn luyện mô hình Isolation Forest phát hiện Anomaly | Cài đặt `scikit-learn` |
| | Buổi 20 | Bảo vệ Dự án Capstone & Vinh danh kết khóa | Thuyết trình 3 Tracks dự án và Demo sản phẩm | Hoàn thiện Slide & Report |

---

## 🎯 Checklist Sản Phẩm Đầu Ra Từng Tuần / Weekly Deliverables

- [ ] **Tuần 1**: Script Python Server-Client Chat bảo mật chạy trên `127.0.0.1`.
- [ ] **Tuần 2**: Công cụ Python Fast Port Scanner đa luồng có báo cáo dịch vụ.
- [ ] **Tuần 3**: Chương trình C++ minh họa con trỏ và xử lý an toàn lỗi Use-After-Free.
- [ ] **Tuần 4**: Chương trình C++ đa luồng an toàn chống Race Condition và Buffer Overflow.
- [ ] **Tuần 5**: Báo cáo kiểm toán Nmap trên Kali Linux.
- [ ] **Tuần 6**: Script Python Scapy phân tích file `.pcap` phát hiện SYN scan.
- [ ] **Tuần 7**: Hệ thống Auth Manager bằng Python mã hóa `bcrypt` có khóa tài khoản.
- [ ] **Tuần 8**: Script Python thu thập OSINT và định dạng JSON IOCs.
- [ ] **Tuần 9**: Công cụ Python quét mã nguồn tĩnh phát hiện lỗ hổng OWASP.
- [ ] **Tuần 10**: Mã nguồn dự án tốt nghiệp Capstone được đẩy lên GitHub cá nhân.
