"""microbit-10weeks · Tuần 05 · Bài 05.

Chủ đề: Nguyên Lý Truyền Sóng Radio P2P & Chỉ Số Cường Độ Sóng RSSI
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Nguyên Lý Truyền Sóng Radio P2P & Chỉ Số Cường Độ Sóng RSSI:', result)
