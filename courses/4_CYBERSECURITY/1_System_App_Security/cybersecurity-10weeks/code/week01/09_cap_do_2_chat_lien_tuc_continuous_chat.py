"""cybersecurity-10weeks · Tuần 01 · Bài 09.

Chủ đề: Cấp độ 2: Chat Liên tục (Continuous Chat)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Cấp độ 2: Chat Liên tục (Continuous Chat):', result)
