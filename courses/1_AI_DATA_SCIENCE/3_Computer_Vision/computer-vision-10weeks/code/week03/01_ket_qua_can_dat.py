"""computer-vision-10weeks · Tuần 03 · Bài 01.

Chủ đề: Kết quả cần đạt
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Kết quả cần đạt:', result)
