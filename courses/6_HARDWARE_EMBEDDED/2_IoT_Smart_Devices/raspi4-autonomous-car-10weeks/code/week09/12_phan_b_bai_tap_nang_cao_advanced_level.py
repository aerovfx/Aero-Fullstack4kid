"""raspi4-autonomous-car-10weeks · Tuần 09 · Bài 12.

Chủ đề: 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level):', result)
