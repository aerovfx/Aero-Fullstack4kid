"""drone-diy-10weeks · Tuần 09 · Bài 05.

Chủ đề: MAVLink over Radio: Range, Packet Loss, RSSI
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - MAVLink over Radio: Range, Packet Loss, RSSI:', result)
