import os

BASE_DIR_CRYPTO = "/Users/dangvietchung/Aero-Fullstack4kid/courses/4_CYBERSECURITY/2_Cryptography/crypto-10weeks"

lessons_crypto = [
    ("Nhập môn Mật mã học & Lịch sử mã hoá", "Từ mã Caesar cổ đại đến mã hóa Enigma. Hiểu các khái niệm cơ bản: Plaintext, Ciphertext, Encryption, Decryption, Key."),
    ("Mã hóa đối xứng (Symmetric Encryption)", "Nghiên cứu nguyên lý hoạt động của các thuật toán mã hoá đối xứng như DES, 3DES và AES. Ứng dụng mã hoá file bằng Python (Cryptography library)."),
    ("Mã hóa bất đối xứng (Asymmetric Encryption)", "Sự ra đời của khoá công khai (Public Key) và khoá bí mật (Private Key). Phân tích thuật toán RSA và trao đổi khoá Diffie-Hellman."),
    ("Hàm băm (Hashing Algorithms)", "Đặc điểm của hàm băm một chiều. Tìm hiểu MD5, SHA-1, SHA-256. Ứng dụng trong việc lưu trữ mật khẩu an toàn và kiểm tra tính toàn vẹn của tệp tin (Checksum)."),
    ("Chữ ký điện tử (Digital Signatures)", "Kết hợp Hashing và Asymmetric Encryption để tạo chữ ký số. Xác thực danh tính người gửi và đảm bảo thông điệp không bị thay đổi (Non-repudiation)."),
    ("Cơ sở hạ tầng khóa công khai (PKI) & Chứng chỉ số", "Cách chứng chỉ SSL/TLS hoạt động. Vai trò của Tổ chức phát hành chứng chỉ (CA). Xây dựng một mini CA nội bộ bằng OpenSSL."),
    ("Bảo mật giao thức mạng (SSL/TLS & VPN)", "Phân tích quá trình TLS Handshake bảo vệ dữ liệu truyền tải trên Internet. Nguyên lý hoạt động của IPSec và mã hóa VPN."),
    ("Mật mã học trong Blockchain & Tiền điện tử", "Cách SHA-256 tạo thành chuỗi khối (Blockchain). Cơ chế chữ ký Elliptic Curve (ECDSA) dùng trong Bitcoin và Ethereum. Khái niệm ví tiền điện tử."),
    ("Mật mã học Hậu lượng tử (Post-Quantum Cryptography)", "Mối đe dọa từ máy tính lượng tử đối với RSA. Tổng quan về các thuật toán mã hóa mới có khả năng chống lại máy tính lượng tử."),
    ("Đồ án cuối khoá: Ứng dụng Nhắn tin Mã hoá End-to-End", "Thiết kế và lập trình một ứng dụng chat (Python Socket) sử dụng mã hóa E2EE (End-to-End Encryption) mô phỏng theo chuẩn tín hiệu của WhatsApp/Signal.")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def generate_course(base_dir, title, desc, lessons, project_title, project_desc):
    print(f"Creating course at {base_dir}")
    create_directory(base_dir)
    create_directory(os.path.join(base_dir, "lessons"))
    create_directory(os.path.join(base_dir, "projects"))

    index_content = f"""# {title}

{desc}

## Cấu trúc thư mục
- \`schedule.md\`: Lộ trình chi tiết 10 tuần.
- \`lessons/\`: Lý thuyết toán học đằng sau mật mã và bài tập lập trình Python.
- \`projects/\`: Đồ án cuối khoá ứng dụng bảo mật.
"""
    write_file(os.path.join(base_dir, "INDEX.md"), index_content)

    schedule_content = f"# Lộ trình {title} (10 Tuần)\n\n"
    for i, (l_title, l_desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {l_title}\n- {l_desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(base_dir, "schedule.md"), schedule_content)

    for i, (l_title, l_desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {l_title}

## 1. Mục tiêu bài học
- {l_desc}

## 2. Nền tảng Toán học (Toán Rời Rạc / Số học Mô-đun)
- Giải thích các công thức toán học cơ sở đằng sau thuật toán.

## 3. Mã nguồn thực hành (Python)
- Sử dụng thư viện \`cryptography\` hoặc \`hashlib\` để triển khai thuật toán trên code.

## 4. Bài tập (Challenge)
- Giải mã một thông điệp bí mật (CTF Challenge) hoặc tìm lỗ hổng trong một hàm băm yếu.
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_CRYPTO, 
        "Mật mã học (Cryptography) Ứng dụng", 
        "Nghiên cứu các thuật toán mã hóa để bảo vệ quyền riêng tư của dữ liệu, chứng thực danh tính và ứng dụng trong các hệ thống ngân hàng, viễn thông và Blockchain.",
        lessons_crypto,
        "Ứng dụng Nhắn tin Bảo mật End-to-End",
        "Học viên sẽ sử dụng Python Socket để viết một ứng dụng Client-Server. Dữ liệu chat phải được mã hoá hoàn toàn ở phía máy khách bằng hệ mật phi đối xứng và đối xứng kết hợp, đảm bảo ngay cả Server (kẻ trung gian) cũng không thể đọc được nội dung tin nhắn."
    )
    print("Successfully generated Cryptography course.")

if __name__ == "__main__":
    main()
