"""data-science-10weeks · Tuần 10 · Bài 05.

Chủ đề: Các chủ đề kỹ thuật chính (Key Technical Topics)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Các chủ đề kỹ thuật chính (Key Technical Topics):', result)
