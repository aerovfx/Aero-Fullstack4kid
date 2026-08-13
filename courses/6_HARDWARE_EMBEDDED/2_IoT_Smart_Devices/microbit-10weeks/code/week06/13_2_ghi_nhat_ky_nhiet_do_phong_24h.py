"""microbit-10weeks · Tuần 06 · Bài 13.

Chủ đề: 2: Ghi Nhật Ký Nhiệt Độ Phòng 24h
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 2: Ghi Nhật Ký Nhiệt Độ Phòng 24h:', result)
