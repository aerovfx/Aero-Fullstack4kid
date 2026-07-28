# Tuần 8: Chống toll fraud và giới hạn cuộc gọi

## Mục tiêu

- Nhận diện SIP scanning, route lỏng và credential yếu.
- Giới hạn nguồn signaling tin cậy và số cuộc gọi đồng thời.
- Thiết kế alert cho call attempt bất thường.

## Video nguồn

Bài 18 và 20: trusted list và giới hạn cuộc gọi trên dial-peer.

## Hardening checklist

- Chỉ cho phép signaling từ peer/SBC đã biết qua ACL và trusted list.
- Dùng xác thực mạnh, đổi credential mặc định và giới hạn management plane.
- Dial pattern theo least privilege; chặn premium/international nếu không có nhu cầu.
- Đặt `max-conn` phù hợp capacity và hợp đồng trunk.
- Thu log failed registration, call spike, giờ gọi bất thường và số đích rủi ro.

```text
voice service voip
 ip address trusted list
  ipv4 192.0.2.10 255.255.255.255
dial-peer voice 100 voip
 max-conn 10
```

## Lab phòng thủ

Trong topology cô lập, thử cuộc gọi từ peer được phép và một peer giả lập không được phép; xác minh cuộc gọi thứ 11 bị từ chối theo chính sách. Không quét hoặc gọi thử hệ thống SIP công cộng.

