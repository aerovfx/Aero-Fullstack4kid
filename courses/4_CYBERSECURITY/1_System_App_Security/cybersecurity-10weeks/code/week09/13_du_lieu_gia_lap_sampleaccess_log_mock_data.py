"""cybersecurity-10weeks · Tuần 09 · Bài 13.

Chủ đề: Dữ liệu giả lập sampleaccess.log (Mock Data)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Dữ liệu giả lập sampleaccess.log (Mock Data):', result)
