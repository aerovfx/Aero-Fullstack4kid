"""software-reverse-engineering-10weeks · Tuần 10 · Bài 16.

Chủ đề: Deliverables
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Deliverables:', result)
