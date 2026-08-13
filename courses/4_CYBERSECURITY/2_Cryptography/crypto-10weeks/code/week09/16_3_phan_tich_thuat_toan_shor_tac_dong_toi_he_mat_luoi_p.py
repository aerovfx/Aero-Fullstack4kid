"""crypto-10weeks · Tuần 09 · Bài 16.

Chủ đề: 3: Phân Tích Thuật Toán Shor & Tác Động Tới Hệ Mật Lưới PQC
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 3: Phân Tích Thuật Toán Shor & Tác Động Tới Hệ Mật Lưới PQC:', result)
