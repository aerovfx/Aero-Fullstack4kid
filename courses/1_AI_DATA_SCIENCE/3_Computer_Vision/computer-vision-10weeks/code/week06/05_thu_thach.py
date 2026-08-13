"""computer-vision-10weeks · Tuần 06 · Bài 05.

Chủ đề: Thử thách
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Thử thách:', result)
