"""computer-vision-10weeks · Tuần 02 · Bài 05.

Chủ đề: Thực hành tổng hợp
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Thực hành tổng hợp:', result)
