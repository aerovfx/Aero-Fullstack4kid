# Khoá Học: Ethical Hacking & Pentesting Thực Chiến (CEH v12 & CompTIA Security+ Aligned)

Chào mừng bạn đến với khoá học **Ethical Hacking & Pentesting Thực Chiến (10 Tuần)**. Chương trình đào tạo chuẩn STEM được thiết kế bám sát theo khung kỹ năng của chứng chỉ quốc tế **Certified Ethical Hacker (CEH v12)** và **CompTIA Security+**, kết hợp giữa lý thuyết an ninh mạng chuẩn mực và các bài lab thực hành phòng thủ an toàn trên môi trường máy ảo cách ly (Local Sandbox).

---

## 🗺️ Bản Đồ Lộ Trình CEH v12 Aligned / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 1: TRINH SÁT, THĂM DÒ & BẢO MẬT HỆ THỐNG (W1-W5) │
                                    │  PART 1: RECONNAISSANCE, SCANNING & SYSTEM SECURITY    │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1: Footprinting, OSINT & Quy tắc Đạo đức CEH
                                         Tuần 2: Quét Mạng & Kỹ thuật Nmap (Scanning Networks)
                                         Tuần 3: System Security, C/C++ Pointers & Memory Layout
                                         Tuần 4: Đa luồng, Buffer Overflow Defense & Malware Concept
                                         Tuần 5: Network Sniffing, Wireshark & ARP Spoof Detection
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │  PHẦN 2: BẢO MẬT WEB, MÃ HÓA & AI SOC OPERATIONS(W6-W10)│
                                    │  PART 2: WEB SECURITY, CRYPTOGRAPHY & AI SOC OPERATOR  │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 6: Social Engineering & Phishing Email Analysis
                                         Tuần 7: Web Application Security & OWASP Top 10 Audit
                                         Tuần 8: Cryptography, Bcrypt Hashing & Wi-Fi Security
                                         Tuần 9: AI Threat Hunting & SAST Code Review
                                         Tuần 10: SOC Operations, Incident Response & Capstone Day
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
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết bám sát CEH v12 Modules và Checklist đầu ra |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/components.md) | Danh sách thiết bị phần cứng & công cụ phòng lab với giá VNĐ |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/software.md) | Setup Kali Linux, Metasploitable, Wireshark, VS Code, Python |
| [An Toàn & Đạo Đức / Safety & Ethics](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/references/safety.md) | Quy định an toàn Pentesting, CEH Code of Ethics và Luật An ninh mạng |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/projects/final_project.md) | 3 Hướng đề tài tốt nghiệp Capstone và Rubric 100 điểm |
| [Google Colab Notebooks](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/1_System_App_Security/cybersecurity-10weeks/notebooks/cybersecurity_10weeks_colab.ipynb) | [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/) Notebook thực hành trực tiếp trên trình duyệt / Mobile |

---

## 📦 Danh Mục Thiết Bị Phòng Lab (BOM) / Hardware Bill of Materials

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| USB Wi-Fi Monitor Card   | Chipset RT3070 hoặc AR9271 (Hỗ trợ Monitor Mode & Packet Injection) | 1 | 250,000 VNĐ | Shopee / Lazada |
| Raspberry Pi 4 Model B   | RAM 4GB (Dùng làm máy chủ mục tiêu DVWA/Metasploitable giả lập) | 1 | 1,500,000 VNĐ | Raspberry Pi VN / Shopee |
| USB Live Flash Drive 32GB| USB 3.0 High Speed (Chạy Kali Linux 2024 Persistent Live) | 1 | 120,000 VNĐ | Tiki / Phong Vũ |

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Kali Linux (VMware / VirtualBox) & Windows / macOS Host.
- **Ngôn ngữ lập trình**: Python 3.10+ và C++ (GCC/G++ 11+).
- **Công cụ CEH Standard**: Nmap, Wireshark, Scapy, Hashcat, Aircrack-ng, Burp Suite Community, OWASP ZAP.
- **Mô hình AI Security**: Ollama (chạy local Llama 3) & APIs (Gemini/OpenAI).

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết CEH/Security+**: 30%
- **Thực hành Lab thực chiến**: 40%
- **Lập trình công cụ tự động hóa bảo mật**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Bài tập & thực hành Lab tuần học**: 40%
- **Mã nguồn công cụ cá nhân / GitHub repo**: 20%
- **Dự án cuối khoá (Capstone Project)**: 40% (Bao gồm Báo cáo Pentest Report, Code và Demo Day).
