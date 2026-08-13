# Đồ Án Cuối Khoá: Thiết Kế & Cấu Hình Mạng Doanh Nghiệp Cỡ Trung

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
- PC từ các VLAN ping thành công router ISP mô phỏng `203.0.113.1`.
- PC từ chi nhánh ping thành công Server nội bộ tại HQ.
- ACL hoạt động đúng mục tiêu.

## An toàn lab

Chỉ dùng dải địa chỉ tài liệu RFC 5737 hoặc mạng lab riêng. Không quét,
debug lưu lượng hay áp dụng cấu hình lên hạ tầng production. Hồ sơ nộp
phải có backup cấu hình, bảng kiểm thử và kế hoạch rollback.
