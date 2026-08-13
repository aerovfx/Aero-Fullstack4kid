"""data-science-10weeks · Tuần 10 · Bài 09.

Chủ đề: Nhiệm vụ thực tế / Task
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Nhiệm vụ thực tế / Task:', result)
