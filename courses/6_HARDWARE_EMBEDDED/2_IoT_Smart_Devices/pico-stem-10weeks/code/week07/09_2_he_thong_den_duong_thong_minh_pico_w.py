"""pico-stem-10weeks · Tuần 07 · Bài 09.

Chủ đề: 2: Hệ Thống Đèn Đường Thông Minh Pico W
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - 2: Hệ Thống Đèn Đường Thông Minh Pico W:', result)
