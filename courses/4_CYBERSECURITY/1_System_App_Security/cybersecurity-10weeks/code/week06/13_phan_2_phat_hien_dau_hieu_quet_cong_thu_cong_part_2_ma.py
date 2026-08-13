"""cybersecurity-10weeks · Tuần 06 · Bài 13.

Chủ đề: Phần 2: Phát hiện dấu hiệu quét cổng thủ công / Part 2: Manual Port Scan Detection
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Phần 2: Phát hiện dấu hiệu quét cổng thủ công / Part 2: Manual Port Scan Detection:', result)
