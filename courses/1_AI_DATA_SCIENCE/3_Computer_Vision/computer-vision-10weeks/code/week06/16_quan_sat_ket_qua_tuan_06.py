"""computer-vision-10weeks · Tuần 06 · Bài 16.

Chủ đề: Quan sát kết quả tuần 06
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Quan sát kết quả tuần 06:', result)
