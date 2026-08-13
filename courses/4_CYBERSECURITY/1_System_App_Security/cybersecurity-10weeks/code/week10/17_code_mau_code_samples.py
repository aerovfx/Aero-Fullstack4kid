"""cybersecurity-10weeks · Tuần 10 · Bài 17.

Chủ đề: Code Mẫu / Code Samples
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Code Mẫu / Code Samples:', result)
