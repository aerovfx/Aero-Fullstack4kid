"""drone-diy-10weeks · Tuần 06 · Bài 08.

Chủ đề: Đối Tượng Vehicle Trong DroneKit / The Vehicle Object in DroneKit
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Đối Tượng Vehicle Trong DroneKit / The Vehicle Object in DroneKit:', result)
