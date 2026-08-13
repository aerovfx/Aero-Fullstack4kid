"""software-reverse-engineering-10weeks · Tuần 03 · Bài 01.

Chủ đề: Tuần 3 – Bài 3
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Tuần 3 – Bài 3:', result)
