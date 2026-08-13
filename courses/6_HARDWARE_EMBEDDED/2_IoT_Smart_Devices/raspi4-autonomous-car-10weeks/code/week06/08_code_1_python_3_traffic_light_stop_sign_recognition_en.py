"""raspi4-autonomous-car-10weeks · Tuần 06 · Bài 08.

Chủ đề: Code 1: Python 3 - Traffic Light & STOP Sign Recognition Engine
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Code 1: Python 3 - Traffic Light & STOP Sign Recognition Engine:', result)
