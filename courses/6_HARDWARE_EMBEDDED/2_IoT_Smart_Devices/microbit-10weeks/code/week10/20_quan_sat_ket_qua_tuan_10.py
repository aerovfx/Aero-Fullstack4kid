"""microbit-10weeks · Tuần 10 · Bài 20.

Chủ đề: Quan sát kết quả tuần 10
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Quan sát kết quả tuần 10:', result)
