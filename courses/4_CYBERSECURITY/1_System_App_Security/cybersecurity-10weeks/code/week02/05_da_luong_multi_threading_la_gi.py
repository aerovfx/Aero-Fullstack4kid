"""cybersecurity-10weeks · Tuần 02 · Bài 05.

Chủ đề: Đa luồng (Multi-threading) là gì?
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Đa luồng (Multi-threading) là gì?:', result)
