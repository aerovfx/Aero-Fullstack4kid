"""drone-diy-10weeks · Tuần 09 · Bài 09.

Chủ đề: Code Thực Hành / Practice Code
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code Thực Hành / Practice Code:', result)
