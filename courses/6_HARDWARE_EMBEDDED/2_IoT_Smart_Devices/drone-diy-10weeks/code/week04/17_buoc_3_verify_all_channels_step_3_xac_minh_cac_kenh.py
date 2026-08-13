"""drone-diy-10weeks · Tuần 04 · Bài 17.

Chủ đề: Bước 3: Verify all channels / Step 3: Xác minh các kênh
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Bước 3: Verify all channels / Step 3: Xác minh các kênh:', result)
