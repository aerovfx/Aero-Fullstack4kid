"""pico-stem-10weeks · Tuần 06 · Bài 05.

Chủ đề: Code 1: MicroPython - Pico W MQTT Telemetry Publisher & Blynk Cloud
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Code 1: MicroPython - Pico W MQTT Telemetry Publisher & Blynk Cloud:', result)
