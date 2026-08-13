"""computer-vision-10weeks · Tuần 01 · Bài 13.

Chủ đề: Dữ liệu đầu vào tuần 01
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Dữ liệu đầu vào tuần 01:', result)
