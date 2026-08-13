"""drone-diy-10weeks · Tuần 07 · Bài 16.

Chủ đề: Đánh Giá / Assessment Rubric
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Đánh Giá / Assessment Rubric:', result)
