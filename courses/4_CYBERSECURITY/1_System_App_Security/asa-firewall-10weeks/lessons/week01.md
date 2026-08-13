# Tuần 1: Tổng quan firewall và mô hình phòng thủ

## Mục tiêu

- Giải thích packet filtering, stateful inspection và phân vùng mạng.
- Xác định tài sản, luồng dữ liệu và trust boundary trước khi viết rule.
- Phân biệt firewall mạng với host firewall và WAF.

## Video nguồn

Video 1–2: khả năng lọc theo các lớp OSI và các vị trí triển khai firewall.

## Kiến thức cốt lõi

Firewall không tự tạo ra an toàn; nó thực thi chính sách. Chính sách tốt bắt đầu bằng **default deny**, chỉ cho phép luồng có chủ đích, ghi log đủ dùng và được rà soát định kỳ. ASA dùng connection table để theo dõi phiên và cho phép traffic phản hồi phù hợp trạng thái.

## Lab thiết kế

Vẽ mô hình gồm `outside`, `inside`, `dmz` và mạng quản trị. Lập bảng:

| Nguồn | Đích | Dịch vụ | Quyết định | Lý do |
|---|---|---|---|---|
| inside | DNS nội bộ | UDP/TCP 53 | Allow | Phân giải tên |
| outside | DB nội bộ | Any | Deny | Không công khai DB |

Không cấu hình thiết bị ở tuần này. Nhóm khác review xem rule có quá rộng hoặc thiếu luồng nghiệp vụ không.

## Hoàn thành khi

Sơ đồ có trust boundary, bảng rule không dùng `any-any allow`, và mỗi ngoại lệ đều có chủ sở hữu cùng ngày rà soát.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 01](../code/week01/README.md), học lần lượt từ `01_...` đến `20_...`.
