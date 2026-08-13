"""crypto-10weeks · Tuần 02 · Bài 08.

Chủ đề: Các Chế Độ Hoạt Động (Modes of Operation)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Các Chế Độ Hoạt Động (Modes of Operation):', result)
