"""microbit-10weeks · Tuần 01 · Bài 13.

Chủ đề: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework:', result)
