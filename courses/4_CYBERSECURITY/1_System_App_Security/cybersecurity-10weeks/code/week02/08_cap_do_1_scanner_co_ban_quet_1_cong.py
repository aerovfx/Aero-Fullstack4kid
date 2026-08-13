"""cybersecurity-10weeks · Tuần 02 · Bài 08.

Chủ đề: Cấp độ 1: Scanner Cơ bản (Quét 1 Cổng)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Cấp độ 1: Scanner Cơ bản (Quét 1 Cổng):', result)
