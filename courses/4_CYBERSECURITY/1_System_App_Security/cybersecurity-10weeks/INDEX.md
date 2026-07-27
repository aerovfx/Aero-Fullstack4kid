# Khoá Học: Kỹ Thuật An Ninh Mạng & Lập Trình Bảo Mật (10 Tuần) / Course: Cybersecurity Engineering & Secure Programming (10 Weeks)

Chào mừng bạn đến với khoá học **Kỹ Thuật An Ninh Mạng & Lập Trình Bảo Mật (10 Tuần)**. Chương trình đào tạo chuẩn STEM được thiết kế dành cho học viên từ trình độ cơ bản đến nâng cao, kết hợp giữa lập trình hệ thống C/C++, tự động hóa bảo mật Python, kiểm toán hạ tầng Kali Linux, và kỹ thuật phòng thủ chiều sâu (Defense-in-Depth).

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │     PHẦN 1: AN NINH HỆ THỐNG & LẬP TRÌNH BẢO MẬT       │
                                    │     PART 1: SYSTEM SECURITY & SECURE PROGRAMMING       │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Mạng máy tính & Lập trình Socket Python
                                         Tuần 2: Quét cổng & Trinh sát mạng (Port Scanning)
                                         Tuần 3: Quản lý bộ nhớ C/C++ & Con trỏ (Pointers)
                                         Tuần 4: Đa luồng & Phòng chống Tràn bộ đệm (BOF)
                                         Tuần 5: Kiểm toán hệ thống với Kali Linux & Nmap
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │     PHẦN 2: PHÂN TÍCH LƯU LƯỢNG & MÃ HÓA NÂNG CAO      │
                                    │     PART 2: TRAFFIC ANALYSIS & ADVANCED CRYPTO         │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 6: Bắt & Phân tích gói tin với Wireshark/Scapy
                                         Tuần 7: Mã hóa mật khẩu, Bcrypt & Bảo mật Wi-Fi
                                         Tuần 8: Thu thập tình báo nguồn mở OSINT & Phân tích
                                         Tuần 9: Kiểm toán mã nguồn SAST & Phân tích Web Log
                                         Tuần 10: Xây dựng hệ thống SOC Alert & Báo cáo Capstone
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │             BẢO VỆ DỰ ÁN CUỐI KHOÁ / DEMO DAY          │
                                    └────────────────────────────────────────────────────────┘
```

---

## 🗂️ Danh Mục Tài Liệu / Document Index

| Tài liệu / Document | Mô tả / Description |
|---------------------|---------------------|
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/schedule.md) | Lịch trình 20 buổi học chi tiết và checklist sản phẩm đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/components.md) | Danh sách thiết bị phần cứng & công cụ phòng lab với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/software.md) | Hướng dẫn cài đặt Kali Linux, VS Code, GCC/G++ và Python libraries |
| [An Toàn & Đạo Đức / Safety & Ethics](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/safety.md) | Quy định an toàn thông tin, đạo đức Pentesting và pháp lý |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric đánh giá |

---

## 📦 Danh Mục Thiết Bị Phòng Lab (BOM) / Hardware Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| USB Wi-Fi Monitor Card   | Chipset RT3070 hoặc AR9271 (Monitor Mode & Packet Injection) | 1 | 250,000 VNĐ | Shopee / Lazada |
| Raspberry Pi 4 Model B   | RAM 4GB (Máy chủ mục tiêu thử nghiệm mạng nội bộ) | 1 | 1,500,000 VNĐ | Raspberry Pi VN / Shopee |
| USB Live Flash Drive 32GB| USB 3.0 High Speed (Chạy Kali Linux Live) | 1 | 120,000 VNĐ | Tiki / Phong Vũ |

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Kali Linux (VMware / VirtualBox / Live USB) & Windows / macOS Host.
- **Ngôn ngữ lập trình**: Python 3.10+ và C++ (GCC/G++ 11+).
- **Thư viện chính**:
  - Python: `socket`, `scapy`, `requests`, `threading`, `bcrypt`, `pandas`, `re`.
  - C++: `<thread>`, `<mutex>`, `<vector>`, `<cstring>`, `<iostream>`.

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết**: 30%
- **Thực hành Lab**: 40%
- **Lập trình công cụ tự động hóa**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập & thực hành tuần học**: 40%
- **Mã nguồn dự án cá nhân / GitHub repo**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Bao gồm code, báo cáo và Demo Day).
