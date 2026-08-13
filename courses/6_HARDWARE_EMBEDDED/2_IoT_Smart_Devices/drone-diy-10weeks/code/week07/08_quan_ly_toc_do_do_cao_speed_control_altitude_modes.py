"""drone-diy-10weeks · Tuần 07 · Bài 08.

Chủ đề: Quản Lý Tốc Độ & Độ Cao (Speed Control & Altitude Modes)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Quản Lý Tốc Độ & Độ Cao (Speed Control & Altitude Modes):', result)
