"""cybersecurity-10weeks · Tuần 04 · Bài 13.

Chủ đề: Code Mẫu / Code Samples (Secure coding examples)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Code Mẫu / Code Samples (Secure coding examples):', result)
