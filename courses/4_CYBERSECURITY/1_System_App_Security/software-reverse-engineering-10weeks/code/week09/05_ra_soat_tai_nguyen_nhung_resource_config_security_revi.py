"""software-reverse-engineering-10weeks · Tuần 09 · Bài 05.

Chủ đề: Rà soát Tài nguyên Nhúng (Resource & Config Security Review)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Rà soát Tài nguyên Nhúng (Resource & Config Security Review):', result)
