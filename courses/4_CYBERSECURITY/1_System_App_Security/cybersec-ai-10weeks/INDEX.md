# Khoá Học: An Ninh Mạng và Ứng Dụng AI Thế Hệ Mới / Course: Cybersecurity & Next-Gen AI Applications

Chào mừng bạn đến với khoá học **An ninh mạng & Ứng dụng AI thế hệ mới (10 Tuần)**. Khoá học này được thiết kế để đào tạo học viên từ lập trình hệ thống cấp thấp đến thực hành thăm dò hệ thống và xây dựng giải pháp an ninh tự động hóa bằng Trí tuệ Nhân tạo.

---

## 🗺️ Bản Đồ Lộ Trình Học Tập / Course Roadmap

```
                                    ┌────────────────────────────────────────────────────────┐
                                    │      PHẦN 1: LẬP TRÌNH HỆ THỐNG & KALI LINUX           │
                                    │      PART 1: SYSTEM PROGRAMMING & KALI LINUX           │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 1 - 2: Lập trình Python (Socket & Scapy)
                                         Tuần 3 - 4: C++ (Quản lý bộ nhớ & Đa luồng)
                                         Tuần 5: Kali Linux & Nmap Thăm dò mạng
                                                               │
                                                               ▼
                                    ┌────────────────────────────────────────────────────────┐
                                    │   PHẦN 2: THĂM DÒ NÂNG CAO & TÍCH HỢP AI TRONG BẢO MẬT │
                                    │   PART 2: ADVANCED RECON & AI IN SECURITY              │
                                    └──────────────────────────┬─────────────────────────────┘
                                                               │
                                         Tuần 6 - 7: Wireshark, Hashcat, Aircrack-ng
                                         Tuần 8 - 9: Prompt Engineering & AI Security
                                         Tuần 10: Xây dựng 3 công cụ bảo mật AI
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
| [Lịch Trình Học / Schedule](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersec-ai-10weeks/schedule.md) | Phân bổ 20 buổi học chi tiết và yêu cầu đầu ra / Detail schedule for 20 sessions and deliverables |
| [Thiết Bị Phòng Lab / Components Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersec-ai-10weeks/references/components.md) | Danh sách linh kiện lab thực hành (Wi-Fi Card, Pi...) / Hardware lab components shopping list |
| [Hướng Dẫn Phần Mềm / Software Guide](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersec-ai-10weeks/references/software.md) | Hướng dẫn cài đặt Kali Linux, VS Code, Ollama / Setup instructions for Kali, VS Code, Ollama |
| [An Toàn & Đạo Đức / Safety & Ethics](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersec-ai-10weeks/references/safety.md) | Quy tắc đạo đức nghề nghiệp và an toàn thông tin / Pentesting ethics rules and guidelines |
| [Dự Án Cuối Khoá / Final Projects](file:///Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersec-ai-10weeks/projects/final_project.md) | Danh sách 3 hướng dự án tốt nghiệp / 3 tracks of final projects |

---

## 📦 Danh Mục Thiết Bị Phòng Lab (BOM) / Hardware Bill of Materials

Để thực hành đầy đủ các phần của Kali Linux (đặc biệt là bẻ khóa Wi-Fi và thực hành quét mạng cục bộ), học viên nên tự trang bị phòng lab mini với danh mục sau:

| Tên Thiết Bị / Component | Thông Số Kỹ Thuật / Specification | SL / Qty | Giá Ước Tính / Est Price | Nơi Mua Đề Xuất / Suggested Source |
|--------------------------|-----------------------------------|----------|---------------------------|-------------------------------------|
| USB Wi-Fi Monitor Card   | Chipset RT3070 hoặc Atheros AR9271 (Hỗ trợ Monitor Mode & Packet Injection) | 1 | 250,000 VNĐ | Shopee / Lazada |
| Raspberry Pi 4 Model B   | RAM 4GB (Dùng làm máy mục tiêu giả lập victim trong mạng nội bộ) | 1 | 1,500,000 VNĐ | Raspberry Pi VN / Shopee |
| USB Flash Drive 32GB     | USB 3.0 (Dùng để cài đặt Kali Linux Live boot nếu không dùng VM) | 1 | 120,000 VNĐ | Thế giới di động / Tiki |

---

## 🛠️ Công Nghệ & Phần Mềm Sử Dụng / Software Stack

- **Hệ điều hành**: Kali Linux (VM hoặc Live USB) & Windows 10/11 làm Host.
- **Ngôn ngữ**: Python 3.10+ & C++ (GCC/G++ 11+).
- **Mô hình AI**: Ollama (chạy local Llama 3 / Mistral) & APIs (Gemini/OpenAI).
- **Thư viện chính**:
  - Python: \`socket\`, \`scapy\`, \`requests\`, \`threading\`, \`json\`.
  - C++: \`<thread>\`, \`<mutex>\`, \`<vector>\`, \`<winsock2.h>\` / \`<sys/socket.h>\`.

---

## 📊 Phân Bổ Thời Gian & Đánh Giá / Time Distribution & Grading

- **Lý thuyết**: 30%
- **Thực hành Lab**: 40%
- **Lập trình công cụ tự động hóa**: 30%

### Tiêu Chí Đánh Giá / Assessment Rubric
- **Hoàn thành các bài thực hành Lab tuần học**: 40%
- **Đóng góp mã nguồn mẫu / GitHub repo cá nhân**: 20%
- **Dự án cuối khoá (Final Capstone)**: 40% (Bao gồm báo cáo, mã nguồn và video demo).
