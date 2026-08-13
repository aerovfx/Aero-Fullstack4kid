# Dự án cuối khóa: Voice/Data cho hai chi nhánh

Thiết kế hệ thống CME cho HQ và Branch: tách data/voice VLAN, SCCP hoặc SIP endpoint, dial plan 2XXX/3XXX, trunk giữa hai site và translation rule có kiểm soát.

## Bắt buộc

- Sơ đồ topology, bảng IP/VLAN/extension và ước lượng băng thông codec.
- Cấu hình có chú thích, backup và kế hoạch rollback.
- Giới hạn trusted SIP source, route outbound và concurrent call để chống toll fraud.
- Kiểm thử gọi nội bộ, liên chi nhánh, số sai, nguồn không tin cậy và mất WAN.
- Không dùng credential, số điện thoại thật hoặc trunk chưa được phép.

## Chấm điểm

Thiết kế 20%; cấu hình 30%; bảo mật 20%; kiểm thử/khắc phục 20%; tài liệu/demo 10%.
