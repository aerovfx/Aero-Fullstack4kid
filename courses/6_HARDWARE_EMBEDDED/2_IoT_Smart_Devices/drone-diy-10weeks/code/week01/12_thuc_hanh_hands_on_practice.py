"""drone-diy-10weeks · Tuần 01 · Bài 12.

Chủ đề: Thực Hành / Hands-On Practice
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Thực Hành / Hands-On Practice:', result)
