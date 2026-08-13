"""pico-stem-10weeks · Tuần 10 · Bài 05.

Chủ đề: Kiến Trúc Tích Hợp Hệ Thống Raspberry Pi Pico W STEM
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Kiến Trúc Tích Hợp Hệ Thống Raspberry Pi Pico W STEM:', result)
