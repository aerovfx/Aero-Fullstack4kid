"""microbit-10weeks · Tuần 10 · Bài 16.

Chủ đề: Cấu trúc chương trình tuần 10
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Cấu trúc chương trình tuần 10:', result)
