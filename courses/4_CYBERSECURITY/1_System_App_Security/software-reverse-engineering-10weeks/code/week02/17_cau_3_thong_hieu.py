"""software-reverse-engineering-10weeks · Tuần 02 · Bài 17.

Chủ đề: Câu 3 (Thông hiểu)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Câu 3 (Thông hiểu):', result)
