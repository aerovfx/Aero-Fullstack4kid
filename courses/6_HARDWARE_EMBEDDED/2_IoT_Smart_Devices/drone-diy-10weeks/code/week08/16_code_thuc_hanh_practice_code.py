"""drone-diy-10weeks · Tuần 08 · Bài 16.

Chủ đề: Code Thực Hành / Practice Code
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Code Thực Hành / Practice Code:', result)
