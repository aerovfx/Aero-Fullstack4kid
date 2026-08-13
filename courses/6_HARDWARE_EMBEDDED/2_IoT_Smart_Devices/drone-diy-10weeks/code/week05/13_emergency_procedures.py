"""drone-diy-10weeks · Tuần 05 · Bài 13.

Chủ đề: Emergency procedures
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Emergency procedures:', result)
