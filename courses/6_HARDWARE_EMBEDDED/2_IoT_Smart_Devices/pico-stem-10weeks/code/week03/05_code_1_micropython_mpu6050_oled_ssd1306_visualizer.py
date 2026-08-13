"""pico-stem-10weeks · Tuần 03 · Bài 05.

Chủ đề: Code 1: MicroPython - MPU6050 & OLED SSD1306 Visualizer
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Code 1: MicroPython - MPU6050 & OLED SSD1306 Visualizer:', result)
