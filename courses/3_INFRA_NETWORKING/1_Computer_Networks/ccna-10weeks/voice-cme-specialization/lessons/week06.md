# Tuần 6: SIP-UA/CUBE và kết nối PSTN

## Mục tiêu

- Phân biệt CME endpoint registration với CUBE trunking.
- Cấu hình SIP-UA bằng credential lab và dial-peer gọi ra.
- Chuẩn hóa Called/Calling number cho chiều vào/ra.

## Video nguồn

Bài 12–15: SIP Client trên CUBE, dial-peer PSTN và translation rule.

## Cấu hình khung

```text
sip-ua
 credentials username <LAB_USER> password <LAB_SECRET> realm lab.example
 registrar ipv4:192.0.2.10 expires 3600
voice translation-rule 10
 rule 1 /^0/ /+84/
voice translation-profile OUTBOUND
 translate calling 10
dial-peer voice 100 voip
 destination-pattern 0T
 session protocol sipv2
 session target ipv4:192.0.2.10
 translation-profile outgoing OUTBOUND
```

Đây là mẫu khái niệm dùng địa chỉ tài liệu. Translation rule phải được test với bảng số cụ thể; rule sai có thể làm gọi nhầm hoặc phá emergency calling.

## Kiểm chứng

Lập test matrix gồm số nội bộ, di động giả lập, số không hợp lệ và chiều inbound. So sánh called/calling number trước và sau translation.

