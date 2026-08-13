"""cybersecurity-10weeks · Tuần 08 · Bài 09.

Chủ đề: Giới Thiệu Về OSINT (Open Source Intelligence) / Introduction to OSINT
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Giới Thiệu Về OSINT (Open Source Intelligence) / Introduction to OSINT:', result)
