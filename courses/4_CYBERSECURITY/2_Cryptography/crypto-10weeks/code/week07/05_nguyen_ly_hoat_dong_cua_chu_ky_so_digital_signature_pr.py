"""crypto-10weeks · Tuần 07 · Bài 05.

Chủ đề: Nguyên Lý Hoạt Động Của Chữ Ký Số / Digital Signature Principles
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Nguyên Lý Hoạt Động Của Chữ Ký Số / Digital Signature Principles:', result)
