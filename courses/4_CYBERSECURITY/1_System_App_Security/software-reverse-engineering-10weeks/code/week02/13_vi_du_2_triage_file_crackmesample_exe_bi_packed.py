"""software-reverse-engineering-10weeks · Tuần 02 · Bài 13.

Chủ đề: Ví dụ 2: Triage file CrackMeSample.exe bị packed
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Ví dụ 2: Triage file CrackMeSample.exe bị packed:', result)
