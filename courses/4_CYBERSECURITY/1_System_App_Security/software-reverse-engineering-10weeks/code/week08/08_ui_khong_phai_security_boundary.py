"""software-reverse-engineering-10weeks · Tuần 08 · Bài 08.

Chủ đề: UI không phải security boundary
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - UI không phải security boundary:', result)
