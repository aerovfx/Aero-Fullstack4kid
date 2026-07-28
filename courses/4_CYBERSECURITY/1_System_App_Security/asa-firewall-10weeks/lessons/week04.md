# Tuần 4: Interface, zone và routing

## Mục tiêu

- Gán IP, `nameif` và security level theo thiết kế.
- Cấu hình default route trong lab.
- Kiểm chứng link, ARP, route và luồng traffic theo từng lớp.

## Video nguồn

Video 6 và 22: khai báo địa chỉ IP trên cổng bằng CLI/ASDM.

## Cấu hình lab

```text
configure terminal
interface GigabitEthernet0/0
 nameif outside
 security-level 0
 ip address 192.0.2.2 255.255.255.0
 no shutdown
interface GigabitEthernet0/1
 nameif inside
 security-level 100
 ip address 10.10.10.1 255.255.255.0
 no shutdown
route outside 0.0.0.0 0.0.0.0 192.0.2.1
end
```

Dải `192.0.2.0/24` là địa chỉ tài liệu; thay bằng IP lab được cấp. Không áp cấu hình mẫu lên production.

## Kiểm chứng

```text
show interface ip brief
show nameif
show route
show arp
packet-tracer input inside tcp 10.10.10.10 50000 198.51.100.10 443
```

## Bài tập

Thêm DMZ với security level 50, cập nhật sơ đồ và giải thích vì sao security level không thay thế cho ACL tường minh.

