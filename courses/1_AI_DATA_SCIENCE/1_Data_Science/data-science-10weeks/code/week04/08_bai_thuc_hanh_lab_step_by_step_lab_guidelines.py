"""data-science-10weeks · Tuần 04 · Bài 08.

Chủ đề: Bài Thực Hành Lab (Step-by-Step Lab Guidelines)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Bài Thực Hành Lab (Step-by-Step Lab Guidelines):', result)
