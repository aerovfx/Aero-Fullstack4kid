"""drone-diy-10weeks · Tuần 04 · Bài 13.

Chủ đề: RSSI monitoring
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - RSSI monitoring:', result)
