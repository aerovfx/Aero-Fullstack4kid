"""microbit-10weeks · Tuần 02 · Bài 16.

Chủ đề: 4: Giả Lập Thiết Bị Đếm Bước Chân (Pedometer Simulator)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 4: Giả Lập Thiết Bị Đếm Bước Chân (Pedometer Simulator):', result)
