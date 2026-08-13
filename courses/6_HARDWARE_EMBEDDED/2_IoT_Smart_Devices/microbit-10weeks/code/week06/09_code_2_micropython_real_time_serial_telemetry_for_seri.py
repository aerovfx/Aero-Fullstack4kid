"""microbit-10weeks · Tuần 06 · Bài 09.

Chủ đề: Code 2: MicroPython - Real-time Serial Telemetry for Serial Plotter
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code 2: MicroPython - Real-time Serial Telemetry for Serial Plotter:', result)
