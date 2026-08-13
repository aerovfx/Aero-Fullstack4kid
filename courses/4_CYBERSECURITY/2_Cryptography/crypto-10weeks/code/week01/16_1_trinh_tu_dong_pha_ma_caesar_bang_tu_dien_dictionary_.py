"""crypto-10weeks · Tuần 01 · Bài 16.

Chủ đề: 1: Trình Tự Động Phá Mã Caesar Bằng Từ Điển (Dictionary-based Caesar Solver)
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - 1: Trình Tự Động Phá Mã Caesar Bằng Từ Điển (Dictionary-based Caesar Solver):', result)
