"""software-reverse-engineering-10weeks · Tuần 07 · Bài 09.

Chủ đề: Playbook chuẩn
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Playbook chuẩn:', result)
