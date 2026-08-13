"""drone-diy-10weeks · Tuần 03 · Bài 04.

Chủ đề: What is an ESC
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - What is an ESC:', result)
