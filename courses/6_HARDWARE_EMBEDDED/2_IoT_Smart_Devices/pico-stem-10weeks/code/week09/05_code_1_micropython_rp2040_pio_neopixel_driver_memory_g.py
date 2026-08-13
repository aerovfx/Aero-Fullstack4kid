"""pico-stem-10weeks · Tuần 09 · Bài 05.

Chủ đề: Code 1: MicroPython - RP2040 PIO Neopixel Driver & Memory Garbage Collector
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Code 1: MicroPython - RP2040 PIO Neopixel Driver & Memory Garbage Collector:', result)
