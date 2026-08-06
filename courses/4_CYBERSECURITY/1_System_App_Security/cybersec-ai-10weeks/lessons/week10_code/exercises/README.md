# Tuần 10 — Bài Tập: AI SOC/SOAR

Bài giảng: [`../../week10.md`](../../week10.md) · Khung CEH: [`../../CEH_alignment.md`](../../CEH_alignment.md)

**Ánh xạ CEH:** M12 Evading IDS/Firewalls (góc phòng thủ)

Mỗi bài có file khung `TODO` để bạn tự điền, và lời giải đầy đủ trong `solutions/`.

| File | Nội dung |
| :--- | :--- |
| `ex01_anomaly_zscore.py` | Phát hiện bất thường bằng z-score |
| `ex02_alert_triage.py` | Phân loại & gộp cảnh báo SOC |

## Cách chạy

```bash
python3 ex01_anomaly_zscore.py
python3 ex02_alert_triage.py
```

> Toàn bộ bài tập chỉ dùng **thư viện chuẩn của Python** và **dữ liệu giả lập nhúng sẵn** —
> chạy được ngay, không cần cài scapy/bcrypt/scikit-learn hay gọi API tính phí.
> Bài giảng dùng các thư viện/công cụ thật đó; bài tập tái hiện *nguyên lý* để ai cũng chạy được.

## An toàn

Mọi bài chỉ thao tác trên `127.0.0.1`, mạng nội bộ của chính bạn, hoặc dữ liệu giả lập.
Không nhắm tới hệ thống của người khác — xem quy tắc đạo đức trong [`../../CEH_alignment.md`](../../CEH_alignment.md).
