"""raspi4-autonomous-car-10weeks · Tuần 07 · Bài 12.

Chủ đề: 2: Thử Nghiệm Phanh Gấp Khởi Động Lại Tự Động
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 2: Thử Nghiệm Phanh Gấp Khởi Động Lại Tự Động:', result)
