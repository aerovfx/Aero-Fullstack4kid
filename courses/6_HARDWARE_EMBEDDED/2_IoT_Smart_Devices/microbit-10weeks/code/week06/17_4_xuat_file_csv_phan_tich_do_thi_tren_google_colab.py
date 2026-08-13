"""microbit-10weeks · Tuần 06 · Bài 17.

Chủ đề: 4: Xuất File CSV & Phân Tích Đồ Thị Trên Google Colab
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 4: Xuất File CSV & Phân Tích Đồ Thị Trên Google Colab:', result)
