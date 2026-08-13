"""software-reverse-engineering-10weeks · Tuần 06 · Bài 09.

Chủ đề: Bước 4 — Kiểm thử Hồi quy (Regression Test Matrix)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Bước 4 — Kiểm thử Hồi quy (Regression Test Matrix):', result)
