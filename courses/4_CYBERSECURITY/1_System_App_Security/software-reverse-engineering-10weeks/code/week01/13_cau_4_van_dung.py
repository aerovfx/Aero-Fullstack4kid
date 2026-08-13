"""software-reverse-engineering-10weeks · Tuần 01 · Bài 13.

Chủ đề: Câu 4 (Vận dụng)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Câu 4 (Vận dụng):', result)
