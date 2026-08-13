"""data-science-10weeks · Tuần 03 · Bài 17.

Chủ đề: Số học theo phần tử
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Số học theo phần tử:', result)
