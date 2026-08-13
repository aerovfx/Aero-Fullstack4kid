"""data-science-10weeks · Tuần 06 · Bài 16.

Chủ đề: Nội dung bài học: chọn, lọc và phân nhóm
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Nội dung bài học: chọn, lọc và phân nhóm:', result)
