"""microbit-10weeks · Tuần 02 · Bài 08.

Chủ đề: Code 1: MicroPython - Electronic Clinometer & Compass
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Code 1: MicroPython - Electronic Clinometer & Compass:', result)
