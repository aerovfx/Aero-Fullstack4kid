"""drone-diy-10weeks · Tuần 04 · Bài 09.

Chủ đề: Configuring channels in Betaflight
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Configuring channels in Betaflight:', result)
