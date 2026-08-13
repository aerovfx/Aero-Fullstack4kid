"""pico-stem-10weeks · Tuần 02 · Bài 05.

Chủ đề: Code 1: MicroPython - ADC Light Sensor & Hardware Interrupt ISR
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Code 1: MicroPython - ADC Light Sensor & Hardware Interrupt ISR:', result)
