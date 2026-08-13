"""software-reverse-engineering-10weeks · Tuần 09 · Bài 12.

Chủ đề: CI/release controls
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - CI/release controls:', result)
