"""software-reverse-engineering-10weeks · Tuần 10 · Bài 09.

Chủ đề: Checksum, MAC và signature
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Checksum, MAC và signature:', result)
