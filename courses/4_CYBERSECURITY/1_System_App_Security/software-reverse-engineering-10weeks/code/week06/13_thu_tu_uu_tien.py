"""software-reverse-engineering-10weeks · Tuần 06 · Bài 13.

Chủ đề: Thứ tự ưu tiên
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Thứ tự ưu tiên:', result)
