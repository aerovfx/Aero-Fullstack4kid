# Tuần 8: Quản trị từ xa an toàn

## Mục tiêu

- Giải thích vì sao Telnet không phù hợp cho production.
- Cấu hình SSH với tài khoản cục bộ trong mạng lab.
- Giới hạn management plane theo subnet và ghi log đăng nhập.

## Video nguồn

Video 15–17 và 30: Telnet password/username, SSH và xác thực qua ASDM.

## Cấu hình SSH minh họa

```text
configure terminal
domain-name lab.example
username netadmin password <LAB_SECRET> privilege 15
crypto key generate rsa modulus 2048
ssh version 2
ssh 10.10.99.0 255.255.255.0 inside
aaa authentication ssh console LOCAL
ssh timeout 5
end
```

Kiểm tra trên phiên bản ASA cụ thể xem thuật toán/kích thước khóa nào được hỗ trợ và còn an toàn. Mạng quản trị nên tách riêng; giới hạn nguồn cụ thể hơn khi có thể.

## Lab Telnet an toàn

Chỉ trong mạng cô lập, dùng packet capture để quan sát credential/traffic không được bảo vệ, sau đó tắt Telnet và chuyển sang SSH. Không thu thập thông tin xác thực của người khác; dùng tài khoản lab giả.

## Kiểm chứng

Thử SSH từ subnet được phép và bị cấm, xác minh timeout, logout, AAA log và khả năng truy cập console dự phòng.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 08](../code/week08/README.md), học lần lượt từ `01_...` đến `20_...`.
