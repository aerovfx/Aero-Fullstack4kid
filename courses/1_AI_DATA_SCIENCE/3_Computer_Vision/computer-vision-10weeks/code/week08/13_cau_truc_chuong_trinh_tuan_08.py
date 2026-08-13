"""computer-vision-10weeks · Tuần 08 · Bài 13.

Chủ đề: Cấu trúc chương trình tuần 08
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Cấu trúc chương trình tuần 08:', result)
