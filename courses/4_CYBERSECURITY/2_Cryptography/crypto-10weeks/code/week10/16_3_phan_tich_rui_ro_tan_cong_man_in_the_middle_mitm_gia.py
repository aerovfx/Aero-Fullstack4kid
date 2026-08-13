"""crypto-10weeks · Tuần 10 · Bài 16.

Chủ đề: 3: Phân Tích Rủi Ro Tấn Công Man-in-the-Middle (MitM) & Giả Mạo Khóa (KCI Attack)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Phân Tích Rủi Ro Tấn Công Man-in-the-Middle (MitM) & Giả Mạo Khóa (KCI Attack):', result)
