"""pico-stem-10weeks · Tuần 01 · Bài 09.

Chủ đề: Code 1: MicroPython - GPIO Input/Output & LED Traffic Signal
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code 1: MicroPython - GPIO Input/Output & LED Traffic Signal:', result)
