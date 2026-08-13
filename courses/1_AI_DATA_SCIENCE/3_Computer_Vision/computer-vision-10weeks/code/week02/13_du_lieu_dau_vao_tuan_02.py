"""computer-vision-10weeks · Tuần 02 · Bài 13.

Chủ đề: Dữ liệu đầu vào tuần 02
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Dữ liệu đầu vào tuần 02:', result)
