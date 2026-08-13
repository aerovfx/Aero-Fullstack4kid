"""microbit-10weeks · Tuần 02 · Bài 20.

Chủ đề: Khởi động và mục tiêu tuần 02
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Khởi động và mục tiêu tuần 02:', result)
