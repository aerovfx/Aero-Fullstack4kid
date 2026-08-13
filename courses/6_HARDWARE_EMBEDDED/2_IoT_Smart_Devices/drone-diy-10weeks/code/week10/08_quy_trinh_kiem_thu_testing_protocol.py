"""drone-diy-10weeks · Tuần 10 · Bài 08.

Chủ đề: Quy Trình Kiểm Thử / Testing Protocol
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Quy Trình Kiểm Thử / Testing Protocol:', result)
