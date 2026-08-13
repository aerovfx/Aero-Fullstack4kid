"""drone-diy-10weeks · Tuần 01 · Bài 09.

Chủ đề: Quy định pháp luật / Regulations
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Quy định pháp luật / Regulations:', result)
