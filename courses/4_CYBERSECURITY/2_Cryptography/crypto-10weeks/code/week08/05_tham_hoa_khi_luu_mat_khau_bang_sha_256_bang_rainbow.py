"""crypto-10weeks · Tuần 08 · Bài 05.

Chủ đề: Thảm Họa Khi Lưu Mật Khẩu Bằng SHA-256 & Bảng Rainbow
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Thảm Họa Khi Lưu Mật Khẩu Bằng SHA-256 & Bảng Rainbow:', result)
