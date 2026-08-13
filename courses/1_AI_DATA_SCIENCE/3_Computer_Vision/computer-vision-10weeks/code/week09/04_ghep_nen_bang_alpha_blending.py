"""computer-vision-10weeks · Tuần 09 · Bài 04.

Chủ đề: Ghép nền bằng alpha blending
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Ghép nền bằng alpha blending:', result)
