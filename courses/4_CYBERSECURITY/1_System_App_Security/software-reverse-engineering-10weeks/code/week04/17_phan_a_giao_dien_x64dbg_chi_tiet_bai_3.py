"""software-reverse-engineering-10weeks · Tuần 04 · Bài 17.

Chủ đề: Phần A — Giao Diện x64dbg Chi Tiết (Bài 3)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Phần A — Giao Diện x64dbg Chi Tiết (Bài 3):', result)
