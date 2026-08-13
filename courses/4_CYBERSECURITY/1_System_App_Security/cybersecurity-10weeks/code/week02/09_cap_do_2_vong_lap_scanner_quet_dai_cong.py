"""cybersecurity-10weeks · Tuần 02 · Bài 09.

Chủ đề: Cấp độ 2: Vòng lặp Scanner (Quét Dải Cổng)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Cấp độ 2: Vòng lặp Scanner (Quét Dải Cổng):', result)
