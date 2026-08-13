"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 08.

Chủ đề: Code Mẫu Thực Hành / Code Implementations
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Code Mẫu Thực Hành / Code Implementations:', result)
