"""cybersecurity-10weeks · Tuần 10 · Bài 20.

Chủ đề: Câu Hỏi Thảo Luận / Discussion
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Câu Hỏi Thảo Luận / Discussion:', result)
