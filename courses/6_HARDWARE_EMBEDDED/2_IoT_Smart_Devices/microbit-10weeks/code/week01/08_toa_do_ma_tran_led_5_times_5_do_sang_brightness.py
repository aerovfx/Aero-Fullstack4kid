"""microbit-10weeks · Tuần 01 · Bài 08.

Chủ đề: Tọa Độ Ma Trận LED $5 \times 5$ & Độ Sáng (Brightness)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Tọa Độ Ma Trận LED $5 \\times 5$ & Độ Sáng (Brightness):', result)
