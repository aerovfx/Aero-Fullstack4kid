"""machine-learning-10weeks · Tuần 07 · Bài 08.

Chủ đề: Thuật ngữ quan trọng tuần 07
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Thuật ngữ quan trọng tuần 07:', result)
