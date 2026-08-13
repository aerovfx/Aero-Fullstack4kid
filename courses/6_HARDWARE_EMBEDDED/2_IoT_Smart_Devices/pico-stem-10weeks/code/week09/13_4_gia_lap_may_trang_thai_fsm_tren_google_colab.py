"""pico-stem-10weeks · Tuần 09 · Bài 13.

Chủ đề: 4: Giả Lập Máy Trạng Thái FSM Trên Google Colab
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 4: Giả Lập Máy Trạng Thái FSM Trên Google Colab:', result)
