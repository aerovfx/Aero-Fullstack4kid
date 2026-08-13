"""drone-diy-10weeks · Tuần 03 · Bài 16.

Chủ đề: Bước 3: First Betaflight connection / Step 3: Kết nối Betaflight lần đầu
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Bước 3: First Betaflight connection / Step 3: Kết nối Betaflight lần đầu:', result)
