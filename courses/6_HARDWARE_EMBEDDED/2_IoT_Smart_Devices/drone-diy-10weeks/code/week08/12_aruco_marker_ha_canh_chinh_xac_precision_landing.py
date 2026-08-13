"""drone-diy-10weeks · Tuần 08 · Bài 12.

Chủ đề: ArUco Marker & Hạ Cánh Chính Xác (Precision Landing)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - ArUco Marker & Hạ Cánh Chính Xác (Precision Landing):', result)
