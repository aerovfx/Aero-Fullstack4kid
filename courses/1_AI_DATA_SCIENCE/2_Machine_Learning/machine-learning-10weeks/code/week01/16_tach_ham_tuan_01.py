"""machine-learning-10weeks · Tuần 01 · Bài 16.

Chủ đề: Tách hàm tuần 01
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Tách hàm tuần 01:', result)
