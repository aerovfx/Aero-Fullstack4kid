"""raspi4-autonomous-car-10weeks · Tuần 03 · Bài 12.

Chủ đề: 2: Đọc Cảm Biến MPU6050 Qua Bus I2C
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 2: Đọc Cảm Biến MPU6050 Qua Bus I2C:', result)
