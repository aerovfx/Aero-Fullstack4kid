"""data-science-10weeks · Tuần 08 · Bài 20.

Chủ đề: Thuật ngữ quan trọng tuần 08
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Thuật ngữ quan trọng tuần 08:', result)
