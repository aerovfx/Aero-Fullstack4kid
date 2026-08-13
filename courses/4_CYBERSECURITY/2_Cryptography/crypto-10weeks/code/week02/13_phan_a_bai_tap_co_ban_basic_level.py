"""crypto-10weeks · Tuần 02 · Bài 13.

Chủ đề: 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 🟢 Phần A: Bài Tập Cơ Bản (Basic Level):', result)
