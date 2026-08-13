"""microbit-10weeks · Tuần 03 · Bài 12.

Chủ đề: 2: Thước Đo Khoảng Cách Siêu Âm HC-SR04 Crowtail
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 2: Thước Đo Khoảng Cách Siêu Âm HC-SR04 Crowtail:', result)
