"""drone-diy-10weeks · Tuần 06 · Bài 20.

Chủ đề: Câu Hỏi Thường Gặp (FAQ - Frequently Asked Questions)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - Câu Hỏi Thường Gặp (FAQ - Frequently Asked Questions):', result)
