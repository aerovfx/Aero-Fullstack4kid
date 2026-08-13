"""cybersecurity-10weeks · Tuần 05 · Bài 17.

Chủ đề: Bước 6: Quét tất cả các cổng (Scan All Ports)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Bước 6: Quét tất cả các cổng (Scan All Ports):', result)
