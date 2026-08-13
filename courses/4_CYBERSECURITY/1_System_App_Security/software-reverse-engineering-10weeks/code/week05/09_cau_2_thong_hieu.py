"""software-reverse-engineering-10weeks · Tuần 05 · Bài 09.

Chủ đề: Câu 2 (Thông hiểu)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Câu 2 (Thông hiểu):', result)
