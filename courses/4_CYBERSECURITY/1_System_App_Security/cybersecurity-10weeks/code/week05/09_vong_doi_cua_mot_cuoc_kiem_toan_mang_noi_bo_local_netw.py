"""cybersecurity-10weeks · Tuần 05 · Bài 09.

Chủ đề: Vòng đời của một cuộc kiểm toán mạng nội bộ (Local Network Audit Lifecycle)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Vòng đời của một cuộc kiểm toán mạng nội bộ (Local Network Audit Lifecycle):', result)
