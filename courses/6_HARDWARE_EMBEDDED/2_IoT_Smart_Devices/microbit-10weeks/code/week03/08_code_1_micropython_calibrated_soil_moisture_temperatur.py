"""microbit-10weeks · Tuần 03 · Bài 08.

Chủ đề: Code 1: MicroPython - Calibrated Soil Moisture & Temperature Monitor
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Code 1: MicroPython - Calibrated Soil Moisture & Temperature Monitor:', result)
