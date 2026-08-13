"""microbit-10weeks · Tuần 01 · Bài 09.

Chủ đề: Code Mẫu Thực Hành / Code Implementations
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code Mẫu Thực Hành / Code Implementations:', result)
