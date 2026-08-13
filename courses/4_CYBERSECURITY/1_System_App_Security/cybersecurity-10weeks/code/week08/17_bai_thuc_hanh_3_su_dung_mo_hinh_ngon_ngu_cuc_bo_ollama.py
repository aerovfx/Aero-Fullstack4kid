"""cybersecurity-10weeks · Tuần 08 · Bài 17.

Chủ đề: Bài Thực Hành 3: Sử Dụng Mô Hình Ngôn Ngữ Cục Bộ (Ollama) Vì Tính Bảo Mật Dữ Liệu
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Bài Thực Hành 3: Sử Dụng Mô Hình Ngôn Ngữ Cục Bộ (Ollama) Vì Tính Bảo Mật Dữ Liệu:', result)
