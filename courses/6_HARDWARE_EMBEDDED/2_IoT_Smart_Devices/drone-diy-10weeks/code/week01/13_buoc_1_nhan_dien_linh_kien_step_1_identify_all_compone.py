"""drone-diy-10weeks · Tuần 01 · Bài 13.

Chủ đề: Bước 1: Nhận diện linh kiện / Step 1: Identify all components on a reference drone
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Bước 1: Nhận diện linh kiện / Step 1: Identify all components on a reference drone:', result)
