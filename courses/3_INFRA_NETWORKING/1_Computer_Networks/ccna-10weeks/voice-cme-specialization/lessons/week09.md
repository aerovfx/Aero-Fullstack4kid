# Tuần 9: POTS và trung kế E1

## Mục tiêu

- Phân biệt FXO/FXS, POTS dial-peer và digital E1.
- Hiểu framing, linecode, clocking, timeslot và signaling.
- Troubleshoot E1 theo physical → controller → signaling → dial-peer.

## Video nguồn

Bài 21–24: POTS analog, tổng quan/cấu hình E1 và dial-peer dùng E1.

## Khung cấu hình

```text
controller E1 0/0/0
 framing CRC4
 linecode HDB3
 pri-group timeslots 1-31
dial-peer voice 200 pots
 destination-pattern 9T
 port 0/0/0:15
 forward-digits all
```

Thông số E1/PRI và port chỉ là ví dụ; phải khớp handoff của nhà mạng. Clocking, switch-type hoặc timeslot sai khiến trunk down hoặc cuộc gọi lỗi.

## Kiểm chứng

```text
show controllers e1
show isdn status
show voice port summary
show dial-peer voice summary
```

## Bài tập

Giáo viên cung cấp ba lỗi giả lập: loss of frame, Layer 2 chưa established và dial-peer sai. Học viên xác định lớp lỗi trước khi đổi cấu hình.

