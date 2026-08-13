"""pico-stem-10weeks · Tuần 05 · Bài 13.

Chủ đề: 4: Giả Lập Pico W Web Server Trên Wokwi Online
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 4: Giả Lập Pico W Web Server Trên Wokwi Online:', result)
