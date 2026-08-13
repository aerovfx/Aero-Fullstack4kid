"""drone-diy-10weeks · Tuần 01 · Bài 16.

Chủ đề: Code / Formulas
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Code / Formulas:', result)
