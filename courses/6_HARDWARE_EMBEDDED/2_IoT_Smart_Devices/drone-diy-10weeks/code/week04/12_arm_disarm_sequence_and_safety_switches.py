"""drone-diy-10weeks · Tuần 04 · Bài 12.

Chủ đề: Arm/Disarm sequence and safety switches
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Arm/Disarm sequence and safety switches:', result)
