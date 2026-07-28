# Tuần 2: SCCP Phone và extension

## Mục tiêu

- Giải thích quá trình phone nhận IP, tìm TFTP/CME, tải cấu hình và đăng ký.
- Tạo directory number cùng ephone trong lab.
- Kiểm chứng trạng thái đăng ký và cuộc gọi nội bộ.

## Video nguồn

Bài 02–03: cấp extension và cuộc gọi giữa SCCP Phone.

## Cấu hình minh họa

```text
telephony-service
 max-ephones 4
 max-dn 8
 ip source-address 10.20.0.1 port 2000
 create cnf-files
ephone-dn 1 dual-line
 number 2001
 name LAB-PHONE-1
ephone 1
 mac-address 0000.0000.0001
 button 1:1
```

MAC là placeholder. Trên lab thật, lấy MAC từ endpoint được cấp và không công khai inventory production.

## Kiểm chứng

```text
show telephony-service
show ephone registered
show ephone-dn
```

Nếu phone không đăng ký, kiểm tra theo thứ tự: link/PoE → VLAN → DHCP → TFTP/CME reachability → config file → protocol/version.

