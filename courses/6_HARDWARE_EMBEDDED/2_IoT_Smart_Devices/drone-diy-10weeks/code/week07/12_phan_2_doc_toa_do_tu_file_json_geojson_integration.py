"""drone-diy-10weeks · Tuần 07 · Bài 12.

Chủ đề: Phần 2: Đọc Tọa Độ Từ File JSON (GeoJSON Integration)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Phần 2: Đọc Tọa Độ Từ File JSON (GeoJSON Integration):', result)
