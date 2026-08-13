"""data-science-10weeks · Tuần 06 · Bài 12.

Chủ đề: Bài Về Nhà / Homework
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Bài Về Nhà / Homework:', result)
