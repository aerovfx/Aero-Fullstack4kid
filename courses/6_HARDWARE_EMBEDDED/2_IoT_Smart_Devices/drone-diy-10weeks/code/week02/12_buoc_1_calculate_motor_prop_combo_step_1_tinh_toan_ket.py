"""drone-diy-10weeks · Tuần 02 · Bài 12.

Chủ đề: Bước 1: Calculate motor + prop combo / Step 1: Tính toán kết hợp động cơ và cánh
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Bước 1: Calculate motor + prop combo / Step 1: Tính toán kết hợp động cơ và cánh:', result)
