"""drone-diy-10weeks · Tuần 02 · Bài 16.

Chủ đề: Câu Hỏi Thảo Luận / Discussion Questions
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Câu Hỏi Thảo Luận / Discussion Questions:', result)
