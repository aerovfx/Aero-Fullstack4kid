# Khoá Học CCNA (200-301) - Mạng Máy Tính Cơ Bản

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
- `code/week01.ios` đến `week10.ios`: Cấu hình mẫu có chú thích.
- `exercises/week01/` đến `week10/`: Starter và tiêu chí kiểm thử cho học viên.
- `projects/`: Đồ án cuối khoá.

Quy trình mỗi tuần: đọc lesson, dựng topology riêng, tham khảo code mẫu,
hoàn thiện exercise và lưu bằng chứng kiểm thử bằng các lệnh `show`.
Không dán cấu hình vào thiết bị production.

## Chuyên đề học tiếp

Sau phần CCNA core, học viên có thể học [Cisco VoIP & CME](voice-cme-specialization/INDEX.md), một module 10 tuần được biên soạn từ 26 video thực hành về SCCP, SIP, Voice VLAN, codec, CUBE, dial-peer, E1 và translation rule.
