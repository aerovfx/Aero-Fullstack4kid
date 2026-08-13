"""cybersecurity-10weeks · Tuần 08 · Bài 16.

Chủ đề: Bài Thực Hành 2: Sử dụng Python và OpenAI API để Phân tích Tự động
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Bài Thực Hành 2: Sử dụng Python và OpenAI API để Phân tích Tự động:', result)
