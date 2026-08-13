"""crypto-10weeks · Tuần 02 · Bài 05.

Chủ đề: Giới thiệu về Mã Hóa Khối Đối Xứng / Symmetric Block Ciphers
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Giới thiệu về Mã Hóa Khối Đối Xứng / Symmetric Block Ciphers:', result)
