"""microbit-10weeks · Tuần 09 · Bài 05.

Chủ đề: Kiến Trúc Máy Trạng Thái Hữu Hạn (Finite State Machine - FSM)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Kiến Trúc Máy Trạng Thái Hữu Hạn (Finite State Machine - FSM):', result)
