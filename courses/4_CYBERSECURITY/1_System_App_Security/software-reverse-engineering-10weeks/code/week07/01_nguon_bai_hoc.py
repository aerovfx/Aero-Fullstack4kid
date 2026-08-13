"""software-reverse-engineering-10weeks · Tuần 07 · Bài 01.

Chủ đề: Nguồn bài học
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Nguồn bài học:', result)
