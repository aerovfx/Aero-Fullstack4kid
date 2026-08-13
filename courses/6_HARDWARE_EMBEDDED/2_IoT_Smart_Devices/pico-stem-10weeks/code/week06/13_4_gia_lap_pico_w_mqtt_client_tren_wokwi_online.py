"""pico-stem-10weeks · Tuần 06 · Bài 13.

Chủ đề: 4: Giả Lập Pico W MQTT Client Trên Wokwi Online
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 4: Giả Lập Pico W MQTT Client Trên Wokwi Online:', result)
