# Lịch trình Cisco VoIP & CME

| Tuần | Chủ đề | Video nguồn | Sản phẩm |
|---|---|---|---|
| 1 | Kiến trúc VoIP và luồng cuộc gọi | 1 | Sơ đồ signaling/media |
| 2 | SCCP Phone và extension | 2–3 | Hai SCCP phone gọi nội bộ |
| 3 | Voice VLAN và telephony-service | 4–5 | Access port voice/data tách biệt |
| 4 | SIP Phone, softphone và xác thực | 6–9 | Hai SIP endpoint đăng ký CME |
| 5 | Codec và tính băng thông | 10–11 | Capacity plan cho WAN |
| 6 | SIP-UA/CUBE và PSTN | 12–15 | Luồng gọi vào/ra có translation |
| 7 | Dial-peer H.323/SIP và codec | 16–17, 19 | Dial plan giữa hai site |
| 8 | Chống toll fraud và call admission | 18, 20 | Trusted list + giới hạn cuộc gọi |
| 9 | POTS và trung kế E1 | 21–24 | Voice gateway hybrid |
| 10 | Translation profile và đồ án | 25–26 | Branch VoIP hoàn chỉnh |

Mỗi lệnh mẫu phải được đối chiếu với IOS/version và capability của image lab. Không coi cấu hình mẫu là production-ready nếu chưa review dial plan, emergency calling, QoS, security và yêu cầu nhà mạng.

