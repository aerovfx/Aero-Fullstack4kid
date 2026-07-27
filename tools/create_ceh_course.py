import os

BASE_DIR = "/Users/dangvietchung/Aero-Fullstack4kid/courses/7_SECURITY/cybersecurity-10weeks"

lessons = [
    ("Nhập môn Ethical Hacking & Security Fundamentals", "Khái niệm Hacker Mũ Trắng, Cyber Kill Chain, CIA Triad, Mô hình Zero Trust, thiết lập Lab với Kali Linux & Metasploitable."),
    ("Footprinting & Reconnaissance", "Thu thập thông tin thụ động/chủ động, OSINT, DNS Enumeration, Nmap Host Discovery."),
    ("Enumeration & Vulnerability Analysis", "Liệt kê dịch vụ (SMB, SNMP, LDAP), sử dụng Nessus/OpenVAS quét và đánh giá mức độ nghiêm trọng (CVSS)."),
    ("System Hacking", "Password Cracking (Hashcat, John the Ripper), Privilege Escalation (Linux/Windows), Bypassing UAC."),
    ("Sniffing, Social Engineering & DoS", "Sử dụng Wireshark phân tích TCP/IP, ARP Spoofing, Phishing cơ bản và nguyên lý tấn công Từ chối dịch vụ (DoS/DDoS)."),
    ("Evading IDS, Firewalls & Honeypots", "Kỹ thuật phân mảnh gói tin, Nmap Decoys, nguyên lý hoạt động của Tường lửa và Honeypot."),
    ("Web Server & Web App Hacking", "Kiến trúc Web, OWASP Top 10, Directory Traversal, XSS (Cross-Site Scripting), CSRF, sử dụng Burp Suite."),
    ("SQL Injection (SQLi)", "Khái niệm SQLi (In-band, Blind, Error-based), khai thác lỗ hổng bằng sqlmap, kỹ thuật phòng thủ (Prepared Statements)."),
    ("Wireless, Mobile & IoT Hacking", "Bảo mật WPA2/WPA3, sử dụng Aircrack-ng, rủi ro thiết bị Mobile và thiết bị IoT, tấn công Rogue AP."),
    ("Cloud Security & Cryptography", "Khái niệm Đám mây (SaaS, PaaS, IaaS), rủi ro cấu hình sai (Misconfiguration), Mã hóa đối xứng/Bất đối xứng, PKI, Hashing.")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def main():
    print(f"Updating CEH course at {BASE_DIR}")
    create_directory(BASE_DIR)
    create_directory(os.path.join(BASE_DIR, "lessons"))
    create_directory(os.path.join(BASE_DIR, "projects"))

    # INDEX.md
    index_content = """# Ethical Hacking & Pentesting (CEH v12 Aligned)

Khóa học 10 tuần về An ninh mạng thực chiến, được thiết kế bám sát theo khung kỹ năng của chứng chỉ **Certified Ethical Hacker (CEH v12)** và **CompTIA Security+**.

## Mục Tiêu Khóa Học
- Làm chủ tư duy của Hacker Mũ Trắng (Ethical Hacker) và quy trình Pentest (Cyber Kill Chain).
- Sử dụng thành thạo hệ điều hành Kali Linux và các công cụ hàng đầu (Nmap, Wireshark, Burp Suite, Hashcat, Metasploit).
- Khả năng tự thiết lập môi trường Lab ảo (VirtualBox/VMware, Metasploitable, DVWA).
- Nắm bắt các kỹ thuật tấn công và phòng thủ ứng dụng Web (OWASP Top 10).

## Yêu Cầu Đầu Vào
- Kiến thức căn bản về Mạng máy tính (OSI, TCP/IP) và Linux.

## Cấu trúc thư mục
- `schedule.md`: Lộ trình chi tiết 10 tuần.
- `lessons/`: Các bài giảng lý thuyết và Lab từng tuần.
- `projects/`: Đồ án thực hành kiểm thử xâm nhập cuối khoá.
"""
    write_file(os.path.join(BASE_DIR, "INDEX.md"), index_content)

    # schedule.md
    schedule_content = "# Lộ trình Ethical Hacking 10 Tuần\n\n"
    for i, (title, desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {title}\n- {desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(BASE_DIR, "schedule.md"), schedule_content)

    # lessons
    for i, (title, desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {title}

## 1. Khái Niệm Cốt Lõi
- {desc}
- Các nguyên tắc đạo đức và pháp lý.

## 2. Công Cụ Sử Dụng (Tools)
- Liệt kê các công cụ tích hợp sẵn trên Kali Linux liên quan đến bài học.

## 3. Bài Tập Lab (Hands-on Lab)
- **Mục tiêu**: Thực hành an toàn trong môi trường Lab cô lập.
- **Yêu cầu**: 
  1. Khởi động máy ảo tấn công (Kali) và máy mục tiêu (Metasploitable/Windows).
  2. Thực hiện kỹ thuật khai thác/phân tích.
  3. Viết báo cáo tìm kiếm lỗ hổng (Vulnerability Report).

## 4. Tài Liệu Tham Khảo (References)
- CEH v12 Courseware.
- TryHackMe / HackTheBox Labs.
"""
        write_file(os.path.join(BASE_DIR, "lessons", f"week{week_num:02d}.md"), lesson_content)

    # final_project.md
    project_content = """# Đồ Án Cuối Khoá: Penetration Testing Report

## Đề Bài
Học viên được cung cấp một máy chủ mục tiêu (Black-box Test) trong mạng Lab. Yêu cầu thực hiện toàn bộ quy trình kiểm thử xâm nhập và viết một báo cáo Pentest hoàn chỉnh.

## Các Bước Thực Hiện (Phases)
1. **Reconnaissance & Enumeration**: Dò quét mạng, xác định các cổng mở và dịch vụ đang chạy.
2. **Vulnerability Analysis**: Phân tích tìm kiếm các lỗ hổng đã biết (CVE) hoặc điểm yếu cấu hình.
3. **Exploitation**: Thực hiện tấn công để lấy quyền truy cập ban đầu (Initial Access).
4. **Post-Exploitation**: Khai thác leo thang đặc quyền (Privilege Escalation) để chiếm quyền Root/Administrator.
5. **Reporting**: Viết báo cáo chuyên nghiệp.

## Yêu Cầu Báo Cáo
- Executive Summary (Tóm tắt cho quản lý).
- Technical Details (Chi tiết kỹ thuật, bằng chứng PoC).
- Remediation (Khuyến nghị khắc phục cho từng lỗ hổng).
"""
    write_file(os.path.join(BASE_DIR, "projects", "final_project.md"), project_content)

    print("Successfully updated CEH course files.")

if __name__ == "__main__":
    main()
