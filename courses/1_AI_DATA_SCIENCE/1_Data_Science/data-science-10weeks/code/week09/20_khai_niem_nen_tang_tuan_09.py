"""data-science-10weeks · Tuần 09 · Bài 20.

Chủ đề: Khái niệm nền tảng tuần 09
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Khái niệm nền tảng tuần 09:', result)
