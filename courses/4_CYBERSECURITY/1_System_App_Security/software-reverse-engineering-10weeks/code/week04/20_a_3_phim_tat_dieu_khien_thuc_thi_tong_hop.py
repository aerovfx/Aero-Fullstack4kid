"""software-reverse-engineering-10weeks · Tuần 04 · Bài 20.

Chủ đề: A.3 Phím tắt điều khiển thực thi tổng hợp
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('20 - A.3 Phím tắt điều khiển thực thi tổng hợp:', result)
