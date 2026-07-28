# Tuần 1: Kiến trúc VoIP và luồng cuộc gọi

## Mục tiêu

- Phân biệt signaling với RTP media.
- Nhận diện IP phone, CME, CUBE/voice gateway, switch PoE và PSTN.
- Lập kế hoạch địa chỉ, VLAN và dial plan trước khi cấu hình.

## Video nguồn

Bài 01: Tổng quan kiến trúc hạ tầng mạng VoIP.

## Kiến thức cốt lõi

Signaling thiết lập/kết thúc cuộc gọi; RTP thường mang âm thanh trực tiếp giữa endpoint. Vì hai luồng có thể đi khác đường, troubleshooting phải kiểm tra riêng đăng ký/cuộc gọi và media một chiều.

## Lab thiết kế

Vẽ hai site, mỗi site có data VLAN, voice VLAN, DHCP, CME và hai extension. Ghi rõ:

- Voice VLAN/subnet và default gateway.
- Extension range, ví dụ Site A `2XXX`, Site B `3XXX`.
- Signaling protocol và codec dự kiến.
- Trust boundary, nguồn SIP được phép và đường PSTN giả lập.

## Kiểm chứng

Nhóm khác review xung đột số, thiếu route, thiếu DHCP option, single point of failure và khả năng media đi hai chiều.

