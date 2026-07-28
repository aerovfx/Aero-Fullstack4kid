# Tuần 4: SIP Phone, softphone và xác thực

## Mục tiêu

- Mô tả REGISTER, INVITE, 100/180/200 và ACK.
- Tạo SIP extension và cấu hình softphone bằng tài khoản lab.
- Bật xác thực, tránh endpoint ẩn danh.

## Video nguồn

Bài 06–09: cấp extension, gọi SIP, softphone và xác thực SIP Server.

## Cấu hình minh họa

```text
voice register global
 mode cme
 source-address 10.20.0.1 port 5060
 max-dn 8
 max-pool 4
 create profile
voice register dn 1
 number 2101
voice register pool 1
 id mac 0000.0000.0011
 number 1 dn 1
 username phone2101 password <LAB_SECRET>
```

Cú pháp phụ thuộc IOS/CME release. Secret phải nằm trong vault hoặc cấu hình lab tạm, không commit vào Git.

## Kiểm chứng

```text
show voice register global
show voice register pool all
show sip-ua status
```

Dùng packet capture lab để nhận diện signaling, nhưng không ghi/thu RTP hoặc credential của người khác.

