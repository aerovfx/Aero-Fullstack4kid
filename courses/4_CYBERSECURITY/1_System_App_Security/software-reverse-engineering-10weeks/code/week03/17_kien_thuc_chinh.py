"""software-reverse-engineering-10weeks · Tuần 03 · Bài 17.

Chủ đề: Kiến thức chính
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Kiến thức chính:', result)
