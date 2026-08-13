"""data-science-10weeks · Tuần 06 · Bài 17.

Chủ đề: code minh họa của tuần
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - code minh họa của tuần:', result)
