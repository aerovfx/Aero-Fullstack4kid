"""pico-stem-10weeks · Tuần 02 · Bài 09.

Chủ đề: 2: Đèn LED Dimmer Tự Động
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - 2: Đèn LED Dimmer Tự Động:', result)
