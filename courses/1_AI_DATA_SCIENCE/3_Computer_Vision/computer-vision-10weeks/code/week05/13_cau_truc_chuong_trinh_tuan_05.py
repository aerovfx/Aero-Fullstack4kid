"""computer-vision-10weeks · Tuần 05 · Bài 13.

Chủ đề: Cấu trúc chương trình tuần 05
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Cấu trúc chương trình tuần 05:', result)
