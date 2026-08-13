"""software-reverse-engineering-10weeks · Tuần 05 · Bài 08.

Chủ đề: Câu 1 (Nhận biết)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Câu 1 (Nhận biết):', result)
