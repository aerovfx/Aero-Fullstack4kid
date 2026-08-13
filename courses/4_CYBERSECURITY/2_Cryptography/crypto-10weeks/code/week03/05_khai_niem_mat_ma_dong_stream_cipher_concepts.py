"""crypto-10weeks · Tuần 03 · Bài 05.

Chủ đề: Khái niệm Mật Mã Dòng / Stream Cipher Concepts
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Khái niệm Mật Mã Dòng / Stream Cipher Concepts:', result)
