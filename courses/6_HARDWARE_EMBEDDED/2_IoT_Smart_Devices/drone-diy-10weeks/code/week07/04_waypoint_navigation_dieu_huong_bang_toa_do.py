"""drone-diy-10weeks · Tuần 07 · Bài 04.

Chủ đề: Waypoint Navigation (Điều Hướng Bằng Tọa Độ)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Waypoint Navigation (Điều Hướng Bằng Tọa Độ):', result)
