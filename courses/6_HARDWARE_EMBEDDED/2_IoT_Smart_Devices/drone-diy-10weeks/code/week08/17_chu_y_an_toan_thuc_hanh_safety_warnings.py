"""drone-diy-10weeks · Tuần 08 · Bài 17.

Chủ đề: Chú Ý An Toàn Thực Hành (Safety Warnings)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Chú Ý An Toàn Thực Hành (Safety Warnings):', result)
