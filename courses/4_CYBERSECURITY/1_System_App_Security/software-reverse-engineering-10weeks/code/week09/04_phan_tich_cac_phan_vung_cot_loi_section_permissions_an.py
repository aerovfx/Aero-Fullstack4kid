"""software-reverse-engineering-10weeks · Tuần 09 · Bài 04.

Chủ đề: Phân tích Các Phân Vùng Cốt Lõi (Section Permissions & Anomaly Detection)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Phân tích Các Phân Vùng Cốt Lõi (Section Permissions & Anomaly Detection):', result)
