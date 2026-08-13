"""computer-vision-10weeks · Tuần 04 · Bài 04.

Chủ đề: Hiểu tham số
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Hiểu tham số:', result)
