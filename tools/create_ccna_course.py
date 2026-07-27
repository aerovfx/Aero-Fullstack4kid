import os
import shutil

BASE_DIR = "/Users/dangvietchung/Aero-Fullstack4kid/courses/8_NETWORKING/ccna-10weeks"

# Cấu trúc tuần học
lessons = [
    ("Nền tảng Mạng (Network Fundamentals)", "Mô hình OSI, TCP/IP, Cáp mạng, Các thiết bị mạng cơ bản (Router, Switch, Hub)."),
    ("Chuyển mạch mạng LAN (Switching)", "Cấu hình Switch cơ bản, VLANs, Trunking (802.1q), DTP, VTP."),
    ("Giao thức chống vòng lặp & Gộp link", "Spanning Tree Protocol (STP), Rapid PVST+, EtherChannel (LACP/PAgP)."),
    ("Định tuyến IP (IP Routing) cơ bản", "Định tuyến IP cơ bản, Định tuyến tĩnh (Static Routing), Default Route, Inter-VLAN Routing (Router-on-a-stick)."),
    ("Giao thức định tuyến động (Dynamic Routing)", "Giới thiệu các giao thức định tuyến động, Cấu hình OSPFv2 đơn vùng (Single-Area OSPF)."),
    ("Cấu trúc địa chỉ IPv4 & Chia mạng con", "Thập phân/Nhị phân, Phân lớp IPv4, Subnetting cơ bản đến nâng cao (VLSM)."),
    ("Thế hệ địa chỉ mới IPv6", "Cấu trúc, các loại địa chỉ (Link-local, Global Unicast), cấu hình IPv6 tĩnh."),
    ("Dịch vụ Mạng (IP Services)", "DHCP (IPv4/IPv6), DNS, NAT (Static, Dynamic, PAT), NTP, HSRP/VRRP cơ bản."),
    ("Bảo mật Mạng cơ bản (Network Security)", "Port Security, Access Control Lists (ACLs - Standard/Extended), DHCP Snooping, Dynamic ARP Inspection."),
    ("Quản trị & Tự động hoá Mạng (Network Automation)", "Quản lý thiết bị (Syslog, SNMP), Giới thiệu SDN (Software-Defined Networking), REST API, JSON, Ansible cơ bản.")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def main():
    print(f"Creating CCNA course at {BASE_DIR}")
    
    # Tạo thư mục
    create_directory(BASE_DIR)
    create_directory(os.path.join(BASE_DIR, "lessons"))
    create_directory(os.path.join(BASE_DIR, "projects"))
    create_directory(os.path.join(BASE_DIR, "resources"))

    # Tạo INDEX.md
    index_content = """# Khoá Học CCNA (200-301) - Mạng Máy Tính Cơ Bản

Chào mừng bạn đến với khoá học cấu hình và quản trị mạng máy tính theo chuẩn CCNA (Cisco Certified Network Associate) 200-301.

## Mục tiêu khoá học
- Hiểu rõ nguyên lý hoạt động của mạng máy tính, mô hình OSI, TCP/IP.
- Thành thạo cấu hình các thiết bị mạng Cisco (Router, Switch).
- Nắm vững định tuyến IP (Static, OSPF), chuyển mạch (VLAN, STP, EtherChannel).
- Cấu hình các dịch vụ mạng (DHCP, NAT, ACL).
- Làm quen với tự động hóa mạng và SDN.

## Hướng dẫn cài đặt
1. Cài đặt **Cisco Packet Tracer** (Phiên bản 8.2 trở lên) từ [NetAcad](https://www.netacad.com).
2. (Tùy chọn) Cài đặt **GNS3** hoặc **EVE-NG** nếu muốn giả lập thực tế với Cisco IOS images.

## Cấu trúc thư mục
- `schedule.md`: Lộ trình chi tiết 10 tuần.
- `lessons/`: Bài giảng và lab thực hành từng tuần.
- `projects/`: Đồ án cuối khoá.
"""
    write_file(os.path.join(BASE_DIR, "INDEX.md"), index_content)

    # Tạo schedule.md
    schedule_content = "# Lộ trình Học Tập CCNA 10 Tuần\n\n"
    for i, (title, desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {title}\n- {desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(BASE_DIR, "schedule.md"), schedule_content)

    # Tạo lessons
    for i, (title, desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {title}

## 1. Lý Thuyết
- Khái niệm: {desc}
- Các giao thức liên quan.
- Bảng tổng hợp câu lệnh Cisco IOS.

## 2. Lab Thực Hành (Packet Tracer)
- **Topolo**: (Sơ đồ mạng)
- **Yêu cầu**:
  1. Cấu hình cơ bản (Hostname, Passwords, SSH).
  2. Cấu hình theo chủ đề bài học.
  3. Kiểm tra kết nối (`ping`, `traceroute`, `show ip interface brief`).

## 3. Câu Lệnh CLI Cần Nhớ
```bash
# Ví dụ
Router# configure terminal
Router(config)#
```

## 4. Bài Tập Về Nhà
- Hoàn thành file `.pkt` và nộp lên hệ thống.
"""
        write_file(os.path.join(BASE_DIR, "lessons", f"week{week_num:02d}.md"), lesson_content)

    # Tạo final_project.md
    project_content = """# Đồ Án Cuối Khoá: Thiết Kế & Cấu Hình Mạng Doanh Nghiệp Cỡ Trung

## Đề Bài
Xây dựng hệ thống mạng hoàn chỉnh cho một doanh nghiệp gồm: Trụ sở chính (HQ) và 1 Chi nhánh (Branch).
Yêu cầu tích hợp tất cả các kiến thức đã học trong 10 tuần.

## Các Yêu Cầu Cấu Hình
1. **Switching**: Chia VLAN (VLAN 10: IT, VLAN 20: HR, VLAN 30: Guest), cấu hình Trunking, cấu hình STP Root Bridge.
2. **IP Addressing**: Cấp phát IP IPv4 bằng DHCP Server, sử dụng VLSM.
3. **Routing**: Cấu hình OSPFv2 giữa HQ và Branch. Định tuyến tĩnh ra Internet.
4. **Services**: Cấu hình NAT PAT để ra Internet. Cài đặt NTP Server.
5. **Security**: Cấu hình Port Security trên các cổng Switch. Áp dụng ACL chặn VLAN Guest truy cập Server nội bộ.

## Tiêu Chí Đánh Giá
- PC từ các VLAN ping thành công ra Internet (Google DNS 8.8.8.8).
- PC từ chi nhánh ping thành công Server nội bộ tại HQ.
- ACL hoạt động đúng mục tiêu.
"""
    write_file(os.path.join(BASE_DIR, "projects", "final_project.md"), project_content)

    print("Successfully created CCNA course scaffolding.")

if __name__ == "__main__":
    main()
