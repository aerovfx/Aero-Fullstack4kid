"""crypto-10weeks · Tuần 06 · Bài 09.

Chủ đề: Code Mẫu Thực Hành / Python Implementation
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code Mẫu Thực Hành / Python Implementation:', result)
