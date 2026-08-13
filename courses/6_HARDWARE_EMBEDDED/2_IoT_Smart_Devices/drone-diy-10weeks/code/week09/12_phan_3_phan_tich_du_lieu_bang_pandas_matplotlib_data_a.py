"""drone-diy-10weeks · Tuần 09 · Bài 12.

Chủ đề: Phần 3: Phân tích dữ liệu bằng Pandas & Matplotlib (Data Analysis)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Phần 3: Phân tích dữ liệu bằng Pandas & Matplotlib (Data Analysis):', result)
