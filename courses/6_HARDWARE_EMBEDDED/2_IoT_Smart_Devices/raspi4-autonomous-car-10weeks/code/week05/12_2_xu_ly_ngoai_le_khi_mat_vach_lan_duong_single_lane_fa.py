"""raspi4-autonomous-car-10weeks · Tuần 05 · Bài 12.

Chủ đề: 2: Xử Lý Ngoại Lệ Khi Mất Vạch Làn Đường (Single-Lane Fallback)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 2: Xử Lý Ngoại Lệ Khi Mất Vạch Làn Đường (Single-Lane Fallback):', result)
