"""pico-stem-10weeks · Tuần 05 · Bài 04.

Chủ đề: Code Mẫu Thực Hành / Code Implementations
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('04 - Code Mẫu Thực Hành / Code Implementations:', result)
