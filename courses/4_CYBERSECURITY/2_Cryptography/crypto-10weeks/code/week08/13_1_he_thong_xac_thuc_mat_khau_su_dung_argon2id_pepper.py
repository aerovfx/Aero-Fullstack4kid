"""crypto-10weeks · Tuần 08 · Bài 13.

Chủ đề: 1: Hệ Thống Xác Thực Mật Khẩu Sử Dụng Argon2id & Pepper
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 1: Hệ Thống Xác Thực Mật Khẩu Sử Dụng Argon2id & Pepper:', result)
