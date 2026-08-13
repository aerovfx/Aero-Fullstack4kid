"""crypto-10weeks · Tuần 04 · Bài 12.

Chủ đề: Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework:', result)
