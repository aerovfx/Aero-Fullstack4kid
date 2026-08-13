"""drone-diy-10weeks · Tuần 08 · Bài 08.

Chủ đề: Tích Hợp Camera (Camera Integration)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Tích Hợp Camera (Camera Integration):', result)
