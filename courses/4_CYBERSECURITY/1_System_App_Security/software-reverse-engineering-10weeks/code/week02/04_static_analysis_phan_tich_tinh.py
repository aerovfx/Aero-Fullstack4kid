"""software-reverse-engineering-10weeks · Tuần 02 · Bài 04.

Chủ đề: Static Analysis (Phân tích tĩnh)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Static Analysis (Phân tích tĩnh):', result)
