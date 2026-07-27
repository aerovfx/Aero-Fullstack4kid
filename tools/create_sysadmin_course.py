import os

BASE_DIR_SYS = "/Users/dangvietchung/Aero-Fullstack4kid/courses/3_INFRA_NETWORKING/2_System_Administration/sysadmin-10weeks"

lessons_sys = [
    ("Nhập môn Máy chủ & Hệ điều hành Linux/Windows", "Sự khác biệt giữa Desktop và Server. Cài đặt Ubuntu Server và Windows Server. Khái niệm về CLI (Command Line Interface)."),
    ("Quản lý File System, Người dùng và Phân quyền", "Cấu trúc thư mục Linux. Tạo User/Group. Phân quyền rwx (Read/Write/Execute) và chmod/chown."),
    ("Tự động hóa với Shell Scripting", "Cơ bản về Bash Script trên Linux và PowerShell trên Windows. Viết kịch bản tự động sao lưu dữ liệu và dọn dẹp log."),
    ("Quản lý Tiến trình và Tài nguyên", "Theo dõi hiệu suất máy chủ. Sử dụng top, htop, ps. Quản lý systemd services (start, stop, enable, restart)."),
    ("Cấu hình Dịch vụ mạng cơ bản (SSH, DNS, DHCP)", "Bảo mật truy cập từ xa với SSH Key. Thiết lập máy chủ phân giải tên miền nội bộ (Local DNS)."),
    ("Triển khai Web Server & Database Server", "Cài đặt và cấu hình Nginx/Apache. Cài đặt MySQL/PostgreSQL. Triển khai kiến trúc LAMP/LEMP stack."),
    ("Windows Server & Active Directory (AD)", "Thiết lập Domain Controller. Quản lý tài nguyên, Group Policy (GPO) trong mạng nội bộ doanh nghiệp."),
    ("Giám sát hệ thống (System Monitoring)", "Cài đặt Prometheus và Grafana để theo dõi sức khoẻ của hàng chục máy chủ qua biểu đồ trực quan thời gian thực."),
    ("Sao lưu dữ liệu (Backup) & Phục hồi (Recovery)", "Chiến lược backup 3-2-1. Lập lịch tự động rsync/cronjob. Diễn tập phục hồi sau sự cố hỏng ổ cứng."),
    ("Bảo mật máy chủ (Hardening) & Đồ án", "Cấu hình tường lửa UFW/iptables. Chống tấn công Brute-force bằng Fail2ban. Cập nhật bản vá bảo mật.")
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
- \`lessons/\`: Các bài giảng thực hành CLI và thiết lập dịch vụ.
- \`projects/\`: Đồ án cuối khoá.
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

## 2. Lệnh CLI (Command Line)
- Liệt kê các lệnh Linux/Windows cần thiết cho bài học này.
- Ví dụ và cú pháp sử dụng.

## 3. Thực hành Lab
- Yêu cầu cấu hình hệ thống trên máy ảo (VirtualBox/VMware).

## 4. Xử lý sự cố (Troubleshooting)
- Các lỗi thường gặp và cách kiểm tra log (e.g., /var/log/syslog).
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_SYS, 
        "Quản Trị Hệ Thống (System Administration)", 
        "Lộ trình 10 tuần đào tạo Kỹ sư Quản trị Hệ thống (SysAdmin). Trang bị kỹ năng quản lý, duy trì, và bảo mật hệ thống máy chủ Linux/Windows Server doanh nghiệp.",
        lessons_sys,
        "Triển khai Mạng Doanh nghiệp Mô phỏng",
        "Học viên sẽ sử dụng máy ảo để xây dựng một kiến trúc mạng doanh nghiệp gồm: 1 Máy chủ Load Balancer (Nginx), 2 Máy chủ Web, 1 Máy chủ Database và hệ thống giám sát bằng Prometheus. Yêu cầu thiết lập tường lửa bảo vệ và viết bash script tự động backup Database mỗi đêm."
    )
    print("Successfully generated SysAdmin course.")

if __name__ == "__main__":
    main()
