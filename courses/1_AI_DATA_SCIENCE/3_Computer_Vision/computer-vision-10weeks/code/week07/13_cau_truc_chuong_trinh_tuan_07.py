"""computer-vision-10weeks · Tuần 07 · Bài 13.

Chủ đề: Cấu trúc chương trình tuần 07
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Cấu trúc chương trình tuần 07:', result)
