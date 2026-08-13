"""software-reverse-engineering-10weeks · Tuần 04 · Bài 13.

Chủ đề: Câu 3 (Thông hiểu)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Câu 3 (Thông hiểu):', result)
