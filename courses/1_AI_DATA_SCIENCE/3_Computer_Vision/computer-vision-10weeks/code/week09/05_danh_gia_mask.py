"""computer-vision-10weeks · Tuần 09 · Bài 05.

Chủ đề: Đánh giá mask
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Đánh giá mask:', result)
