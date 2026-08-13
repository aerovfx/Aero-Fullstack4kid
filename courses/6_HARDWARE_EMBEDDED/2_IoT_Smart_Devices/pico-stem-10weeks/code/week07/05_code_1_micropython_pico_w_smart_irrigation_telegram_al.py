"""pico-stem-10weeks · Tuần 07 · Bài 05.

Chủ đề: Code 1: MicroPython - Pico W Smart Irrigation & Telegram Alert Gateway
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Code 1: MicroPython - Pico W Smart Irrigation & Telegram Alert Gateway:', result)
