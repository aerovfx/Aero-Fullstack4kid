"""cybersecurity-10weeks · Tuần 05 · Bài 13.

Chủ đề: Bước 2: Thiết lập một số dịch vụ nội bộ (Tùy chọn nhưng khuyến nghị) / Step 2: Set up some
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Bước 2: Thiết lập một số dịch vụ nội bộ (Tùy chọn nhưng khuyến nghị) / Step 2: Set up some:', result)
