# Chuyên đề Cisco VoIP & CME — 10 tuần

Module học tiếp sau CCNA core, giúp học viên triển khai thoại IP quy mô chi nhánh bằng Cisco Unified Communications Manager Express (CME) và Voice Gateway.

## Nguồn chuyên đề

- [Thư mục 26 video Cisco VoIP/CME](https://drive.google.com/drive/folders/1TgdPGpgA_9hnnkmo6izt3i0E8Zg7Sahp?usp=drive_link)
- Video nguồn bao phủ kiến trúc VoIP, SCCP/SIP Phone, Voice VLAN, codec, SIP-UA/CUBE, dial-peer, toll-fraud prevention, E1 và number translation.

## Điều kiện học

Hoàn thành hoặc có kiến thức tương đương CCNA core: IPv4/subnet, VLAN/trunk, DHCP, routing, ACL, NAT và CLI Cisco IOS. Một số tính năng voice không có trong Packet Tracer; lab nâng cao cần CML/EVE-NG/GNS3 với image được cấp phép hoặc thiết bị thật được ủy quyền.

## Đầu ra

Học viên có thể thiết kế voice/data VLAN, đăng ký SCCP/SIP endpoint, chọn codec theo băng thông, xây dial plan, kết nối SIP/POTS/E1, chuẩn hóa số gọi và triển khai kiểm soát chống toll fraud.

## Nguyên tắc an toàn và pháp lý

- Chỉ kết nối PSTN/SIP trunk do đơn vị sở hữu hoặc nhà cung cấp cho phép.
- Không thử số, route cuộc gọi hoặc credential trên hệ thống công cộng.
- Dùng số giả `2XXX`, địa chỉ tài liệu và secret placeholder trong repo.
- Giới hạn nguồn SIP, xác thực endpoint, theo dõi call attempt và có ngưỡng cuộc gọi đồng thời.

- [Lịch trình 10 tuần](schedule.md)
- Bài học: `lessons/week01.md` đến `week10.md`.
- Cấu hình mẫu: `code/week01.ios` đến `week10.ios`.
- Lab học viên: `exercises/week01/` đến `week10/`.
- [Dự án cuối khóa](projects/final_project.md).

Quy trình mỗi tuần: đọc lesson, dựng topology lab, tham khảo code mẫu,
hoàn thiện starter và lưu bằng chứng kiểm thử. Không dán cấu hình vào
voice gateway, SIP trunk hoặc PSTN production.
