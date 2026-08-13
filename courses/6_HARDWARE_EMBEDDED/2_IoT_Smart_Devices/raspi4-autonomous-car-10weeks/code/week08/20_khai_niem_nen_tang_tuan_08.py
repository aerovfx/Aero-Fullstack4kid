"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 20.

Chủ đề: Khái niệm nền tảng tuần 08
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Khái niệm nền tảng tuần 08:', result)
