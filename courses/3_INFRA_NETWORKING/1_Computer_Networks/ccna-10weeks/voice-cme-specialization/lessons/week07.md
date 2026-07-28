# Tuần 7: Dial-peer H.323, SIP và codec

## Mục tiêu

- Phân biệt inbound/outbound dial-peer matching.
- Cấu hình destination-pattern, session target và codec.
- Troubleshoot “no matching dial-peer” có phương pháp.

## Video nguồn

Bài 16–17 và 19: H.323, codec trên dial-peer và SIPv2.

## Cấu hình minh họa

```text
dial-peer voice 300 voip
 description TO-SITE-B
 destination-pattern 3...
 session protocol sipv2
 session target ipv4:198.51.100.20
 codec g711ulaw
 no vad
```

`3...` khớp bốn chữ số bắt đầu bằng 3. Pattern càng cụ thể càng dễ audit; tránh route quá rộng hoặc overlap không chủ đích.

## Kiểm chứng

```text
show dial-peer voice summary
show dialplan number 3001
show call active voice brief
show voice call status
```

Debug có thể tạo log lớn và ảnh hưởng thiết bị. Chỉ bật debug có mục tiêu trong lab/maintenance window, đặt thời gian tắt và ưu tiên `show`/trace có lọc trước.

