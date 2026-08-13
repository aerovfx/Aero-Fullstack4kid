"""machine-learning-10weeks · Tuần 04 · Bài 04.

Chủ đề: Bài tập (Challenge)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Bài tập (Challenge):', result)
