# Tuần 3: Voice VLAN và telephony-service

## Mục tiêu

- Tách voice/data bằng VLAN trên cùng access port.
- Giải thích CDP/LLDP-MED và DHCP trong quá trình phone khởi động.
- Áp dụng QoS trust có kiểm soát, không tin mọi thiết bị đầu cuối.

## Video nguồn

Bài 04–05: Voice VLAN và dịch vụ Telephony Service trên CME.

## Switch lab

```text
vlan 10
 name DATA
vlan 20
 name VOICE
interface GigabitEthernet1/0/10
 switchport mode access
 switchport access vlan 10
 switchport voice vlan 20
 spanning-tree portfast
 spanning-tree bpduguard enable
```

Tùy platform, QoS command khác nhau. Chỉ trust marking từ phone được xác thực/kiểm soát; PC nối sau phone không được tự do đánh dấu traffic ưu tiên.

## Kiểm chứng

```text
show vlan brief
show interfaces switchport
show cdp neighbors detail
show interfaces counters errors
```

## Thử thách

Mô phỏng PC và phone dùng chung cổng, chứng minh chúng nhận subnet khác nhau và vẫn gọi được khi data traffic tăng trong giới hạn lab.

