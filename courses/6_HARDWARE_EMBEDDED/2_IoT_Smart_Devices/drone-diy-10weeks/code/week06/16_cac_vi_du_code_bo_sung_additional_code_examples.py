"""drone-diy-10weeks · Tuần 06 · Bài 16.

Chủ đề: Các Ví Dụ Code Bổ Sung / Additional Code Examples
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Các Ví Dụ Code Bổ Sung / Additional Code Examples:', result)
