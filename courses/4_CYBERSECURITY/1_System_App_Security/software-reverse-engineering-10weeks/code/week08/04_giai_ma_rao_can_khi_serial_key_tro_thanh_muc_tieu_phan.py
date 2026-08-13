"""software-reverse-engineering-10weeks · Tuần 08 · Bài 04.

Chủ đề: Giải mã rào cản: Khi Serial Key trở thành mục tiêu phân tích
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Giải mã rào cản: Khi Serial Key trở thành mục tiêu phân tích:', result)
