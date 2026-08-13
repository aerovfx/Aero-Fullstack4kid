"""software-reverse-engineering-10weeks · Tuần 10 · Bài 13.

Chủ đề: A. Parser hardening
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - A. Parser hardening:', result)
