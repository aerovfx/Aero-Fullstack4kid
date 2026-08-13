"""data-science-10weeks · Tuần 03 · Bài 20.

Chủ đề: Bài tập code
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Bài tập code:', result)
