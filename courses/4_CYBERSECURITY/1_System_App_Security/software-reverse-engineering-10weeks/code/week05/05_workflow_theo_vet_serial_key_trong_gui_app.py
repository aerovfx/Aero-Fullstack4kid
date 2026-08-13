"""software-reverse-engineering-10weeks · Tuần 05 · Bài 05.

Chủ đề: Workflow Theo Vết Serial Key Trong GUI App
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Workflow Theo Vết Serial Key Trong GUI App:', result)
