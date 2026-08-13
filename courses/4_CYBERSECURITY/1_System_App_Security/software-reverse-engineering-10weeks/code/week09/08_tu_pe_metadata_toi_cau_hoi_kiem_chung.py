"""software-reverse-engineering-10weeks · Tuần 09 · Bài 08.

Chủ đề: Từ PE metadata tới câu hỏi kiểm chứng
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Từ PE metadata tới câu hỏi kiểm chứng:', result)
