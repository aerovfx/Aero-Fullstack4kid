"""cybersecurity-10weeks · Tuần 05 · Bài 16.

Chủ đề: Bước 5: Quét nhanh (Fast Scan)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Bước 5: Quét nhanh (Fast Scan):', result)
