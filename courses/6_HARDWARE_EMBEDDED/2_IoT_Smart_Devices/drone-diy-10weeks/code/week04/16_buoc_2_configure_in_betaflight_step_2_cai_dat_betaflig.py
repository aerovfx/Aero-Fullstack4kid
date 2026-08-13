"""drone-diy-10weeks · Tuần 04 · Bài 16.

Chủ đề: Bước 2: Configure in Betaflight / Step 2: Cài đặt Betaflight
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Bước 2: Configure in Betaflight / Step 2: Cài đặt Betaflight:', result)
