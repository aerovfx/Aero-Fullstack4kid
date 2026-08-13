"""drone-diy-10weeks · Tuần 07 · Bài 05.

Chủ đề: Các Loại Nhiệm Vụ Bay (Mission Types)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Các Loại Nhiệm Vụ Bay (Mission Types):', result)
