# Tuần 10: DHCP và đồ án tổng hợp

## Mục tiêu

- Cấu hình ASA cấp DHCP trong mạng branch lab.
- Kiểm chứng lease, gateway, DNS và xử lý xung đột địa chỉ.
- Bàn giao firewall kèm cấu hình, bằng chứng và runbook.

## Video nguồn

Video 31: cấu hình DHCP Server trên ASA.

## Cấu hình lab

```text
configure terminal
dhcpd address 10.10.10.100-10.10.10.150 inside
dhcpd dns 1.1.1.1 8.8.8.8
dhcpd lease 3600
dhcpd enable inside
end
show dhcpd state
show dhcpd binding
```

Chọn pool không trùng IP tĩnh; DNS trong ví dụ là public resolver, còn môi trường doanh nghiệp thường phải dùng DNS nội bộ. Xác minh cú pháp và giới hạn theo phiên bản.

## Đồ án cuối khóa

Thiết kế firewall branch-office có outside, inside, DMZ và management. Yêu cầu:

- Chính sách traffic theo least privilege và sơ đồ luồng.
- SSH/ASDM chỉ từ management subnet; không bật Telnet.
- DHCP cho client, backup cấu hình và kế hoạch upgrade/rollback.
- Bộ kiểm thử dùng `show`, `packet-tracer` và kiểm tra nghiệp vụ.
- Runbook sự cố mất quyền quản trị, hỏng image và restore cấu hình.

## Rubric 100 điểm

Thiết kế/chính sách 25; cấu hình và hardening 25; kiểm chứng 20; backup/rollback 15; tài liệu, đạo đức và demo 15. Không đạt nếu thực hành ngoài phạm vi được ủy quyền hoặc để lộ bí mật thật.

